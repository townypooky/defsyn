/**
 * Test defined syntax
 *
 * @author Towny Pooky
 */


syntax(s,  [np, vp, np]).
syntax(s,  [np, vp]).
syntax(s,  [np]).
syntax(np, [n1, aux]).
syntax(vp, [v1, n1]).
syntax(vp, [v1]).
syntax(n1, [n, n1]).
syntax(n1, [n]).
syntax(v1, [v]).

term(aux, "da").
term(aux, "ga").
term(n, "watashi").
term(n, "anata").
term(n, "ore").
term(n, "atashi").
term(v, "asobu").
term(v, "kaku").
term(v, "tanoshimu").

s(S, A) :-
    list(S),
    syntax(s, Sy),
    solve(S, Sy, [], A).
s(S, A) :-
    list(A),
    write('Not implementated'),
    halt(4).
s(S, A) :-
    var(S),
    syntax(s, Sy),
    build(Sy, S).

solve(S, [P|Sy], S1a, A) :-
    syntax(P, Sy1),
    solve(S, Sy1, S1, A1),
    solve(S1, Sy, S1a, A2),
    append(A1, A2, A).
solve(S, [P|Sy], S1a, [[P, T1]|A]) :-
    term(P, T1),
    append(T1, S1, S),
    solve(S1, Sy, Sa1, A).

build([], []) :- !.
build([P|Sy], S) :-
    syntax(P,  Sy1),
    build(Sy1, S1),
    build(Sy,  S2),
    append(S1, S2, S).

