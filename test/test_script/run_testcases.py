import os
import subprocess
import psutil
import time
import platform
import re
import shutil
import argparse

class FirrtlsynTest:
    def __init__(self, firrtlsyn_exe, fir_dir, verilog_dir='', log_dir=''):
        self.fir_dir = fir_dir
        fir_name = os.path.basename(self.fir_dir).replace('.fir', '')
        self.verilog_dir = verilog_dir if verilog_dir else f'{os.path.dirname(firrtlsyn_exe)}/{fir_name}.v'
        self.log_dir = log_dir if log_dir else f'{os.path.dirname(firrtlsyn_exe)}/{fir_name}.log'
        self.firrtlsyn_exe = firrtlsyn_exe
        self.has_read_firrtl_error = False
        self.has_elaborate_error = False
        self.has_write_verilog_error = False
        self.time_out = False
        self.run_time = 0
        self.run_memory = 0
        self.git_version = ''
        self.windows_environ_path = ''
        self.run_tcl = (f'read_firrtl {self.fir_dir}\n'
                        'elaborate\n'
                        f'write_verilog {self.verilog_dir} -overwrite\n'
                        'clear_firdb -all\n'
                        'exit\n')

    def instantiate(self):
        if platform.system() == 'Windows':
            thirdpart_dir = f'{os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(self.firrtlsyn_exe))))}/thirdpart'
            os.environ['TCL_LIBRARY'] = f'{thirdpart_dir}/tcl/lib/tcl8.4'
            self.windows_environ_path = os.environ['PATH']
            os.environ['PATH'] = f'{thirdpart_dir}/dll;%PATH%'

        try:
            self.git_version = subprocess.Popen('git rev-parse HEAD', stdout=subprocess.PIPE, shell=True).communicate()[0].strip()[0:8].decode('utf-8')
        except:
            pass

        if os.path.exists(f'{os.getcwd()}/firrtlsyn.log'):
            os.remove(f'{os.getcwd()}/firrtlsyn.log')

    def run(self):

        with open(f'{os.path.dirname(self.log_dir)}/run.tcl', 'w') as fp_run_tcl:
            fp_run_tcl.write(self.run_tcl)
        firrtlsyn_command = f'{self.firrtlsyn_exe} {os.path.dirname(self.log_dir)}/run.tcl'
        run_firrtlsyn = subprocess.Popen(firrtlsyn_command, shell=True)
        firrtlsyn_process = psutil.Process(run_firrtlsyn.pid)
        memory_use = [0]
        start_time = time.process_time()
        while True:
            memory_use.append(firrtlsyn_process.memory_info().rss/1024/1024) #if platform.system() == 'Linux' else None
            if subprocess.Popen.poll(run_firrtlsyn) is not None:
                end_time = time.process_time()
                break
            end_time = time.process_time()
