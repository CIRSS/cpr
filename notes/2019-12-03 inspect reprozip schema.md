## 2019-12-03 Inspect ReproZip database schema

### Examined the SQLite database created when ReproZip traced a simple command

- Continued working with example from previous day.

- The following comand had been run in an empty directory:  `reprozip trace date`

- Following execution of the above command the directory contained a `.reprozip-trace` sub-directory containing a SQLite database file:
	```
	 scratch$ ls -al .reprozip-trace/
	 total 44
	 drwxrwxr-x 2 tmcphill tmcphill  4096 Dec  2 19:13 .
	 drwxrwxr-x 3 tmcphill tmcphill  4096 Dec  2 19:13 ..
	 -rw-rw-r-- 1 tmcphill tmcphill  5496 Dec  2 19:13 config.yml
	 -rw-r--r-- 1 tmcphill tmcphill 28672 Dec  2 19:13 trace.sqlite3
	```
- Opened the SQLite database using the `sqlite3` command:
	```
	scratch$ sqlite3 .reprozip-trace/trace.sqlite3 
	SQLite version 3.22.0 2018-01-22 18:45:57
	Enter ".help" for usage hints.	
	sqlite>
	```
- Dumped the entire contents of the database:
	```
	sqlite> .dump
	PRAGMA foreign_keys=OFF;
	BEGIN TRANSACTION;
	CREATE TABLE processes(    id INTEGER NOT NULL PRIMARY KEY,    run_id INTEGER NOT NULL,    parent INTEGER,    timestamp INTEGER NOT NULL,    is_thread BOOLEAN NOT NULL,    exitcode INTEGER    );
	INSERT INTO processes VALUES(1,0,NULL,15577399435137,0,0);
	CREATE TABLE opened_files(    id INTEGER NOT NULL PRIMARY KEY,    run_id INTEGER NOT NULL,    name TEXT NOT NULL,    timestamp INTEGER NOT NULL,    mode INTEGER NOT NULL,    is_directory BOOLEAN NOT NULL,    process INTEGER NOT NULL    );
	INSERT INTO opened_files VALUES(1,0,'/linfast/GitRepos/wt-prov-model/toolkits/reprozip/scratch',15577399441065,4,1,1);
	INSERT INTO opened_files VALUES(2,0,'/linfast/GitRepos/wt-prov-model/toolkits/reprozip/scratch',15577399443805,4,1,1);
	INSERT INTO opened_files VALUES(3,0,'/lib/x86_64-linux-gnu/ld-2.27.so',15577408452187,1,0,1);
	INSERT INTO opened_files VALUES(4,0,'/etc/ld.so.cache',15577408763619,1,0,1);
	INSERT INTO opened_files VALUES(5,0,'/lib/x86_64-linux-gnu/libc.so.6',15577408954429,1,0,1);
	INSERT INTO opened_files VALUES(6,0,'/usr/lib/locale/locale-archive',15577409838454,1,0,1);
	INSERT INTO opened_files VALUES(7,0,'/etc/localtime',15577410055926,1,0,1);
	CREATE TABLE executed_files(    id INTEGER NOT NULL PRIMARY KEY,    name TEXT NOT NULL,    run_id INTEGER NOT NULL,    timestamp INTEGER NOT NULL,    process INTEGER NOT NULL,    argv TEXT NOT NULL,    envp TEXT NOT NULL,    workingdir TEXT NOT NULL    );
	INSERT INTO executed_files VALUES(1,'/bin/date',0,15577407955282,1,'date','LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:','/linfast/GitRepos/wt-prov-model/toolkits/reprozip/scratch');
	CREATE INDEX proc_parent_idx ON processes(parent);
	CREATE INDEX open_proc_idx ON opened_files(process);
	CREATE INDEX exec_proc_idx ON executed_files(process);
	COMMIT;
	```

- Confirmed that the database has only three tables:
	```
	sqlite> .tables
	executed_files  opened_files    processes 
	```
