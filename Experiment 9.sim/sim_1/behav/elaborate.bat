@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto a2a922147ac14461947d824a5b85eb56 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot testbench_exp7_behav xil_defaultlib.testbench_exp7 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
