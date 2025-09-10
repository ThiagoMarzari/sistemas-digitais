@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xelab  -wto 58e044dfe5e34f28b5e5f523bc03f72e -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot detector_tb_behav xil_defaultlib.detector_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
