@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xelab  -wto 3a961f81a6024e2ab4cf66932374c3d1 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_porta_senha_behav xil_defaultlib.tb_porta_senha -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
