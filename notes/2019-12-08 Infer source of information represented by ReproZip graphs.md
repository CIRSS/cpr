## 2019-12-08 Infer source of information represented by ReproZip graphs

### Prepared system to produce ReproZip visualizations

- Confirmed that the dot command is not already available:
	```
	tmcphill@artemis:~/GitRepos/wt-prov-model$ dot
	Command 'dot' not found, but can be installed with:
	sudo apt install graphviz
	```
- Installed `graphviz` apt package:
	```
	tmcphill@artemis:~/GitRepos/wt-prov-model$ sudo apt install graphviz
	[sudo] password for tmcphill: 
	Reading package lists... Done
	Building dependency tree       
	Reading state information... Done
	The following additional packages will be installed:
	  libann0 libcdt5 libcgraph6 libgts-0.7-5 libgts-bin libgvc6 libgvpr2 liblab-gamut1 libpathplan4
	Suggested packages:
	  graphviz-doc
	The following NEW packages will be installed:
	  graphviz libann0 libcdt5 libcgraph6 libgts-0.7-5 libgts-bin libgvc6 libgvpr2 liblab-gamut1 libpathplan4
	0 upgraded, 10 newly installed, 0 to remove and 0 not upgraded.
	Need to get 1,847 kB of archives.
	After this operation, 8,870 kB of additional disk space will be used.
	Do you want to continue? [Y/n] 
	Get:1 http://us.archive.ubuntu.com/ubuntu bionic/universe amd64 libann0 amd64 1.1.2+doc-6 [24.8 kB]
	Get:2 http://us.archive.ubuntu.com/ubuntu bionic/universe amd64 libcdt5 amd64 2.40.1-2 [19.6 kB]
	Get:3 http://us.archive.ubuntu.com/ubuntu bionic/universe amd64 libcgraph6 amd64 2.40.1-2 [40.8 kB]
	Get:4 http://us.archive.ubuntu.com/ubuntu bionic/universe amd64 libgts-0.7-5 amd64 0.7.6+darcs121130-4 [150 kB]
	Get:5 http://us.archive.ubuntu.com/ubuntu bionic/universe amd64 libpathplan4 amd64 2.40.1-2 [22.6 kB]
	Get:6 http://us.archive.ubuntu.com/ubuntu bionic/universe amd64 libgvc6 amd64 2.40.1-2 [601 kB]
	Get:7 http://us.archive.ubuntu.com/ubuntu bionic/universe amd64 libgvpr2 amd64 2.40.1-2 [169 kB]
	Get:8 http://us.archive.ubuntu.com/ubuntu bionic/universe amd64 liblab-gamut1 amd64 2.40.1-2 [178 kB]
	Get:9 http://us.archive.ubuntu.com/ubuntu bionic/universe amd64 graphviz amd64 2.40.1-2 [601 kB]
	Get:10 http://us.archive.ubuntu.com/ubuntu bionic/universe amd64 libgts-bin amd64 0.7.6+darcs121130-4 [41.3 kB]
	Fetched 1,847 kB in 1s (2,079 kB/s)    
	Selecting previously unselected package libann0.
	(Reading database ... 231426 files and directories currently installed.)
	Preparing to unpack .../0-libann0_1.1.2+doc-6_amd64.deb ...
	Unpacking libann0 (1.1.2+doc-6) ...
	Selecting previously unselected package libcdt5.
	Preparing to unpack .../1-libcdt5_2.40.1-2_amd64.deb ...
	Unpacking libcdt5 (2.40.1-2) ...
	Selecting previously unselected package libcgraph6.
	Preparing to unpack .../2-libcgraph6_2.40.1-2_amd64.deb ...
	Unpacking libcgraph6 (2.40.1-2) ...
	Selecting previously unselected package libgts-0.7-5:amd64.
	Preparing to unpack .../3-libgts-0.7-5_0.7.6+darcs121130-4_amd64.deb ...
	Unpacking libgts-0.7-5:amd64 (0.7.6+darcs121130-4) ...
	Selecting previously unselected package libpathplan4.
	Preparing to unpack .../4-libpathplan4_2.40.1-2_amd64.deb ...
	Unpacking libpathplan4 (2.40.1-2) ...
	Selecting previously unselected package libgvc6.
	Preparing to unpack .../5-libgvc6_2.40.1-2_amd64.deb ...
	Unpacking libgvc6 (2.40.1-2) ...
	Selecting previously unselected package libgvpr2.
	Preparing to unpack .../6-libgvpr2_2.40.1-2_amd64.deb ...
	Unpacking libgvpr2 (2.40.1-2) ...
	Selecting previously unselected package liblab-gamut1.
	Preparing to unpack .../7-liblab-gamut1_2.40.1-2_amd64.deb ...
	Unpacking liblab-gamut1 (2.40.1-2) ...
	Selecting previously unselected package graphviz.
	Preparing to unpack .../8-graphviz_2.40.1-2_amd64.deb ...
	Unpacking graphviz (2.40.1-2) ...
	Selecting previously unselected package libgts-bin.
	Preparing to unpack .../9-libgts-bin_0.7.6+darcs121130-4_amd64.deb ...
	Unpacking libgts-bin (0.7.6+darcs121130-4) ...
	Setting up libgts-0.7-5:amd64 (0.7.6+darcs121130-4) ...
	Setting up libpathplan4 (2.40.1-2) ...
	Setting up liblab-gamut1 (2.40.1-2) ...
	Setting up libann0 (1.1.2+doc-6) ...
	Setting up libgts-bin (0.7.6+darcs121130-4) ...
	Setting up libcdt5 (2.40.1-2) ...
	Setting up libcgraph6 (2.40.1-2) ...
	Setting up libgvc6 (2.40.1-2) ...
	Setting up libgvpr2 (2.40.1-2) ...
	Setting up graphviz (2.40.1-2) ...
	Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
	Processing triggers for libc-bin (2.27-3ubuntu1) ...
	```
