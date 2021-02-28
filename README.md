GPU monitoring sensor for PRTG\
SSH Script Advanced based sensor to probe Linux system and collect GPU stats

Prerequisites\
Working installation of Paessler PRTG Network Monitor\
Linux sysetm containing nVidia GPU's\
Relevant nVidia driver installed on Linux system\
SSH installed enabled on Linux system


Installation and setup\
Copy scripts to linux system `/var/prtg/scriptsxml`\
In PRTG webui/desktop, go to system you want to monitor (Device)\
Add Sensor, chosing SSH Script Advanced\
In Sensor Settings, chose script from the drop down list\
Adjust SSH Specific settings to match your environment\
Click Create to save and make the sensor

Built With\
Notepad.exe

License\
see the LICENSE.md file for details

Acknowledgments\
nVidia nvidia-smi documentation\
Paessler PRTG manual
