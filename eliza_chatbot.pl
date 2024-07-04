% Preliminary phase of bot testing
% Within these 4 tests we have included case histories that will help us in using the bot
% The first two are simple >toLowerCase and >toUpperCase conversions.
% [delteChars] is a test for removing punctuation from the input (this is to avoid problems when we go to split the sentence into arrays).
% [readWord] test for the bot's CORE function, it will split the input into vector array for keyword matching.

test:-
	out("[toLowerCase] "),
	toLowerCase("A","a"),toLowerCase("5","5"),
	toLowerCase("b","b"),toLowerCase(" "," "),
	toLowerCase(",",",").
test:-
	out("[toUpperCase] "),
	toUpperCase("A","A"),toUpperCase("5","5"),
	toUpperCase("b","B"),toUpperCase(" "," "),
	toUpperCase(",",",").
test:-
	out("[deleteChars] "),
	string_chars("Hi, How are you Prof.?",In),
	string_chars("Hi how are you Prof?",Out),
	deleteChars(In, punctuation, Out).
test:-
	out("[readWord] "),
	string_chars("Hi how are you Prof?",In),
	Out=['Hi','how','are','you','Prof'],
	toWords(In,Out).

% End of testing process
    % Process for making the bot remebering the name
    :- dynamic user_name/1.
:- dynamic resID/2.
resID(_,0).

% Start of the eliza bot process
% Start with an out(+Text) > Used to print the initial message
out(Text):- write(Text).

% in(+Text) > Used to read questions from the input stream
% Inside we also find how the user name is displayed
in(Text):-
    user_name(Name),
    format("\033[1m~w> \033[0m", [Name]), % Nome utente in grassetto
    readLine(Text).
%
% Same case history but covering the case where there is no registered name
%
in(Text):-
    \+user_name(_),
    write("\033[1m> \033[0m"), % Prompt in grassetto
    readLine(Text).
%
%
%
% Used to Read a line of text from user input character by character.
% We need this function to allow matching between keywords
readLine(Text):-
    get_char(Char),
    toLowerCase(Char, LChar),
    readLine2(LChar, Text).
readLine2('\n', []):- !.
readLine2(LChar, [LChar|T]):-
    readLine(T).
%
%
% constant predicates
charType('!', punctuation).
charType('?', punctuation).
charType('.', punctuation).
charType(',', punctuation).
charType('\'', punctuation).
charType(' ', whitespace).
charType('\t', whitespace).
%
%
% Now begin a manipulation of the input sentence by going to apply the functions tested at the beginning
% The order remains that of testing
% toLowerCase(+Char, -LChar) tested function:- lower case char (using ASCII codes)
toLowerCase(Char, LChar):-
    char_code(Char, Code),
    Code >= "A",
    Code =< "Z",
    NewCode is Code + 32,
    char_code(LChar, NewCode), !.
toLowerCase(Char, Char).
%
% toUpperCase(+Char, -UChar) tested function:- upper case char (using ASCII codes)
toUpperCase(Char, UChar):-
    char_code(Char, Code),
    Code >= "a",
    Code =< "z",
    NewCode is Code - 32,
    char_code(UChar, NewCode), !.
toUpperCase(Char, Char).
%
% deleteChars(+Line, -Type, -Res):- delete specific charType from line
deleteChars([Char|Rest], Type, Out):-
    charType(Char, Type),
    deleteChars(Rest, Type, Out),!.
deleteChars([Char|Rest], Type, [Char|Out]):-
    deleteChars(Rest, Type, Out),!.
deleteChars([], _, []).
%
% Finally we go on to apply the function that allows us to split the sentence into arrays of words
% As mentioned before we will need it for keyword matching
% toWords(+Line, -Words):- transfer output of readLine to list of words
toWords([], []):- !.
toWords(Line, [Word|ResWords]):-
    readWord(Line, Word, ResLine),
    toWords(ResLine, ResWords).
