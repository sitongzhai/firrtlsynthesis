# FIRRTL Synthesis Tool

## Introduction
**ToDo:** Will be updated after paper published.
<!-- The FIRRTL Synthesis Tool (FST) is designed to facilitate the completion of the chisel tool chain. Primitive based firrtl synthesis flow separates the design of primitive macros from the design of circuits. FST tries to build an open source FIRRTL synthesis tool that does not rely on any existing synthesis tools.

FST elaborates the FIRRTL to a primitive level netlist and then transfers to RTL or gate level netlist with an RTL or gate level macro library. FST supports all the features of FIRRTL not only in the specification but also the experimental features already in the Chisel\/FIRRTL project. 

FST is built as an extensible framework so it can be used easily as the basis for custom FIRRTL synthesis and as an environment for implementation and research on primitive or gate level netlist optimization algorithms. In addition, an RTL level primitive macro library has been designed in this paper. With this library, the generated primitive level netlists all have passed the logical equivalent check (LEC) by Conformal from Cadence. 
  -->
  
## License
All FST source code is under MIT license.
See the [full license](LICENSE.md) for details.

<!-- ## How to Cite
The following paper may be used as a general citation for FST:

Sitong Zhai, Furong Xiang and Vaughn Betz "A Fast and Extensible Primitive-Based FIRRTL Synthesis Tool", ICCAD, 2022.

Bibtex:
```
@article{fst,
  title={A Fast and Extensible Primitive-Based FIRRTL Synthesis Tool},
  author={Sitong Zhai, Furong Xiang and Vaughn Betz},
  journal={ICCAD},
  year={2022}
}
```
 -->

## Building

FST is cross-platform. It requires miracl and tcl8.4.20, readline6.0 is required on Linux platform and pthread is required on Windows plarform. In addition, "qmake" is required to build.

#### 1.Windows
Come into direction "firrtlsynthesis/code/build". Double click the batch script "make_2013.bat". The environment will be configured and "firrtlsyn.sln" file will be generated automatically, then the solution file will be open with visual studio 2013. 

The third party libraries in "firrtlsynthesis/thirdparty" were built by Visual Studio 2013 with the platform toolset "v120" using processor "Intel(R) i7-2720QM". The libraries may need to be recompiled if using other windows platforms.

The default path of Visual Studio 2013 is "C:\Program Files (x86)\Microsoft Visual Studio 12.0", "VS_PATH" and "%VS_PATH%\VC\bin\amd64\vcvars64.bat" in "make_2013.bat" should be changed if using other paths.

The default path of "qmake" is "D:\opt\Qt\qt-5.8.0\msvc2013_64\bin". "QT_PATH" in "make_20013.bat" should be modified if using other paths. The default "-spec" of qmake is "win32-msvc2013", the platform-specific variable should be changed if using other platforms.

<!-- "D:\application\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin\amd64\MSBuild.exe" fastsyn.sln /p:Configuration=Release;Platform=x64 -->

#### 2.Linux
Set the environemnt as below or using absolute paths:
    
    export LD_LIBRARY_PATH="../thirdparty/Linux/tcl:../thirdparty/Linux/readline:$LD_LIBRARY_PATH"
    export TCL_LIBRARY="../thirdparty/Linux/tcl/tcl8.4"

If using relative paths as above, come into direction "firrtlsynthesis/code" to build:

    ./build/make_pro
    make

The binary executable will be generated in "firrtlsynthesis/bin/Linux" as "firrtlsyn".
"make debug" will generate "firrtlsyn-debug" in the same path.

The static libraries were compiled in "Ubuntu 16.04TLS" using processor "Intel(R) i7-2720QM". The libraries may need to be recompiled if using other Linux plarform.

## Run/Debug FST
If using relative paths in the environment on Linux, come into direction "firrtlsynthesis/code", run FST with:

    ./bin/Linux/fittrlsyn

Use tcl commands to synthesis FIRRTL to netlist files:

    read_firrtl path_of_firrtl/XXX.fir
    elaborate
    write_verilog path_of_verilog/XXX.v

or use a tcl script to run as:

    source path_of_script/XXX.tcl

or run the tcl script directly as:

    path_of_firrtlsyn/firrtlsyn path_of_script/XXX.tcl

## FST commands

#### 1.read_firrtl XXX.fir

