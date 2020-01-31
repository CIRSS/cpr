## 2020-01-28 We may need to use inode numbers to determine file identity

### Background
- Our primary interest in employing ReproZip in Whole Tale is in supporting the construction of the process-data graphs (data lineage) associated with Tale runs.

- ReproZip detects and records system calls executed when programs are executed, processes are created, and files are opened.

- The ReproZip trace files record the paths to the files executed or opened.  However, support for detecting when two different paths refer to the same file (e.g. when one path traverses a symbolic link and the other does not) is limited.

- We need to detect what file paths used by the processes comprising a run refer to the same file so that accurate data-process graphs can be created, queried, and visualized reliably.

### The current rpz2prolog prototype demonstrating expected behavior

- We  use a simple custom program to query the ReproZip `trace.sqlite3` file and to export its contents as Prolog facts.

- Tracing a new execution of `date` using ReproZip, followed by fact extraction via `rpz2prolog`, currently gives the following:
	```
	(reprozip) tmcphill@circe:~$ mkdir scratch  

	(reprozip) tmcphill@circe:~$ cd scratch  

	(reprozip) tmcphill@circe:~/scratch$ reprozip trace date  
	Tue Jan 28 18:45:48 PST 2020  
	Configuration file written in .reprozip-trace/config.yml  
	Edit that file then run the packer -- use 'reprozip pack -h' for help  

	(reprozip) tmcphill@circe:~/scratch$ rpz2prolog .reprozip-trace/  
	%---------------------------------------------------------------------------------------------------  
	% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).  
	%---------------------------------------------------------------------------------------------------  
	rpz_process(p1, nil, r0, false, 0, 345235287921498).  
	  
	%---------------------------------------------------------------------------------------------------  
	% FACT: rpz_executed_file(ExecutionID, RunID, ProcessID, Program, Argv, WorkingDir, TimeStamp).  
	%---------------------------------------------------------------------------------------------------  
	rpz_executed_file(e1, r0, p1, "/bin/date", "date", "/home/tmcphill/scratch", 345235306137598).  
	  
	%---------------------------------------------------------------------------------------------------  
	% FACT: rpz_opened_file(FileID, RunID, ProcessID, File, Mode, IsDirectory, Timestamp).  
	%---------------------------------------------------------------------------------------------------  
	rpz_opened_file(f1, r0, p1, "/home/tmcphill/scratch", 4, true, 345235287931698).  
	rpz_opened_file(f2, r0, p1, "/home/tmcphill/scratch", 4, true, 345235287935298).  
	rpz_opened_file(f3, r0, p1, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, 345235306684998).  
	rpz_opened_file(f4, r0, p1, "/etc/ld.so.cache", 1, false, 345235308395498).  
	rpz_opened_file(f5, r0, p1, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, 345235310180198).  
	rpz_opened_file(f6, r0, p1, "/usr/lib/locale/locale-archive", 1, false, 345235315213498).  
	rpz_opened_file(f7, r0, p1, "/etc/localtime", 1, false, 345235316407598).
	```

- Running the `date` command via a `run.sh` bash script that redirects the output to a file, then outputs the contents of that file gives the following (using the rpz2prolog options -m and -i to mask timestamps and ignore files written by the first processs, i.e. bash):
	```
	(reprozip) tmcphill@circe:~/scratch$ cat run.sh  
	#!/bin/bash  
	date > date.txt  
	cat date.txt  

	(reprozip) tmcphill@circe:~/scratch$ reprozip trace --overwrite ./run.sh  
	Tue Jan 28 19:13:58 PST 2020  
	Configuration file written in .reprozip-trace/config.yml  
	Edit that file then run the packer -- use 'reprozip pack -h' for help  
	
	(reprozip) tmcphill@circe:~/scratch$ rpz2prolog -m -i .reprozip-trace/  
	%---------------------------------------------------------------------------------------------------  
	% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).  
	%---------------------------------------------------------------------------------------------------  
	rpz_process(p1, nil, r0, false, 0, nil).  
	rpz_process(p2, p1, r0, false, 0, nil).  
	rpz_process(p3, p1, r0, false, 0, nil).  
	  
	%---------------------------------------------------------------------------------------------------  
	% FACT: rpz_executed_file(ExecutionID, RunID, ProcessID, Program, Argv, WorkingDir, TimeStamp).  
	%---------------------------------------------------------------------------------------------------  
	rpz_executed_file(e1, r0, p1, "/home/tmcphill/scratch/./run.sh", "./run.sh", "/home/tmcphill/scratch", nil).  
	rpz_executed_file(e2, r0, p2, "/bin/date", "date", "/home/tmcphill/scratch", nil).  
	rpz_executed_file(e3, r0, p3, "/bin/cat", "catdate.txt", "/home/tmcphill/scratch", nil).  
	  
	%---------------------------------------------------------------------------------------------------  
	% FACT: rpz_opened_file(FileID, RunID, ProcessID, File, Mode, IsDirectory, Timestamp).  
	%---------------------------------------------------------------------------------------------------  
	rpz_opened_file(f32, r0, p2, "/home/tmcphill/scratch", 4, true, nil).  
	rpz_opened_file(f33, r0, p2, "/home/tmcphill/scratch/date.txt", 2, false, nil).  
	rpz_opened_file(f34, r0, p2, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, nil).  
	rpz_opened_file(f35, r0, p2, "/etc/ld.so.cache", 1, false, nil).  
	rpz_opened_file(f36, r0, p2, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, nil).  
	rpz_opened_file(f37, r0, p2, "/usr/lib/locale/locale-archive", 1, false, nil).  
	rpz_opened_file(f38, r0, p2, "/etc/localtime", 1, false, nil).  
	rpz_opened_file(f50, r0, p3, "/home/tmcphill/scratch", 4, true, nil).  
	rpz_opened_file(f51, r0, p3, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, nil).  
	rpz_opened_file(f52, r0, p3, "/etc/ld.so.cache", 1, false, nil).  
	rpz_opened_file(f53, r0, p3, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, nil).  
	rpz_opened_file(f54, r0, p3, "/usr/lib/locale/locale-archive", 1, false, nil).  
	rpz_opened_file(f55, r0, p3, "/home/tmcphill/scratch/date.txt", 1, false, nil).
	```