- Dumped each table separately to highlight the schema.  The `processes` table:
	```
	sqlite> .dump processes
	PRAGMA foreign_keys=OFF;
	BEGIN TRANSACTION;
	CREATE TABLE processes( 
		id        INTEGER NOT NULL PRIMARY KEY,   
		run_id    INTEGER NOT NULL,    
		parent    INTEGER,    
		timestamp INTEGER NOT NULL,    
		is_thread BOOLEAN NOT NULL,   
		exitcode INTEGER 
	 );
	INSERT INTO processes VALUES(1,0,NULL,15577399435137,0,0);
	CREATE INDEX proc_parent_idx ON processes(parent);
	COMMIT;
	```
- The `executed_files` table:
	```
	sqlite> .dump executed_files
	PRAGMA foreign_keys=OFF;
	BEGIN TRANSACTION;
	CREATE TABLE executed_files(
		id         INTEGER NOT NULL PRIMARY KEY,    
		name       TEXT NOT NULL,    
		run_id     INTEGER NOT NULL,    
		timestamp  INTEGER NOT NULL,    
		process    INTEGER NOT NULL,    
		argv       TEXT NOT NULL,    
		envp       TEXT NOT NULL,    
		workingdir TEXT NOT NULL
	);
	INSERT INTO executed_files VALUES(1,'/bin/date',0,15577407955282,1,'date','LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:','/linfast/GitRepos/wt-prov-model/toolkits/reprozip/scratch');
	CREATE INDEX exec_proc_idx ON executed_files(process);
	COMMIT;
	```
- And the `opened_files` table:
	```
	sqlite> .dump opened_files
	PRAGMA foreign_keys=OFF;
	BEGIN TRANSACTION;
	CREATE TABLE opened_files(    
		id           INTEGER NOT NULL PRIMARY KEY, 
		run_id       INTEGER NOT NULL,
		name         TEXT NOT NULL,    
		timestamp    INTEGER NOT NULL,    
		mode         INTEGER NOT NULL,    
		is_directory BOOLEAN NOT NULL,    
		process      INTEGER NOT NULL
	);
	INSERT INTO opened_files VALUES(1,0,'/linfast/GitRepos/wt-prov-model/toolkits/reprozip/scratch',15577399441065,4,1,1);
	INSERT INTO opened_files VALUES(2,0,'/linfast/GitRepos/wt-prov-model/toolkits/reprozip/scratch',15577399443805,4,1,1);
	INSERT INTO opened_files VALUES(3,0,'/lib/x86_64-linux-gnu/ld-2.27.so',15577408452187,1,0,1);
	INSERT INTO opened_files VALUES(4,0,'/etc/ld.so.cache',15577408763619,1,0,1);
	INSERT INTO opened_files VALUES(5,0,'/lib/x86_64-linux-gnu/libc.so.6',15577408954429,1,0,1);
	INSERT INTO opened_files VALUES(6,0,'/usr/lib/locale/locale-archive',15577409838454,1,0,1);
	INSERT INTO opened_files VALUES(7,0,'/etc/localtime',15577410055926,1,0,1);
	CREATE INDEX open_proc_idx ON opened_files(process);
	COMMIT;
	```

### Initial observations and questions about the SQLite schema

- All three tables have a `run_id` column, and in all rows for the single run above the value of `run_id` is `0`.   Does this mean that all runs in a database instance are fully independent?

- The `processes` table has a `parent` column, and the value of this attribute in the single row in the table for a single run is `NULL`.  Presumably this attribute is used to record processes starting other processes?

- The `process` column of the `executed_files` table appears to refer to the `id` of the `processes` table (as a foreign key).  Are there situations in which this relationship is many-to-one, not one-to-one?  If the relationship is always 1-to-1, then these can be thought of just one table. Or does the presence of the `is_thread` column in the `processes` table indicate that a process can spawn many threads, with each represented by a row in the `processes` table, and with each row in `executed_files` referring only to the initial thread of a process?

- What is the difference between the `timestamp` attributes in the `processes` and `executed_files` tables?  Is the first the timestamp of the `fork()` system call, and the second the timestamp of the `exec()` system call?  Can the former represent the time at which threads are created within a process?

- The `opened_files` table has a `mode` column.  No table in this database instance records file read or write operations.  So is the mode used when opening a file employed by ReproZip to infer that a processes in fact reads or writes to particular files?
 