Command "read_firrtl" parses a FIRRTL source file using flex/bison, and build an abstract syntax tree (AST) in FST. 

#### 2.elaborate -optimize_exp true -reg positive

Command "elaborate" elaborates the parsed AST to a primitive level FIRRTL netlist. "-optimize_exp" and "-reg" are optional. 

The default value of "-optimize_exp" is "true", which will optimize the constant and inferred constant expressions to the constants.
The default value of "-reg" is "positive". This is used for declaring the type of registers, positive or negative edge triggered registers.

#### 3.write_verilog XXX.v

Command "write_verilog" generates the primitive level Verilog netlist. The edif and blif format of netlists have not been support yet. The primitive level Verilog netlists are powered with a primitive macro cell library, which is RTL level and is easy to changed with other levels/formats. 

<!-- ## Results
The testcases come from "treadle", "FIRRTL", submodules of "Rocket Chip", and self-designed unit tests. 

#### 1.Logical Equivalent Check
All the 224 testcases passed the logical equivalent check (LEC) by the commercial LEC tool Conformal from Candence.

#### 2.Runtimes
FST runs 26.8x faster than project FIRRTL on average. 2-4 times on large designs and 30-50 times on small designs.

#### 3.Delays and Resource Usages

|                            |224 testcases|99 significant testcases|
|----------------------------|-------------|------------------------|
|Worst Timing                |        -0.2%|                    0.7%|
|Max Sequential Delay        |           1%|                    2.6%|
|Max Combinational Path Delay|        -1.6%|                   -2.7%|
|Slice Register #            |        -1.2%|                   -1.2%|
|Slice LUT #                 |        -3.5%|                   -2.4%|
|LUT FF Pair #               |        -1.9%|                   -1.9%|
|DSP #                       |         Same|                    Same|
|BRAM/FIFO #                 |         Same|                    Same|
|I/O #                       |         Same|                    Same|
|BUFG/BUFGCTRL #             |         Same|                    Same|


**Note:** The golden results (sbt) in testcases are generated by FIRRTL with git version 0a1aa5f56fe5eb563de7c33faa8eae33caa65441，Author: Jack Koenig <koenig@sifive.com>，Date:   Mon Apr 19 14:11:21 2021 -0700 -->


## Develop New Commands & Functions
<!-- FST project is built as extensible framework. FST can be easily used as the basis for custom FIRRTL synthesis tool because it fully supports FIRRTL features in the specification and experimental features. It can also be used as the environment for the implementation and research on primitive or gate level netlist optimization algorithms.  -->

#### register new commands
All tcl commands need to be registered in function "int registerAllCmds(Tcl_Interp* interp)" of "firrtlsynthesis/code/src/tcl/register_commands.cpp"


## References
[1] ] P. S. Li, A. M. Izraelevitz, and J. Bachrach, “Specification for the firrtl language,” EECS Department, University of California, Berkeley, Tech. Rep. UCB/EECS-2016-9, 2016.
[2] “Chisel/firrtl hardware compiler framework,” Website, https://www.chisel-lang.org/.
[3] A. Izraelevitz, J. Koenig, P. Li, R. Lin, A. Wang, A. Magyar, D. Kim, C. Schmidt, C. Markley, J. Lawson et al., “Reusability is firrtl ground: Hardware construction languages, compiler frameworks, and transformations,” in 2017 IEEE/ACM International Conference on Computer-Aided Design (ICCAD). IEEE, 2017, pp. 209–216.
[4] J. Bachrach, H. Vo, B. Richards, Y. Lee, A. Waterman, R. Aviˇzienis, J. Wawrzynek, and K. Asanovi´c, “Chisel: constructing hardware in a scala embedded language,” in DAC Design Automation Conference 2012. IEEE, 2012, pp. 1212–1221.
[5] K. Asanovic, R. Avizienis, J. Bachrach, S. Beamer, D. Biancolin, C. Celio, H. Cook, D. Dabbelt, J. Hauser, A. Izraelevitz et al., “The rocket chip generator,” EECS Department, University of California, Berkeley, Tech. Rep. UCB/EECS-2016-17, 2016.
[6] “A chisel/firrtl execution engine,” Website, https://github.com/chipsalliance/treadlel.
[7] “Flexible internal representation for rtl,” Website, https://github.com/chipsalliance/firrtl.