#            if round(end_time-start_time, 0) > 300:
#                run_firrtlsyn.kill()
#                self.time_out = True
#                break
        self.run_time = end_time-start_time
        self.run_memory = round(max(memory_use), 3)
        print(os.getcwd())
        shutil.copyfile(f'firrtlsyn.log', self.log_dir)

    def collect(self):
        try:
            with open(f'{self.log_dir}', 'r') as fp_log:
                firrtlsyn_log = fp_log.read()
            self.has_read_firrtl_error = False if '*INFO*: Read firrtl files succeeded' in firrtlsyn_log else True
            self.has_elaborate_error = False if '*INFO*: Elaborate succeeded' in firrtlsyn_log else True
            re_write_succeeded = re.findall('Write verilog \'(.*?)\' succeeded', firrtlsyn_log)
            self.has_write_verilog_error = False if re_write_succeeded else True
            re_memory = re.findall('write_verilog used memory (.*?)Mb, firrtlsyn used peak memory (.*?)Mb, current used memory (.*?)Mb\.', firrtlsyn_log)
            self.run_memory = re_memory[0][2] if re_memory else 0
            log_git_version = re.findall('Git Version: (.*?)\n', firrtlsyn_log)[0]
            self.git_version = log_git_version if not self.git_version else self.git_version
            # if log_git_version != self.git_version:
            #     print(f'{self.fir_dir}: git version difference.')
        except IOError:
            print(f'can\'t open file {self.log_dir}/firrtlsyn.log!')

    def report(self):
        report_dir = f'{os.path.dirname(self.log_dir)}/report.txt'
        report_str = f'firrtlsyn exe: \"{self.firrtlsyn_exe}\".\n'
        report_str += f'firrtl: \"{self.fir_dir}\".\n'
        report_str += f'generated verilog: \"{self.verilog_dir}\".\n'
        report_str += f'run time: {self.run_time}s\nused memory: {self.run_memory}Mb.\n'
        report_str += f'read firrtl failed.\n' if self.has_read_firrtl_error else f'read firrtl succeeded.\n'
        report_str += f'elaborate failed.\n' if self.has_elaborate_error else f'elaborate succeeded.\n'
        report_str += f'write verilog failed.\n' if self.has_write_verilog_error else f'write verilog succeeded.\n'

        with open(report_dir, 'w') as fp_report:
            fp_report.write(report_str)

    def clean(self):
        if platform.system() == 'Windows':
            os.environ.pop('TCL_LIBRARY')
            os.environ.pop('PATH')
            os.environ['PATH'] = self.windows_environ_path

