compiler_options([xpp_on]).

llength([],0).
llength([_|T], N) :- llength(T, Nt), N is Nt + 1.

banner(Name, Description, Signature) :-
    writeln(''),
    writeln(''),
    writeln('---------------------------------------------------------------------------------------------------'),
    write(Name),
    write(' : '),
    writeln(Description),
    writeln(''),
    writeln(Signature),
    writeln('...................................................................................................').

rule_banner(Description) :-
    writeln(''),
    writeln(''),
    writeln('%---------------------------------------------------------------------------------------------------'),
    write('% FACT: '),
    writeln(Description),
    writeln('%...................................................................................................').

printall(Q) :-
    call(Q),
    writeq(Q),
    writeln('.'),
    fail
    ;
    true.

count(Goal, Count) :-
    findall(_, Goal, List),
    llength(List, Count).
