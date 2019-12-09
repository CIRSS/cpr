
## 2019-12-02 Install ReproZip on desktop Linux system

### Background
- Need to run ReproZip under well-defined conditions, starting with an installation on desktop computer running Ubuntu 18.04.
- Recording manual configuration of computing environment to facilitate automating set up of equivalent environments elsewhere.

### Recorded system information for desktop system `artemis`

- Linux distribution and release
	```
	tmcphill@artemis:~$ cat /etc/lsb-release  
	DISTRIB_ID=Ubuntu  
	DISTRIB_RELEASE=18.04  
	DISTRIB_CODENAME=bionic  
	DISTRIB_DESCRIPTION="Ubuntu 18.04.3 LTS"  
	
	tmcphill@artemis:~$ cat /etc/os-release
	NAME="Ubuntu"  
	VERSION="18.04.3 LTS (Bionic Beaver)"  
	ID=ubuntu  
	ID_LIKE=debian  
	PRETTY_NAME="Ubuntu 18.04.3 LTS"  
	VERSION_ID="18.04"  
	HOME_URL="https://www.ubuntu.com/"  
	SUPPORT_URL="https://help.ubuntu.com/"  
	BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"  
	PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"  
	VERSION_CODENAME=bionic  
	UBUNTU_CODENAME=bionic
	```
### Reviewed installation requirements for ReproZip