%
% It reads the keyword matched in Word and the rest of the sentence is put into ResLine
% readWord(+Line, -Word, -ResLine) :- reads one word from line
% (the rest of line is returned in ResLine
readWord([], '', []).
readWord([Char|Res], '', Res):- charType(Char, whitespace),!.
readWord([Char|ResLine], Word, Res):- 
    readWord(ResLine, ResWord, Res),
    atom_concat(Char, ResWord, Word).
%
%
%
%
% CORE FUNCTION DEL BOT
% From here on we find the main body of eliza operation.
init:-
    % path to thr other part of the bot
    consult("/Users/rondocata/Desktop/logic for AI/semplification_rules.pl"),
    consult("/Users/rondocata/Desktop/logic for AI/reply_rules.pl").

% A function that applies the solutions seen above, it is used to, as the name suggests, simplify input.
% Takes stream string as input, removes punctuation, splits words, and looks for synonyms.
simplify(In, Out):-
    deleteChars(In, punctuation, Out1),
    toWords(Out1, Out2),
    findSynonyms(Out2, Out3),
    Out = Out3.
%
% Synonym search function
% For each word in the list, the function searches for a synonym. If a synonym is found, the word is replaced with the synonym. 
% This process is repeated until synonyms are found for all the words in the list. (iteratively).
%
findSynonyms(Words, Syn) :-
    sr(Words, Syn, RestWords, ResOutput),!,
    findSynonyms(RestWords, ResOutput).
findSynonyms([Word| ResWords], [Word| ResSyn]):-
    findSynonyms(ResWords, ResSyn),!.
findSynonyms([], []).
%
%
% Una volta che si è trovata la lista di keyword da usare per il matching, si passa alla findReply.
% Questa fun esamina le keywords e cerca una corrispondenza con le regole definite in reply_rules.pl.
% RICORSIONE PER CERCARE LA RISPOSTA MIGLIORE
findReply(Words, Reply) :-
    findReply2(Words, -2, 0, [], ID, Reply),
    ID \= 0,
    updateResID(ID).
% WORKING PRINCIPLE:
% FindReply2 takes as input a list of Words Words, a current ActScore, a current ActID, a current ActRes response
% Returns the final ID ID and the final answer Res.
% Start by examining each word in the Words list and looking for rules that match those words using the rules(_, Score, [H|T], _) function,
% Where H is the current word and T is the rest of the words.
% If matching rules are found, the rule with the highest score is selected using max_list(Rules, NewScore).
%
findReply2([H|T], ActScore, _, _, ID, Res):-
    findall(Score, rules(_, Score, [H|T], _), Rules),
    Rules \= [], 
    max_list(Rules, NewScore),
    ActScore < NewScore,
    rules(NewID, NewScore, [H|T], Replyes),
    resID(NewID, ResID),
    nth0(ResID, Replyes, NewReply),
    findReply2(T, NewScore, NewID, NewReply, ID, Res),!.
findReply2([_|T], ActScore, ActID, ActRes, ID, Res):-
    findReply2(T, ActScore, ActID, ActRes, ID, Res).
findReply2([], _, ID, Res, ID, Res).
%
%
% The updateResID function is called when a response has been used, 
% Then it is necessary to update the ID to indicate which response from the list associated with the rule is to be used next.
% It will be taken from reply_rules.pl
updateResID(ID):-
    resID(ID, RID),
    once(rules(ID, _, _, Replyes)),
    length(Replyes, Len),
    NRID is (RID + 1) mod Len,
    retract((resID(ID, RID):-!)),
    asserta(resID(ID, NRID):-!),!.
updateResID(ID):-
    resID(ID, RID),
    once(rules(ID, _, _, Replyes)),
    length(Replyes, Len),
    NRID is (RID + 1) mod Len,
    asserta(resID(ID, NRID):-!).
%
%
% Finally we have the final function that will be used to print the result obtained from the previous search.
writeWords([Word|Res]):-
    string_chars(Word, [Char|RChar]),
    toUpperCase(Char, UChar),
    readWord([UChar|RChar], Out, _),
    out("\033[1;31m\033[1mPsy. Elisa>\033[0m "),
    out(Out),
    writeWords2(Res).

writeWords2([Word|Res]):-
    is_list(Word),
    writeWords2(Word),
    writeWords2(Res),!.
writeWords2([Word|Res]):-
    charType(Word, punctuation),
    out(Word),
    writeWords2(Res),!.
writeWords2([Word|Res]):-
    out(" "),
    out(Word),
    writeWords2(Res),!.
writeWords2([]).
%
%
%
% Bot starting point
% As soon as it starts it will print out and the fun will be called back to ask the user for the name.
clearScreen :-
    % Pulizia del terminale basata sul sistema operativo
    (   current_prolog_flag(windows, true) ->
        shell('cls')
    ;   shell('clear')
    ).

elisa:-
    clearScreen,
    out("Looking for Elisa....\n"),
    init,
    out("Here she is...\n"),
    printAsciiArt,
    askForName,
    elisa([]).

askForName:-
    out("Hello, I'm Elisa. What's your name? "),
    read_line_to_string(user_input, Name),
    asserta(user_name(Name)),
    format("\nNice to meet you, ~w!\n\n", [Name]).

elisa([quit|_]):-
    resetUserName,
    !.

elisa(_):-
    in(Line),
    write("\n"),
    simplify(Line, Words),
    findReply(Words, Reply),
    writeWords(Reply),nl,
    write("\n"),
    elisa(Words).

resetUserName :-
    retractall(user_name(_)).

    printAsciiArt :-
    nl,
    out('------------------------------------------------------\n'), nl,
    out('   _ \\                      ____|  | _)              '), nl,
    out('  |   |  __|  |   |         __|    |  |   __|   _` | '), nl,
    out('  ___/ \\__ \\  |   |         |      |  | \\__ \\  (   | '), nl,
    out(' _|    ____/ \\__, | _)     _____| _| _| ____/ \\__,_| '), nl,
    out('             ____/                                     \n\n'), nl.