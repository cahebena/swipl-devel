squeeze :-
    get(C),
    (
        C == 32 ; C == 44 -> squeeze ;
        dorest(C)
    ).

squeeze2 :-
    get0(C),
    dorest(C).

dorest(32) :- !,    % blank
    get(C),
    (
        C == 44 -> dorest(44) ;
        put(32),
        dorest(C)
    ).

dorest(44) :-   % comma
    get(C),
    (
        C == 32 ; C == 44 -> dorest(44) ;
        C == 46 -> dorest(46) ;
        write(', '),
        dorest(C)
    ).

dorest(46) :- !.    % period

dorest(Letter) :-
    put(Letter),
    squeeze2.