class FirrtlsynRegression:
    def __init__(self, firlist_dir, dest, firrtlsyn_exe):
        self.firrtlsyn_exe = firrtlsyn_exe
        self.firlist_dir = firlist_dir
        self.dest = dest
        self.fir_dir = []
        self.reference_fail = []
        self.firrtlsyn_tests = {}
        self.read_firrtl_error = []
        self.elaborate_error = []
        self.write_verilog_error = []
        self.run_time = ''
        self.run_memory = ''
        self.git_version = ''
        self.date = str(time.strftime("%Y/%m/%d", time.localtime()))
        self.windows_environ_path = ''

    def instantiate(self):
        if platform.system() == 'Windows':
            thirdpart_dir = f'{os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(self.firrtlsyn_exe))))}/thirdpart'
            os.environ['TCL_LIBRARY'] = f'{thirdpart_dir}/tcl/lib/tcl8.4'
            self.windows_environ_path = os.environ['PATH']
            os.environ['PATH'] = f'{thirdpart_dir}/dll;%PATH%'
        try:
            #self.git_version = subprocess.Popen('git rev-parse HEAD', stdout=subprocess.PIPE, shell=True).communicate()[0].strip()[0:8].decode('utf-8')
            pass
        except:
            pass

        if os.path.exists(f'{os.getcwd()}/firrtlsyn.log'):
            os.remove(f'{os.getcwd()}/firrtlsyn.log')
        if os.path.exists(self.dest):
            shutil.rmtree(self.dest)
        os.makedirs(self.dest)

    def run(self):
        fir_lst = []
        try:
            with open(self.firlist_dir, 'r') as fp_fir_lst:
                fir_lst = fp_fir_lst.readlines()
        except IOError:
            print(f'can\'t open file {self.firlist_dir}!')

        for fir_dir in fir_lst:
            fir_dir = fir_dir.strip()
            if not fir_dir:
                continue
            self.fir_dir.append(fir_dir)
            if os.path.exists(fir_dir) and fir_dir.endswith('.fir'):
                fir_name = os.path.basename(fir_dir).replace('.fir', '')
                dest_fir_dir = f'{self.dest}/{fir_name}'
                os.makedirs(dest_fir_dir) if not os.path.exists(dest_fir_dir) else None
                shutil.copyfile(fir_dir, f'{dest_fir_dir}/{fir_name}.fir')
                reference_dir = f'{os.path.dirname(fir_dir)}/reference/{fir_name}.v'
                has_reference = os.path.exists(reference_dir)
                if has_reference:
                    shutil.copyfile(reference_dir, f'{dest_fir_dir}/{fir_name}_reference.v')
                verilog_dir = f'{dest_fir_dir}/{fir_name}.v'
                log_dir = f'{dest_fir_dir}/{fir_name}.log'
                firrtlsyn_test = FirrtlsynTest(self.firrtlsyn_exe, fir_dir, verilog_dir, log_dir)
                firrtlsyn_test.run()
                firrtlsyn_test.collect()
                firrtlsyn_test.report()
                cy_verilog_dir = f'{self.dest}/{fir_name}/reference'
                if not os.path.exists(cy_verilog_dir):
                    os.makedirs(cy_verilog_dir)
                cy_verilog_path = f'{cy_verilog_dir}/{fir_name}.v'
                shutil.copyfile(verilog_dir, cy_verilog_path)
                if firrtlsyn_test.has_read_firrtl_error:
                    self.read_firrtl_error.append(fir_name)
                if firrtlsyn_test.has_elaborate_error:
                    self.elaborate_error.append(fir_name)
                if firrtlsyn_test.has_write_verilog_error:
                    self.write_verilog_error.append(fir_name)
                self.run_time += f'{fir_name}: {firrtlsyn_test.run_time}s.\n'
                self.run_memory += f'{fir_name}: {firrtlsyn_test.run_memory}Mb.\n'
                if firrtlsyn_test.git_version != self.git_version:
                    print(f'{fir_dir}: git version difference.')
                # comparison
                if os.path.exists(verilog_dir) and os.path.exists(reference_dir):
                    with open(verilog_dir, 'r') as file1:
                        content1 = file1.read()
                    with open(reference_dir, 'r') as file2:
                        content2 = file2.read()
                    if content1 != content2:
                        self.reference_fail.append(fir_name)

    def clean(self):
        if platform.system() == 'Windows':
            os.environ.pop('TCL_LIBRARY')
            os.environ.pop('PATH')
            os.environ['PATH'] = self.windows_environ_path

    def report(self):
        report_str = f'date: {self.date}.\n'
        report_str += f'git version: {self.git_version}.\n'
        str(len(self.fir_dir))
        report_str += (f'run: {str(len(self.fir_dir))}, '
                       f'read firrtl error: {str(len(self.read_firrtl_error))}, '
                       f'elaborate error: {str(len(self.elaborate_error))}, '
                       f'write verilog error: {str(len(self.write_verilog_error))}, '
                       f'reference difference: {str(len(self.reference_fail))}.\n\n')

        report_str += '\nread firrtl error:\n'
        report_str += '{}\n'.format('-'*80)
        for read_firrtl_error in self.read_firrtl_error:
            report_str += f'{read_firrtl_error}\n'

        report_str += '\nelaborate error:\n'
        report_str += '{}\n'.format('-' * 80)
        for elaborate_error in self.elaborate_error:
            report_str += f'{elaborate_error}\n'

        report_str += '\nwrite verilog error:\n'
        report_str += '{}\n'.format('-' * 80)
        for write_verilog_error in self.write_verilog_error:
            report_str += f'{write_verilog_error}'

        report_str += '\nreference fail:\n'
        report_str += '{}\n'.format('-' * 80)
        for reference_fail in self.reference_fail:
            report_str += f'{reference_fail}\n'

        report_str += '\nrun time:\n'
        report_str += '{}\n'.format('-' * 80)
        report_str += self.run_time
        report_str += '\nrun memory:\n'
        report_str += '{}\n'.format('-' * 80)
        report_str += self.run_memory
        with open(f'{self.dest}/firrtlsyn_regression_report.txt', 'w') as fp_report:
            fp_report.write(report_str)