- In the above, output file `f33` and input file `f55` have identical file paths, `/home/tmcphill/scratch/date.txt`.

- It is notable that the relative path `date.txt` used twice in `run.sh` is replaced by the absolute path `/home/tmcphill/scratch/date.txt` in both instances.

- Inspecting `.reprozip-trace/config.yml` following the above run, `date.txt` appears only in the context of the run inputs and outputs, where it is identified as an output, and has the same absolute path as in the SQLite file:
	```yaml
	inputs_outputs:
	- name: date.txt  
	path: /home/tmcphill/scratch/date.txt  
	written_by_runs: [0]  
	read_by_runs: []
	```

- Under these circumstances multiple opened files can be determined to refer to the same file if the paths to it in the different rows of `opened_files` are identical.

### Effect of using different but equivalent relative paths in the same run 

- If different paths are used to access the same file during a run the resulting paths in the the SQLite database can be different. 

- The following is obtained if the second reference to date.txt is changed to `./date.txt`:
	```
	(reprozip) tmcphill@circe:~/scratch$ cat run.sh
	#!/bin/bash
	date > date.txt
	cat ./date.txt

	(reprozip) tmcphill@circe:~/scratch$ reprozip trace --overwrite ./run.sh
	Tue Jan 28 20:42:20 PST 2020
	Configuration file written in .reprozip-trace/config.yml
	Edit that file then run the packer -- use 'reprozip pack -h' for help

	(reprozip) tmcphill@circe:~/scratch$ rpz2prolog -m -i .reprozip-trace/
	%---------------------------------------------------------------------------------------------------
	% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
	%---------------------------------------------------------------------------------------------------
	rpz_process(p1, nil, r0, false, 0, nil).
	rpz_process(p2, p1, r0, false, 0, nil).
	rpz_process(p3, p1, r0, false, 0, nil).

	%---------------------------------------------------------------------------------------------------
	% FACT: rpz_executed_file(ExecutionID, RunID, ProcessID, Program, Argv, WorkingDir, TimeStamp).
	%---------------------------------------------------------------------------------------------------
	rpz_executed_file(e1, r0, p1, "/home/tmcphill/scratch/./run.sh", "./run.sh", "/home/tmcphill/scratch", nil).
	rpz_executed_file(e2, r0, p2, "/bin/date", "date", "/home/tmcphill/scratch", nil).
	rpz_executed_file(e3, r0, p3, "/bin/cat", "cat./date.txt", "/home/tmcphill/scratch", nil).

	%---------------------------------------------------------------------------------------------------
	% FACT: rpz_opened_file(FileID, RunID, ProcessID, File, Mode, IsDirectory, Timestamp).
	%---------------------------------------------------------------------------------------------------
	rpz_opened_file(f32, r0, p2, "/home/tmcphill/scratch", 4, true, nil).
	rpz_opened_file(f33, r0, p2, "/home/tmcphill/scratch/date.txt", 2, false, nil).
	rpz_opened_file(f34, r0, p2, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, nil).
	rpz_opened_file(f35, r0, p2, "/etc/ld.so.cache", 1, false, nil).
	rpz_opened_file(f36, r0, p2, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, nil).
	rpz_opened_file(f37, r0, p2, "/usr/lib/locale/locale-archive", 1, false, nil).
	rpz_opened_file(f38, r0, p2, "/etc/localtime", 1, false, nil).
	rpz_opened_file(f50, r0, p3, "/home/tmcphill/scratch", 4, true, nil).
	rpz_opened_file(f51, r0, p3, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, nil).
	rpz_opened_file(f52, r0, p3, "/etc/ld.so.cache", 1, false, nil).
	rpz_opened_file(f53, r0, p3, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, nil).
	rpz_opened_file(f54, r0, p3, "/usr/lib/locale/locale-archive", 1, false, nil).
	rpz_opened_file(f55, r0, p3, "/home/tmcphill/scratch/./date.txt", 1, false, nil).
	```
