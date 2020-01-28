
%---------------------------------------------------------------------------------------------------
% FACT: rpz_process(ProcessID, ParentID, RunID, IsThread, ExitCode, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_process(p1, nil, r0, false, 0, nil).
rpz_process(p2, p1, r0, false, 0, nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_executed_file(ExecutionID, RunID, ProcessID, Program, Argv, WorkingDir, TimeStamp).
%---------------------------------------------------------------------------------------------------
rpz_executed_file(e1, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python/./run.sh", "./run.sh ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python", nil).
rpz_executed_file(e2, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python/./hello.py", "./hello.py ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python", nil).
rpz_executed_file(e3, r0, p2, "/home/tmcphill/.venv/reprozip/bin/python", "python ./hello.py ", "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python", nil).

%---------------------------------------------------------------------------------------------------
% FACT: rpz_opened_file(FileID, RunID, ProcessID, File, Mode, IsDirectory, Timestamp).
%---------------------------------------------------------------------------------------------------
rpz_opened_file(f1, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python", 4, true, nil).
rpz_opened_file(f2, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python", 4, true, nil).
rpz_opened_file(f3, r0, p1, "/bin/bash", 1, false, nil).
rpz_opened_file(f4, r0, p1, "/bin/bash", 1, false, nil).
rpz_opened_file(f5, r0, p1, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, nil).
rpz_opened_file(f6, r0, p1, "/etc/ld.so.cache", 1, false, nil).
rpz_opened_file(f7, r0, p1, "/lib/x86_64-linux-gnu/libtinfo.so.5", 1, false, nil).
rpz_opened_file(f8, r0, p1, "/lib/x86_64-linux-gnu/libdl.so.2", 1, false, nil).
rpz_opened_file(f9, r0, p1, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, nil).
rpz_opened_file(f10, r0, p1, "/dev/tty", 3, false, nil).
rpz_opened_file(f11, r0, p1, "/usr/lib/locale/locale-archive", 1, false, nil).
rpz_opened_file(f12, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples", 8, true, nil).
rpz_opened_file(f13, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python/.", 8, true, nil).
rpz_opened_file(f14, r0, p1, "/home/tmcphill/GitRepos/wt-prov-model/examples/03-hello-c", 8, true, nil).
rpz_opened_file(f15, r0, p1, "/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache", 1, false, nil).
rpz_opened_file(f16, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python/./run.sh", 1, false, nil).
rpz_opened_file(f17, r0, p1, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python/./run.sh", 8, false, nil).
rpz_opened_file(f18, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python", 4, true, nil).
rpz_opened_file(f19, r0, p2, "/usr/bin/env", 1, false, nil).
rpz_opened_file(f20, r0, p2, "/usr/bin/env", 1, false, nil).
rpz_opened_file(f21, r0, p2, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, nil).
rpz_opened_file(f22, r0, p2, "/etc/ld.so.cache", 1, false, nil).
rpz_opened_file(f23, r0, p2, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, nil).
rpz_opened_file(f24, r0, p2, "/usr/lib/locale/locale-archive", 1, false, nil).
rpz_opened_file(f25, r0, p2, "/usr/bin/python3.5", 1, false, nil).
rpz_opened_file(f26, r0, p2, "/lib/x86_64-linux-gnu/ld-2.24.so", 1, false, nil).
rpz_opened_file(f27, r0, p2, "/etc/ld.so.cache", 1, false, nil).
rpz_opened_file(f28, r0, p2, "/lib/x86_64-linux-gnu/libpthread.so.0", 1, false, nil).
rpz_opened_file(f29, r0, p2, "/lib/x86_64-linux-gnu/libdl.so.2", 1, false, nil).
rpz_opened_file(f30, r0, p2, "/lib/x86_64-linux-gnu/libutil.so.1", 1, false, nil).
rpz_opened_file(f31, r0, p2, "/lib/x86_64-linux-gnu/libexpat.so.1", 1, false, nil).
rpz_opened_file(f32, r0, p2, "/lib/x86_64-linux-gnu/libz.so.1", 1, false, nil).
rpz_opened_file(f33, r0, p2, "/lib/x86_64-linux-gnu/libm.so.6", 1, false, nil).
rpz_opened_file(f34, r0, p2, "/lib/x86_64-linux-gnu/libc.so.6", 1, false, nil).
rpz_opened_file(f35, r0, p2, "/usr/lib/locale/locale-archive", 1, false, nil).
rpz_opened_file(f36, r0, p2, "/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache", 1, false, nil).
rpz_opened_file(f37, r0, p2, "/home/tmcphill/.venv/reprozip/bin/python", 8, false, nil).
rpz_opened_file(f38, r0, p2, "/home/tmcphill/.venv/reprozip/bin/python", 24, false, nil).
rpz_opened_file(f39, r0, p2, "/home/tmcphill/.venv/reprozip/bin/python3", 24, false, nil).
rpz_opened_file(f40, r0, p2, "/usr/bin/python3", 24, false, nil).
rpz_opened_file(f41, r0, p2, "/usr/lib/python3.5/os.py", 8, false, nil).
rpz_opened_file(f42, r0, p2, "/usr/lib/python3.5/lib-dynload", 8, true, nil).
rpz_opened_file(f43, r0, p2, "/usr/lib", 8, true, nil).
rpz_opened_file(f44, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f45, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f46, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f47, r0, p2, "/usr/lib/python3.5", 1, true, nil).
rpz_opened_file(f48, r0, p2, "/usr/lib/python3.5/encodings/__init__.py", 8, false, nil).
rpz_opened_file(f49, r0, p2, "/usr/lib/python3.5/encodings/__init__.py", 8, false, nil).
rpz_opened_file(f50, r0, p2, "/usr/lib/python3.5/encodings/__pycache__/__init__.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f51, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f52, r0, p2, "/usr/lib/python3.5/codecs.py", 8, false, nil).
rpz_opened_file(f53, r0, p2, "/usr/lib/python3.5/codecs.py", 8, false, nil).
rpz_opened_file(f54, r0, p2, "/usr/lib/python3.5/__pycache__/codecs.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f55, r0, p2, "/usr/lib/python3.5/encodings", 8, true, nil).
rpz_opened_file(f56, r0, p2, "/usr/lib/python3.5/encodings", 8, true, nil).
rpz_opened_file(f57, r0, p2, "/usr/lib/python3.5/encodings", 8, true, nil).
rpz_opened_file(f58, r0, p2, "/usr/lib/python3.5/encodings", 1, true, nil).
rpz_opened_file(f59, r0, p2, "/usr/lib/python3.5/encodings/aliases.py", 8, false, nil).
rpz_opened_file(f60, r0, p2, "/usr/lib/python3.5/encodings/aliases.py", 8, false, nil).
rpz_opened_file(f61, r0, p2, "/usr/lib/python3.5/encodings/__pycache__/aliases.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f62, r0, p2, "/usr/lib/python3.5/encodings", 8, true, nil).
rpz_opened_file(f63, r0, p2, "/usr/lib/python3.5/encodings/utf_8.py", 8, false, nil).
rpz_opened_file(f64, r0, p2, "/usr/lib/python3.5/encodings/utf_8.py", 8, false, nil).
rpz_opened_file(f65, r0, p2, "/usr/lib/python3.5/encodings/__pycache__/utf_8.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f66, r0, p2, "/usr/lib/python3.5/encodings", 8, true, nil).
rpz_opened_file(f67, r0, p2, "/usr/lib/python3.5/encodings/latin_1.py", 8, false, nil).
rpz_opened_file(f68, r0, p2, "/usr/lib/python3.5/encodings/latin_1.py", 8, false, nil).
rpz_opened_file(f69, r0, p2, "/usr/lib/python3.5/encodings/__pycache__/latin_1.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f70, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f71, r0, p2, "/usr/lib/python3.5/io.py", 8, false, nil).
rpz_opened_file(f72, r0, p2, "/usr/lib/python3.5/io.py", 8, false, nil).
rpz_opened_file(f73, r0, p2, "/usr/lib/python3.5/__pycache__/io.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f74, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f75, r0, p2, "/usr/lib/python3.5/abc.py", 8, false, nil).
rpz_opened_file(f76, r0, p2, "/usr/lib/python3.5/abc.py", 8, false, nil).
rpz_opened_file(f77, r0, p2, "/usr/lib/python3.5/__pycache__/abc.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f78, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f79, r0, p2, "/usr/lib/python3.5/_weakrefset.py", 8, false, nil).
rpz_opened_file(f80, r0, p2, "/usr/lib/python3.5/_weakrefset.py", 8, false, nil).
rpz_opened_file(f81, r0, p2, "/usr/lib/python3.5/__pycache__/_weakrefset.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f82, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f83, r0, p2, "/usr/lib/python3.5/site.py", 8, false, nil).
rpz_opened_file(f84, r0, p2, "/usr/lib/python3.5/site.py", 8, false, nil).
rpz_opened_file(f85, r0, p2, "/usr/lib/python3.5/__pycache__/site.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f86, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f87, r0, p2, "/usr/lib/python3.5/os.py", 8, false, nil).
rpz_opened_file(f88, r0, p2, "/usr/lib/python3.5/os.py", 8, false, nil).
rpz_opened_file(f89, r0, p2, "/usr/lib/python3.5/__pycache__/os.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f90, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f91, r0, p2, "/usr/lib/python3.5/stat.py", 8, false, nil).
rpz_opened_file(f92, r0, p2, "/usr/lib/python3.5/stat.py", 8, false, nil).
rpz_opened_file(f93, r0, p2, "/usr/lib/python3.5/__pycache__/stat.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f94, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f95, r0, p2, "/usr/lib/python3.5/posixpath.py", 8, false, nil).
rpz_opened_file(f96, r0, p2, "/usr/lib/python3.5/posixpath.py", 8, false, nil).
rpz_opened_file(f97, r0, p2, "/usr/lib/python3.5/__pycache__/posixpath.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f98, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f99, r0, p2, "/usr/lib/python3.5/genericpath.py", 8, false, nil).
rpz_opened_file(f100, r0, p2, "/usr/lib/python3.5/genericpath.py", 8, false, nil).
rpz_opened_file(f101, r0, p2, "/usr/lib/python3.5/__pycache__/genericpath.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f102, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f103, r0, p2, "/usr/lib/python3.5/_collections_abc.py", 8, false, nil).
rpz_opened_file(f104, r0, p2, "/usr/lib/python3.5/_collections_abc.py", 8, false, nil).
rpz_opened_file(f105, r0, p2, "/usr/lib/python3.5/__pycache__/_collections_abc.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f106, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f107, r0, p2, "/usr/lib/python3.5/_sitebuiltins.py", 8, false, nil).
rpz_opened_file(f108, r0, p2, "/usr/lib/python3.5/_sitebuiltins.py", 8, false, nil).
rpz_opened_file(f109, r0, p2, "/usr/lib/python3.5/__pycache__/_sitebuiltins.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f110, r0, p2, "/home/tmcphill/.venv/reprozip/pyvenv.cfg", 8, false, nil).
rpz_opened_file(f111, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f112, r0, p2, "/usr/lib/python3.5/re.py", 8, false, nil).
rpz_opened_file(f113, r0, p2, "/usr/lib/python3.5/re.py", 8, false, nil).
rpz_opened_file(f114, r0, p2, "/usr/lib/python3.5/__pycache__/re.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f115, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f116, r0, p2, "/usr/lib/python3.5/sre_compile.py", 8, false, nil).
rpz_opened_file(f117, r0, p2, "/usr/lib/python3.5/sre_compile.py", 8, false, nil).
rpz_opened_file(f118, r0, p2, "/usr/lib/python3.5/__pycache__/sre_compile.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f119, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f120, r0, p2, "/usr/lib/python3.5/sre_parse.py", 8, false, nil).
rpz_opened_file(f121, r0, p2, "/usr/lib/python3.5/sre_parse.py", 8, false, nil).
rpz_opened_file(f122, r0, p2, "/usr/lib/python3.5/__pycache__/sre_parse.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f123, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f124, r0, p2, "/usr/lib/python3.5/sre_constants.py", 8, false, nil).
rpz_opened_file(f125, r0, p2, "/usr/lib/python3.5/sre_constants.py", 8, false, nil).
rpz_opened_file(f126, r0, p2, "/usr/lib/python3.5/__pycache__/sre_constants.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f127, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f128, r0, p2, "/usr/lib/python3.5/copyreg.py", 8, false, nil).
rpz_opened_file(f129, r0, p2, "/usr/lib/python3.5/copyreg.py", 8, false, nil).
rpz_opened_file(f130, r0, p2, "/usr/lib/python3.5/__pycache__/copyreg.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f131, r0, p2, "/home/tmcphill/.venv/reprozip/pyvenv.cfg", 1, false, nil).
rpz_opened_file(f132, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages", 8, true, nil).
rpz_opened_file(f133, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages", 1, true, nil).
rpz_opened_file(f134, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages/reprounzip-1.0.16-py3.6-nspkg.pth", 1, false, nil).
rpz_opened_file(f135, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f136, r0, p2, "/usr/lib/python3.5/_bootlocale.py", 8, false, nil).
rpz_opened_file(f137, r0, p2, "/usr/lib/python3.5/_bootlocale.py", 8, false, nil).
rpz_opened_file(f138, r0, p2, "/usr/lib/python3.5/__pycache__/_bootlocale.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f139, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f140, r0, p2, "/usr/lib/python3.5/types.py", 8, false, nil).
rpz_opened_file(f141, r0, p2, "/usr/lib/python3.5/types.py", 8, false, nil).
rpz_opened_file(f142, r0, p2, "/usr/lib/python3.5/__pycache__/types.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f143, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f144, r0, p2, "/usr/lib/python3.5/functools.py", 8, false, nil).
rpz_opened_file(f145, r0, p2, "/usr/lib/python3.5/functools.py", 8, false, nil).
rpz_opened_file(f146, r0, p2, "/usr/lib/python3.5/__pycache__/functools.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f147, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f148, r0, p2, "/usr/lib/python3.5/collections/__init__.py", 8, false, nil).
rpz_opened_file(f149, r0, p2, "/usr/lib/python3.5/collections/__init__.py", 8, false, nil).
rpz_opened_file(f150, r0, p2, "/usr/lib/python3.5/collections/__pycache__/__init__.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f151, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f152, r0, p2, "/usr/lib/python3.5/operator.py", 8, false, nil).
rpz_opened_file(f153, r0, p2, "/usr/lib/python3.5/operator.py", 8, false, nil).
rpz_opened_file(f154, r0, p2, "/usr/lib/python3.5/__pycache__/operator.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f155, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f156, r0, p2, "/usr/lib/python3.5/keyword.py", 8, false, nil).
rpz_opened_file(f157, r0, p2, "/usr/lib/python3.5/keyword.py", 8, false, nil).
rpz_opened_file(f158, r0, p2, "/usr/lib/python3.5/__pycache__/keyword.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f159, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f160, r0, p2, "/usr/lib/python3.5/heapq.py", 8, false, nil).
rpz_opened_file(f161, r0, p2, "/usr/lib/python3.5/heapq.py", 8, false, nil).
rpz_opened_file(f162, r0, p2, "/usr/lib/python3.5/__pycache__/heapq.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f163, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f164, r0, p2, "/usr/lib/python3.5/reprlib.py", 8, false, nil).
rpz_opened_file(f165, r0, p2, "/usr/lib/python3.5/reprlib.py", 8, false, nil).
rpz_opened_file(f166, r0, p2, "/usr/lib/python3.5/__pycache__/reprlib.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f167, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f168, r0, p2, "/usr/lib/python3.5/weakref.py", 8, false, nil).
rpz_opened_file(f169, r0, p2, "/usr/lib/python3.5/weakref.py", 8, false, nil).
rpz_opened_file(f170, r0, p2, "/usr/lib/python3.5/__pycache__/weakref.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f171, r0, p2, "/usr/lib/python3.5/collections", 8, true, nil).
rpz_opened_file(f172, r0, p2, "/usr/lib/python3.5/collections", 8, true, nil).
rpz_opened_file(f173, r0, p2, "/usr/lib/python3.5/collections", 8, true, nil).
rpz_opened_file(f174, r0, p2, "/usr/lib/python3.5/collections", 1, true, nil).
rpz_opened_file(f175, r0, p2, "/usr/lib/python3.5/collections/abc.py", 8, false, nil).
rpz_opened_file(f176, r0, p2, "/usr/lib/python3.5/collections/abc.py", 8, false, nil).
rpz_opened_file(f177, r0, p2, "/usr/lib/python3.5/collections/__pycache__/abc.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f178, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f179, r0, p2, "/usr/lib/python3.5/importlib/__init__.py", 8, false, nil).
rpz_opened_file(f180, r0, p2, "/usr/lib/python3.5/importlib/__init__.py", 8, false, nil).
rpz_opened_file(f181, r0, p2, "/usr/lib/python3.5/importlib/__pycache__/__init__.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f182, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f183, r0, p2, "/usr/lib/python3.5/warnings.py", 8, false, nil).
rpz_opened_file(f184, r0, p2, "/usr/lib/python3.5/warnings.py", 8, false, nil).
rpz_opened_file(f185, r0, p2, "/usr/lib/python3.5/__pycache__/warnings.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f186, r0, p2, "/usr/lib/python3.5/importlib", 8, true, nil).
rpz_opened_file(f187, r0, p2, "/usr/lib/python3.5/importlib", 8, true, nil).
rpz_opened_file(f188, r0, p2, "/usr/lib/python3.5/importlib", 8, true, nil).
rpz_opened_file(f189, r0, p2, "/usr/lib/python3.5/importlib", 1, true, nil).
rpz_opened_file(f190, r0, p2, "/usr/lib/python3.5/importlib/util.py", 8, false, nil).
rpz_opened_file(f191, r0, p2, "/usr/lib/python3.5/importlib/util.py", 8, false, nil).
rpz_opened_file(f192, r0, p2, "/usr/lib/python3.5/importlib/__pycache__/util.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f193, r0, p2, "/usr/lib/python3.5/importlib", 8, true, nil).
rpz_opened_file(f194, r0, p2, "/usr/lib/python3.5/importlib/abc.py", 8, false, nil).
rpz_opened_file(f195, r0, p2, "/usr/lib/python3.5/importlib/abc.py", 8, false, nil).
rpz_opened_file(f196, r0, p2, "/usr/lib/python3.5/importlib/__pycache__/abc.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f197, r0, p2, "/usr/lib/python3.5/importlib", 8, true, nil).
rpz_opened_file(f198, r0, p2, "/usr/lib/python3.5/importlib/machinery.py", 8, false, nil).
rpz_opened_file(f199, r0, p2, "/usr/lib/python3.5/importlib/machinery.py", 8, false, nil).
rpz_opened_file(f200, r0, p2, "/usr/lib/python3.5/importlib/__pycache__/machinery.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f201, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f202, r0, p2, "/usr/lib/python3.5/contextlib.py", 8, false, nil).
rpz_opened_file(f203, r0, p2, "/usr/lib/python3.5/contextlib.py", 8, false, nil).
rpz_opened_file(f204, r0, p2, "/usr/lib/python3.5/__pycache__/contextlib.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f205, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages", 8, true, nil).
rpz_opened_file(f206, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages", 8, true, nil).
rpz_opened_file(f207, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages", 8, true, nil).
rpz_opened_file(f208, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages", 1, true, nil).
rpz_opened_file(f209, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages/reprounzip", 8, true, nil).
rpz_opened_file(f210, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages", 8, true, nil).
rpz_opened_file(f211, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages/reprounzip", 8, true, nil).
rpz_opened_file(f212, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages/reprounzip", 8, true, nil).
rpz_opened_file(f213, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages/reprounzip", 8, true, nil).
rpz_opened_file(f214, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages/reprounzip", 8, true, nil).
rpz_opened_file(f215, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages/reprounzip", 1, true, nil).
rpz_opened_file(f216, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages/reprounzip/unpackers", 8, true, nil).
rpz_opened_file(f217, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f218, r0, p2, "/usr/lib/python3.5/sysconfig.py", 8, false, nil).
rpz_opened_file(f219, r0, p2, "/usr/lib/python3.5/sysconfig.py", 8, false, nil).
rpz_opened_file(f220, r0, p2, "/usr/lib/python3.5/__pycache__/sysconfig.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f221, r0, p2, "/home", 24, true, nil).
rpz_opened_file(f222, r0, p2, "/home/tmcphill", 24, true, nil).
rpz_opened_file(f223, r0, p2, "/home/tmcphill/.venv", 24, true, nil).
rpz_opened_file(f224, r0, p2, "/home/tmcphill/.venv/reprozip", 24, true, nil).
rpz_opened_file(f225, r0, p2, "/home/tmcphill/.venv/reprozip/bin", 24, true, nil).
rpz_opened_file(f226, r0, p2, "/home/tmcphill/.venv/reprozip/bin/python", 24, false, nil).
rpz_opened_file(f227, r0, p2, "/home/tmcphill/.venv/reprozip/bin/python", 24, false, nil).
rpz_opened_file(f228, r0, p2, "/home/tmcphill/.venv/reprozip/bin/python3", 24, false, nil).
rpz_opened_file(f229, r0, p2, "/home/tmcphill/.venv/reprozip/bin/python3", 24, false, nil).
rpz_opened_file(f230, r0, p2, "/usr", 24, true, nil).
rpz_opened_file(f231, r0, p2, "/usr/bin", 24, true, nil).
rpz_opened_file(f232, r0, p2, "/usr/bin/python3", 24, false, nil).
rpz_opened_file(f233, r0, p2, "/usr/bin/python3", 24, false, nil).
rpz_opened_file(f234, r0, p2, "/usr/bin/python3.5", 24, false, nil).
rpz_opened_file(f235, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f236, r0, p2, "/usr/lib/python3.5/_sysconfigdata.py", 8, false, nil).
rpz_opened_file(f237, r0, p2, "/usr/lib/python3.5/_sysconfigdata.py", 8, false, nil).
rpz_opened_file(f238, r0, p2, "/usr/lib/python3.5/__pycache__/_sysconfigdata.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f239, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f240, r0, p2, "/usr/lib/python3.5/plat-x86_64-linux-gnu", 8, true, nil).
rpz_opened_file(f241, r0, p2, "/usr/lib/python3.5/plat-x86_64-linux-gnu", 8, true, nil).
rpz_opened_file(f242, r0, p2, "/usr/lib/python3.5/plat-x86_64-linux-gnu", 8, true, nil).
rpz_opened_file(f243, r0, p2, "/usr/lib/python3.5/plat-x86_64-linux-gnu", 1, true, nil).
rpz_opened_file(f244, r0, p2, "/usr/lib/python3.5/plat-x86_64-linux-gnu/_sysconfigdata_m.py", 8, false, nil).
rpz_opened_file(f245, r0, p2, "/usr/lib/python3.5/plat-x86_64-linux-gnu/_sysconfigdata_m.py", 8, false, nil).
rpz_opened_file(f246, r0, p2, "/usr/lib/python3.5/plat-x86_64-linux-gnu/__pycache__/_sysconfigdata_m.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f247, r0, p2, "/usr", 24, true, nil).
rpz_opened_file(f248, r0, p2, "/usr/lib", 24, true, nil).
rpz_opened_file(f249, r0, p2, "/usr/lib/python3.5", 24, true, nil).
rpz_opened_file(f250, r0, p2, "/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu", 24, true, nil).
rpz_opened_file(f251, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages", 8, true, nil).
rpz_opened_file(f252, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages", 1, true, nil).
rpz_opened_file(f253, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages/reprounzip-1.0.16-py3.6-nspkg.pth", 1, false, nil).
rpz_opened_file(f254, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages", 8, true, nil).
rpz_opened_file(f255, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages/reprounzip", 8, true, nil).
rpz_opened_file(f256, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages", 8, true, nil).
rpz_opened_file(f257, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages/reprounzip", 8, true, nil).
rpz_opened_file(f258, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages/reprounzip", 8, true, nil).
rpz_opened_file(f259, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages/reprounzip/unpackers", 8, true, nil).
rpz_opened_file(f260, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f261, r0, p2, "/usr/lib/python3.5/sitecustomize.py", 8, false, nil).
rpz_opened_file(f262, r0, p2, "/usr/lib/python3.5/sitecustomize.py", 8, false, nil).
rpz_opened_file(f263, r0, p2, "/usr/lib/python3.5/__pycache__/sitecustomize.cpython-35.pyc", 1, false, nil).
rpz_opened_file(f264, r0, p2, "/usr/lib/python3.5", 8, true, nil).
rpz_opened_file(f265, r0, p2, "/usr/lib/python3.5/plat-x86_64-linux-gnu", 8, true, nil).
rpz_opened_file(f266, r0, p2, "/usr/lib/python3.5/lib-dynload", 8, true, nil).
rpz_opened_file(f267, r0, p2, "/usr/lib/python3.5/lib-dynload", 8, true, nil).
rpz_opened_file(f268, r0, p2, "/usr/lib/python3.5/lib-dynload", 8, true, nil).
rpz_opened_file(f269, r0, p2, "/usr/lib/python3.5/lib-dynload", 1, true, nil).
rpz_opened_file(f270, r0, p2, "/home/tmcphill/.venv/reprozip/lib/python3.5/site-packages", 8, true, nil).
rpz_opened_file(f271, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python/hello.py", 24, false, nil).
rpz_opened_file(f272, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python/./hello.py", 8, false, nil).
rpz_opened_file(f273, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python/./hello.py", 1, false, nil).
rpz_opened_file(f274, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python/./hello.py", 8, false, nil).
rpz_opened_file(f275, r0, p2, "/mnt/c/Users/tmcphill/OneDrive/GitRepos/wt-prov-model/examples/06-hello-python/./hello.py", 1, false, nil).
