
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
wt_accessed_path(e3, r0, '/home/wt/.venv/reprozip/bin/python', i9, nil).
wt_accessed_path(o22, r0, '.', i4, sw).
wt_accessed_path(o23, r0, '/usr/bin/env', i15, sw).
wt_accessed_path(o24, r0, '/usr/bin/env', i15, sw).
wt_accessed_path(o25, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i17, os).
wt_accessed_path(o26, r0, '/etc/ld.so.cache', i19, os).
wt_accessed_path(o27, r0, '/lib/x86_64-linux-gnu/libc.so.6', i20, os).
wt_accessed_path(o28, r0, '/usr/lib/locale/C.UTF-8/LC_CTYPE', i21, os).
wt_accessed_path(o29, r0, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', i24, os).
wt_accessed_path(o30, r0, '/usr/bin/python3.7', i9, sw).
wt_accessed_path(o31, r0, '/lib/x86_64-linux-gnu/ld-2.28.so', i17, os).
wt_accessed_path(o32, r0, '/etc/ld.so.cache', i19, os).
wt_accessed_path(o33, r0, '/lib/x86_64-linux-gnu/libcrypt.so.1', i27, os).
wt_accessed_path(o34, r0, '/lib/x86_64-linux-gnu/libpthread.so.0', i28, os).
wt_accessed_path(o35, r0, '/lib/x86_64-linux-gnu/libdl.so.2', i29, os).
wt_accessed_path(o36, r0, '/lib/x86_64-linux-gnu/libutil.so.1', i30, os).
wt_accessed_path(o37, r0, '/lib/x86_64-linux-gnu/libexpat.so.1', i31, os).
wt_accessed_path(o38, r0, '/lib/x86_64-linux-gnu/libz.so.1', i32, os).
wt_accessed_path(o39, r0, '/lib/x86_64-linux-gnu/libm.so.6', i33, os).
wt_accessed_path(o40, r0, '/lib/x86_64-linux-gnu/libc.so.6', i20, os).
wt_accessed_path(o41, r0, '/usr/lib/locale/C.UTF-8/LC_CTYPE', i21, os).
wt_accessed_path(o42, r0, '/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache', i24, os).
wt_accessed_path(o43, r0, '/home/wt/.venv/reprozip/bin/python', i9, nil).
wt_accessed_path(o44, r0, '/home/wt/.venv/reprozip/bin/python', i9, nil).
wt_accessed_path(o45, r0, '/home/wt/.venv/reprozip/bin/python3', i9, nil).
wt_accessed_path(o46, r0, '/usr/bin/python3', i9, sw).
wt_accessed_path(o47, r0, '/usr/lib/python3.7/os.py', i34, os).
wt_accessed_path(o48, r0, '/usr/lib/python3.7/lib-dynload', i36, os).
wt_accessed_path(o49, r0, '/usr/lib', i3, os).
wt_accessed_path(o50, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o51, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o52, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o53, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o54, r0, '/usr/lib/python3.7/encodings/__init__.py', i37, os).
wt_accessed_path(o55, r0, '/usr/lib/python3.7/encodings/__init__.py', i37, os).
wt_accessed_path(o56, r0, '/usr/lib/python3.7/encodings/__pycache__/__init__.cpython-37.pyc', i39, os).
wt_accessed_path(o57, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o58, r0, '/usr/lib/python3.7/codecs.py', i41, os).
wt_accessed_path(o59, r0, '/usr/lib/python3.7/codecs.py', i41, os).
wt_accessed_path(o60, r0, '/usr/lib/python3.7/__pycache__/codecs.cpython-37.pyc', i42, os).
wt_accessed_path(o61, r0, '/usr/lib/python3.7/encodings', i38, os).
wt_accessed_path(o62, r0, '/usr/lib/python3.7/encodings', i38, os).
wt_accessed_path(o63, r0, '/usr/lib/python3.7/encodings', i38, os).
wt_accessed_path(o64, r0, '/usr/lib/python3.7/encodings', i38, os).
wt_accessed_path(o65, r0, '/usr/lib/python3.7/encodings/aliases.py', i44, os).
wt_accessed_path(o66, r0, '/usr/lib/python3.7/encodings/aliases.py', i44, os).
wt_accessed_path(o67, r0, '/usr/lib/python3.7/encodings/__pycache__/aliases.cpython-37.pyc', i45, os).
wt_accessed_path(o68, r0, '/usr/lib/python3.7/encodings', i38, os).
wt_accessed_path(o69, r0, '/usr/lib/python3.7/encodings/utf_8.py', i46, os).
wt_accessed_path(o70, r0, '/usr/lib/python3.7/encodings/utf_8.py', i46, os).
wt_accessed_path(o71, r0, '/usr/lib/python3.7/encodings/__pycache__/utf_8.cpython-37.pyc', i47, os).
wt_accessed_path(o72, r0, '/usr/lib/python3.7/encodings', i38, os).
wt_accessed_path(o73, r0, '/usr/lib/python3.7/encodings/latin_1.py', i48, os).
wt_accessed_path(o74, r0, '/usr/lib/python3.7/encodings/latin_1.py', i48, os).
wt_accessed_path(o75, r0, '/usr/lib/python3.7/encodings/__pycache__/latin_1.cpython-37.pyc', i49, os).
wt_accessed_path(o76, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o77, r0, '/usr/lib/python3.7/io.py', i50, os).
wt_accessed_path(o78, r0, '/usr/lib/python3.7/io.py', i50, os).
wt_accessed_path(o79, r0, '/usr/lib/python3.7/__pycache__/io.cpython-37.pyc', i51, os).
wt_accessed_path(o80, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o81, r0, '/usr/lib/python3.7/abc.py', i52, os).
wt_accessed_path(o82, r0, '/usr/lib/python3.7/abc.py', i52, os).
wt_accessed_path(o83, r0, '/usr/lib/python3.7/__pycache__/abc.cpython-37.pyc', i53, os).
wt_accessed_path(o84, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o85, r0, '/usr/lib/python3.7/site.py', i54, os).
wt_accessed_path(o86, r0, '/usr/lib/python3.7/site.py', i54, os).
wt_accessed_path(o87, r0, '/usr/lib/python3.7/__pycache__/site.cpython-37.pyc', i55, os).
wt_accessed_path(o88, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o89, r0, '/usr/lib/python3.7/os.py', i34, os).
wt_accessed_path(o90, r0, '/usr/lib/python3.7/os.py', i34, os).
wt_accessed_path(o91, r0, '/usr/lib/python3.7/__pycache__/os.cpython-37.pyc', i56, os).
wt_accessed_path(o92, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o93, r0, '/usr/lib/python3.7/stat.py', i57, os).
wt_accessed_path(o94, r0, '/usr/lib/python3.7/stat.py', i57, os).
wt_accessed_path(o95, r0, '/usr/lib/python3.7/__pycache__/stat.cpython-37.pyc', i58, os).
wt_accessed_path(o96, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o97, r0, '/usr/lib/python3.7/posixpath.py', i59, os).
wt_accessed_path(o98, r0, '/usr/lib/python3.7/posixpath.py', i59, os).
wt_accessed_path(o99, r0, '/usr/lib/python3.7/__pycache__/posixpath.cpython-37.pyc', i60, os).
wt_accessed_path(o100, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o101, r0, '/usr/lib/python3.7/genericpath.py', i61, os).
wt_accessed_path(o102, r0, '/usr/lib/python3.7/genericpath.py', i61, os).
wt_accessed_path(o103, r0, '/usr/lib/python3.7/__pycache__/genericpath.cpython-37.pyc', i62, os).
wt_accessed_path(o104, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o105, r0, '/usr/lib/python3.7/_collections_abc.py', i63, os).
wt_accessed_path(o106, r0, '/usr/lib/python3.7/_collections_abc.py', i63, os).
wt_accessed_path(o107, r0, '/usr/lib/python3.7/__pycache__/_collections_abc.cpython-37.pyc', i64, os).
wt_accessed_path(o108, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o109, r0, '/usr/lib/python3.7/_sitebuiltins.py', i65, os).
wt_accessed_path(o110, r0, '/usr/lib/python3.7/_sitebuiltins.py', i65, os).
wt_accessed_path(o111, r0, '/usr/lib/python3.7/__pycache__/_sitebuiltins.cpython-37.pyc', i66, os).
wt_accessed_path(o112, r0, '/home/wt/.venv/reprozip/pyvenv.cfg', i67, nil).
wt_accessed_path(o113, r0, '/home/wt/.venv/reprozip/pyvenv.cfg', i67, nil).
wt_accessed_path(o114, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages', i68, nil).
wt_accessed_path(o115, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages', i68, nil).
wt_accessed_path(o116, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages/reprounzip-1.0.16-py3.6-nspkg.pth', i71, nil).
wt_accessed_path(o117, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o118, r0, '/usr/lib/python3.7/_bootlocale.py', i72, os).
wt_accessed_path(o119, r0, '/usr/lib/python3.7/_bootlocale.py', i72, os).
wt_accessed_path(o120, r0, '/usr/lib/python3.7/__pycache__/_bootlocale.cpython-37.pyc', i73, os).
wt_accessed_path(o121, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o122, r0, '/usr/lib/python3.7/types.py', i74, os).
wt_accessed_path(o123, r0, '/usr/lib/python3.7/types.py', i74, os).
wt_accessed_path(o124, r0, '/usr/lib/python3.7/__pycache__/types.cpython-37.pyc', i75, os).
wt_accessed_path(o125, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o126, r0, '/usr/lib/python3.7/importlib/__init__.py', i76, os).
wt_accessed_path(o127, r0, '/usr/lib/python3.7/importlib/__init__.py', i76, os).
wt_accessed_path(o128, r0, '/usr/lib/python3.7/importlib/__pycache__/__init__.cpython-37.pyc', i78, os).
wt_accessed_path(o129, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o130, r0, '/usr/lib/python3.7/warnings.py', i80, os).
wt_accessed_path(o131, r0, '/usr/lib/python3.7/warnings.py', i80, os).
wt_accessed_path(o132, r0, '/usr/lib/python3.7/__pycache__/warnings.cpython-37.pyc', i81, os).
wt_accessed_path(o133, r0, '/usr/lib/python3.7/importlib', i77, os).
wt_accessed_path(o134, r0, '/usr/lib/python3.7/importlib', i77, os).
wt_accessed_path(o135, r0, '/usr/lib/python3.7/importlib', i77, os).
wt_accessed_path(o136, r0, '/usr/lib/python3.7/importlib', i77, os).
wt_accessed_path(o137, r0, '/usr/lib/python3.7/importlib/util.py', i82, os).
wt_accessed_path(o138, r0, '/usr/lib/python3.7/importlib/util.py', i82, os).
wt_accessed_path(o139, r0, '/usr/lib/python3.7/importlib/__pycache__/util.cpython-37.pyc', i83, os).
wt_accessed_path(o140, r0, '/usr/lib/python3.7/importlib', i77, os).
wt_accessed_path(o141, r0, '/usr/lib/python3.7/importlib/abc.py', i84, os).
wt_accessed_path(o142, r0, '/usr/lib/python3.7/importlib/abc.py', i84, os).
wt_accessed_path(o143, r0, '/usr/lib/python3.7/importlib/__pycache__/abc.cpython-37.pyc', i85, os).
wt_accessed_path(o144, r0, '/usr/lib/python3.7/importlib', i77, os).
wt_accessed_path(o145, r0, '/usr/lib/python3.7/importlib/machinery.py', i86, os).
wt_accessed_path(o146, r0, '/usr/lib/python3.7/importlib/machinery.py', i86, os).
wt_accessed_path(o147, r0, '/usr/lib/python3.7/importlib/__pycache__/machinery.cpython-37.pyc', i87, os).
wt_accessed_path(o148, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o149, r0, '/usr/lib/python3.7/contextlib.py', i88, os).
wt_accessed_path(o150, r0, '/usr/lib/python3.7/contextlib.py', i88, os).
wt_accessed_path(o151, r0, '/usr/lib/python3.7/__pycache__/contextlib.cpython-37.pyc', i89, os).
wt_accessed_path(o152, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o153, r0, '/usr/lib/python3.7/collections/__init__.py', i90, os).
wt_accessed_path(o154, r0, '/usr/lib/python3.7/collections/__init__.py', i90, os).
wt_accessed_path(o155, r0, '/usr/lib/python3.7/collections/__pycache__/__init__.cpython-37.pyc', i92, os).
wt_accessed_path(o156, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o157, r0, '/usr/lib/python3.7/operator.py', i94, os).
wt_accessed_path(o158, r0, '/usr/lib/python3.7/operator.py', i94, os).
wt_accessed_path(o159, r0, '/usr/lib/python3.7/__pycache__/operator.cpython-37.pyc', i95, os).
wt_accessed_path(o160, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o161, r0, '/usr/lib/python3.7/keyword.py', i96, os).
wt_accessed_path(o162, r0, '/usr/lib/python3.7/keyword.py', i96, os).
wt_accessed_path(o163, r0, '/usr/lib/python3.7/__pycache__/keyword.cpython-37.pyc', i97, os).
wt_accessed_path(o164, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o165, r0, '/usr/lib/python3.7/heapq.py', i98, os).
wt_accessed_path(o166, r0, '/usr/lib/python3.7/heapq.py', i98, os).
wt_accessed_path(o167, r0, '/usr/lib/python3.7/__pycache__/heapq.cpython-37.pyc', i99, os).
wt_accessed_path(o168, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o169, r0, '/usr/lib/python3.7/reprlib.py', i100, os).
wt_accessed_path(o170, r0, '/usr/lib/python3.7/reprlib.py', i100, os).
wt_accessed_path(o171, r0, '/usr/lib/python3.7/__pycache__/reprlib.cpython-37.pyc', i101, os).
wt_accessed_path(o172, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o173, r0, '/usr/lib/python3.7/functools.py', i102, os).
wt_accessed_path(o174, r0, '/usr/lib/python3.7/functools.py', i102, os).
wt_accessed_path(o175, r0, '/usr/lib/python3.7/__pycache__/functools.cpython-37.pyc', i103, os).
wt_accessed_path(o176, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages', i68, nil).
wt_accessed_path(o177, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages', i68, nil).
wt_accessed_path(o178, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages', i68, nil).
wt_accessed_path(o179, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages', i68, nil).
wt_accessed_path(o180, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages/reprounzip', i104, nil).
wt_accessed_path(o181, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages', i68, nil).
wt_accessed_path(o182, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages/reprounzip', i104, nil).
wt_accessed_path(o183, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages/reprounzip', i104, nil).
wt_accessed_path(o184, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages/reprounzip', i104, nil).
wt_accessed_path(o185, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages/reprounzip', i104, nil).
wt_accessed_path(o186, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages/reprounzip', i104, nil).
wt_accessed_path(o187, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages/reprounzip/unpackers', i105, nil).
wt_accessed_path(o188, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages', i68, nil).
wt_accessed_path(o189, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages', i68, nil).
wt_accessed_path(o190, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages/reprounzip-1.0.16-py3.6-nspkg.pth', i71, nil).
wt_accessed_path(o191, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages', i68, nil).
wt_accessed_path(o192, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages/reprounzip', i104, nil).
wt_accessed_path(o193, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages', i68, nil).
wt_accessed_path(o194, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages/reprounzip', i104, nil).
wt_accessed_path(o195, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages/reprounzip', i104, nil).
wt_accessed_path(o196, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages/reprounzip/unpackers', i105, nil).
wt_accessed_path(o197, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o198, r0, '/usr/lib/python3.7/sitecustomize.py', i106, os).
wt_accessed_path(o199, r0, '/usr/lib/python3.7/sitecustomize.py', i106, os).
wt_accessed_path(o200, r0, '/usr/lib/python3.7/__pycache__/sitecustomize.cpython-37.pyc', i107, os).
wt_accessed_path(o201, r0, '/usr/lib/python3.7', i35, os).
wt_accessed_path(o202, r0, '/usr/lib/python3.7/lib-dynload', i36, os).
wt_accessed_path(o203, r0, '/usr/lib/python3.7/lib-dynload', i36, os).
wt_accessed_path(o204, r0, '/usr/lib/python3.7/lib-dynload', i36, os).
wt_accessed_path(o205, r0, '/usr/lib/python3.7/lib-dynload', i36, os).
wt_accessed_path(o206, r0, '/home/wt/.venv/reprozip/lib/python3.7/site-packages', i68, nil).
wt_accessed_path(o207, r0, './hello.py', i8, sw).
wt_accessed_path(o208, r0, './hello.py', i8, sw).
wt_accessed_path(o209, r0, './hello.py', i8, sw).
wt_accessed_path(o210, r0, './hello.py', i8, sw).
wt_accessed_path(o211, r0, './hello.py', i8, sw).