### Observed effects of tracing a second run of the same command

- Traced a second execution of the `date` command in the same directory as before:
	```
	scratch$ reprozip trace date
	Trace directory .reprozip-trace exists
	(a)ppend run to the trace, (d)elete it or (s)top? [a/d/s] a
	[REPROZIP] 21:14:41.751 WARNING: You can use --overwrite to replace the existing trace (or --continue to append
	without prompt)
	Tue Dec  3 21:14:41 PST 2019
	Configuration file written in .reprozip-trace/config.yml
	Edit that file then run the packer -- use 'reprozip pack -h' for help
	```
- Noted that no new tables were created in the trace database:
	```
	scratch/.reprozip-trace$ sqlite3 trace.sqlite3 
	SQLite version 3.22.0 2018-01-22 18:45:57
	Enter ".help" for usage hints.
	
	sqlite> .tables
	executed_files  opened_files    processes 
	```
- Enabled pretty-printing of database table contents:
	```
	sqlite> .headers on
	sqlite> .mode column
	```
- The second run is now represented in the `processes` table:
	```
	sqlite> select * from processes;
	
	id          run_id      parent      timestamp       is_thread   exitcode  
	----------  ----------  ----------  --------------  ----------  ----------
	1           0                       15577399435137  0           0         
	2           1                       3518788081903   0           0
	```
- The `executed_files` table also has a second row now (leaving out the `envp` column):
	```
	sqlite> select id, name, run_id, timestamp, process, argv, workingdir  from executed_files ;
	
	id          name        run_id      timestamp       process     argv        workingdir                                               
	----------  ----------  ----------  --------------  ----------  ----------  ---------------------------------------------------------
	1           /bin/date   0           15577407955282  1           date        /linfast/GitRepos/wt-prov-model/toolkits/reprozip/scratch
	2           /bin/date   1           3518797166217   2           date        /linfast/GitRepos/wt-prov-model/toolkits/reprozip/scratch
	```

- And the rows in `opened_files` have been repeated for the new run:
	```
	sqlite> select * from opened_files ;
	
	id          run_id      name                                                       timestamp       mode        is_directory  process   
	----------  ----------  ---------------------------------------------------------  --------------  ----------  ------------  ----------
	1           0           /linfast/GitRepos/wt-prov-model/toolkits/reprozip/scratch  15577399441065  4           1             1         
	2           0           /linfast/GitRepos/wt-prov-model/toolkits/reprozip/scratch  15577399443805  4           1             1         
	3           0           /lib/x86_64-linux-gnu/ld-2.27.so                           15577408452187  1           0             1         
	4           0           /etc/ld.so.cache                                           15577408763619  1           0             1         
	5           0           /lib/x86_64-linux-gnu/libc.so.6                            15577408954429  1           0             1         
	6           0           /usr/lib/locale/locale-archive                             15577409838454  1           0             1         
	7           0           /etc/localtime                                             15577410055926  1           0             1         
	8           1           /linfast/GitRepos/wt-prov-model/toolkits/reprozip/scratch  3518788378372   4           1             2         
	9           1           /linfast/GitRepos/wt-prov-model/toolkits/reprozip/scratch  3518788414383   4           1             2         
	10          1           /lib/x86_64-linux-gnu/ld-2.27.so                           3518797500912   1           0             2         
	11          1           /etc/ld.so.cache                                           3518797691441   1           0             2         
	12          1           /lib/x86_64-linux-gnu/libc.so.6                            3518797813869   1           0             2         
	13          1           /usr/lib/locale/locale-archive                             3518798335187   1           0             2         
	14          1           /etc/localtime                                             3518798466915   1           0             2     
	```

- The two runs do appear to be independent, with each row of all tables identified with a single run.

### Observed limitation of information in ReproZip trace database with respect to symbolic links

