

%---------------------------------------------------------------------------------------------------
% FACT: wt_process(ProcessID, ParentID, ExecID, ExecPath).
%...................................................................................................
wt_process(p2,p1,e3,'/usr/bin/python3').
wt_process(p2,p1,e2,'./hello.py').
wt_process(p1,nil,e1,'./run.sh').


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
wt_file_read(o21,r0,p2,i8,'/usr/bin/env',sw).
wt_file_read(o22,r0,p2,i8,'/usr/bin/env',sw).
wt_file_read(o23,r0,p2,i10,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o25,r0,p2,i12,'/etc/ld.so.cache',os).
wt_file_read(o26,r0,p2,i13,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o27,r0,p2,i14,'/usr/bin/python3.7',sw).
wt_file_read(o28,r0,p2,i10,'/lib/x86_64-linux-gnu/ld-2.28.so',os).
wt_file_read(o30,r0,p2,i12,'/etc/ld.so.cache',os).
wt_file_read(o31,r0,p2,i15,'/lib/x86_64-linux-gnu/libcrypt.so.1',os).
wt_file_read(o32,r0,p2,i16,'/lib/x86_64-linux-gnu/libpthread.so.0',os).
wt_file_read(o33,r0,p2,i17,'/lib/x86_64-linux-gnu/libdl.so.2',os).
wt_file_read(o34,r0,p2,i18,'/lib/x86_64-linux-gnu/libutil.so.1',os).
wt_file_read(o37,r0,p2,i19,'/lib/x86_64-linux-gnu/libm.so.6',os).
wt_file_read(o38,r0,p2,i13,'/lib/x86_64-linux-gnu/libc.so.6',os).
wt_file_read(o43,r0,p2,i23,'/usr/lib/locale/C.UTF-8/LC_CTYPE',os).
wt_file_read(o44,r0,p2,i26,'/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache',os).
wt_file_read(o52,r0,p2,i31,'/usr/lib/python3.7/encodings/__pycache__/__init__.cpython-37.pyc',os).
wt_file_read(o56,r0,p2,i34,'/usr/lib/python3.7/__pycache__/codecs.cpython-37.pyc',os).
wt_file_read(o63,r0,p2,i37,'/usr/lib/python3.7/encodings/__pycache__/aliases.cpython-37.pyc',os).
wt_file_read(o67,r0,p2,i39,'/usr/lib/python3.7/encodings/__pycache__/utf_8.cpython-37.pyc',os).
wt_file_read(o71,r0,p2,i41,'/usr/lib/python3.7/encodings/__pycache__/latin_1.cpython-37.pyc',os).
wt_file_read(o75,r0,p2,i43,'/usr/lib/python3.7/__pycache__/io.cpython-37.pyc',os).
wt_file_read(o79,r0,p2,i45,'/usr/lib/python3.7/__pycache__/abc.cpython-37.pyc',os).
wt_file_read(o83,r0,p2,i47,'/usr/lib/python3.7/__pycache__/site.cpython-37.pyc',os).
wt_file_read(o87,r0,p2,i48,'/usr/lib/python3.7/__pycache__/os.cpython-37.pyc',os).
wt_file_read(o91,r0,p2,i50,'/usr/lib/python3.7/__pycache__/stat.cpython-37.pyc',os).
wt_file_read(o95,r0,p2,i52,'/usr/lib/python3.7/__pycache__/posixpath.cpython-37.pyc',os).
wt_file_read(o99,r0,p2,i54,'/usr/lib/python3.7/__pycache__/genericpath.cpython-37.pyc',os).
wt_file_read(o103,r0,p2,i56,'/usr/lib/python3.7/__pycache__/_collections_abc.cpython-37.pyc',os).
wt_file_read(o107,r0,p2,i58,'/usr/lib/python3.7/__pycache__/_sitebuiltins.cpython-37.pyc',os).
wt_file_read(o115,r0,p2,i66,'/usr/lib/python3.7/__pycache__/sitecustomize.cpython-37.pyc',os).
wt_file_read(o134,r0,p2,i67,'./hello.py',sw).
wt_file_read(o137,r0,p2,i67,'./hello.py',sw).


%---------------------------------------------------------------------------------------------------
% FACT: wt_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................


%---------------------------------------------------------------------------------------------------
% FACT: wt_data_file(PathIndex, FilePath, PathRole).
%...................................................................................................