class ConformalTest:
    def __init__(self, golden_verilog, revise_verilog, conformal_exe, top_module, log_dir=''):
        self.golden_verilog = golden_verilog
        self.revise_verilog = revise_verilog
        self.conformal_exe = conformal_exe
        self.top_module = top_module
        self.log_dir = log_dir if log_dir else f'{os.getcwd()}/conformal.log'
        self.equivalent = 'unknown'
        self.time_out = False
        self.has_error = False
        self.dofile = ('// This is my dofile\n'
                       'vpx set dofile abort exit\n'
                       '//vpx set parallel option -threads 4\n'
                       'vpx set undriven signal 0 -both\n'
                       'vpx set undefined cell black_box\n'
                       'vpx read design -systemVerilog -golden -noelaborate $golden_verilog\n'
                       'vpx elaborate design -golden\n'
                       'vpx set root module $m -golden\n'
                       'vpx read design -systemVerilog -revised -noelaborate $revise_verilog\n'
                       'vpx elaborate design -revised\n'
                       'vpx set root module $m -revised\n'
                       'vpx report design data\n'
                       'vpx report hier result -all -usage\n'
                       'set system mode lec\n'
                       'set mapping method -name first\n'
                       'map key points\n'
                       'add compare points -all\n'
                       'compare\n'
                       'report compare data -noneq\n'
                       'exit -force\n')
        os.makedirs(f'{os.path.dirname(self.log_dir)}') if not os.path.exists(f'{os.path.dirname(self.log_dir)}') else None

    def run(self):
        with open(self.revise_verilog, 'r') as fp_revise_verilog:
            revise_verilog = fp_revise_verilog.read()
        # top_module = revise_verilog_name if f'module {revise_verilog_name}' in revise_verilog else ''
        # if not top_module:
        #     re_top_module = re.search('module (.*?)\(', revise_verilog)
        #     top_module = re_top_module.group(1)

        dofile = self.dofile.replace('$golden_verilog', self.golden_verilog)
        dofile = dofile.replace('$revise_verilog', self.revise_verilog)
        dofile = dofile.replace('$m', self.top_module)
        dofile_dir = f'{os.path.dirname(self.log_dir)}/dofile'
        with open(dofile_dir, 'w') as fp_dofile:
            fp_dofile.write(dofile)

        conformal_command = f'{self.conformal_exe} -nogui -dofile {dofile_dir} -logfile {self.log_dir}'
        run_conformal = subprocess.Popen(conformal_command, shell=True)
        start_time = time.time()
        while True:
            if run_conformal.poll() is not None:
                break
            end_time = time.time()
            if round(end_time - start_time, 0) > 300:
                run_conformal.kill()
                self.time_out = True
                break

    def collect(self):
        try:
            with open(self.log_dir, 'r') as fp_conformal_log:
                conformal_log = fp_conformal_log.read()
            non_equivalent = re.search('Non-equivalent       ', conformal_log)

            if 'Error' in conformal_log:
                self.has_error = True
            if non_equivalent is not None:
                self.equivalent = 'non-equivalent'
            elif '// Command: exit -force' in conformal_log:
                self.equivalent = 'equivalent'
            else:
                self.equivalent = 'unknown'
        except:
            pass

    def report(self):
        report_str = f'golden_verilog: {self.golden_verilog}\n'
        report_str += f'revise_verilog: {self.revise_verilog}\n'
        report_str += f'logic equivalent: {self.equivalent}\n'
        report_str += f'time out: {str(self.time_out)}\n'
        report_str += f'has error: {str(self.has_error)}'

        with open(self.log_dir, 'w') as fp_report:
            fp_report.write(report_str)