- Checked version of newly installed `dot` command:
	```
	tmcphill@artemis:~/GitRepos/wt-prov-model$ dot -V
	dot - graphviz version 2.40.1 (20161225.0304)
	```
- Found that `reprounzip`, the command used visualize ReproZip provenance graphs, is not installed with `reprozip` by default:
	```
	wt-prov-model/toolkits/reprozip$ . .venv-reprozip/bin/activate
	
	(.venv-reprozip) wt-prov-model/toolkits/reprozip$ reprozip --version
	reprozip version 1.0.16
	
	(.venv-reprozip) wt-prov-model/toolkits/reprozip$ reprounzip --version
	Command 'reprounzip' not found, but can be installed with:
	sudo apt install reprounzip
	```
- Installed `reprounzip` using `pip` in virtual environment with `reprozip`:
	```
	wt-prov-model/toolkits/reprozip$ pip install reprounzip
	Collecting reprounzip
	  Downloading https://files.pythonhosted.org/packages/10/90/89e668957adf016e0a6786db0c81ca271e6ec474c05e2066f56b34c1458c/reprounzip-1.0.16-py2.py3-none-any.whl (64kB)
	     |████████████████████████████████| 71kB 2.3MB/s 
	Requirement already satisfied: rpaths>=0.8 in ./.venv-reprozip/lib/python3.7/site-packages (from reprounzip) (0.13)
	Requirement already satisfied: PyYAML in ./.venv-reprozip/lib/python3.7/site-packages (from reprounzip) (5.2)
	Requirement already satisfied: distro in ./.venv-reprozip/lib/python3.7/site-packages (from reprounzip) (1.4.0)
	Requirement already satisfied: requests in ./.venv-reprozip/lib/python3.7/site-packages (from reprounzip) (2.22.0)
	Requirement already satisfied: usagestats>=0.3 in ./.venv-reprozip/lib/python3.7/site-packages (from reprounzip) (0.8)
	Requirement already satisfied: certifi>=2017.4.17 in ./.venv-reprozip/lib/python3.7/site-packages (from requests->reprounzip) (2019.11.28)
	Requirement already satisfied: chardet<3.1.0,>=3.0.2 in ./.venv-reprozip/lib/python3.7/site-packages (from requests->reprounzip) (3.0.4)
	Requirement already satisfied: idna<2.9,>=2.5 in ./.venv-reprozip/lib/python3.7/site-packages (from requests->reprounzip) (2.8)
	Requirement already satisfied: urllib3!=1.25.0,!=1.25.1,<1.26,>=1.21.1 in ./.venv-reprozip/lib/python3.7/site-packages (from requests->reprounzip) (1.25.7)
	Installing collected packages: reprounzip
	Successfully installed reprounzip-1.0.16

	(.venv-reprozip) wt-prov-model/toolkits/reprozip$ reprounzip --version
	reprounzip version 1.0.16
	```