- Inspected the type of each of the five files that were recorded (twice each) in the `opened_files` table:
	```
	$ file /lib/x86_64-linux-gnu/ld-2.27.so /etc/ld.so.cache /lib/x86_64-linux-gnu/libc.so.6 /usr/lib/locale/locale-archive /etc/localtime
	/lib/x86_64-linux-gnu/ld-2.27.so: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, BuildID[sha1]=64df1b961228382fe18684249ed800ab1dceaad4, stripped
	/etc/ld.so.cache:                 data
	/lib/x86_64-linux-gnu/libc.so.6:  symbolic link to libc-2.27.so
	/usr/lib/locale/locale-archive:   locale archive 228 strings
	/etc/localtime:                   symbolic link to /usr/share/zoneinfo/America/Los_Angeles

	$ ls -al /lib/x86_64-linux-gnu/ld-2.27.so /etc/ld.so.cache /lib/x86_64-linux-gnu/libc.so.6 /usr/lib/locale/locale-archive /etc/localtime
	-rw-r--r-- 1 root root  133499 Dec  3 20:19 /etc/ld.so.cache
	lrwxrwxrwx 1 root root      39 Dec  2 13:57 /etc/localtime -> /usr/share/zoneinfo/America/Los_Angeles
	-rwxr-xr-x 1 root root  170960 Apr 16  2018 /lib/x86_64-linux-gnu/ld-2.27.so
	lrwxrwxrwx 1 root root      12 Nov  7  2018 /lib/x86_64-linux-gnu/libc.so.6 -> libc-2.27.so
	-rw-r--r-- 1 root root 3004224 Jul 24  2018 /usr/lib/locale/locale-archive
	```
- Two of the files are actually symbolic links:
	```
	/etc/localtime -> /usr/share/zoneinfo/America/Los_Angeles
	/lib/x86_64-linux-gnu/libc.so.6 -> libc-2.27.so
	/lib64/ld-linux-x86-64.so.2: symbolic link to /lib/x86_64-linux-gnu/ld-2.27.so
	```
- In the case of symbolic links, ReproZip appears to record in the database the path of the link, not the path to the actual file accessed on the filesystem via the link.

- However, the `config.yml` file (used for driving the ReproZip packer) stored in the same directory as `trace.sqlite3` *does* note the path to the actual file in comments that acknowledge the symbolic links:
	```yaml
	.
	.
	.
	packages:
	  - name: "coreutils"
	    version: "8.28-1ubuntu1"
	    size: 6717440
	    packfiles: true
	    files:
	      # Total files used: 98.21 KB
	      # Installed package size: 6.41 MB
	      - "/bin/date" # 98.21 KB
	  - name: "libc6"
	    version: "2.27-3ubuntu1"
	    size: 12162048
	    packfiles: true
	    files:
	      # Total files used: 2.10 MB
	      # Installed package size: 11.60 MB
	      - "/lib/x86_64-linux-gnu/ld-2.27.so" # 166.95 KB
	      - "/lib/x86_64-linux-gnu/libc-2.27.so" # 1.94 MB
	      - "/lib/x86_64-linux-gnu/libc.so.6" # Link to /lib/x86_64-linux-gnu/libc-2.27.so
	  - name: "tzdata"
	    version: "2019c-0ubuntu0.18.04"
	    size: 3106816
	    packfiles: true
	    files:
	      # Total files used: 2.78 KB
	      # Installed package size: 2.96 MB
	      - "/usr/share/zoneinfo/America/Los_Angeles" # 2.78 KB

	# These files do not appear to come with an installed package -- you probably
	# want them packed
	other_files:
	  - "/etc/ld.so.cache" # 130.37 KB
	  - "/etc/localtime" # Link to /usr/share/zoneinfo/America/Los_Angeles
	  - "/lib64/ld-linux-x86-64.so.2" # Link to /lib/x86_64-linux-gnu/ld-2.27.so
	  - "/linfast/GitRepos/wt-prov-model/toolkits/reprozip/scratch" # Directory
	  - "/usr/lib/locale/locale-archive" # 2.87 MB
	.
	.
	.
	```
- Moreover, the `config.yml` file (above) notes that `/lib64/ld-linux-x86-64.so.2` is a symbolic link to `/lib/x86_64-linux-gnu/ld-2.27.so`, whereas in the database only the target of that link is recorded (`/lib/x86_64-linux-gnu/ld-2.27.so`).

- Thus, it appears that ReproZip does see this information at run-time, but does not consistently record the targets of symbolic links in the SQLite database file.
 