class ConformalRegression:
    def __init__(self, filelist_dir, dest_dir):
        self.filelist_dir = filelist_dir
        self.dest_dir = dest_dir
        self.equivalent = []
        self.non_equivalent = []
        self.unknown = []
        self.time_out = []
        self.has_error = []
        self.case_name_lst = []
        self.log_dir = f'{self.dest_dir}/conformal_regression_report.txt'

        shutil.rmtree(self.dest_dir) if os.path.exists(self.dest_dir) else None
        os.makedirs(self.dest_dir) if not os.path.exists(self.dest_dir) else None

    def run(self):
        filelist_dir_list = []
        try:
            with open(self.filelist_dir, 'r') as fp_filelist:
                filelist_dir_list = fp_filelist.readlines()
        except:
            print(f'can\'t open {self.filelist_dir}')

        for filelist_dir in filelist_dir_list:
            filelist_dir = filelist_dir.strip().split()
            if len(filelist_dir) == 3:
                golden_verilog = filelist_dir[0]
                revise_verilog = filelist_dir[1]
                top_module = filelist_dir[2]
                case_name = os.path.basename(revise_verilog).replace('.v', '')
                self.case_name_lst.append(case_name)
                if case_name:
                    case_name_dir = f'{self.dest_dir}/{case_name}'
                    os.makedirs(case_name_dir) if not os.path.exists(case_name_dir) else None
                    if os.path.exists(revise_verilog):
                        revise_verilog_dir = f'{case_name_dir}/{case_name}_revise.v'
                        shutil.copyfile(revise_verilog, revise_verilog_dir)
                    if os.path.exists(golden_verilog):
                        golden_verilog_dir = f'{case_name_dir}/{case_name}_golden.v'
                        shutil.copyfile(golden_verilog, golden_verilog_dir)
                    log_dir = f'{case_name_dir}/conformal.log'
                    conformal_test = ConformalTest(golden_verilog_dir, revise_verilog_dir, 'LEC', top_module, log_dir)
                    conformal_test.run()
                    conformal_test.collect()
                    conformal_test.report()
                    if conformal_test.equivalent == 'equivalent':
                        self.equivalent.append(case_name)
                    elif conformal_test.equivalent == 'non-equivalent':
                        self.non_equivalent.append(case_name)
                    elif conformal_test.equivalent == 'unknown':
                        self.unknown.append(case_name)
                    else:
                        print(f'undefined equivalent \"{conformal_test.equivalent}\" of testcase {case_name}')
                    if conformal_test.time_out:
                        self.time_out.append(case_name)
                    if conformal_test.has_error:
                        self.has_error.append(case_name)

    def report(self):
        date = str(time.strftime("%Y/%m/%d", time.localtime()))
        report_str = f'date: {date}\n'
        report_str += (f'run {str(len(self.case_name_lst))}, '
                       f'equivalent: {str(len(self.equivalent))}, '
                       f'non-equivalent: {str(len(self.non_equivalent))}, '
                       f'error: {str(len(self.has_error))}, '
                       f'unknown: {str(len(self.unknown))}, '
                       f'time out: {str(len(self.time_out))}\n')

        report_str += '\nequivalent:\n'
        report_str += '{}\n'.format('-' * 80)

        for equivalent in self.equivalent:
            report_str += f'{equivalent}\n'

        report_str += '\nnon_equivalent:\n'
        report_str += '{}\n'.format('-' * 80)
        for non_equivalent in self.non_equivalent:
            report_str += f'{non_equivalent}\n'

        report_str += '\nhas error:\n'
        report_str += '{}\n'.format('-' * 80)
        for has_error in self.has_error:
            report_str += f'{has_error}\n'

        report_str += '\nunknown:\n'
        report_str += '{}\n'.format('-' * 80)
        for unknown in self.unknown:
            report_str += f'{unknown}\n'

        report_str += '\ntime out:\n'
        report_str += '{}\n'.format('-' * 80)
        for time_out in self.time_out:
            report_str += f'{time_out}\n'

        with open(self.log_dir, 'w') as fp_log_dir:
            fp_log_dir.write(report_str)

