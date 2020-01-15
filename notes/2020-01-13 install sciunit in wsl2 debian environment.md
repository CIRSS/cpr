## 2020-01-13 Install Sciunit in WSL2 Debian environment

### Background
- Need to exercise sciunit under well-defined conditions.
- Will try using in a WSL2 environment running a Debian distribution.  WSL2 is a version of the Windows Subsystem for Linux that includes a Linux kernel running in a lightweight VM.
- Will record manual configuration of computing environment to facilitate automating set up of equivalent environments elsewhere.

### Recorded system information for WSL2 Debian environment on `circe`

- Linux distribution and release:
	```
	tmcphill@circe:~$ cat /etc/os-release  
	PRETTY_NAME="Debian GNU/Linux 9 (stretch)"  
	NAME="Debian GNU/Linux"  
	VERSION_ID="9"  
	VERSION="9 (stretch)"  
	ID=debian  
	HOME_URL="https://www.debian.org/"  
	SUPPORT_URL="https://www.debian.org/support"  
	BUG_REPORT_URL="https://bugs.debian.org/"
	```
- Linux kernel release and build:
	```
	tmcphill@circe:~$ uname -r  
	4.19.84-microsoft-standard
	```

### Reviewed installation requirements for Sciunit
- Read the Sciunit [Installation Guide](https://sciunit.run/install/).
- Noted the following dependencies: `python2.7` and `pip2`.
- Confirmed that `python2.7`, `pip`, and `virtualenv` are installed:
	```
	tmcphill@circe:~$ python --version  
	Python 2.7.13  
	
	tmcphill@circe:~$ pip --version  
	pip 19.3.1 from /usr/local/lib/python2.7/dist-packages/pip (python 2.7)

	tmcphill@circe:~$ virtualenv --version  
	16.6.2
	```
### Installed Sciunit in a new Python virtual environment

- Created a new virtual environment for working with Sciunit:
	```
	tmcphill@circe:~$ virtualenv .venv/sciunit  
	New python executable in /home/tmcphill/.venv/sciunit/bin/python  
	Installing setuptools, pip, wheel...  
	done.
	```

- Confirmed that the new virtual environment uses Python 2:
	```
	tmcphill@circe:~$ . .venv/sciunit/bin/activate  

	(sciunit) tmcphill@circe:~$ python --version  
	Python 2.7.13  

	(sciunit) tmcphill@circe:~$ pip --version  
	pip 19.3.1 from /home/tmcphill/.venv/sciunit/local/lib/python2.7/site-packages/pip (python 2.7)
	```
- Found that Python packages initially installed in the virtual environment are minimal:
	```
	(sciunit) tmcphill@circe:~$ pip list  
	Package Version  
	---------- -------  
	pip 19.3.1  
	setuptools 44.0.0  
	wheel 0.33.6  
	```
- Installed sciunit2 package in the new virtual environment:
	```
	(sciunit) tmcphill@circe:~$ pip install sciunit2  
	DEPRECATION: Python 2.7 will reach the end of its life on January 1st, 2020. Please upgrade your Python as Python 2.7 won't  
	be maintained after that date. A future version of pip will drop support for Python 2.7. More details about Python 2 suppo  
	rt in pip, can be found at https://pip.pypa.io/en/latest/development/release-process/#python-2-support  
	Collecting sciunit2  
	Downloading https://files.pythonhosted.org/packages/7f/6f/1376de729c863dbbf03b2981d0fd942cb67bfbd776cbb3f654e35cc7df65/sc  
	iunit2-0.4.post3.dev95073526-py2-none-manylinux1_x86_64.whl (677kB)  
	|████████████████████████████████| 686kB 3.3MB/s  
	Collecting utcdatetime  
	Downloading https://files.pythonhosted.org/packages/7c/f6/32b6f7b13140daab5a7ae6f3cba6d1cb84e4c93a7839748478b77bbe69fe/ut  
	cdatetime-0.0.7.tar.gz  
	Collecting poster  
	Downloading https://files.pythonhosted.org/packages/9f/dc/0683a458d21c3d561ab2f71b4fcdd812bf04e55c54e560b0854cea95610e/po  
	ster-0.8.1.tar.gz  
	Collecting humanfriendly  
	Downloading https://files.pythonhosted.org/packages/90/df/88bff450f333114680698dc4aac7506ff7cab164b794461906de31998665/hu  
	manfriendly-4.18-py2.py3-none-any.whl (73kB)  
	|████████████████████████████████| 81kB 7.1MB/s  
	Collecting backports.tempfile  
	Downloading https://files.pythonhosted.org/packages/b4/5c/077f910632476281428fe254807952eb47ca78e720d059a46178c541e669/ba  
	ckports.tempfile-1.0-py2.py3-none-any.whl  
	Collecting tqdm>=4.17.1  
	Downloading https://files.pythonhosted.org/packages/72/c9/7fc20feac72e79032a7c8138fd0d395dc6d8812b5b9edf53c3afd0b31017/tq  
	dm-4.41.1-py2.py3-none-any.whl (56kB)  
	|████████████████████████████████| 61kB 5.1MB/s  
	Collecting configobj  
	Downloading https://files.pythonhosted.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab/co  
	nfigobj-5.0.6.tar.gz  
	Collecting scandir  
	Downloading https://files.pythonhosted.org/packages/df/f5/9c052db7bd54d0cbf1bc0bb6554362bba1012d03e5888950a4f5c5dadc4e/sc  
	andir-1.10.0.tar.gz  
	Collecting zipfile2  
	Downloading https://files.pythonhosted.org/packages/60/ad/d6bc08f235b66c11bbb76df41b973ce93544a907cc0e23c726ea374eee79/zi  
	pfile2-0.0.12-py2.py3-none-any.whl (44kB)  
	|████████████████████████████████| 51kB 2.4MB/s  
	Requirement already satisfied: setuptools in ./.venv/sciunit/lib/python2.7/site-packages (from sciunit2) (44.0.0)  
	Collecting contextlib2  
	Downloading https://files.pythonhosted.org/packages/85/60/370352f7ef6aa96c52fb001831622f50f923c1d575427d021b8ab3311236/co  
	ntextlib2-0.6.0.post1-py2.py3-none-any.whl  
	Collecting hs-restclient  
	Downloading https://files.pythonhosted.org/packages/ce/0c/89ec84a9b8bbdba21f40ff2baa2fac5b96f11670aebbfe1f58cf08dda0fc/hs  
	_restclient-1.3.5.tar.gz  
	Collecting tzlocal  
	Downloading https://files.pythonhosted.org/packages/ef/99/53bd1ac9349262f59c1c421d8fcc2559ae8a5eeffed9202684756b648d33/tz  
	local-2.0.0-py2.py3-none-any.whl  
	Collecting retry  
	Downloading https://files.pythonhosted.org/packages/4b/0d/53aea75710af4528a25ed6837d71d117602b01946b307a3912cb3cfcbcba/re  
	try-0.9.2-py2.py3-none-any.whl  
	Collecting monotonic; python_version == "2.6" or python_version == "2.7" or python_version == "3.0" or python_version == "3  
	.1" or python_version == "3.2"  
	Downloading https://files.pythonhosted.org/packages/ac/aa/063eca6a416f397bd99552c534c6d11d57f58f2e94c14780f3bbf818c4cf/mo  
	notonic-1.5-py2.py3-none-any.whl  
	Collecting backports.weakref  
	Downloading https://files.pythonhosted.org/packages/88/ec/f598b633c3d5ffe267aaada57d961c94fdfa183c5c3ebda2b6d151943db6/ba  
	ckports.weakref-1.0.post1-py2.py3-none-any.whl  
	Collecting six  
	Downloading https://files.pythonhosted.org/packages/65/26/32b8464df2a97e6dd1b656ed26b2c194606c16fe163c695a992b36c11cdf/si  
	x-1.13.0-py2.py3-none-any.whl  
	Collecting requests  
	Using cached https://files.pythonhosted.org/packages/51/bd/23c926cd341ea6b7dd0b2a00aba99ae0f828be89d72b2190f27c11d4b7fb/r  
	equests-2.22.0-py2.py3-none-any.whl  
	Collecting requests_toolbelt  
	Downloading https://files.pythonhosted.org/packages/60/ef/7681134338fc097acef8d9b2f8abe0458e4d87559c689a8c306d0957ece5/re  
	quests_toolbelt-0.9.1-py2.py3-none-any.whl (54kB)  
	|████████████████████████████████| 61kB 771kB/s  
	Collecting oauthlib  
	Downloading https://files.pythonhosted.org/packages/05/57/ce2e7a8fa7c0afb54a0581b14a65b56e62b5759dbc98e80627142b8a3704/oa  
	uthlib-3.1.0-py2.py3-none-any.whl (147kB)  
	|████████████████████████████████| 153kB 31.9MB/s  
	Collecting requests_oauthlib  
	Downloading https://files.pythonhosted.org/packages/a3/12/b92740d845ab62ea4edf04d2f4164d82532b5a0b03836d4d4e71c6f3d379/re  
	quests_oauthlib-1.3.0-py2.py3-none-any.whl  
	Collecting pytz  
	Downloading https://files.pythonhosted.org/packages/e7/f9/f0b53f88060247251bf481fa6ea62cd0d25bf1b11a87888e53ce5b7c8ad2/py  
	tz-2019.3-py2.py3-none-any.whl (509kB)  
	|████████████████████████████████| 512kB 20.3MB/s  
	Collecting decorator>=3.4.2  
	Downloading https://files.pythonhosted.org/packages/8f/b7/f329cfdc75f3d28d12c65980e4469e2fa373f1953f5df6e370e84ea2e875/de  
	corator-4.4.1-py2.py3-none-any.whl  
	Collecting py<2.0.0,>=1.4.26  
	Downloading https://files.pythonhosted.org/packages/99/8d/21e1767c009211a62a8e3067280bfce76e89c9f876180308515942304d2d/py  
	-1.8.1-py2.py3-none-any.whl (83kB)  
	|████████████████████████████████| 92kB 3.8MB/s  
	Collecting idna<2.9,>=2.5  
	Using cached https://files.pythonhosted.org/packages/14/2c/cd551d81dbe15200be1cf41cd03869a46fe7226e7450af7a6545bfc474c9/i  
	dna-2.8-py2.py3-none-any.whl  
	Collecting chardet<3.1.0,>=3.0.2  
	Using cached https://files.pythonhosted.org/packages/bc/a9/01ffebfb562e4274b6487b4bb1ddec7ca55ec7510b22e4c51f14098443b8/c  
	hardet-3.0.4-py2.py3-none-any.whl  
	Collecting certifi>=2017.4.17  
	Using cached https://files.pythonhosted.org/packages/b9/63/df50cac98ea0d5b006c55a399c3bf1db9da7b5a24de7890bc9cfd5dd9e99/c  
	ertifi-2019.11.28-py2.py3-none-any.whl  
	Collecting urllib3!=1.25.0,!=1.25.1,<1.26,>=1.21.1  
	Using cached https://files.pythonhosted.org/packages/b4/40/a9837291310ee1ccc242ceb6ebfd9eb21539649f193a7c8c86ba15b98539/u  
	rllib3-1.25.7-py2.py3-none-any.whl  
	Building wheels for collected packages: utcdatetime, poster, configobj, scandir, hs-restclient  
	Building wheel for utcdatetime (setup.py) ... done  
	Created wheel for utcdatetime: filename=utcdatetime-0.0.7-cp27-none-any.whl size=10288 sha256=441e128e469aa065c6586c8890a  
	6a9a5f0cd1570b508b7a9b4406f9e451b31dd  
	Stored in directory: /home/tmcphill/.cache/pip/wheels/0b/70/44/fbfcb99686bc5f5134e83405445654a068406f6777dd07999a  
	Building wheel for poster (setup.py) ... done  
	Created wheel for poster: filename=poster-0.8.1-cp27-none-any.whl size=13888 sha256=e7ffde952a133f48c85b582497d8bdf8426d3  
	f48c1628017997ed57d2e6ac3bd  
	Stored in directory: /home/tmcphill/.cache/pip/wheels/19/88/45/343a1c011ea08cf21bada430686629f0e981c9f70a6ec7bf38  
	Building wheel for configobj (setup.py) ... done  
	Created wheel for configobj: filename=configobj-5.0.6-cp27-none-any.whl size=34546 sha256=a662dc5e04ae8ea0c0d5d26b76ec5fe  
	f4eb66b44f22674727813f34b4ddc7e63  
	Stored in directory: /home/tmcphill/.cache/pip/wheels/f1/e4/16/4981ca97c2d65106b49861e0b35e2660695be7219a2d351ee0  
	Building wheel for scandir (setup.py) ... done  
	Created wheel for scandir: filename=scandir-1.10.0-cp27-cp27mu-linux_x86_64.whl size=38937 sha256=8b397cc49a3fb400e1363c1  
	37c76fe3fd8bdeb3573cb42ea52ef6d5677b8b5ab  
	Stored in directory: /home/tmcphill/.cache/pip/wheels/91/95/75/19c98a91239878abbc7c59970abd3b4e0438a7dd5b61778335  
	Building wheel for hs-restclient (setup.py) ... done  
	Created wheel for hs-restclient: filename=hs_restclient-1.3.5-cp27-none-any.whl size=17318 sha256=939e32ccbaac13e8958cd35  
	a7f3f0e538ba0b0b918e61dcaec4e133ccb82108d  
	Stored in directory: /home/tmcphill/.cache/pip/wheels/b5/47/b6/cc8d87a92da774de2ad44f2f42f17fad6b95b08cff011a18c2  
	Successfully built utcdatetime poster configobj scandir hs-restclient  
	Installing collected packages: utcdatetime, poster, monotonic, humanfriendly, backports.weakref, backports.tempfile, tqdm,  
	six, configobj, scandir, zipfile2, contextlib2, idna, chardet, certifi, urllib3, requests, requests-toolbelt, oauthlib, req  
	uests-oauthlib, hs-restclient, pytz, tzlocal, decorator, py, retry, sciunit2  
	Successfully installed backports.tempfile-1.0 backports.weakref-1.0.post1 certifi-2019.11.28 chardet-3.0.4 configobj-5.0.6  
	contextlib2-0.6.0.post1 decorator-4.4.1 hs-restclient-1.3.5 humanfriendly-4.18 idna-2.8 monotonic-1.5 oauthlib-3.1.0 poster  
	-0.8.1 py-1.8.1 pytz-2019.3 requests-2.22.0 requests-oauthlib-1.3.0 requests-toolbelt-0.9.1 retry-0.9.2 scandir-1.10.0 sciu  
	nit2-0.4.post3.dev95073526 six-1.13.0 tqdm-4.41.1 tzlocal-2.0.0 urllib3-1.25.7 utcdatetime-0.0.7 zipfile2-0.0.12
	```
- The following packages are now installed in the virtual environment:
	```
	(sciunit) tmcphill@circe:~$ pip list  
	Package Version  
	------------------ ---------------------  
	backports.tempfile 1.0  
	backports.weakref 1.0.post1  
	certifi 2019.11.28  
	chardet 3.0.4  
	configobj 5.0.6  
	contextlib2 0.6.0.post1  
	decorator 4.4.1  
	hs-restclient 1.3.5  
	humanfriendly 4.18  
	idna 2.8  
	monotonic 1.5  
	oauthlib 3.1.0  
	pip 19.3.1  
	poster 0.8.1  
	py 1.8.1  
	pytz 2019.3  
	requests 2.22.0  
	requests-oauthlib 1.3.0  
	requests-toolbelt 0.9.1  
	retry 0.9.2  
	scandir 1.10.0  
	sciunit2 0.4.post3.dev95073526  
	setuptools 44.0.0  
	six 1.13.0  
	tqdm 4.41.1  
	tzlocal 2.0.0  
	urllib3 1.25.7  
	utcdatetime 0.0.7  
	wheel 0.33.6  
	zipfile2 0.0.12
	```
- Confirmed that the `sciunit` command now works:
	```
	(sciunit) tmcphill@circe:~$ sciunit --version  
	sciunit2 0.4.post3.dev95073526
	```
### Used Sciunit to trace a simple command
- Created a first sciunit:
	```
	(sciunit) tmcphill@circe:~/scratch$ sciunit create sciunit-date  
	Opened empty sciunit at /home/tmcphill/sciunit/sciunit-date
	```
- Noted that the current directory is still empty after creating the sciunit:
	```
	(sciunit) tmcphill@circe:~/scratch$ ls -al  
	total 8  
	drwxr-xr-x 2 tmcphill tmcphill 4096 Jan 13 18:41 .  
	drwxr-xr-x 18 tmcphill tmcphill 4096 Jan 13 18:41 ..
	```
- However, there is now a new directory tree at `~/sciunit` with the following contents:
	```
	(sciunit) tmcphill@circe:~/scratch$ tree -a ~/sciunit/  
	/home/tmcphill/sciunit/  
	├── .activated  
	└── sciunit-date  
	  
	1 directory, 1 file

	(sciunit) tmcphill@circe:~/scratch$ ls -al ~/sciunit/sciunit-date/
	total 8
	drwxr-xr-x 2 tmcphill tmcphill 4096 Jan 13 18:41 .
	drwxr-xr-x 3 tmcphill tmcphill 4096 Jan 13 18:41 ..

	(sciunit) tmcphill@circe:~/scratch$ cat ~/sciunit/.activated  
	/home/tmcphill/sciunit/sciunit-date
	```

- Ran the `date` command with sciunit:
	```
	(sciunit) tmcphill@circe:~/scratch$ sciunit exec date  
	Mon Jan 13 18:45:57 PST 2020  
	  
	[sciunit-date e1] date  
	Date: Mon, 13 Jan 2020 18:45:57 -0800
	```
- The current scratch directory is still empty:
	```(sciunit) tmcphill@circe:~/scratch$ ls -al  
	total 8  
	drwxr-xr-x 2 tmcphill tmcphill 4096 Jan 13 18:45 .  
	drwxr-xr-x 18 tmcphill tmcphill 4096 Jan 13 18:41 ..
	```
- But now the ~/sciunit/sciunit-date directory contains four files:
	```
	(sciunit) tmcphill@circe:~/scratch$ tree -a ~/sciunit/  
	/home/tmcphill/sciunit/  
	├── .activated  
	└── sciunit-date  
	    ├── e1.json  
	    ├── sciunit.db  
	    ├── vvpkg.bin  
	    └── vvpkg.db  
	  
	1 directory, 5 files
	```
- And the sciunit `list` and `show` commands reveal basic metadata about the run:
	```
	(sciunit) tmcphill@circe:~/scratch$ sciunit list  
	e1 Jan 13 18:45 date  
	
	(sciunit) tmcphill@circe:~/scratch$ sciunit show e1  
	id: e1  
	sciunit: sciunit-date  
	command: date  
	size: 4.24 MB  
	started: 2020-01-13 18:45
	```

### Observed effects of running a second command in the same sciunit
- Ran the same command as before using sciunit:
	```
	(sciunit) tmcphill@circe:~/scratch$ sciunit exec date  
	Mon Jan 13 18:51:52 PST 2020  
	  
	[sciunit-date e2] date  
	Date: Mon, 13 Jan 2020 18:51:52 -0800
	```

- Listing the runs shows both previous (e1) and latest (e2) run:
	```
	(sciunit) tmcphill@circe:~/scratch$ sciunit list  
	e1 Jan 13 18:45 date  
	e2 Jan 13 18:51 date
	```
- And the `~/sciunit/sciunit-date directory` contains a new file (e2.json):
	```
	(sciunit) tmcphill@circe:~/scratch$ tree -a ~/sciunit/  
	/home/tmcphill/sciunit/  
	├── .activated  
	└── sciunit-date  
		├── e1.json  
		├── e2.json  
		├── sciunit.db  
		├── vvpkg.bin  
		└── vvpkg.db  
	  
	1 directory, 6 files
	```


