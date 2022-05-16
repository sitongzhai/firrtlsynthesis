//******************************************************************************
//* Author: Sitong Zhai
//* Created: 2021-08-20
//* Last updated: 2022-05-15
//******************************************************************************

#include "utility/app.h"
#include "utility/file.h"
#include "utility/utility.h"

#ifdef WIN32
#include <Windows.h>
#include <Shlwapi.h>
#pragma comment(lib, "Shlwapi.lib")
#else
#include <stdlib.h>
#include <limits.h>
#include <dirent.h>
#endif

namespace firrtlsyn {

  bool App::canonicalFilePath(std::string & file_path, std::string &canonical_path)
  {
#ifdef WIN32
#ifdef UNICODE
    // std::string => wchar_t
    std::wstring ws_path = std::wstring(file_path.begin(), file_path.end());
    const WCHAR *wc_path = ws_path.data();
    WCHAR lpBuffer[MAX_PATH];
    if (strlen(file_path.data()) > MAX_PATH || PathCanonicalizeW(lpBuffer, wc_path) == FALSE) {
      fs_error("*ERROR*: Get real-path failed for path '%s', check the file path length and format.\n", file_path.data());
      return false;
    }
    if (PathFileExists(lpBuffer) == FALSE) {
      fs_error("*ERROR*: File '%s' not exist.\n", file_path.data());
      return false;
    }
    // wchar_t => std::string
    DWORD dw_path = WideCharToMultiByte(CP_OEMCP, NULL, lpBuffer, -1, NULL, 0, NULL, FALSE);
    char *ps_text = new char[dw_path];
    WideCharToMultiByte(CP_OEMCP, NULL, lpBuffer, -1, ps_text, dw_path, NULL, FALSE);
    canonical_path = ps_text;
    delete ps_text;
    // return full path
    char full_path[MAX_PATH];
    // may not be save on multi-thread
    if (_fullpath(full_path, canonical_path.data(), MAX_PATH) == NULL) {
      fs_error("*ERROR*: Get full-path failed for path '%s'.\n", canonical_path.data());
      return false;
    }
    canonical_path = full_path;
#else
    char path[MAX_PATH + 1] = { 0 };
    char *l_path = const_cast<char *>(file_path.c_str());
    if (strlen(path) > MAX_PATH || FALSE == PathCanonicalize(l_path, path)) {
      fs_error("*ERROR*: Get real-path failed for path '%s'.\n", file_path.data());
      return false;
    }
    char full_path[MAX_PATH];
    if (_fullpath(full_path, l_path, MAX_PATH) == NULL) {
      fs_error("*ERROR*: Get full-path failed for path '%s'.\n", file_path.data());
    }
    canonical_path = full_path;
#endif
#else
    char path[PATH_MAX + 1] = { 0x00 };
    const char *input_path = file_path.c_str();
    if (strlen(input_path) > PATH_MAX || NULL == realpath(input_path, path)) {
      fs_error("*ERROR*: Get real-path failed for path '%s'.\n", input_path);
      return false;
    }
    canonical_path = path;
#endif
    return true;
  }

  std::string App::getDBPath() {

#ifndef WIN32
    std::string key_bin("/bin/");
    std::string key_to_replace("/db");
    char firrtlsyn_path[1024] = { 0 };
    if (readlink("/proc/self/exe", firrtlsyn_path, sizeof(firrtlsyn_path)) <= 0)
      return "";
#else
    std::string key_bin("\\bin\\");
    std::string key_to_replace("\\db");
    char firrtlsyn_path[MAX_PATH] = { 0 };
    wchar_t firrtlsyn_path_wchar[MAX_PATH] = { 0 };
    HINSTANCE hInst = GetModuleHandle(NULL);
    GetModuleFileName(hInst, firrtlsyn_path_wchar, sizeof(firrtlsyn_path_wchar));
    wcstombs(firrtlsyn_path, firrtlsyn_path_wchar, sizeof(firrtlsyn_path));
#endif // !WIN32

    char* firrtlsyn_db_dir = NULL;
    std::string exec_path = firrtlsyn_path;
    size_t found = exec_path.rfind(key_bin);
    if (found != std::string::npos) {
      exec_path.replace(exec_path.begin() + found, exec_path.end(), key_to_replace);
      if (!File::access(exec_path.c_str(), 0)) {
        firrtlsyn_db_dir = strdup(exec_path.c_str());

      }
    }

    if (firrtlsyn_db_dir == NULL) {
      firrtlsyn_db_dir = strdup(getenv("FIRRTLSYN_DB"));
    }

    if (firrtlsyn_db_dir != NULL) {
      std::string dir = firrtlsyn_db_dir;
      free(firrtlsyn_db_dir);
      return dir;
    }

    return "";
  }

  bool App::avoidOverwrite(const std::string & file_name) {
    if (access(file_name.c_str(), 0) == -1) {
      // no such a file exists, do nothing
      return true;
    }
    std::vector<std::string> all_files;
#ifndef WIN32
    size_t pos = file_name.find_last_of("/");
    std::string dir_path = "";
    std::string file_final_name = "";
    if (pos != std::string::npos) {
      dir_path = file_name.substr(0, pos);
      file_final_name = file_name.substr(pos+1);
    } else {
      char buf[2048] = { 0 };
      getcwd(buf, sizeof(buf));
      dir_path = std::string(buf);
      file_final_name = file_name;
    }
    DIR *pDir;
    struct dirent *pEntry;
    if ((pDir = opendir(dir_path.c_str())) != NULL) {
      while ((pEntry = readdir(pDir)) != NULL) {
        if (strstr(pEntry->d_name, file_final_name.c_str())) {
          all_files.push_back(dir_path + std::string(pEntry->d_name));
        }
      }
      closedir(pDir);
    } else {
      fs_error("*ERROR*: The directory '%s' does not exist.\n", dir_path.c_str());
    }
#else
    struct _finddata_t finfo;
    long long fhandle = _findfirst((file_name + ".*").c_str(), &finfo);
    int success = static_cast<int>(fhandle);
    while (success != -1) {
      all_files.push_back(finfo.name);
      success = _findnext(fhandle, &finfo);
    }
    _findclose(fhandle);
#endif // WIN32
    int max = -1;
    for (size_t i = 0; i < all_files.size(); i++) {
      std::string tmp_file = all_files[i];
      size_t found = tmp_file.find_last_of('.');
      if (found == std::string::npos) {
        fs_warning("*WARNING*: Found a file without suffix: '%s'.\n");
        continue;
      }
      std::string suffix = std::string(tmp_file, found+1);
      int num = std::atoi(suffix.c_str());
      if (num > max) {
        max = num;
      }
    }

    if (max >= 0) {
      std::string new_file_name = file_name + "." + std::to_string(max + 1);
      rename(file_name.c_str(), new_file_name.c_str());
      fs_info("*INFO*: The existing Verilog file '%s' was renamed to '%s' to avoid overwriting.\n", file_name.c_str(), new_file_name.c_str());
    }
    return true;
  }
}