- Read [ReproZip installation instruction page](https://docs.reprozip.org/en/1.0.x/install.html).

- Noted the following apt package prerequisites:
	```python python-dev python-pip gcc libsqlite3-dev libssl-dev libffi-dev```
	
- Installed system-wide prerequisites unrelated to Python
	```
	tmcphill@artemis:~$ sudo apt install gcc libsqlite3-dev libssl-dev libffi-dev
	[sudo] password for tmcphill: 
	Reading package lists... Done
	Building dependency tree       
	Reading state information... Done
	gcc is already the newest version (4:7.4.0-1ubuntu2.3).
	Suggested packages:
	  sqlite3-doc libssl-doc
	The following NEW packages will be installed:
	  libffi-dev libsqlite3-dev libssl-dev
	0 upgraded, 3 newly installed, 0 to remove and 0 not upgraded.
	Need to get 2,354 kB of archives.
	After this operation, 10.3 MB of additional disk space will be used.
	Do you want to continue? [Y/n] 
	Get:1 http://us.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libsqlite3-dev amd64 3.22.0-1ubuntu0.2 [632 kB]
	Get:2 http://us.archive.ubuntu.com/ubuntu bionic-updates/main amd64 libssl-dev amd64 1.1.1-1ubuntu2.1~18.04.5 [1,566 kB]
	Get:3 http://us.archive.ubuntu.com/ubuntu bionic/main amd64 libffi-dev amd64 3.2.1-8 [156 kB]
	Fetched 2,354 kB in 1s (2,532 kB/s)  
	Selecting previously unselected package libsqlite3-dev:amd64.
	(Reading database ... 230248 files and directories currently installed.)
	Preparing to unpack .../libsqlite3-dev_3.22.0-1ubuntu0.2_amd64.deb ...
	Unpacking libsqlite3-dev:amd64 (3.22.0-1ubuntu0.2) ...
	Selecting previously unselected package libssl-dev:amd64.
	Preparing to unpack .../libssl-dev_1.1.1-1ubuntu2.1~18.04.5_amd64.deb ...
	Unpacking libssl-dev:amd64 (1.1.1-1ubuntu2.1~18.04.5) ...
	Selecting previously unselected package libffi-dev:amd64.
	Preparing to unpack .../libffi-dev_3.2.1-8_amd64.deb ...
	Unpacking libffi-dev:amd64 (3.2.1-8) ...
	Setting up libsqlite3-dev:amd64 (3.22.0-1ubuntu0.2) ...
	Setting up libssl-dev:amd64 (1.1.1-1ubuntu2.1~18.04.5) ...
	Setting up libffi-dev:amd64 (3.2.1-8) ...
	Processing triggers for install-info (6.5.0.dfsg.1-2) ...
	Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
	```

- Installed `sqlite3` package to enable command-line operations on the SQLite databases created by ReproZip:
	```
	tmcphill@artemis:~$ sudo apt install sqlite3
	[sudo] password for tmcphill: 
	Reading package lists... Done
	Building dependency tree       
	Reading state information... Done
	Suggested packages:
	  sqlite3-doc
	The following NEW packages will be installed:
	  sqlite3
	0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
	Need to get 754 kB of archives.
	After this operation, 2,481 kB of additional disk space will be used.
	Get:1 http://us.archive.ubuntu.com/ubuntu bionic-updates/main amd64 sqlite3 amd64 3.22.0-1ubuntu0.2 [754 kB]
	Fetched 754 kB in 1s (1,031 kB/s)
	Selecting previously unselected package sqlite3.
	(Reading database ... 230409 files and directories currently installed.)
	Preparing to unpack .../sqlite3_3.22.0-1ubuntu0.2_amd64.deb ...
	Unpacking sqlite3 (3.22.0-1ubuntu0.2) ...
	Setting up sqlite3 (3.22.0-1ubuntu0.2) ...
	Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
	```

### Installed Python 3.7 alongside default Python 3.6

- Determined that Python 3.6 currently is installed (the python3 apt package):
	```
	tmcphill@artemis:~$ apt list python3 -a  
	Listing... Done  
	python3/bionic-updates,now 3.6.7-1~18.04 amd64 [installed]  
	python3/bionic 3.6.5-3 amd64
	```
- Installed Python 3.7 alongside 3.6:
	```
	tmcphill@artemis:~$ sudo apt install python3.7  
	Reading package lists... Done  
	Building dependency tree  
	Reading state information... Done  
	Suggested packages:  
	python3.7-venv python3.7-doc  
	The following NEW packages will be installed:  
	python3.7  
	0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.  
	Need to get 301 kB of archives.  
	After this operation, 434 kB of additional disk space will be used.  
	Get:1 http://us.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 python3.7 amd64 3.7.5-2~18.04 [  
	301 kB]  
	Fetched 301 kB in 1s (511 kB/s)  
	Selecting previously unselected package python3.7.  
	(Reading database ... 230222 files and directories currently installed.)  
	Preparing to unpack .../python3.7_3.7.5-2~18.04_amd64.deb ...  
	Unpacking python3.7 (3.7.5-2~18.04) ...  
	Setting up python3.7 (3.7.5-2~18.04) ...  
	Processing triggers for mime-support (3.60ubuntu1) ...  
	Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
	```

- Confirmed that Python 3.6 and 3.7 now are both installed system-wide:
	```
	tmcphill@artemis:~$ python3 --version  
	Python 3.6.9  
	tmcphill@artemis:~$ python3.7 --version  
	Python 3.7.5
	```
- Determined that pip3 still refers to the Python 3.6 distribution:

	```
	tmcphill@artemis:~$ pip3 --version  
	pip 18.1 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)  
	
	tmcphill@artemis:~$ pip3.7 --version  
	pip3.7: command not found
	```
- Installed pip for Python 3.7 using `get-pip.py`:
	```
	tmcphill@artemis:~$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py  
	% Total % Received % Xferd Average Speed Time Time Time Current  
	Dload Upload Total Spent Left Speed  
	100 1734k 100 1734k 0 0 2127k 0 --:--:-- --:--:-- --:--:-- 2125k

	tmcphill@artemis:~$ sudo python3.7 ./get-pip.py  
	WARNING: The directory '/home/tmcphill/.cache/pip/http' or its parent directory is not owned by the cur  
	rent user and the cache has been disabled. Please check the permissions and owner of that directory. If  
	executing pip with sudo, you may want sudo's -H flag.  
	WARNING: The directory '/home/tmcphill/.cache/pip' or its parent directory is not owned by the current  
	user and caching wheels has been disabled. check the permissions and owner of that directory. If execut  
	ing pip with sudo, you may want sudo's -H flag.  
	Collecting pip  
	Downloading https://files.pythonhosted.org/packages/00/b6/9cfa56b4081ad13874b0c6f96af8ce16cfbc1cb06be  
	df8e9164ce5551ec1/pip-19.3.1-py2.py3-none-any.whl (1.4MB)  
	|████████████████████████████████| 1.4MB 3.0MB/s  
	Collecting wheel  
	Downloading https://files.pythonhosted.org/packages/00/83/b4a77d044e78ad1a45610eb88f745be2fd2c6d658f9  
	798a15e384b7d57c9/wheel-0.33.6-py2.py3-none-any.whl  
	Installing collected packages: pip, wheel  
	Successfully installed pip-19.3.1 wheel-0.33.6
	```
- Determined that `pip3` is now equivalent to `pip3.7`, but `pip3.6` is still available:
	```
	tmcphill@artemis:~$ pip3 --version  
	pip 19.3.1 from /usr/local/lib/python3.7/dist-packages/pip (python 3.7)
	  
	tmcphill@artemis:~$ pip3.7 --version  
	pip 19.3.1 from /usr/local/lib/python3.7/dist-packages/pip (python 3.7)  
	
	tmcphill@artemis:~$ pip3.6 --version  
	pip 18.1 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)
	```
- Determined that the three pip commands above are all bash scripts:
	```
	tmcphill@artemis:~$ cat /usr/local/bin/pip3.7  
	#!/usr/bin/python3.7  
	# -*- coding: utf-8 -*-  
	import re  
	import sys  
	from pip._internal.main import main  
	if __name__ == '__main__':  
	sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])  
	sys.exit(main())  
	
	tmcphill@artemis:~$ cat /usr/local/bin/pip3.6  
	#!/usr/bin/python3  
	# -*- coding: utf-8 -*-  
	import re  
	import sys  
	from pip._internal import main    
	if __name__ == '__main__':  
	sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])  
	sys.exit(main())  
	
	tmcphill@artemis:~$ cat /usr/local/bin/pip3  
	#!/usr/bin/python3.7  
	# -*- coding: utf-8 -*-  
	import re  
	import sys  
	from pip._internal.main import main  
	if __name__ == '__main__':  
	sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])  
	sys.exit(main())
	```
- Copied pip3.6 over pip3 to restore old behavior of `pip3` command:
	```
	tmcphill@artemis:~$ sudo cp /usr/local/bin/pip3.6 /usr/local/bin/pip3

	tmcphill@artemis:~$ pip3 --version  
	pip 18.1 from /usr/local/lib/python3.6/dist-packages/pip (python 3.6)
	```

- Installed `python3.7-venv` package to support Python virtual environments with Python 3.7:
	```
	tmcphill@artemis:~$ sudo apt-get install python3.7-venv
	[sudo] password for tmcphill: 
	Reading package lists... Done
	Building dependency tree       
	Reading state information... Done
	The following NEW packages will be installed:
	  python3.7-venv
	0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
	Need to get 6,184 B of archives.
	After this operation, 32.8 kB of additional disk space will be used.
	Get:1 http://us.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 python3.7-venv amd64 3.7.5-2~18.04 [6,184 B]
	Fetched 6,184 B in 0s (24.9 kB/s)         
	Selecting previously unselected package python3.7-venv.
	(Reading database ... 230240 files and directories currently installed.)
	Preparing to unpack .../python3.7-venv_3.7.5-2~18.04_amd64.deb ...
	Unpacking python3.7-venv (3.7.5-2~18.04) ...
	Setting up python3.7-venv (3.7.5-2~18.04) ...
	Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
	```
### Set up Python 3.7 virtual environment for working with ReproZip

- Created a Python 3.7 virtual environment for working with ReproZip:
	```
	tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip$ python3.7 -m venv .venv-reprozip
	```
- Confirmed that virtual environment uses Python 3.7:
	```
	tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip$ cat .venv-reprozip/pyvenv.cfg 
	home = /usr/bin
	include-system-site-packages = false
	version = 3.7.5

	tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip$ ls -al .venv-reprozip/bin/
	total 40
	drwxrwxr-x 2 tmcphill tmcphill 4096 Dec  2 17:36 .
	drwxrwxr-x 6 tmcphill tmcphill 4096 Dec  2 17:35 ..
	-rw-r--r-- 1 tmcphill tmcphill 2264 Dec  2 17:36 activate
	-rw-r--r-- 1 tmcphill tmcphill 1316 Dec  2 17:36 activate.csh
	-rw-r--r-- 1 tmcphill tmcphill 2468 Dec  2 17:36 activate.fish
	-rwxrwxr-x 1 tmcphill tmcphill  296 Dec  2 17:36 easy_install
	-rwxrwxr-x 1 tmcphill tmcphill  296 Dec  2 17:36 easy_install-3.7
	-rwxrwxr-x 1 tmcphill tmcphill  268 Dec  2 17:36 pip
	-rwxrwxr-x 1 tmcphill tmcphill  268 Dec  2 17:36 pip3
	-rwxrwxr-x 1 tmcphill tmcphill  268 Dec  2 17:36 pip3.7
	lrwxrwxrwx 1 tmcphill tmcphill    9 Dec  2 17:31 python -> python3.7
	lrwxrwxrwx 1 tmcphill tmcphill    9 Dec  2 17:31 python3 -> python3.7
	lrwxrwxrwx 1 tmcphill tmcphill   18 Dec  2 17:31 python3.7 -> /usr/bin/python3.7
	```
- Activated new venv and confirmed that `python` command runs python3.7:
	```
	tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip$ . .venv-reprozip/bin/activate
	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip$ python --version
	Python 3.7.5
	```
- But noticed that `pip` in the venv is out of date:
	```
	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip$ pip --version
	pip 9.0.1 from /linfast/GitRepos/wt-prov-model/toolkits/reprozip/.venv-reprozip/lib/python3.7/site-packages (python 3.7)
	```
- Upgraded pip in the venv to get the latest version:
	```
	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip$ pip install -U pip
	Cache entry deserialization failed, entry ignored
	Collecting pip
	  Downloading https://files.pythonhosted.org/packages/00/b6/9cfa56b4081ad13874b0c6f96af8ce16cfbc1cb06bedf8e9164ce5551ec1/pip-19.3.1-py2.py3-none-any.whl (1.4MB)
	    100% |████████████████████████████████| 1.4MB 787kB/s 
	Installing collected packages: pip
	  Found existing installation: pip 9.0.1
	    Uninstalling pip-9.0.1:
	      Successfully uninstalled pip-9.0.1
	Successfully installed pip-19.3.1

	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip$ pip --version
	pip 19.3.1 from /linfast/GitRepos/wt-prov-model/toolkits/reprozip/.venv-reprozip/lib/python3.7/site-packages/pip (python 3.7)
	```
- Packages installed in venv are minimal:
	```
	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip$ pip list
	Package       Version
	------------- -------
	pip           19.3.1 
	pkg-resources 0.0.0  
	setuptools    39.0.1
	```

###  Installed ReproZip in virtual environment
- Installed reprozip package in venv:
	```
	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip$ pip install reprozip
	Collecting reprozip
	  Downloading https://files.pythonhosted.org/packages/34/02/efdf11f33400f5108bd0fd78e49a303235cf5b23f6d484ac4f3d343ba127/reprozip-1.0.16-cp37-cp37m-manylinux2010_x86_64.whl (750kB)
	     |████████████████████████████████| 757kB 3.1MB/s 
	Collecting distro
	  Downloading https://files.pythonhosted.org/packages/ea/35/82f79b92fa4d937146c660a6482cee4f3dfa1f97ff3d2a6f3ecba33e712e/distro-1.4.0-py2.py3-none-any.whl
	Collecting usagestats>=0.3
	  Downloading https://files.pythonhosted.org/packages/25/51/f1a1e1dbfa0f556186ec6507cad03ef6c42831de8ef13cf6fd9f57aaa621/usagestats-0.8-py2.py3-none-any.whl
	Collecting PyYAML
	  Downloading https://files.pythonhosted.org/packages/8d/c9/e5be955a117a1ac548cdd31e37e8fd7b02ce987f9655f5c7563c656d5dcb/PyYAML-5.2.tar.gz (265kB)
	     |████████████████████████████████| 266kB 19.5MB/s 
	Collecting requests
	  Downloading https://files.pythonhosted.org/packages/51/bd/23c926cd341ea6b7dd0b2a00aba99ae0f828be89d72b2190f27c11d4b7fb/requests-2.22.0-py2.py3-none-any.whl (57kB)
	     |████████████████████████████████| 61kB 4.4MB/s 
	Collecting rpaths>=0.8
	  Downloading https://files.pythonhosted.org/packages/3b/fb/a0ebfe0091df57e66d4b4f28ef8c433b038104a16e51cc862f1d891387fc/rpaths-0.13-py2.py3-none-any.whl
	Collecting urllib3!=1.25.0,!=1.25.1,<1.26,>=1.21.1
	  Downloading https://files.pythonhosted.org/packages/b4/40/a9837291310ee1ccc242ceb6ebfd9eb21539649f193a7c8c86ba15b98539/urllib3-1.25.7-py2.py3-none-any.whl (125kB)
	     |████████████████████████████████| 133kB 25.3MB/s 
	Collecting certifi>=2017.4.17
	  Downloading https://files.pythonhosted.org/packages/b9/63/df50cac98ea0d5b006c55a399c3bf1db9da7b5a24de7890bc9cfd5dd9e99/certifi-2019.11.28-py2.py3-none-any.whl (156kB)
	     |████████████████████████████████| 163kB 31.9MB/s 
	Collecting idna<2.9,>=2.5
	  Downloading https://files.pythonhosted.org/packages/14/2c/cd551d81dbe15200be1cf41cd03869a46fe7226e7450af7a6545bfc474c9/idna-2.8-py2.py3-none-any.whl (58kB)
	     |████████████████████████████████| 61kB 4.8MB/s 
	Collecting chardet<3.1.0,>=3.0.2
	  Using cached https://files.pythonhosted.org/packages/bc/a9/01ffebfb562e4274b6487b4bb1ddec7ca55ec7510b22e4c51f14098443b8/chardet-3.0.4-py2.py3-none-any.whl
	Installing collected packages: distro, urllib3, certifi, idna, chardet, requests, usagestats, PyYAML, rpaths, reprozip
	    Running setup.py install for PyYAML ... done
	Successfully installed PyYAML-5.2 certifi-2019.11.28 chardet-3.0.4 distro-1.4.0 idna-2.8 reprozip-1.0.16 requests-2.22.0 rpaths-0.13 urllib3-1.25.7 usagestats-0.8
	```

- Listed packages now installed in venv:
	```
	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip$ pip list
	Package       Version   
	------------- ----------
	certifi       2019.11.28
	chardet       3.0.4     
	distro        1.4.0     
	idna          2.8       
	pip           19.3.1    
	pkg-resources 0.0.0     
	PyYAML        5.2       
	reprozip      1.0.16    
	requests      2.22.0    
	rpaths        0.13      
	setuptools    39.0.1    
	urllib3       1.25.7    
	usagestats    0.8
	```
- Confirmed `reprozip` command works:
	```
	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip$ reprozip --version
	reprozip version 1.0.16
	```
- Disabled uploading of usage statistics:
	```
	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip$ reprozip usage_report --disable
	Usage reports will not be collected nor sent.
	```
- Found that ReproZip saves per-user information under `~/.reprozip/`, including the unique user ID and the usage statistics flag just set:
	```
	tmcphill@artemis:~$ tree ~/.reprozip/
	/home/tmcphill/.reprozip/
	├── log
	└── usage_stats
	    ├── status
	    └── user_id
	1 directory, 3 files

	tmcphill@artemis:~$ cat ~/.reprozip/usage_stats/user_id 
	bfe64484-3aa6-49e2-919c-086b0bb50700

	tmcphill@artemis:~$ cat ~/.reprozip/usage_stats/status 
	DISABLED

	tmcphill@artemis:~$ cat ~/.reprozip/log 
	[REPROZIP] 19:05:00.489 INFO: Log opened 2019-12-02 ['/linfast/GitRepos/wt-prov-model/toolkits/reprozip/.venv-reprozip/bin/reprozip', 'usage_report', '--disable']
	[REPROZIP] 19:05:00.490 INFO: Deleted 0 pending reports
	```
### Used ReproZip to trace a simple command

- To demonstrate that it is properly installed, ran the `date` command using `reprozip trace` in an empty directory, noting that a `.reprozip-trace` directory is created:
	```
	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip/scratch$ ls -al
	total 8
	drwxrwxr-x 2 tmcphill tmcphill 4096 Dec  2 19:13 .
	drwxrwxr-x 4 tmcphill tmcphill 4096 Dec  2 18:12 ..

	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip/scratch$ reprozip trace date
	Mon Dec  2 19:13:56 PST 2019
	Configuration file written in .reprozip-trace/config.yml
	Edit that file then run the packer -- use 'reprozip pack -h' for help
	
	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip/scratch$ ls -al
	total 12
	drwxrwxr-x 3 tmcphill tmcphill 4096 Dec  2 19:13 .
	drwxrwxr-x 4 tmcphill tmcphill 4096 Dec  2 18:12 ..
	drwxrwxr-x 2 tmcphill tmcphill 4096 Dec  2 19:13 .reprozip-trace
	```
- The operation just performed was logged in ~/.reprozip/log:
	```
	(.venv-reprozip) tmcphill@artemis:~$ cat ~/.reprozip/log 
	[REPROZIP] 19:05:00.489 INFO: Log opened 2019-12-02 ['/linfast/GitRepos/wt-prov-model/toolkits/reprozip/.venv-reprozip/bin/reprozip', 'usage_report', '--disable']
	[REPROZIP] 19:05:00.490 INFO: Deleted 0 pending reports
	[REPROZIP] 19:13:56.517 INFO: Log opened 2019-12-02 ['/linfast/GitRepos/wt-prov-model/toolkits/reprozip/.venv-reprozip/bin/reprozip', 'trace', 'date']
	[REPROZIP] 19:13:56.519 INFO: Running program
	[REPROZIP] 19:13:56.520 INFO: child created, pid=8209
	[REPROZIP] 19:13:56.523 INFO: process 8209 created by initial fork()
	[REPROZIP] 19:13:56.523 INFO: 1 processes (inc. 0 unattached)
	[REPROZIP] 19:13:56.532 INFO: [8209] successfully exec'd /bin/date
	[REPROZIP] 19:13:56.534 INFO: [8209] process exited (code 0), 0 processes remain
	[REPROZIP] 19:13:56.557 INFO: Program completed
	[REPROZIP] 19:13:56.611 INFO: Running filter plugin builtin
	[REPROZIP] 19:13:56.612 INFO: Running filter plugin python
	[REPROZIP] 19:13:56.616 INFO: Identifying Debian packages for 10 files...
	[REPROZIP] 19:13:56.974 INFO: 3 packages with 5 files, and 5 other files
	```
- And the new .reprozip-trace directory contains a YAML and a SQLite database:
	```
	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip/scratch$ ls -al .reprozip-trace/
	total 44
	drwxrwxr-x 2 tmcphill tmcphill  4096 Dec  2 19:13 .
	drwxrwxr-x 3 tmcphill tmcphill  4096 Dec  2 19:13 ..
	-rw-rw-r-- 1 tmcphill tmcphill  5496 Dec  2 19:13 config.yml
	-rw-r--r-- 1 tmcphill tmcphill 28672 Dec  2 19:13 trace.sqlite3
	```
