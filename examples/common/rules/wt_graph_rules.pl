:- import concat_atom/2 from string.

wt_node_style__run :-
    writeln('node[shape=box style="filled" fillcolor="#FFFFFF" peripheries=2 fontname=Courier]').

wt_node_style__process :-
    writeln('node[shape=box style="filled" fillcolor="#CCFFCC" peripheries=1 fontname=Courier]').

wt_node_style__data :-
    gv_nodestyle(box, 'rounded,filled', '#FFFFCC', 1, 'Helvetica').

wt_node_style__file :-
    gv_nodestyle(box, 'rounded,filled', '#FFFFCC', 1, 'Helvetica').

wt_input_node_name(InputName, NodeName) :-
    concat_atom(['input:', InputName], NodeName).

wt_output_node_name(OutputName, NodeName) :-
    concat_atom(['output:', OutputName], NodeName).

wt_executable_node_name(ExeName, NodeName) :-
    concat_atom(['exe:', ExeName], NodeName).

wt_file_node_name(AccessID, NodeName) :-
    concat_atom(['access:', AccessID], NodeName).

wt_node__run(RunName) :-
    gv_labeled_node(RunName).

wt_nodes__run_input_files() :-
    wt_file_read(_, _, _, _, FilePath, in),
    wt_input_node_name(FilePath, NodeName),
    gv_labeled_node(NodeName, FilePath),
    fail
    ;
    true.

wt_nodes__run_output_files() :-
    wt_file_write(_, _, _, _, FilePath, out),
    wt_output_node_name(FilePath, NodeName),
    gv_labeled_node(NodeName, FilePath),
    fail
    ;
    true.

wt_edges__input_files_to_run() :-
    wt_run(r0, RunName),
    wt_file_read(_, _, _, _, FilePath, in),
    wt_input_node_name(FilePath, NodeName),
    gv_unlabeled_edge(NodeName, RunName),
    fail
    ;
    true.

wt_edges__run_to_output_files() :-
    wt_run(r0, RunName),
    wt_file_write(_, _, _, _, FilePath, out),
    wt_output_node_name(FilePath, NodeName),
    gv_unlabeled_edge(RunName, NodeName),
    fail
    ;
    true.

wt_nodes__processes() :-
    wt_process(_, ExecutionID, Path),
    wt_executable_node_name(ExecutionID, ProcessNodeName),
    gv_labeled_node(ProcessNodeName, Path),
    fail
    ;
    true.

wt_nodes__data_files() :-
    wt_data_file(PathIndex, Path, _),
    wt_file_node_name(PathIndex, DataFileNodeName),
    gv_labeled_node(DataFileNodeName, Path),
    fail
    ;
    true.

wt_edges__processes_to_data_files() :-
    wt_process(ProcessID, ExecutionID, _),
    wt_file_write(_, _, ProcessID, PathIndex, _, _),
    wt_data_file(PathIndex, _, _),
    wt_executable_node_name(ExecutionID, ProcessNodeName),
    wt_file_node_name(PathIndex, DataFileNodeName),
    gv_unlabeled_edge(ProcessNodeName, DataFileNodeName),
    fail
    ;
    true.

wt_edges__data_files_to_processes() :-
    wt_process(ProcessID, ExecutionID, _),
    wt_file_read(_, _, ProcessID, PathIndex, _, _),
    wt_data_file(PathIndex, _, _),
    wt_executable_node_name(ExecutionID, ProcessNodeName),
    wt_file_node_name(PathIndex, DataFileNodeName),
    gv_unlabeled_edge(DataFileNodeName, ProcessNodeName),
    fail
    ;
    true.