class SbtTest:
    def __init__(self, sbt_exe, fir_dir, verilog_dir='', log_dir=''):
        self.fir_dir = fir_dir
        fir_name = os.path.basename(self.fir_dir).replace('.fir', '')
        self.verilog_dir = verilog_dir if verilog_dir else f'{os.path.dirname(sbt_exe)}/{fir_name}.v'
        self.log_dir = log_dir if log_dir else f'{os.path.dirname(sbt_exe)}/{fir_name}.log'
        self.sbt_exe = f'C:/Program Files/Git/bin/bash.exe {sbt_exe}'
        self.run_time = 0
        self.run_memory = 0

    def run(self):
        sbt_command = f'{self.sbt_exe} -i {self.fir_dir} -o {self.verilog_dir} -X verilog'
        run_sbt = subprocess.Popen(sbt_command, shell=False)
        sbt_process = psutil.Process(run_sbt.pid)
        memory_use = [0]
        start_time = time.process_time()
        while True:
            memory_use.append(sbt_process.memory_info().rss/1024/1024) if platform.system() == 'Linux' else None
            if subprocess.Popen.poll(run_sbt) is not None:
                end_time = time.process_time()
                break
            end_time = time.process_time()
        self.run_time = end_time - start_time
        self.run_memory = round(max(memory_use), 3)

    def report(self):
        report_dir = f'{os.path.dirname(self.log_dir)}/report.txt'
        report_str = f'sbt firrtl exe: \"{self.sbt_exe}\".\n'
        report_str += f'firrtl: \"{self.fir_dir}\".\n'
        report_str += f'generated verilog: \"{self.verilog_dir}\".\n'
        report_str += f'run time: {self.run_time}s\nused memory: {self.run_memory}Mb.\n'

        with open(report_dir, 'w') as fp_report:
            fp_report.write(report_str)

class SbtRegression:
    def __init__(self, firlist_dir, dest_dir, sbt_exe):
        self.firlist_dir = firlist_dir
        self.dest_dir = dest_dir
        self.firlist_dir_list = []
        self.sbt_exe = sbt_exe
        self.run_time = ''
        self.run_memory = ''

    def run(self):
        firlist_dir_list = []
        try:
            with open(self.firlist_dir, 'r') as fp_firlist_dir:
                firlist_dir_list = fp_firlist_dir.readlines()
        except:
            pass

        for firlist_dir in firlist_dir_list:
            firlist_dir = firlist_dir.strip()
            fir_name = os.path.basename(firlist_dir).replace('.fir', '')
            self.firlist_dir_list.append(firlist_dir)
            dest_fir_dir = f'{self.dest_dir}/{fir_name}'
            verilog_dir = f'{dest_fir_dir}/{fir_name}.v'
            os.makedirs(dest_fir_dir) if not os.path.exists(dest_fir_dir) else None
            log_dir = f'{dest_fir_dir}/{fir_name}.log'
            print(f'sbt running {fir_name}')
            sbt_test = SbtTest(self.sbt_exe, firlist_dir, verilog_dir, log_dir)
            sbt_test.run()
            sbt_test.report()
            cy_verilog_dir = f'{self.dest_dir}/{fir_name}/sbt'
            if not os.path.exists(cy_verilog_dir):
                os.makedirs(cy_verilog_dir)
            cy_verilog_path = f'{cy_verilog_dir}/{fir_name}.v'
            shutil.copyfile(verilog_dir, cy_verilog_path)
            self.run_time += f'{fir_name}: {sbt_test.run_time}s.\n'
            self.run_memory += f'{fir_name}: {sbt_test.run_memory}Mb.\n'

    def report(self):
        date = str(time.strftime("%Y/%m/%d", time.localtime()))
        report_str = f'date: {date}\n'
        report_str += f'sbt firrtl path: {self.sbt_exe}\n'
        report_str += '\nrun time:\n'
        report_str += '{}\n'.format('-' * 80)
        report_str += self.run_time
        report_str += '\nrun memory:\n'
        report_str += '{}\n'.format('-' * 80)
        report_str += self.run_memory
        with open(f'{self.dest_dir}/sbt_regression_report.txt', 'w') as fp_sbt_log:
            fp_sbt_log.write(report_str)

