## 2020-01-22 Compare `strace` outputs with sciunit

### Background

- Both Sciunit and Reprozip appear to employ the [ptrace](https://linux.die.net/man/2/ptrace) (process trace) Linux system call to monitor and control the execution of other processes.

- The [strace](https://linux.die.net/man/1/strace) command is a standard command-line tool wrapping `ptrace` process monitoring capabilities.

- **Question:**  How much more does Sciunit give us beyond what the `ptrace` command provides on its own?

### Installed ptrace in WSL2 Debian environment

- Installed the `strace` package:
	```
	tmcphill@circe:~/scratch$ sudo apt install strace
	Reading package lists... Done
	Building dependency tree
	Reading state information... Done
	The following packages were automatically installed and are no longer required:
	  dirmngr python-apt-common
	Use 'sudo apt autoremove' to remove them.
	The following NEW packages will be installed:
	  strace
	0 upgraded, 1 newly installed, 0 to remove and 52 not upgraded.
	Need to get 533 kB of archives.
	After this operation, 1,396 kB of additional disk space will be used.
	Get:1 http://deb.debian.org/debian stretch/main amd64 strace amd64 4.15-2 [533 kB]
	Fetched 533 kB in 0s (2,029 kB/s)
	Selecting previously unselected package strace.
	(Reading database ... 46771 files and directories currently installed.)
	Preparing to unpack .../strace_4.15-2_amd64.deb ...
	Unpacking strace (4.15-2) ...
	Setting up strace (4.15-2) ...
	Processing triggers for man-db (2.7.6.1-2) ...
	```
- Checked version of `strace`:
	```
	tmcphill@circe:~/scratch$ strace -V
	strace -- version 4.15
	```

- Printed `strace` help and examined command options:
	```
	tmcphill@circe:~/scratch$ strace -h
	usage: strace [-CdffhiqrtttTvVwxxy] [-I n] [-e expr]...
	              [-a column] [-o file] [-s strsize] [-P path]...
	              -p pid... / [-D] [-E var=val]... [-u username] PROG [ARGS]
	   or: strace -c[dfw] [-I n] [-e expr]... [-O overhead] [-S sortby]
	              -p pid... / [-D] [-E var=val]... [-u username] PROG [ARGS]

	Output format:
	  -a column      alignment COLUMN for printing syscall results (default 40)
	  -i             print instruction pointer at time of syscall
	  -o file        send trace output to FILE instead of stderr
	  -q             suppress messages about attaching, detaching, etc.
	  -r             print relative timestamp
	  -s strsize     limit length of print strings to STRSIZE chars (default 32)
	  -t             print absolute timestamp
	  -tt            print absolute timestamp with usecs
	  -T             print time spent in each syscall
	  -x             print non-ascii strings in hex
	  -xx            print all strings in hex
	  -y             print paths associated with file descriptor arguments
	  -yy            print protocol specific information associated with socket file descriptors

	Statistics:
	  -c             count time, calls, and errors for each syscall and report summary
	  -C             like -c but also print regular output
	  -O overhead    set overhead for tracing syscalls to OVERHEAD usecs
	  -S sortby      sort syscall counts by: time, calls, name, nothing (default time)
	  -w             summarise syscall latency (default is system time)

	Filtering:
	  -e expr        a qualifying expression: option=[!]all or option=[!]val1[,val2]...
	     options:    trace, abbrev, verbose, raw, signal, read, write, fault
	  -P path        trace accesses to path

	Tracing:
	  -b execve      detach on execve syscall
	  -D             run tracer process as a detached grandchild, not as parent
	  -f             follow forks
	  -ff            follow forks with output into separate files
	  -I interruptible
	     1:          no signals are blocked
	     2:          fatal signals are blocked while decoding syscall (default)
	     3:          fatal signals are always blocked (default if '-o FILE PROG')
	     4:          fatal signals and SIGTSTP (^Z) are always blocked
	                 (useful to make 'strace -o FILE PROG' not stop on ^Z)

	Startup:
	  -E var         remove var from the environment for command
	  -E var=val     put var=val in the environment for command
	  -p pid         trace process with process id PID, may be repeated
	  -u username    run command as username handling setuid and/or setgid

	Miscellaneous:
	  -d             enable debug output to stderr
	  -v             verbose mode: print unabbreviated argv, stat, termios, etc. args
	  -h             print help message
	  -V             print version
	```

### Used `strace` to monitor `date` execution

- Ran `date` via `strace` using the default options:
	```
	tmcphill@circe:~/scratch$ strace date
	execve("/bin/date", ["date"], [/* 26 vars */]) = 0
	brk(NULL)                               = 0x561f7a5f5000
	access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
	access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
	open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
	fstat(3, {st_mode=S_IFREG|0644, st_size=36052, ...}) = 0
	mmap(NULL, 36052, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f9634d7e000
	close(3)                                = 0
	access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
	open("/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
	read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\4\2\0\0\0\0\0"..., 832) = 832
	fstat(3, {st_mode=S_IFREG|0755, st_size=1689360, ...}) = 0
	mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f9634d7c000
	mmap(NULL, 3795296, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f96347c5000
	mprotect(0x7f963495a000, 2097152, PROT_NONE) = 0
	mmap(0x7f9634b5a000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x195000) = 0x7f9634b5a000
	mmap(0x7f9634b60000, 14688, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f9634b60000
	close(3)                                = 0
	arch_prctl(ARCH_SET_FS, 0x7f9634d7d480) = 0
	mprotect(0x7f9634b5a000, 16384, PROT_READ) = 0
	mprotect(0x561f79c05000, 4096, PROT_READ) = 0
	mprotect(0x7f9634d87000, 4096, PROT_READ) = 0
	munmap(0x7f9634d7e000, 36052)           = 0
	brk(NULL)                               = 0x561f7a5f5000
	brk(0x561f7a616000)                     = 0x561f7a616000
	open("/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = 3
	fstat(3, {st_mode=S_IFREG|0644, st_size=1679776, ...}) = 0
	mmap(NULL, 1679776, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f9634be1000
	close(3)                                = 0
	open("/etc/localtime", O_RDONLY|O_CLOEXEC) = 3
	fstat(3, {st_mode=S_IFREG|0644, st_size=2845, ...}) = 0
	fstat(3, {st_mode=S_IFREG|0644, st_size=2845, ...}) = 0
	read(3, "TZif2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\5\0\0\0\5\0\0\0\0"..., 4096) = 2845
	lseek(3, -1811, SEEK_CUR)               = 1034
	read(3, "TZif2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\5\0\0\0\5\0\0\0\0"..., 4096) = 1811
	close(3)                                = 0
	fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 0), ...}) = 0
	write(1, "Wed Jan 22 13:48:47 PST 2020\n", 29Wed Jan 22 13:48:47 PST 2020
	) = 29
	close(1)                                = 0
	close(2)                                = 0
	exit_group(0)                           = ?
	+++ exited with 0 +++
	```
- Reviewed record of system calls in `provenance.cde-root.1.log`:
	```
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
- The subset of the `strace` output roughly corresponding in content to entries in the log file above is (reordered to match):
	```
	execve("/bin/date", ["date"], [/* 26 vars */]) = 0

	open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
	mmap(NULL, 36052, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f9634d7e000

	close(3)                                = 0

	open("/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
	read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\4\2\0\0\0\0\0"..., 832) = 832
	mmap(NULL, 3795296, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f96347c5000

	close(3)                                = 0

	open("/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = 3
	mmap(NULL, 1679776, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f9634be1000

	close(3)                                = 0

	open("/etc/localtime", O_RDONLY|O_CLOEXEC) = 3
	read(3, "TZif2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\5\0\0\0\5\0\0\0\0"..., 4096) = 2845
	lseek(3, -1811, SEEK_CUR)               = 1034
	read(3, "TZif2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\5\0\0\0\5\0\0\0\0"..., 4096) = 1811

	close(3)                                = 0

	```

### Observation

- There is one `READ` entry in the Sciunit/CDE log per `open()` call, each with the O_RDONLY flag set.  There are two `read()` calls for one of the files, and none for two of the files that presumably are accessed exclusively via memory mapping.

- So (similar to ReproZip) what Sciunit (via CDE) likely actually observes is file open events, with read/write accesses distinguished by the flags given to `open()`.