- Listed pip packages currently installed in virtual environment, noting that only the `reprounzip` package is new (see notes [2019-12-02](2019-12-02%20install%20reprozip%20on%20desktop%20linux%20system.md#installed-reprozip-in-virtual-environment)):
    ```
	(.venv-reprozip) wt-prov-model/toolkits/reprozip$ pip list
	Package       Version   
	------------- ----------
	certifi       2019.11.28
	chardet       3.0.4     
	distro        1.4.0     
	idna          2.8       
	pip           19.3.1    
	pkg-resources 0.0.0     
	PyYAML        5.2       
	reprounzip    1.0.16    
	reprozip      1.0.16    
	requests      2.22.0    
	rpaths        0.13      
	setuptools    39.0.1    
	urllib3       1.25.7    
	usagestats    0.8 
	```


### Created default visualization of `date` example of last week

- Determined from ReproZip documentation page [Visualizing the Provenance Graph](https://docs.reprozip.org/en/1.0.x/graph.html) that the default options to `reprozip graph` provide maximum detail.  Optional settings hide information.

- Ran `reprounzip graph` command in scratch directory where `reprozip trace date` had been executed twice: 
	```
	(.venv-reprozip) wt-prov-model/toolkits/reprozip/scratch$ reprounzip graph graphfile.dot
	
	(.venv-reprozip) wt-prov-model/toolkits/reprozip/scratch$ ls -al
	total 16
	drwxrwxr-x 3 tmcphill tmcphill 4096 Dec  8 18:47 .
	drwxrwxr-x 4 tmcphill tmcphill 4096 Dec  2 18:12 ..
	-rw-rw-r-- 1 tmcphill tmcphill 1475 Dec  8 18:47 graphfile.dot
	drwxrwxr-x 2 tmcphill tmcphill 4096 Dec  3 21:14 .reprozip-trace
	```
- Converted the `graphfile.dot` file to a PNG:
	```
	(.venv-reprozip) wt-prov-model/toolkits/reprozip/scratch$ dot graphfile.dot -Tpng -o graphfile.png
	
	(.venv-reprozip) wt-prov-model/toolkits/reprozip/scratch$ ls -al
	total 100
	drwxrwxr-x 3 tmcphill tmcphill  4096 Dec  8 19:10 .
	drwxrwxr-x 4 tmcphill tmcphill  4096 Dec  2 18:12 ..
	-rw-rw-r-- 1 tmcphill tmcphill  1475 Dec  8 18:47 graphfile.dot
	-rw-rw-r-- 1 tmcphill tmcphill 84314 Dec  8 19:10 graphfile.png
	drwxrwxr-x 2 tmcphill tmcphill  4096 Dec  3 21:14 .reprozip-trace
	```

- Visualized the graph:
	
	![enter image description here](https://lh3.googleusercontent.com/bHF4YBotk8jTNwDYaSjXPFsrYwVxlkuXLJohLG8OB78JP7NSQ0aXM2YfBbq369vhVxWffLc7ZZuT)

### Compared information in graph with contents of files in `.reprozip-trace` directory

- Referred to comparison of contents of `trace.sqlite3` and `config.yml` (notes [2019-12-04](2019-12-04%20compare%20contents%20of%20reprozip%20trace%20database%20and%20yaml%20file.md#2019-12-04-compare-contents-of-reprozip-trace-database-and-yaml-file)).

- All of the information in the default visualization above, including all labels and edges, can be found in the SQLite database with the following exceptions:
	1. The names of the packages `coreutils` and `libc6`, and their respective versions `8.28-1ubuntu1` and `2.27-3ubuntu1` labeling the subgraphs in the top left corner of the figure, are not in the database.

	2.  The association of `/bin/date` with the `coreutils` package, and of `ld-2.27.so` and `libc.so.6` with the `libc6` package, represented by the subgraphs in the top left corner, cannot be deduced from the contents of the database.

- The `config.yml` file does not have sufficient information to associate the files accessed during each run (the ovals in the left column) with the executables on the right.  Only the database has this information.

- It appears that both the database and the YAML file are required to create this visualization.

### Confirmed that both the YAML file and the database are required by `reprounzip graph`

- Temporarily renamed `config.yml` in the trace directory and noted error message running `reprounzip graph`:
	```
	(.venv-reprozip) wt-prov-model/toolkits/reprozip/scratch/.reprozip-trace$ mv config.yml config.yml.save

	(.venv-reprozip) wt-prov-model/toolkits/reprozip/scratch$ reprounzip graph graphfile.dot
	[REPROUNZIP] 19:45:57.329 CRITICAL: Configuration file does not exist!
	Did you forget to run 'reprozip trace'?
	If not, you might want to use --dir to specify an alternate location.
	```

- Restored `config.yml` and renamed SQLite file, then observed a different error message:
	```
	(.venv-reprozip) wt-prov-model/toolkits/reprozip/scratch/.reprozip-trace$ mv config.yml.save config.yml

	(.venv-reprozip) wt-prov-model/toolkits/reprozip/scratch/.reprozip-trace$ mv trace.sqlite3 trace.sqlite3.save

	(.venv-reprozip) wt-prov-model/toolkits/reprozip/scratch$ reprounzip graph graphfile.dot
	Traceback (most recent call last):
	  File "/linfast/GitRepos/wt-prov-model/toolkits/reprozip/.venv-reprozip/bin/reprounzip", line 8, in <module>
	    sys.exit(main())
	  File "/linfast/GitRepos/wt-prov-model/toolkits/reprozip/.venv-reprozip/lib/python3.7/site-packages/reprounzip/main.py", line 144, in main
	    args.func(args)
	  File "/linfast/GitRepos/wt-prov-model/toolkits/reprozip/.venv-reprozip/lib/python3.7/site-packages/reprounzip/unpackers/graph.py", line 751, in graph
	    Path(args.dir) / 'trace.sqlite3')
	  File "/linfast/GitRepos/wt-prov-model/toolkits/reprozip/.venv-reprozip/lib/python3.7/site-packages/reprounzip/unpackers/graph.py", line 741, in call_generate
	    args.regex_replace, args.aggregate)
	  File "/linfast/GitRepos/wt-prov-model/toolkits/reprozip/.venv-reprozip/lib/python3.7/site-packages/reprounzip/unpackers/graph.py", line 479, in generate
	    has_thread_flag)
	  File "/linfast/GitRepos/wt-prov-model/toolkits/reprozip/.venv-reprozip/lib/python3.7/site-packages/reprounzip/unpackers/graph.py", line 326, in read_events
	    process_rows = process_cursor.execute(sql)
	sqlite3.OperationalError: no such table: processes
	```
- And observed that running `reprounzip graph` in the absence of SQLite file created an *empty* SQLite file:
	```
	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip/scratch$ ls -al .reprozip-trace/
	total 56
	drwxrwxr-x 2 tmcphill tmcphill  4096 Dec  8 20:00 .
	drwxrwxr-x 3 tmcphill tmcphill  4096 Dec  8 20:00 ..
	-rw-rw-r-- 1 tmcphill tmcphill  8448 Dec  3 21:14 config.yml
	-rw-r--r-- 1 tmcphill tmcphill     0 Dec  8 20:00 trace.sqlite3
	-rw-r--r-- 1 tmcphill tmcphill 36864 Dec  3 21:14 trace.sqlite3.save
	```
- Restored the SQLite file and observed that `reprounzip graph` works correctly again.

### Conclusions

- Different contents from the SQLite database and YAML views of the trace are necessary to create the default (most detailed) visualization of the ReproZip provenance graph.

- Both the `config.yml` and `trace.sqlite3` files are actually used by `reprounzip graph` to create the default visualization.




