
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, nil).
rpz_process(p2, p1, r0, false, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_execution(ExecID, RunID, ProcessID, FilePath, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_execution(e1, r0, p1, '/mnt/cpr/examples/06-hello-python/./run.sh', '/mnt/cpr/examples/06-hello-python', nil).
rpz_execution(e2, r0, p2, '/mnt/cpr/examples/06-hello-python/./hello.py', '/mnt/cpr/examples/06-hello-python', nil).
rpz_execution(e3, r0, p2, '/usr/bin/python3', '/mnt/cpr/examples/06-hello-python', nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_argument(ExecID, ArgIndex, ArgValue).
%---------------------------------------------------------------------------------------------------
rpz_argument(e1, 0, './run.sh').
rpz_argument(e2, 0, './hello.py').
rpz_argument(e3, 0, 'python3').
rpz_argument(e3, 1, './hello.py').

%---------------------------------------------------------------------------------------------------
% FACT: rpz_file_open(OpenID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_file_open(o20, r0, p2, '/mnt/cpr/examples/06-hello-python', 4, true, nil).
rpz_file_open(o21, r0, p2, '/usr/bin/env', 1, false, nil).
rpz_file_open(o22, r0, p2, '/usr/bin/env', 1, false, nil).
rpz_file_open(o23, r0, p2, '/lib/x86_64-linux-gnu/ld-2.28.so', 1, false, nil).
rpz_file_open(o24, r0, p2, '/tmp/_MEIYegI7n', 8, true, nil).
rpz_file_open(o25, r0, p2, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o26, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o27, r0, p2, '/usr/bin/python3.7', 1, false, nil).
rpz_file_open(o28, r0, p2, '/lib/x86_64-linux-gnu/ld-2.28.so', 1, false, nil).
rpz_file_open(o29, r0, p2, '/tmp/_MEIYegI7n', 8, true, nil).
rpz_file_open(o30, r0, p2, '/etc/ld.so.cache', 1, false, nil).
rpz_file_open(o31, r0, p2, '/lib/x86_64-linux-gnu/libcrypt.so.1', 1, false, nil).
rpz_file_open(o32, r0, p2, '/lib/x86_64-linux-gnu/libpthread.so.0', 1, false, nil).
rpz_file_open(o33, r0, p2, '/lib/x86_64-linux-gnu/libdl.so.2', 1, false, nil).
rpz_file_open(o34, r0, p2, '/lib/x86_64-linux-gnu/libutil.so.1', 1, false, nil).
rpz_file_open(o35, r0, p2, '/tmp/_MEIYegI7n/libexpat.so.1', 1, false, nil).
rpz_file_open(o36, r0, p2, '/tmp/_MEIYegI7n/libz.so.1', 1, false, nil).
rpz_file_open(o37, r0, p2, '/lib/x86_64-linux-gnu/libm.so.6', 1, false, nil).
rpz_file_open(o38, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
rpz_file_open(o39, r0, p2, '/usr/bin/python3', 8, false, nil).
rpz_file_open(o40, r0, p2, '/usr/bin/python3', 24, false, nil).
rpz_file_open(o41, r0, p2, '/usr/lib/python3.7/os.py', 8, false, nil).
rpz_file_open(o42, r0, p2, '/usr/lib/python3.7/lib-dynload', 8, true, nil).
rpz_file_open(o43, r0, p2, '/usr/lib/locale/C.UTF-8/LC_CTYPE', 1, false, nil).
rpz_file_open(o44, r0, p2, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', 1, false, nil).
rpz_file_open(o45, r0, p2, '/usr/lib', 8, true, nil).
rpz_file_open(o46, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o47, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o48, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o49, r0, p2, '/usr/lib/python3.7', 1, true, nil).
rpz_file_open(o50, r0, p2, '/usr/lib/python3.7/encodings/__init__.py', 8, false, nil).
rpz_file_open(o51, r0, p2, '/usr/lib/python3.7/encodings/__init__.py', 8, false, nil).
rpz_file_open(o52, r0, p2, '/usr/lib/python3.7/encodings/__pycache__/__init__.cpython-37.pyc', 1, false, nil).
rpz_file_open(o53, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o54, r0, p2, '/usr/lib/python3.7/codecs.py', 8, false, nil).
rpz_file_open(o55, r0, p2, '/usr/lib/python3.7/codecs.py', 8, false, nil).
rpz_file_open(o56, r0, p2, '/usr/lib/python3.7/__pycache__/codecs.cpython-37.pyc', 1, false, nil).
rpz_file_open(o57, r0, p2, '/usr/lib/python3.7/encodings', 8, true, nil).
rpz_file_open(o58, r0, p2, '/usr/lib/python3.7/encodings', 8, true, nil).
rpz_file_open(o59, r0, p2, '/usr/lib/python3.7/encodings', 8, true, nil).
rpz_file_open(o60, r0, p2, '/usr/lib/python3.7/encodings', 1, true, nil).
rpz_file_open(o61, r0, p2, '/usr/lib/python3.7/encodings/aliases.py', 8, false, nil).
rpz_file_open(o62, r0, p2, '/usr/lib/python3.7/encodings/aliases.py', 8, false, nil).
rpz_file_open(o63, r0, p2, '/usr/lib/python3.7/encodings/__pycache__/aliases.cpython-37.pyc', 1, false, nil).
rpz_file_open(o64, r0, p2, '/usr/lib/python3.7/encodings', 8, true, nil).
rpz_file_open(o65, r0, p2, '/usr/lib/python3.7/encodings/utf_8.py', 8, false, nil).
rpz_file_open(o66, r0, p2, '/usr/lib/python3.7/encodings/utf_8.py', 8, false, nil).
rpz_file_open(o67, r0, p2, '/usr/lib/python3.7/encodings/__pycache__/utf_8.cpython-37.pyc', 1, false, nil).
rpz_file_open(o68, r0, p2, '/usr/lib/python3.7/encodings', 8, true, nil).
rpz_file_open(o69, r0, p2, '/usr/lib/python3.7/encodings/latin_1.py', 8, false, nil).
rpz_file_open(o70, r0, p2, '/usr/lib/python3.7/encodings/latin_1.py', 8, false, nil).
rpz_file_open(o71, r0, p2, '/usr/lib/python3.7/encodings/__pycache__/latin_1.cpython-37.pyc', 1, false, nil).
rpz_file_open(o72, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o73, r0, p2, '/usr/lib/python3.7/io.py', 8, false, nil).
rpz_file_open(o74, r0, p2, '/usr/lib/python3.7/io.py', 8, false, nil).
rpz_file_open(o75, r0, p2, '/usr/lib/python3.7/__pycache__/io.cpython-37.pyc', 1, false, nil).
rpz_file_open(o76, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o77, r0, p2, '/usr/lib/python3.7/abc.py', 8, false, nil).
rpz_file_open(o78, r0, p2, '/usr/lib/python3.7/abc.py', 8, false, nil).
rpz_file_open(o79, r0, p2, '/usr/lib/python3.7/__pycache__/abc.cpython-37.pyc', 1, false, nil).
rpz_file_open(o80, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o81, r0, p2, '/usr/lib/python3.7/site.py', 8, false, nil).
rpz_file_open(o82, r0, p2, '/usr/lib/python3.7/site.py', 8, false, nil).
rpz_file_open(o83, r0, p2, '/usr/lib/python3.7/__pycache__/site.cpython-37.pyc', 1, false, nil).
rpz_file_open(o84, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o85, r0, p2, '/usr/lib/python3.7/os.py', 8, false, nil).
rpz_file_open(o86, r0, p2, '/usr/lib/python3.7/os.py', 8, false, nil).
rpz_file_open(o87, r0, p2, '/usr/lib/python3.7/__pycache__/os.cpython-37.pyc', 1, false, nil).
rpz_file_open(o88, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o89, r0, p2, '/usr/lib/python3.7/stat.py', 8, false, nil).
rpz_file_open(o90, r0, p2, '/usr/lib/python3.7/stat.py', 8, false, nil).
rpz_file_open(o91, r0, p2, '/usr/lib/python3.7/__pycache__/stat.cpython-37.pyc', 1, false, nil).
rpz_file_open(o92, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o93, r0, p2, '/usr/lib/python3.7/posixpath.py', 8, false, nil).
rpz_file_open(o94, r0, p2, '/usr/lib/python3.7/posixpath.py', 8, false, nil).
rpz_file_open(o95, r0, p2, '/usr/lib/python3.7/__pycache__/posixpath.cpython-37.pyc', 1, false, nil).
rpz_file_open(o96, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o97, r0, p2, '/usr/lib/python3.7/genericpath.py', 8, false, nil).
rpz_file_open(o98, r0, p2, '/usr/lib/python3.7/genericpath.py', 8, false, nil).
rpz_file_open(o99, r0, p2, '/usr/lib/python3.7/__pycache__/genericpath.cpython-37.pyc', 1, false, nil).
rpz_file_open(o100, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o101, r0, p2, '/usr/lib/python3.7/_collections_abc.py', 8, false, nil).
rpz_file_open(o102, r0, p2, '/usr/lib/python3.7/_collections_abc.py', 8, false, nil).
rpz_file_open(o103, r0, p2, '/usr/lib/python3.7/__pycache__/_collections_abc.cpython-37.pyc', 1, false, nil).
rpz_file_open(o104, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o105, r0, p2, '/usr/lib/python3.7/_sitebuiltins.py', 8, false, nil).
rpz_file_open(o106, r0, p2, '/usr/lib/python3.7/_sitebuiltins.py', 8, false, nil).
rpz_file_open(o107, r0, p2, '/usr/lib/python3.7/__pycache__/_sitebuiltins.cpython-37.pyc', 1, false, nil).
rpz_file_open(o108, r0, p2, '/usr/local/lib/python3.7/dist-packages', 8, true, nil).
rpz_file_open(o109, r0, p2, '/usr/local/lib/python3.7/dist-packages', 1, true, nil).
rpz_file_open(o110, r0, p2, '/usr/lib/python3/dist-packages', 8, true, nil).
rpz_file_open(o111, r0, p2, '/usr/lib/python3/dist-packages', 1, true, nil).
rpz_file_open(o112, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o113, r0, p2, '/usr/lib/python3.7/sitecustomize.py', 8, false, nil).
rpz_file_open(o114, r0, p2, '/usr/lib/python3.7/sitecustomize.py', 8, false, nil).
rpz_file_open(o115, r0, p2, '/usr/lib/python3.7/__pycache__/sitecustomize.cpython-37.pyc', 1, false, nil).
rpz_file_open(o116, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o117, r0, p2, '/usr/lib/python3.7/lib-dynload', 8, true, nil).
rpz_file_open(o118, r0, p2, '/usr/lib/python3.7/lib-dynload', 8, true, nil).
rpz_file_open(o119, r0, p2, '/usr/lib/python3.7/lib-dynload', 8, true, nil).
rpz_file_open(o120, r0, p2, '/usr/lib/python3.7/lib-dynload', 1, true, nil).
rpz_file_open(o121, r0, p2, '/usr/local/lib/python3.7/dist-packages', 8, true, nil).
rpz_file_open(o122, r0, p2, '/usr/local/lib/python3.7/dist-packages', 8, true, nil).
rpz_file_open(o123, r0, p2, '/usr/local/lib/python3.7/dist-packages', 8, true, nil).
rpz_file_open(o124, r0, p2, '/usr/local/lib/python3.7/dist-packages', 1, true, nil).
rpz_file_open(o125, r0, p2, '/usr/lib/python3/dist-packages', 8, true, nil).
rpz_file_open(o126, r0, p2, '/usr/lib/python3/dist-packages', 8, true, nil).
rpz_file_open(o127, r0, p2, '/usr/lib/python3/dist-packages', 8, true, nil).
rpz_file_open(o128, r0, p2, '/usr/lib/python3/dist-packages', 1, true, nil).
rpz_file_open(o129, r0, p2, '/usr/lib/python3.7', 8, true, nil).
rpz_file_open(o130, r0, p2, '/usr/lib/python3.7/lib-dynload', 8, true, nil).
rpz_file_open(o131, r0, p2, '/usr/local/lib/python3.7/dist-packages', 8, true, nil).
rpz_file_open(o132, r0, p2, '/usr/lib/python3/dist-packages', 8, true, nil).
rpz_file_open(o133, r0, p2, '/mnt/cpr/examples/06-hello-python/./hello.py', 8, false, nil).
rpz_file_open(o134, r0, p2, '/mnt/cpr/examples/06-hello-python/./hello.py', 1, false, nil).
rpz_file_open(o135, r0, p2, '/mnt/cpr/examples/06-hello-python/./hello.py', 8, false, nil).
rpz_file_open(o136, r0, p2, '/mnt/cpr/examples/06-hello-python/hello.py', 24, false, nil).
rpz_file_open(o137, r0, p2, '/mnt/cpr/examples/06-hello-python/./hello.py', 1, false, nil).
