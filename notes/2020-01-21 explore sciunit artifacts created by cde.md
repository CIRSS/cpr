## 2020-01-21 Explore Sciunit artifacts created by CDE

### Background
- One of the files saved by Sciunit is named `vvpkg.bin`.  This is a tar archive containing what appear to be the products of the [CDE](http://www.pgbovine.net/cde.html) system on which Sciunit is built.

- The files in the top-level `cde-package` directory in the archive promise to contain some provenance information.

- The `vvpgk.bin` archive for a sciunit representing two executions of the `date` command was previously expanded. The following files were found in the top-level `cde-package` directory:

	```
	 (sciunit) tmcphill@circe:~/sciunit/sciunit-date$ tree -L 1 cde-package
	 cde-package
	 ├── cde-exec
	 ├── cde.full-environment.cde-root
	 ├── cde.log
	 ├── cde.options
	 ├── cde-root
	 ├── cde.uname
	 ├── date.cde
	 └── provenance.cde-root.1.log

	 (sciunit) tmcphill@circe:~/sciunit/sciunit-date/cde-package$ ls -l
	 total 560
	 -rwxr-xr-x 1 tmcphill tmcphill 543544 Jan 13 18:45 cde-exec
	 -rw-r--r-- 1 tmcphill tmcphill   2532 Jan 13 18:45 cde.full-environment.cde-root
	 -rw-r--r-- 1 tmcphill tmcphill     58 Jan 13 18:45 cde.log
	 -rw-r--r-- 1 tmcphill tmcphill   1354 Jan 13 18:45 cde.options
	 drwxr-xr-x 8 tmcphill tmcphill   4096 Jan 13 18:45 cde-root
	 -rw-r--r-- 1 tmcphill tmcphill     91 Jan 13 18:45 cde.uname
	 -rwxr-xr-x 1 tmcphill tmcphill     99 Jan 13 18:45 date.cde
	 -rw-r--r-- 1 tmcphill tmcphill    749 Jan 13 18:45 provenance.cde-root.1.log
	```

### Examined types and contents of each file in the `cde-package` directory

- Determined file types using `file`:
	```
	tmcphill@circe:~/sciunit/sciunit-date/cde-package$ file *  
	cde-exec: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=a8931d8c9  
	75ff740608007fb92bea646473cc11f, stripped  
	cde.full-environment.cde-root: data  
	cde.log: ASCII text  
	cde.options: ASCII text  
	cde-root: directory  
	cde.uname: ASCII text  
	date.cde: POSIX shell script, ASCII text executable  
	provenance.cde-root.1.log: ASCII text
	```

- The `cde-exec` file appears to be a binary executable provided by the `PTU` system:
	```
	tmcphill@circe:~/sciunit/sciunit-date/cde-package$ ./cde-exec  
	PTU-r--r-- 1 tmcphill tmcphill 2532 Jan 13 18:45 cde.full-environment.cde-root  
	Basic usage: ptu-exec [command within cde-root/ to run]log
	```

- The `date.cde` file appears to be a shell script for rerunning the `date` execution via the `cde-exec` binary:

	```
	tmcphill@circe:~/sciunit/sciunit-date/cde-package$ cat date.cde
	#!/bin/sh
	HERE="$(dirname "$(readlink -f "${0}")")"
	cd "$HERE/cde-root" && ../cde-exec 'date' "$@"

	tmcphill@circe:~/sciunit/sciunit-date/cde-package$ ./date.cde
	Tue Jan 21 19:23:10 PST 2020

	tmcphill@circe:~/sciunit/sciunit-date/cde-package$ ./date.cde
	Tue Jan 21 19:23:13 PST 2020
	```

- The `cde.full-environment.cde-root` file appears to contain a process environment variable string:
	```
	tmcphill@circe:~/sciunit/sciunit-date/cde-package$ cat cde.full-environment.cde-root  
	HOSTTYPE=x86_64LESSCLOSE=/usr/bin/lesspipe %s %sLANG=en_US.UTF-8DISPLAY=0:0GITREPOS=/mnt/c/Users/tmcphill/GitReposOLDPWD=/home/tmcphillWSL_INTEROP=/run/WSL/14806_interopWSL_DISTRO_NAME=Debia  
	nVIRTUAL_ENV=/home/tmcphill/.venv/sciunitUSER=tmcphillXSB_DIR=/home/tmcphill/XSBPWD=/home/tmcphill/scratchPLAYBOOKS_REPO=/mnt/c/Users/tmcphill/GitRepos/ansible-playbooksHOME=/home/tmcphillWI  
	NHOME=/mnt/c/Users/tmcphillNAME=circeANTLR4_JAR=/home/tmcphill/.antlr4/antlr-4.7.2-complete.jarPLAYBOOKS=/mnt/c/Users/tmcphill/GitRepos/ansible-playbooks/debianSHELL=/bin/bashTERM=xterm-256c  
	olorSHLVL=1LOGNAME=tmcphillPATH=/home/tmcphill/.venv/sciunit/bin:/home/tmcphill/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/mnt/c/ProgramDat  
	a/DockerDesktop/version-bin:/mnt/c/Program Files/Docker/Docker/Resources/bin:/mnt/c/Program Files/Python36/Scripts/:/mnt/c/Program Files/Python36/:/mnt/c/Program Files/Microsoft MPI/Bin/:/mn  
	t/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program Files/dotnet/:/mnt/c/Program  
	Files/Microsoft SQL Server/130/Tools/Binn/:/mnt/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/mnt/c/Program Files/NVIDIA Corporation/NVIDIA NvDLISR:/mnt/c/ProgramData/chocolatey/bin  
	:/mnt/c/HashiCorp/Vagrant/bin:/mnt/c/Program Files/MiKTeX 2.9/miktex/bin/x64/:/mnt/c/Program Files/Microsoft SQL Server/Client SDK/ODBC/170/Tools/Binn/:/mnt/c/Program Files/PowerShell/6/:/mn  
	t/c/Program Files (x86)/IncrediBuild:/mnt/c/Program Files/Git/cmd:/mnt/c/Program Files/Java/jdk1.8.0_231/bin:/mnt/c/Go/bin:/mnt/c/Program Files (x86)/Windows Kits/10/Windows Performance Tool  
	kit/:/mnt/c/Program Files (x86)/Windows Kits/10/Microsoft Application Virtualization/Sequencer/:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/Wi  
	ndowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Users/tmcphill/AppData/Local/Microsoft/WindowsApps:/mnt/c/Program Files/Microsoft VS Code/bin:/mnt/c/Users/tmcphill/AppData/Loca  
	l/Programs/Microsoft VS Code/bin:/mnt/c/ProgramData/chocolatey/lib/mingw/tools/install/mingw64/bin:/mnt/c/Users/tmcphill/go/bin:/mnt/c/Users/tmcphill/go/bin:/mnt/c/Users/tmcphill/AppData/Loc  
	al/Microsoft/WindowsApps:/usr/local/go/bin:/home/tmcphill/XSB/binPS1=(sciunit) ${debian_chroot:+($debian_chroot)}\u@\h:\w\$ WSLENV=LESSOPEN=| /usr/bin/lesspipe %s_=/home/tmcphill/.venv/sciun  
	it/bin/sciunitLINES=46COLUMNS=136
	```
- The `cde.option` file appears to customize the execution of CDE:
	``` 
	tmcphill@circe:~/sciunit/sciunit-date/cde-package$ cat cde.options  
	# cde.options v1 (do not alter this first line!)  
	  
	# These directories often contain pseudo-files that shouldn't be tracked  
	ignore_prefix=/dev/  
	ignore_exact=/dev  
	ignore_prefix=/proc/  
	ignore_exact=/proc  
	ignore_prefix=/sys/  
	ignore_exact=/sys  
	ignore_prefix=/var/cache/  
	ignore_prefix=/var/lock/  
	ignore_prefix=/var/log/  
	ignore_prefix=/var/run/  
	ignore_prefix=/var/tmp/  
	ignore_prefix=/tmp/  
	ignore_exact=/tmp  
	  
	# un-comment the entries below if you think they might help your app:  
	#ignore_exact=/etc/ld.so.cache  
	#ignore_exact=/etc/ld.so.preload  
	#ignore_exact=/etc/ld.so.nohwcap  
	  
	# Ignore .Xauthority to allow X Windows programs to work  
	ignore_substr=.Xauthority  
	ignore_exact=/etc/resolv.conf  
	ignore_exact=/etc/host.conf  
	ignore_exact=/etc/hosts  
	ignore_exact=/etc/nsswitch.conf  
	ignore_exact=/etc/gai.conf  
	  
	# Access the target machine's password files:  
	# (some programs like texmacs need these lines to be commented-out,  
	# since they try to use home directory paths within the passwd file,  
	# and those paths might not exist within the package.)  
	ignore_prefix=/etc/passwd  
	ignore_prefix=/etc/shadow  
	  
	# These environment vars might lead to 'overfitting' and hinder portability  
	ignore_environment_var=DBUS_SESSION_BUS_ADDRESS  
	ignore_environment_var=ORBIT_SOCKETDIR  
	ignore_environment_var=SESSION_MANAGER  
	ignore_environment_var=XAUTHORITY  
	ignore_environment_var=DISPLAY
	```

- The `cde.uname` file appears to record information provided by `uname` on the host system where the sciunit was created:
	```
	tmcphill@circe:~/sciunit/sciunit-date/cde-package$ cat cde.uname  
	uname: 'Linux' '4.19.84-microsoft-standard' '#1 SMP Wed Nov 13 11:44:37 UTC 2019' 'x86_64'
	```

- The `cde.log` file appears to be a log file that also can be used to rerun the captured execution:
	```
	tmcphill@circe:~/sciunit/sciunit-date/cde-package$ cat cde.log  
	# ["date"]  
	cd 'cde-root/home/tmcphill/scratch'  
	./date.cde

	tmcphill@circe:~/sciunit/sciunit-date/cde-package$ chmod a+rx cde.log  

	tmcphill@circe:~/sciunit/sciunit-date/cde-package$ ./cde.log  
	Tue Jan 21 19:38:57 PST 2020  

	tmcphill@circe:~/sciunit/sciunit-date/cde-package$ ./cde.log  
	Tue Jan 21 19:39:01 PST 2020
	```

- Finally, the `provenance.cde-root.1.log` file appears to contain a log of timestamped system calls corresponding to the execution captured by the sciunit;
	```
	tmcphill@circe:~/sciunit/sciunit-date/cde-package$ cat provenance.cde-root.1.log
	# @agent: tmcphill
	# @machine: Linux circe 4.19.84-microsoft-standard #1 SMP Wed Nov 13 11:44:37 UTC 2019 x86_64 GNU/Linux
	# @namespace: cde-root
	# @subns: 1
	# @fullns: cde-root.1
	# @parentns: (null)
	1578969957 15894 EXECVE 15900 /bin/date /home/tmcphill/scratch ["date"]
	1578969957 15900 EXECVE2 -1
	1578969957 15900 MEM 421888
	1578969957 15900 READ /etc/ld.so.cache
	1578969957 15900 CLOSE /etc/ld.so.cache
	1578969957 15900 READ /lib/x86_64-linux-gnu/libc.so.6
	1578969957 15900 CLOSE /lib/x86_64-linux-gnu/libc.so.6
	1578969957 15900 READ /usr/lib/locale/locale-archive
	1578969957 15900 CLOSE /usr/lib/locale/locale-archive
	1578969957 15900 READ /etc/localtime
	1578969957 15900 CLOSE /etc/localtime
	1578969957 15900 MEM 6045696
	1578969957 15900 EXIT
	```

### Observations

- No process-data provenance graph appears to be recorded in the `vvpkg.bin` archive.  In principle, the log of system calls recorded in `provenance.cde-root.1.log` could be parsed and used to determine the process-process and process-data edges of this graph.

- Otherwise the files in the `vvpkg.bin` archive appear to be limited to those necessary to rerun the sciunit.

- Given that the output of the `cde-exec` binary refers to `ptu-exec`, the `vvpkg.bin` archive likely is not the product of the original CDE system, but of the [PTU](https://www.slideshare.net/TanuMalik/ptu-tapp13) system which either embeds or extends CDE.


