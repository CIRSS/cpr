:- import concat_atom/2 from string.

cpr_node_style__run :-
    writeln('node[shape=box style="filled" fillcolor="#FFFFFF" peripheries=2 fontname=Courier]').

cpr_node_style__process :-
    writeln('node[shape=box style="filled" fillcolor="#CCFFCC" peripheries=1 fontname=Courier]').

cpr_node_style__data :-
    gv_nodestyle(box, 'rounded,filled', '#FFFFCC', 1, 'Helvetica').

cpr_node_style__file :-
    gv_nodestyle(box, 'rounded,filled', '#FFFFCC', 1, 'Helvetica').

cpr_input_node_name(InputName, NodeName) :-
    concat_atom(['input:', InputName], NodeName).

cpr_output_node_name(OutputName, NodeName) :-
    concat_atom(['output:', OutputName], NodeName).

cpr_executable_node_name(ExeName, NodeName) :-
    concat_atom(['exe:', ExeName], NodeName).

cpr_file_node_name(AccessID, NodeName) :-
    concat_atom(['access:', AccessID], NodeName).

cpr_node__run(RunName) :-
    gv_labeled_node(RunName).

cpr_nodes__run_input_files() :-
    cpr_file_read(_, _, _, _, FilePath, in),
    cpr_input_node_name(FilePath, NodeName),
    gv_labeled_node(NodeName, FilePath),
    fail
    ;
    true.

cpr_nodes__run_output_files() :-
    cpr_file_write(_, _, _, _, FilePath, out),
    cpr_output_node_name(FilePath, NodeName),
    gv_labeled_node(NodeName, FilePath),
    fail
    ;
    true.

cpr_edges__input_files_to_run() :-
    cpr_run(r0, RunName),
    cpr_file_read(_, _, _, _, FilePath, in),
    cpr_input_node_name(FilePath, NodeName),
    gv_unlabeled_edge(NodeName, RunName),
    fail
    ;
    true.

cpr_edges__run_to_output_files() :-
    cpr_run(r0, RunName),
    cpr_file_write(_, _, _, _, FilePath, out),
    cpr_output_node_name(FilePath, NodeName),
    gv_unlabeled_edge(RunName, NodeName),
    fail
    ;
    true.

:- table cpr_process_uses_data/1.
cpr_process_uses_data(ProcessID) :-
    cpr_process(ProcessID, _, _, _),
    cpr_file_read(_, _, ProcessID, _, _, _).
cpr_process_uses_data(ProcessID) :-
    cpr_process(ProcessID, _, _, _),
    cpr_file_write(_, _, ProcessID, _, _, _).

cpr_nodes__processes() :-
    cpr_process(ProcessID, _, ExecutionID, Path),
    cpr_process_uses_data(ProcessID),
    cpr_executable_node_name(ExecutionID, ProcessNodeName),
    gv_labeled_node(ProcessNodeName, Path),
    fail
    ;
    true.

cpr_nodes__data_files() :-
    cpr_data_file(PathIndex, Path, _),
    cpr_file_node_name(PathIndex, DataFileNodeName),
    gv_labeled_node(DataFileNodeName, Path),
    fail
    ;
    true.

cpr_edges__processes_to_data_files() :-
    cpr_process(ProcessID, _, ExecutionID, _),
    cpr_file_write(_, _, ProcessID, PathIndex, _, _),
    cpr_data_file(PathIndex, _, _),
    cpr_executable_node_name(ExecutionID, ProcessNodeName),
    cpr_file_node_name(PathIndex, DataFileNodeName),
    gv_unlabeled_edge(ProcessNodeName, DataFileNodeName),
    fail
    ;
    true.

cpr_edges__data_files_to_processes() :-
    cpr_process(ProcessID, _, ExecutionID, _),
    cpr_file_read(_, _, ProcessID, PathIndex, _, _),
    cpr_data_file(PathIndex, _, _),
    cpr_executable_node_name(ExecutionID, ProcessNodeName),
    cpr_file_node_name(PathIndex, DataFileNodeName),
    gv_unlabeled_edge(DataFileNodeName, ProcessNodeName),
    fail
    ;
    true.