- Now the paths for `f33` and `f55` are different, and it is no longer possible to determine if the two rows refer to the same file just be comparing the paths:
	```
	...
	rpz_opened_file(f33, r0, p2, "/home/tmcphill/scratch/date.txt", 2, false, nil).
	.. .
	rz_opened_file(f55, r0, p3, "/home/tmcphill/scratch/./date.txt", 1, false, nil).
	...
	```
- The only reference to date.txt in config.yml is still:
	```
	inputs_outputs:  
	- name: date.txt  
	path: /home/tmcphill/scratch/date.txt  
	written_by_runs: [0]  
	read_by_runs: []
	```
- So variations in how files are accessed have the potential to make it difficult to determine which paths refer to the same file.

- However, the graph created by the `reprounzip graph --packages drop` command correctly shows a single file named `date.txt` being both read and written despite the differences in the paths used (likely via conversion to canonical paths):

	![enter image description here](https://lh3.googleusercontent.com/9A9w_k1pNznvdZxgDUY3tbXCiqkzFckg8qHLR_It46nOpxNT0XXbgjHD65TVCvaRgiHgP1h2aFU8=s4000)


### Effect of running example in a directory with a path including a symbolic link
- A similar situation can be observed running ReproZip in a clone of a the wt-prov-model repo stored on a path that traverses a symbolic link.

- The `run.sh` script for the `04-date-to-file` example is:
	```bash
	#!/bin/bash
	date > outputs/date.txt
	cat `pwd`/outputs/date.txt
	```
- Tracing a run of this script with ReproZip followed by extraction of facts...
	```
	$ reprozip trace --overwrite ./run.sh
	$ rpz2prolog -m -i .reprozip-trace > facts/rpz_facts.pl
	```
- Yields facts exported from the SQLite database indicating that `date.txt` is written and then read via two distinct paths:
	```prolog
	% FACT: rpz_opened_file(FileID, RunID, ProcessID, File, Mode, IsDirectory, Timestamp).
	rpz_opened_file(f36, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file/outputs/date.txt", 2, false, nil).
	rpz_opened_file(f59, r0, p4, "/home/tmcphill/GitRepos/wt-prov-model/examples/04-date-to-file/outputs/date.txt", 1, false, nil).
	```
- The two paths above are equivalent because `/home/tmcphill/GitRepos` is a symbolic link to `/mnt/c/Users/tmcphill/OneDrive/GitRepos`.

- In `config.yml` the file is listed under `inputs_outputs` with only one of these paths:
	```yaml
	inputs_outputs:
	- name: date.txt
	  path: /mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/04-date-to-file/outputs/date.txt
	  written_by_runs: [0]
	  read_by_runs: []
	```

- As a result the `reprounzip` graphs for the run indicates that `date.txt` is considered an output of the run (and of the `/bin/date (2)` process in particular), but not an input of the run (nor an input to `/bin/cat`):

![enter image description here](https://lh3.googleusercontent.com/WCxRbNZavaSejcXiwPO7i1zcj0S9QXvoaaxkz8QuUI5AgL8QVGoYS24DgweDkX7YuiPKWY019Gn5=s4000)

- However, resolving the paths in question to inode number does seem to confirm they point to the same file:
	```
	04-date-to-file$ ls -il  outputs/date.txt `pwd`/outputs/date.txt  /mnt/c/Users/tmcphill/GitRepos/wt-prov-model/examples/04-date-to-file/outputs/date.txt
	36591746972505925 -rw-r--r-- 1 tmcphill tmcphill 29 Jan 27 22:28 /home/tmcphill/GitRepos/wt-prov-model/examples/04-date-to-file/outputs/date.txt
	36591746972505925 -rw-r--r-- 1 tmcphill tmcphill 29 Jan 27 22:28 /mnt/c/Users/tmcphill/GitRepos/wt-prov-model/examples/04-date-to-file/outputs/date.txt
	36591746972505925 -rw-r--r-- 1 tmcphill tmcphill 29 Jan 27 22:28 outputs/date.txt
	```

- We should consider recording the inode number for all files accessed during a run, and use them to determine file identity.
