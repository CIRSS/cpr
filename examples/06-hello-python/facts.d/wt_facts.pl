
%---------------------------------------------------------------------------------------------------
% FACT: wt_run(RunID, RunName).
%---------------------------------------------------------------------------------------------------
wt_run(r0, '06-hello-python').

%---------------------------------------------------------------------------------------------------
% FACT: wt_path_role(RunID, Path, PathIndex, Role).
%---------------------------------------------------------------------------------------------------
wt_path_role(r0, '/lib', i1, os).
wt_path_role(r0, '/etc', i2, os).
wt_path_role(r0, '/usr/lib', i3, os).
wt_path_role(r0, '.', i4, sw).
wt_path_role(r0, '/usr/bin', i5, sw).
wt_path_role(r0, '/usr/lib/python3.5', i0, sw).
wt_path_role(r0, '/home/tmcphill/.venv', i0, sw).
wt_path_role(r0, './inputs', i0, in).
wt_path_role(r0, './outputs', i6, out).

%---------------------------------------------------------------------------------------------------
% FACT: wt_accessed_path(AccessID, RunId, Path, PathIndex, PathRole).
%---------------------------------------------------------------------------------------------------
wt_accessed_path(e1, r0, './run.sh', i7, sw).
wt_accessed_path(e2, r0, './hello.py', i8, sw).
wt_accessed_path(e3, r0, '/usr/bin/python3', i9, sw).
wt_accessed_path(o20, r0, '.', i4, sw).
wt_accessed_path(o21, r0, '/usr/bin/env', i11, sw).
wt_accessed_path(o22, r0, '/usr/bin/env', i11, sw).
wt_accessed_path(o23, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i12, os).
wt_accessed_path(o24, r0, '/tmp/_MEIYegI7n', i0, nil).
wt_accessed_path(o25, r0, '/etc/ld.so.cache', i15, os).
wt_accessed_path(o26, r0, '/lib/x86_64-linux-gnu/libc.so.6', i16, os).
wt_accessed_path(o27, r0, '/usr/bin/python3.7', i9, sw).
wt_accessed_path(o28, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i12, os).
wt_accessed_path(o29, r0, '/tmp/_MEIYegI7n', i0, nil).
wt_accessed_path(o30, r0, '/etc/ld.so.cache', i15, os).
wt_accessed_path(o31, r0, '/lib/x86_64-linux-gnu/libcrypt.so.1', i17, os).
wt_accessed_path(o32, r0, '/lib/x86_64-linux-gnu/libpthread.so.0', i18, os).
wt_accessed_path(o33, r0, '/lib/x86_64-linux-gnu/libdl.so.2', i19, os).
wt_accessed_path(o34, r0, '/lib/x86_64-linux-gnu/libutil.so.1', i20, os).
wt_accessed_path(o35, r0, '/tmp/_MEIYegI7n/libexpat.so.1', i0, nil).
wt_accessed_path(o36, r0, '/tmp/_MEIYegI7n/libz.so.1', i0, nil).
wt_accessed_path(o37, r0, '/lib/x86_64-linux-gnu/libm.so.6', i21, os).
wt_accessed_path(o38, r0, '/lib/x86_64-linux-gnu/libc.so.6', i16, os).
wt_accessed_path(o39, r0, '/usr/bin/python3', i9, sw).
wt_accessed_path(o40, r0, '/usr/bin/python3', i9, sw).
wt_accessed_path(o41, r0, '/usr/lib/python3.7/os.py', i22, os).
wt_accessed_path(o42, r0, '/usr/lib/python3.7/lib-dynload', i24, os).
wt_accessed_path(o43, r0, '/usr/lib/locale/C.UTF-8/LC_CTYPE', i25, os).
wt_accessed_path(o44, r0, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', i28, os).
wt_accessed_path(o45, r0, '/usr/lib', i3, os).
wt_accessed_path(o46, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o47, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o48, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o49, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o50, r0, '/usr/lib/python3.7/encodings/__init__.py', i31, os).
wt_accessed_path(o51, r0, '/usr/lib/python3.7/encodings/__init__.py', i31, os).
wt_accessed_path(o52, r0, '/usr/lib/python3.7/encodings/__pycache__/__init__.cpython-37.pyc', i33, os).
wt_accessed_path(o53, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o54, r0, '/usr/lib/python3.7/codecs.py', i35, os).
wt_accessed_path(o55, r0, '/usr/lib/python3.7/codecs.py', i35, os).
wt_accessed_path(o56, r0, '/usr/lib/python3.7/__pycache__/codecs.cpython-37.pyc', i36, os).
wt_accessed_path(o57, r0, '/usr/lib/python3.7/encodings', i32, os).
wt_accessed_path(o58, r0, '/usr/lib/python3.7/encodings', i32, os).
wt_accessed_path(o59, r0, '/usr/lib/python3.7/encodings', i32, os).
wt_accessed_path(o60, r0, '/usr/lib/python3.7/encodings', i32, os).
wt_accessed_path(o61, r0, '/usr/lib/python3.7/encodings/aliases.py', i38, os).
wt_accessed_path(o62, r0, '/usr/lib/python3.7/encodings/aliases.py', i38, os).
wt_accessed_path(o63, r0, '/usr/lib/python3.7/encodings/__pycache__/aliases.cpython-37.pyc', i39, os).
wt_accessed_path(o64, r0, '/usr/lib/python3.7/encodings', i32, os).
wt_accessed_path(o65, r0, '/usr/lib/python3.7/encodings/utf_8.py', i40, os).
wt_accessed_path(o66, r0, '/usr/lib/python3.7/encodings/utf_8.py', i40, os).
wt_accessed_path(o67, r0, '/usr/lib/python3.7/encodings/__pycache__/utf_8.cpython-37.pyc', i41, os).
wt_accessed_path(o68, r0, '/usr/lib/python3.7/encodings', i32, os).
wt_accessed_path(o69, r0, '/usr/lib/python3.7/encodings/latin_1.py', i42, os).
wt_accessed_path(o70, r0, '/usr/lib/python3.7/encodings/latin_1.py', i42, os).
wt_accessed_path(o71, r0, '/usr/lib/python3.7/encodings/__pycache__/latin_1.cpython-37.pyc', i43, os).
wt_accessed_path(o72, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o73, r0, '/usr/lib/python3.7/io.py', i44, os).
wt_accessed_path(o74, r0, '/usr/lib/python3.7/io.py', i44, os).
wt_accessed_path(o75, r0, '/usr/lib/python3.7/__pycache__/io.cpython-37.pyc', i45, os).
wt_accessed_path(o76, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o77, r0, '/usr/lib/python3.7/abc.py', i46, os).
wt_accessed_path(o78, r0, '/usr/lib/python3.7/abc.py', i46, os).
wt_accessed_path(o79, r0, '/usr/lib/python3.7/__pycache__/abc.cpython-37.pyc', i47, os).
wt_accessed_path(o80, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o81, r0, '/usr/lib/python3.7/site.py', i48, os).
wt_accessed_path(o82, r0, '/usr/lib/python3.7/site.py', i48, os).
wt_accessed_path(o83, r0, '/usr/lib/python3.7/__pycache__/site.cpython-37.pyc', i49, os).
wt_accessed_path(o84, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o85, r0, '/usr/lib/python3.7/os.py', i22, os).
wt_accessed_path(o86, r0, '/usr/lib/python3.7/os.py', i22, os).
wt_accessed_path(o87, r0, '/usr/lib/python3.7/__pycache__/os.cpython-37.pyc', i50, os).
wt_accessed_path(o88, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o89, r0, '/usr/lib/python3.7/stat.py', i51, os).
wt_accessed_path(o90, r0, '/usr/lib/python3.7/stat.py', i51, os).
wt_accessed_path(o91, r0, '/usr/lib/python3.7/__pycache__/stat.cpython-37.pyc', i52, os).
wt_accessed_path(o92, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o93, r0, '/usr/lib/python3.7/posixpath.py', i53, os).
wt_accessed_path(o94, r0, '/usr/lib/python3.7/posixpath.py', i53, os).
wt_accessed_path(o95, r0, '/usr/lib/python3.7/__pycache__/posixpath.cpython-37.pyc', i54, os).
wt_accessed_path(o96, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o97, r0, '/usr/lib/python3.7/genericpath.py', i55, os).
wt_accessed_path(o98, r0, '/usr/lib/python3.7/genericpath.py', i55, os).
wt_accessed_path(o99, r0, '/usr/lib/python3.7/__pycache__/genericpath.cpython-37.pyc', i56, os).
wt_accessed_path(o100, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o101, r0, '/usr/lib/python3.7/_collections_abc.py', i57, os).
wt_accessed_path(o102, r0, '/usr/lib/python3.7/_collections_abc.py', i57, os).
wt_accessed_path(o103, r0, '/usr/lib/python3.7/__pycache__/_collections_abc.cpython-37.pyc', i58, os).
wt_accessed_path(o104, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o105, r0, '/usr/lib/python3.7/_sitebuiltins.py', i59, os).
wt_accessed_path(o106, r0, '/usr/lib/python3.7/_sitebuiltins.py', i59, os).
wt_accessed_path(o107, r0, '/usr/lib/python3.7/__pycache__/_sitebuiltins.cpython-37.pyc', i60, os).
wt_accessed_path(o108, r0, '/usr/local/lib/python3.7/dist-packages', i61, nil).
wt_accessed_path(o109, r0, '/usr/local/lib/python3.7/dist-packages', i61, nil).
wt_accessed_path(o110, r0, '/usr/lib/python3/dist-packages', i65, os).
wt_accessed_path(o111, r0, '/usr/lib/python3/dist-packages', i65, os).
wt_accessed_path(o112, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o113, r0, '/usr/lib/python3.7/sitecustomize.py', i67, os).
wt_accessed_path(o114, r0, '/usr/lib/python3.7/sitecustomize.py', i67, os).
wt_accessed_path(o115, r0, '/usr/lib/python3.7/__pycache__/sitecustomize.cpython-37.pyc', i68, os).
wt_accessed_path(o116, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o117, r0, '/usr/lib/python3.7/lib-dynload', i24, os).
wt_accessed_path(o118, r0, '/usr/lib/python3.7/lib-dynload', i24, os).
wt_accessed_path(o119, r0, '/usr/lib/python3.7/lib-dynload', i24, os).
wt_accessed_path(o120, r0, '/usr/lib/python3.7/lib-dynload', i24, os).
wt_accessed_path(o121, r0, '/usr/local/lib/python3.7/dist-packages', i61, nil).
wt_accessed_path(o122, r0, '/usr/local/lib/python3.7/dist-packages', i61, nil).
wt_accessed_path(o123, r0, '/usr/local/lib/python3.7/dist-packages', i61, nil).
wt_accessed_path(o124, r0, '/usr/local/lib/python3.7/dist-packages', i61, nil).
wt_accessed_path(o125, r0, '/usr/lib/python3/dist-packages', i65, os).
wt_accessed_path(o126, r0, '/usr/lib/python3/dist-packages', i65, os).
wt_accessed_path(o127, r0, '/usr/lib/python3/dist-packages', i65, os).
wt_accessed_path(o128, r0, '/usr/lib/python3/dist-packages', i65, os).
wt_accessed_path(o129, r0, '/usr/lib/python3.7', i23, os).
wt_accessed_path(o130, r0, '/usr/lib/python3.7/lib-dynload', i24, os).
wt_accessed_path(o131, r0, '/usr/local/lib/python3.7/dist-packages', i61, nil).
wt_accessed_path(o132, r0, '/usr/lib/python3/dist-packages', i65, os).
wt_accessed_path(o133, r0, './hello.py', i8, sw).
wt_accessed_path(o134, r0, './hello.py', i8, sw).
wt_accessed_path(o135, r0, './hello.py', i8, sw).
wt_accessed_path(o136, r0, './hello.py', i8, sw).
wt_accessed_path(o137, r0, './hello.py', i8, sw).
