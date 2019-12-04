## 2019-12-03 Inspect ReproZip database schema

### Examined the SQLite database created when ReproZip traced a simple command

- Continued working with example from previous day.

- The following comand had been run in an empty directory:  `reprozip trace date`

- Following execution of the above command the directory contained a `.reprozip-trace` sub-directory containing a SQLite database file:
	```
	 (.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip/scratch$ ls -al .reprozip-trace/
	 total 44
	 drwxrwxr-x 2 tmcphill tmcphill  4096 Dec  2 19:13 .
	 drwxrwxr-x 3 tmcphill tmcphill  4096 Dec  2 19:13 ..
	 -rw-rw-r-- 1 tmcphill tmcphill  5496 Dec  2 19:13 config.yml
	 -rw-r--r-- 1 tmcphill tmcphill 28672 Dec  2 19:13 trace.sqlite3
	```
- Opened the SQLite database using the `sqlite3` command:
	```
	(.venv-reprozip) tmcphill@artemis:~/GitRepos/wt-prov-model/toolkits/reprozip/scratch$ sqlite3 .reprozip-trace/trace.sqlite3 
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
 

