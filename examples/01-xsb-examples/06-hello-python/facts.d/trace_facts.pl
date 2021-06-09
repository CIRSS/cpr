
%---------------------------------------------------------------------------------------------------
% FACT: cpr_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
cpr_process(p1, nil, r0, false, 0, nil).
cpr_process(p2, p1, r0, false, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_execution(ExecID, RunID, ProcessID, FilePath, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
cpr_execution(e1, r0, p1, '/mnt/cpr/examples/01-xsb-examples/06-hello-python/./run.sh', '/mnt/cpr/examples/01-xsb-examples/06-hello-python', nil).
cpr_execution(e2, r0, p2, '/mnt/cpr/examples/01-xsb-examples/06-hello-python/./hello.py', '/mnt/cpr/examples/01-xsb-examples/06-hello-python', nil).
cpr_execution(e3, r0, p2, '/usr/bin/python3', '/mnt/cpr/examples/01-xsb-examples/06-hello-python', nil).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_argument(ExecID, ArgIndex, ArgValue).
%---------------------------------------------------------------------------------------------------
cpr_argument(e1, 0, './run.sh').
cpr_argument(e2, 0, './hello.py').
cpr_argument(e3, 0, 'python3').
cpr_argument(e3, 1, './hello.py').

%---------------------------------------------------------------------------------------------------
% FACT: cpr_file_open(OpenID, RunID, ProcessID, FilePath, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
cpr_file_open(o20, r0, p2, '/mnt/cpr/examples/01-xsb-examples/06-hello-python', 4, true, nil).
cpr_file_open(o21, r0, p2, '/usr/bin/env', 1, false, nil).
cpr_file_open(o22, r0, p2, '/usr/bin/env', 1, false, nil).
cpr_file_open(o23, r0, p2, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', 1, false, nil).
cpr_file_open(o25, r0, p2, '/etc/ld.so.cache', 1, false, nil).
cpr_file_open(o26, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
cpr_file_open(o27, r0, p2, '/usr/bin/python3.8', 1, false, nil).
cpr_file_open(o28, r0, p2, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', 1, false, nil).
cpr_file_open(o30, r0, p2, '/etc/ld.so.cache', 1, false, nil).
cpr_file_open(o31, r0, p2, '/lib/x86_64-linux-gnu/libc.so.6', 1, false, nil).
cpr_file_open(o32, r0, p2, '/lib/x86_64-linux-gnu/libpthread.so.0', 1, false, nil).
cpr_file_open(o33, r0, p2, '/lib/x86_64-linux-gnu/libdl.so.2', 1, false, nil).
cpr_file_open(o34, r0, p2, '/lib/x86_64-linux-gnu/libutil.so.1', 1, false, nil).
cpr_file_open(o35, r0, p2, '/lib/x86_64-linux-gnu/libm.so.6', 1, false, nil).
cpr_file_open(o38, r0, p2, '/usr/lib/locale/C.UTF-8/LC_CTYPE', 1, false, nil).
cpr_file_open(o39, r0, p2, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', 1, false, nil).
cpr_file_open(o40, r0, p2, '/usr/bin/python3', 8, false, nil).
cpr_file_open(o41, r0, p2, '/usr/bin/python3', 24, false, nil).
cpr_file_open(o42, r0, p2, '/usr/lib/python3.8/os.py', 8, false, nil).
cpr_file_open(o43, r0, p2, '/usr/lib/python3.8/lib-dynload', 8, true, nil).
cpr_file_open(o44, r0, p2, '/etc/localtime', 1, false, nil).
cpr_file_open(o45, r0, p2, '/usr/lib', 8, true, nil).
cpr_file_open(o46, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o47, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o48, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o49, r0, p2, '/usr/lib/python3.8', 1, true, nil).
cpr_file_open(o50, r0, p2, '/usr/lib/python3.8/encodings/__init__.py', 8, false, nil).
cpr_file_open(o51, r0, p2, '/usr/lib/python3.8/encodings/__init__.py', 8, false, nil).
cpr_file_open(o52, r0, p2, '/usr/lib/python3.8/encodings/__pycache__/__init__.cpython-38.pyc', 1, false, nil).
cpr_file_open(o53, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o54, r0, p2, '/usr/lib/python3.8/codecs.py', 8, false, nil).
cpr_file_open(o55, r0, p2, '/usr/lib/python3.8/codecs.py', 8, false, nil).
cpr_file_open(o56, r0, p2, '/usr/lib/python3.8/__pycache__/codecs.cpython-38.pyc', 1, false, nil).
cpr_file_open(o57, r0, p2, '/usr/lib/python3.8/encodings', 8, true, nil).
cpr_file_open(o58, r0, p2, '/usr/lib/python3.8/encodings', 8, true, nil).
cpr_file_open(o59, r0, p2, '/usr/lib/python3.8/encodings', 8, true, nil).
cpr_file_open(o60, r0, p2, '/usr/lib/python3.8/encodings', 1, true, nil).
cpr_file_open(o61, r0, p2, '/usr/lib/python3.8/encodings/aliases.py', 8, false, nil).
cpr_file_open(o62, r0, p2, '/usr/lib/python3.8/encodings/aliases.py', 8, false, nil).
cpr_file_open(o63, r0, p2, '/usr/lib/python3.8/encodings/__pycache__/aliases.cpython-38.pyc', 1, false, nil).
cpr_file_open(o64, r0, p2, '/usr/lib/python3.8/encodings', 8, true, nil).
cpr_file_open(o65, r0, p2, '/usr/lib/python3.8/encodings/utf_8.py', 8, false, nil).
cpr_file_open(o66, r0, p2, '/usr/lib/python3.8/encodings/utf_8.py', 8, false, nil).
cpr_file_open(o67, r0, p2, '/usr/lib/python3.8/encodings/__pycache__/utf_8.cpython-38.pyc', 1, false, nil).
cpr_file_open(o68, r0, p2, '/usr/lib/python3.8/encodings', 8, true, nil).
cpr_file_open(o69, r0, p2, '/usr/lib/python3.8/encodings/latin_1.py', 8, false, nil).
cpr_file_open(o70, r0, p2, '/usr/lib/python3.8/encodings/latin_1.py', 8, false, nil).
cpr_file_open(o71, r0, p2, '/usr/lib/python3.8/encodings/__pycache__/latin_1.cpython-38.pyc', 1, false, nil).
cpr_file_open(o72, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o73, r0, p2, '/usr/lib/python3.8/io.py', 8, false, nil).
cpr_file_open(o74, r0, p2, '/usr/lib/python3.8/io.py', 8, false, nil).
cpr_file_open(o75, r0, p2, '/usr/lib/python3.8/__pycache__/io.cpython-38.pyc', 1, false, nil).
cpr_file_open(o76, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o77, r0, p2, '/usr/lib/python3.8/abc.py', 8, false, nil).
cpr_file_open(o78, r0, p2, '/usr/lib/python3.8/abc.py', 8, false, nil).
cpr_file_open(o79, r0, p2, '/usr/lib/python3.8/__pycache__/abc.cpython-38.pyc', 1, false, nil).
cpr_file_open(o80, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o81, r0, p2, '/usr/lib/python3.8/site.py', 8, false, nil).
cpr_file_open(o82, r0, p2, '/usr/lib/python3.8/site.py', 8, false, nil).
cpr_file_open(o83, r0, p2, '/usr/lib/python3.8/__pycache__/site.cpython-38.pyc', 1, false, nil).
cpr_file_open(o84, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o85, r0, p2, '/usr/lib/python3.8/os.py', 8, false, nil).
cpr_file_open(o86, r0, p2, '/usr/lib/python3.8/os.py', 8, false, nil).
cpr_file_open(o87, r0, p2, '/usr/lib/python3.8/__pycache__/os.cpython-38.pyc', 1, false, nil).
cpr_file_open(o88, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o89, r0, p2, '/usr/lib/python3.8/stat.py', 8, false, nil).
cpr_file_open(o90, r0, p2, '/usr/lib/python3.8/stat.py', 8, false, nil).
cpr_file_open(o91, r0, p2, '/usr/lib/python3.8/__pycache__/stat.cpython-38.pyc', 1, false, nil).
cpr_file_open(o92, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o93, r0, p2, '/usr/lib/python3.8/_collections_abc.py', 8, false, nil).
cpr_file_open(o94, r0, p2, '/usr/lib/python3.8/_collections_abc.py', 8, false, nil).
cpr_file_open(o95, r0, p2, '/usr/lib/python3.8/__pycache__/_collections_abc.cpython-38.pyc', 1, false, nil).
cpr_file_open(o96, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o97, r0, p2, '/usr/lib/python3.8/posixpath.py', 8, false, nil).
cpr_file_open(o98, r0, p2, '/usr/lib/python3.8/posixpath.py', 8, false, nil).
cpr_file_open(o99, r0, p2, '/usr/lib/python3.8/__pycache__/posixpath.cpython-38.pyc', 1, false, nil).
cpr_file_open(o100, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o101, r0, p2, '/usr/lib/python3.8/genericpath.py', 8, false, nil).
cpr_file_open(o102, r0, p2, '/usr/lib/python3.8/genericpath.py', 8, false, nil).
cpr_file_open(o103, r0, p2, '/usr/lib/python3.8/__pycache__/genericpath.cpython-38.pyc', 1, false, nil).
cpr_file_open(o104, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o105, r0, p2, '/usr/lib/python3.8/_sitebuiltins.py', 8, false, nil).
cpr_file_open(o106, r0, p2, '/usr/lib/python3.8/_sitebuiltins.py', 8, false, nil).
cpr_file_open(o107, r0, p2, '/usr/lib/python3.8/__pycache__/_sitebuiltins.cpython-38.pyc', 1, false, nil).
cpr_file_open(o108, r0, p2, '/usr/local/lib/python3.8/dist-packages', 8, true, nil).
cpr_file_open(o109, r0, p2, '/usr/local/lib/python3.8/dist-packages', 1, true, nil).
cpr_file_open(o110, r0, p2, '/usr/lib/python3/dist-packages', 8, true, nil).
cpr_file_open(o111, r0, p2, '/usr/lib/python3/dist-packages', 1, true, nil).
cpr_file_open(o112, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o113, r0, p2, '/usr/lib/python3.8/sitecustomize.py', 8, false, nil).
cpr_file_open(o114, r0, p2, '/usr/lib/python3.8/sitecustomize.py', 8, false, nil).
cpr_file_open(o115, r0, p2, '/usr/lib/python3.8/__pycache__/sitecustomize.cpython-38.pyc', 1, false, nil).
cpr_file_open(o116, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o117, r0, p2, '/usr/lib/python3.8/lib-dynload', 8, true, nil).
cpr_file_open(o118, r0, p2, '/usr/lib/python3.8/lib-dynload', 8, true, nil).
cpr_file_open(o119, r0, p2, '/usr/lib/python3.8/lib-dynload', 8, true, nil).
cpr_file_open(o120, r0, p2, '/usr/lib/python3.8/lib-dynload', 1, true, nil).
cpr_file_open(o121, r0, p2, '/usr/local/lib/python3.8/dist-packages', 8, true, nil).
cpr_file_open(o122, r0, p2, '/usr/local/lib/python3.8/dist-packages', 8, true, nil).
cpr_file_open(o123, r0, p2, '/usr/local/lib/python3.8/dist-packages', 8, true, nil).
cpr_file_open(o124, r0, p2, '/usr/local/lib/python3.8/dist-packages', 1, true, nil).
cpr_file_open(o125, r0, p2, '/usr/lib/python3/dist-packages', 8, true, nil).
cpr_file_open(o126, r0, p2, '/usr/lib/python3/dist-packages', 8, true, nil).
cpr_file_open(o127, r0, p2, '/usr/lib/python3/dist-packages', 8, true, nil).
cpr_file_open(o128, r0, p2, '/usr/lib/python3/dist-packages', 1, true, nil).
cpr_file_open(o129, r0, p2, '/usr/lib/python3.8', 8, true, nil).
cpr_file_open(o130, r0, p2, '/usr/lib/python3.8/lib-dynload', 8, true, nil).
cpr_file_open(o131, r0, p2, '/usr/local/lib/python3.8/dist-packages', 8, true, nil).
cpr_file_open(o132, r0, p2, '/usr/lib/python3/dist-packages', 8, true, nil).
cpr_file_open(o133, r0, p2, '/mnt/cpr/examples/01-xsb-examples/06-hello-python/./hello.py', 8, false, nil).
cpr_file_open(o134, r0, p2, '/mnt/cpr/examples/01-xsb-examples/06-hello-python/./hello.py', 1, false, nil).
cpr_file_open(o135, r0, p2, '/mnt/cpr/examples/01-xsb-examples/06-hello-python/./hello.py', 8, false, nil).
cpr_file_open(o136, r0, p2, '/mnt/cpr/examples/01-xsb-examples/06-hello-python/hello.py', 24, false, nil).
cpr_file_open(o137, r0, p2, '/mnt/cpr/examples/01-xsb-examples/06-hello-python/./hello.py', 1, false, nil).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
cpr_run(r0, '06-hello-python').

%---------------------------------------------------------------------------------------------------
% FACT: cpr_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------
cpr_path_role(r0, '/lib', i1, os).
cpr_path_role(r0, '/etc', i2, os).
cpr_path_role(r0, '/usr/lib', i1, os).
cpr_path_role(r0, '.', i3, sw).
cpr_path_role(r0, '/usr/bin', i4, sw).
cpr_path_role(r0, '/usr/lib/python3.5', i0, sw).
cpr_path_role(r0, '/home/tmcphill/.venv', i0, sw).
cpr_path_role(r0, './inputs', i0, in).
cpr_path_role(r0, './outputs', i5, out).
cpr_path_role(r0, '/tmp', i6, nul).

%---------------------------------------------------------------------------------------------------
% FACT: cpr_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
cpr_accessed_path(e1, r0, './run.sh', i66, sw).
cpr_accessed_path(e2, r0, './hello.py', i65, sw).
cpr_accessed_path(e3, r0, '/usr/bin/python3', i13, sw).
cpr_accessed_path(o20, r0, '.', i3, sw).
cpr_accessed_path(o21, r0, '/usr/bin/env', i7, sw).
cpr_accessed_path(o22, r0, '/usr/bin/env', i7, sw).
cpr_accessed_path(o23, r0, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', i9, os).
cpr_accessed_path(o25, r0, '/etc/ld.so.cache', i11, os).
cpr_accessed_path(o26, r0, '/lib/x86_64-linux-gnu/libc.so.6', i12, os).
cpr_accessed_path(o27, r0, '/usr/bin/python3.8', i13, sw).
cpr_accessed_path(o28, r0, '/usr/lib/x86_64-linux-gnu/ld-2.31.so', i9, os).
cpr_accessed_path(o30, r0, '/etc/ld.so.cache', i11, os).
cpr_accessed_path(o31, r0, '/lib/x86_64-linux-gnu/libc.so.6', i12, os).
cpr_accessed_path(o32, r0, '/lib/x86_64-linux-gnu/libpthread.so.0', i14, os).
cpr_accessed_path(o33, r0, '/lib/x86_64-linux-gnu/libdl.so.2', i15, os).
cpr_accessed_path(o34, r0, '/lib/x86_64-linux-gnu/libutil.so.1', i16, os).
cpr_accessed_path(o35, r0, '/lib/x86_64-linux-gnu/libm.so.6', i17, os).
cpr_accessed_path(o38, r0, '/usr/lib/locale/C.UTF-8/LC_CTYPE', i18, os).
cpr_accessed_path(o39, r0, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', i21, os).
cpr_accessed_path(o40, r0, '/usr/bin/python3', i13, sw).
cpr_accessed_path(o41, r0, '/usr/bin/python3', i13, sw).
cpr_accessed_path(o42, r0, '/usr/lib/python3.8/os.py', i23, os).
cpr_accessed_path(o43, r0, '/usr/lib/python3.8/lib-dynload', i25, os).
cpr_accessed_path(o44, r0, '/etc/localtime', i26, os).
cpr_accessed_path(o45, r0, '/usr/lib', i1, os).
cpr_accessed_path(o46, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o47, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o48, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o49, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o50, r0, '/usr/lib/python3.8/encodings/__init__.py', i27, os).
cpr_accessed_path(o51, r0, '/usr/lib/python3.8/encodings/__init__.py', i27, os).
cpr_accessed_path(o52, r0, '/usr/lib/python3.8/encodings/__pycache__/__init__.cpython-38.pyc', i29, os).
cpr_accessed_path(o53, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o54, r0, '/usr/lib/python3.8/codecs.py', i31, os).
cpr_accessed_path(o55, r0, '/usr/lib/python3.8/codecs.py', i31, os).
cpr_accessed_path(o56, r0, '/usr/lib/python3.8/__pycache__/codecs.cpython-38.pyc', i32, os).
cpr_accessed_path(o57, r0, '/usr/lib/python3.8/encodings', i28, os).
cpr_accessed_path(o58, r0, '/usr/lib/python3.8/encodings', i28, os).
cpr_accessed_path(o59, r0, '/usr/lib/python3.8/encodings', i28, os).
cpr_accessed_path(o60, r0, '/usr/lib/python3.8/encodings', i28, os).
cpr_accessed_path(o61, r0, '/usr/lib/python3.8/encodings/aliases.py', i34, os).
cpr_accessed_path(o62, r0, '/usr/lib/python3.8/encodings/aliases.py', i34, os).
cpr_accessed_path(o63, r0, '/usr/lib/python3.8/encodings/__pycache__/aliases.cpython-38.pyc', i35, os).
cpr_accessed_path(o64, r0, '/usr/lib/python3.8/encodings', i28, os).
cpr_accessed_path(o65, r0, '/usr/lib/python3.8/encodings/utf_8.py', i36, os).
cpr_accessed_path(o66, r0, '/usr/lib/python3.8/encodings/utf_8.py', i36, os).
cpr_accessed_path(o67, r0, '/usr/lib/python3.8/encodings/__pycache__/utf_8.cpython-38.pyc', i37, os).
cpr_accessed_path(o68, r0, '/usr/lib/python3.8/encodings', i28, os).
cpr_accessed_path(o69, r0, '/usr/lib/python3.8/encodings/latin_1.py', i38, os).
cpr_accessed_path(o70, r0, '/usr/lib/python3.8/encodings/latin_1.py', i38, os).
cpr_accessed_path(o71, r0, '/usr/lib/python3.8/encodings/__pycache__/latin_1.cpython-38.pyc', i39, os).
cpr_accessed_path(o72, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o73, r0, '/usr/lib/python3.8/io.py', i40, os).
cpr_accessed_path(o74, r0, '/usr/lib/python3.8/io.py', i40, os).
cpr_accessed_path(o75, r0, '/usr/lib/python3.8/__pycache__/io.cpython-38.pyc', i41, os).
cpr_accessed_path(o76, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o77, r0, '/usr/lib/python3.8/abc.py', i42, os).
cpr_accessed_path(o78, r0, '/usr/lib/python3.8/abc.py', i42, os).
cpr_accessed_path(o79, r0, '/usr/lib/python3.8/__pycache__/abc.cpython-38.pyc', i43, os).
cpr_accessed_path(o80, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o81, r0, '/usr/lib/python3.8/site.py', i44, os).
cpr_accessed_path(o82, r0, '/usr/lib/python3.8/site.py', i44, os).
cpr_accessed_path(o83, r0, '/usr/lib/python3.8/__pycache__/site.cpython-38.pyc', i45, os).
cpr_accessed_path(o84, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o85, r0, '/usr/lib/python3.8/os.py', i23, os).
cpr_accessed_path(o86, r0, '/usr/lib/python3.8/os.py', i23, os).
cpr_accessed_path(o87, r0, '/usr/lib/python3.8/__pycache__/os.cpython-38.pyc', i46, os).
cpr_accessed_path(o88, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o89, r0, '/usr/lib/python3.8/stat.py', i47, os).
cpr_accessed_path(o90, r0, '/usr/lib/python3.8/stat.py', i47, os).
cpr_accessed_path(o91, r0, '/usr/lib/python3.8/__pycache__/stat.cpython-38.pyc', i48, os).
cpr_accessed_path(o92, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o93, r0, '/usr/lib/python3.8/_collections_abc.py', i49, os).
cpr_accessed_path(o94, r0, '/usr/lib/python3.8/_collections_abc.py', i49, os).
cpr_accessed_path(o95, r0, '/usr/lib/python3.8/__pycache__/_collections_abc.cpython-38.pyc', i50, os).
cpr_accessed_path(o96, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o97, r0, '/usr/lib/python3.8/posixpath.py', i51, os).
cpr_accessed_path(o98, r0, '/usr/lib/python3.8/posixpath.py', i51, os).
cpr_accessed_path(o99, r0, '/usr/lib/python3.8/__pycache__/posixpath.cpython-38.pyc', i52, os).
cpr_accessed_path(o100, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o101, r0, '/usr/lib/python3.8/genericpath.py', i53, os).
cpr_accessed_path(o102, r0, '/usr/lib/python3.8/genericpath.py', i53, os).
cpr_accessed_path(o103, r0, '/usr/lib/python3.8/__pycache__/genericpath.cpython-38.pyc', i54, os).
cpr_accessed_path(o104, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o105, r0, '/usr/lib/python3.8/_sitebuiltins.py', i55, os).
cpr_accessed_path(o106, r0, '/usr/lib/python3.8/_sitebuiltins.py', i55, os).
cpr_accessed_path(o107, r0, '/usr/lib/python3.8/__pycache__/_sitebuiltins.cpython-38.pyc', i56, os).
cpr_accessed_path(o108, r0, '/usr/local/lib/python3.8/dist-packages', i57, nil).
cpr_accessed_path(o109, r0, '/usr/local/lib/python3.8/dist-packages', i57, nil).
cpr_accessed_path(o110, r0, '/usr/lib/python3/dist-packages', i61, os).
cpr_accessed_path(o111, r0, '/usr/lib/python3/dist-packages', i61, os).
cpr_accessed_path(o112, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o113, r0, '/usr/lib/python3.8/sitecustomize.py', i63, os).
cpr_accessed_path(o114, r0, '/usr/lib/python3.8/sitecustomize.py', i63, os).
cpr_accessed_path(o115, r0, '/usr/lib/python3.8/__pycache__/sitecustomize.cpython-38.pyc', i64, os).
cpr_accessed_path(o116, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o117, r0, '/usr/lib/python3.8/lib-dynload', i25, os).
cpr_accessed_path(o118, r0, '/usr/lib/python3.8/lib-dynload', i25, os).
cpr_accessed_path(o119, r0, '/usr/lib/python3.8/lib-dynload', i25, os).
cpr_accessed_path(o120, r0, '/usr/lib/python3.8/lib-dynload', i25, os).
cpr_accessed_path(o121, r0, '/usr/local/lib/python3.8/dist-packages', i57, nil).
cpr_accessed_path(o122, r0, '/usr/local/lib/python3.8/dist-packages', i57, nil).
cpr_accessed_path(o123, r0, '/usr/local/lib/python3.8/dist-packages', i57, nil).
cpr_accessed_path(o124, r0, '/usr/local/lib/python3.8/dist-packages', i57, nil).
cpr_accessed_path(o125, r0, '/usr/lib/python3/dist-packages', i61, os).
cpr_accessed_path(o126, r0, '/usr/lib/python3/dist-packages', i61, os).
cpr_accessed_path(o127, r0, '/usr/lib/python3/dist-packages', i61, os).
cpr_accessed_path(o128, r0, '/usr/lib/python3/dist-packages', i61, os).
cpr_accessed_path(o129, r0, '/usr/lib/python3.8', i24, os).
cpr_accessed_path(o130, r0, '/usr/lib/python3.8/lib-dynload', i25, os).
cpr_accessed_path(o131, r0, '/usr/local/lib/python3.8/dist-packages', i57, nil).
cpr_accessed_path(o132, r0, '/usr/lib/python3/dist-packages', i61, os).
cpr_accessed_path(o133, r0, './hello.py', i65, sw).
cpr_accessed_path(o134, r0, './hello.py', i65, sw).
cpr_accessed_path(o135, r0, './hello.py', i65, sw).
cpr_accessed_path(o136, r0, './hello.py', i65, sw).
cpr_accessed_path(o137, r0, './hello.py', i65, sw).
