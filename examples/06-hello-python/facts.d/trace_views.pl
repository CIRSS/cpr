

%---------------------------------------------------------------------------------------------------
% FACT: cpr_process(ProcessID, ParentID, ExecID, ExecPath).
%...................................................................................................
cpr_process(p2,p1,e3,'/usr/bin/python3').
cpr_process(p2,p1,e2,'./hello.py').
cpr_process(p1,nil,e1,'./run.sh').


%---------------------------------------------------------------------------------------------------
% FACT: cpr_file_read(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................
cpr_file_read(o21,r0,p2,i7,'/usr/bin/env',sw).
cpr_file_read(o22,r0,p2,i7,'/usr/bin/env',sw).
cpr_file_read(o23,r0,p2,i9,'/usr/lib/x86_64-linux-gnu/ld-2.31.so',os).
cpr_file_read(o25,r0,p2,i11,'/etc/ld.so.cache',os).
cpr_file_read(o26,r0,p2,i12,'/lib/x86_64-linux-gnu/libc.so.6',os).
cpr_file_read(o27,r0,p2,i13,'/usr/bin/python3.8',sw).
cpr_file_read(o28,r0,p2,i9,'/usr/lib/x86_64-linux-gnu/ld-2.31.so',os).
cpr_file_read(o30,r0,p2,i11,'/etc/ld.so.cache',os).
cpr_file_read(o31,r0,p2,i12,'/lib/x86_64-linux-gnu/libc.so.6',os).
cpr_file_read(o32,r0,p2,i14,'/lib/x86_64-linux-gnu/libpthread.so.0',os).
cpr_file_read(o33,r0,p2,i15,'/lib/x86_64-linux-gnu/libdl.so.2',os).
cpr_file_read(o34,r0,p2,i16,'/lib/x86_64-linux-gnu/libutil.so.1',os).
cpr_file_read(o35,r0,p2,i17,'/lib/x86_64-linux-gnu/libm.so.6',os).
cpr_file_read(o38,r0,p2,i18,'/usr/lib/locale/C.UTF-8/LC_CTYPE',os).
cpr_file_read(o39,r0,p2,i21,'/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache',os).
cpr_file_read(o44,r0,p2,i26,'/etc/localtime',os).
cpr_file_read(o52,r0,p2,i29,'/usr/lib/python3.8/encodings/__pycache__/__init__.cpython-38.pyc',os).
cpr_file_read(o56,r0,p2,i32,'/usr/lib/python3.8/__pycache__/codecs.cpython-38.pyc',os).
cpr_file_read(o63,r0,p2,i35,'/usr/lib/python3.8/encodings/__pycache__/aliases.cpython-38.pyc',os).
cpr_file_read(o67,r0,p2,i37,'/usr/lib/python3.8/encodings/__pycache__/utf_8.cpython-38.pyc',os).
cpr_file_read(o71,r0,p2,i39,'/usr/lib/python3.8/encodings/__pycache__/latin_1.cpython-38.pyc',os).
cpr_file_read(o75,r0,p2,i41,'/usr/lib/python3.8/__pycache__/io.cpython-38.pyc',os).
cpr_file_read(o79,r0,p2,i43,'/usr/lib/python3.8/__pycache__/abc.cpython-38.pyc',os).
cpr_file_read(o83,r0,p2,i45,'/usr/lib/python3.8/__pycache__/site.cpython-38.pyc',os).
cpr_file_read(o87,r0,p2,i46,'/usr/lib/python3.8/__pycache__/os.cpython-38.pyc',os).
cpr_file_read(o91,r0,p2,i48,'/usr/lib/python3.8/__pycache__/stat.cpython-38.pyc',os).
cpr_file_read(o95,r0,p2,i50,'/usr/lib/python3.8/__pycache__/_collections_abc.cpython-38.pyc',os).
cpr_file_read(o99,r0,p2,i52,'/usr/lib/python3.8/__pycache__/posixpath.cpython-38.pyc',os).
cpr_file_read(o103,r0,p2,i54,'/usr/lib/python3.8/__pycache__/genericpath.cpython-38.pyc',os).
cpr_file_read(o107,r0,p2,i56,'/usr/lib/python3.8/__pycache__/_sitebuiltins.cpython-38.pyc',os).
cpr_file_read(o115,r0,p2,i64,'/usr/lib/python3.8/__pycache__/sitecustomize.cpython-38.pyc',os).
cpr_file_read(o134,r0,p2,i65,'./hello.py',sw).
cpr_file_read(o137,r0,p2,i65,'./hello.py',sw).


%---------------------------------------------------------------------------------------------------
% FACT: cpr_file_write(AccessID, RunID, ProcessID, FileIndex, FilePath, FileRole).
%...................................................................................................


%---------------------------------------------------------------------------------------------------
% FACT: cpr_data_file(PathIndex, FilePath, PathRole).
%...................................................................................................