if __name__ == '__main__':

    arg_parser = argparse.ArgumentParser(prog='exetest', description='firrtlsyn test')
    arg_parser.add_argument('-e', '--firrtlsyn', action='store', nargs='?', default='', help='the path of firrtlsyn exe')
    arg_parser.add_argument('-f', '--fir_dir', action='store', nargs='?', default='', help='the path of firrtl')
    arg_parser.add_argument('-v', '--verilog_dir', action='store', nargs='*', default='', help='the path of verilog')
    arg_parser.add_argument('-l', '--log_dir', action='store', nargs='?', default='', help='the path of log for single case')
    arg_parser.add_argument('-d', '--dest_dir', action='store', nargs='?', default='', help='the path of dest')
    arg_parser.add_argument('-r', '--filelist_dir', action='store', nargs='?', default='', help='the path of firlist')
    arg_parser.add_argument('-t', '--top_module', action='store', nargs='?', default='', help='')
    arg_parser.add_argument('-c', '--conformal', action='store_true', help='run conformal check')
    arg_parser.add_argument('-s', '--sbt', action='store', help='run sbt')

    args = arg_parser.parse_args()

    firrtlsyn_exe = args.firrtlsyn if args.firrtlsyn else ''
    fir_dir = args.fir_dir if args.fir_dir else ''
    verilog_dir = args.verilog_dir if args.verilog_dir else ''
    log_dir = args.log_dir if args.log_dir else ''
    dest_dir = args.dest_dir if args.dest_dir else ''
    filelist_dir = args.filelist_dir if args.filelist_dir else ''
    top_module = args.top_module if args.top_module else ''
    conformal = True if args.conformal else False
    sbt_exe = args.sbt if args.sbt else False
    # firrtlsyn
    if firrtlsyn_exe and not conformal and not sbt_exe:
        if dest_dir and filelist_dir and not fir_dir:
            firrtlsyn_regression = FirrtlsynRegression(filelist_dir, dest_dir, firrtlsyn_exe)
            firrtlsyn_regression.instantiate()
            firrtlsyn_regression.run()
            firrtlsyn_regression.clean()
            firrtlsyn_regression.report()
        elif fir_dir and not dest_dir and not filelist_dir:
            firrtlsyn_test = FirrtlsynTest(firrtlsyn_exe, fir_dir, verilog_dir, log_dir)
            firrtlsyn_test.instantiate()
            firrtlsyn_test.run()
            firrtlsyn_test.collect()
            firrtlsyn_test.clean()
            firrtlsyn_test.report()
        else:
            print('firrtlsyn test command format error.')
    # conformal
    elif conformal and not firrtlsyn_exe and not sbt_exe:
        if verilog_dir and top_module and not dest_dir and not filelist_dir:
            if len(verilog_dir) == 2:
                conformal_test = ConformalTest(verilog_dir[0], verilog_dir[1], 'LEC', top_module, log_dir)
                conformal_test.run()
                conformal_test.report()
            else:
                print('verilog_dir should be 2 parameter')
        elif filelist_dir and dest_dir and not verilog_dir and not top_module:
            conformal_regression = ConformalRegression(filelist_dir, dest_dir)
            conformal_regression.run()
            conformal_regression.report()
        else:
            print('conformal test command format error.')
    # sbt
    elif sbt_exe and not firrtlsyn_exe and not conformal:
        if fir_dir and not dest_dir and not filelist_dir:
            sbt_test = SbtTest(fir_dir, sbt_exe, log_dir)
            sbt_test.run()
        elif dest_dir and filelist_dir and not fir_dir:
            sbt_regression = SbtRegression(filelist_dir, dest_dir, sbt_exe)
            sbt_regression.run()
            sbt_regression.report()
        else:
            print('sbt test command format error.')
