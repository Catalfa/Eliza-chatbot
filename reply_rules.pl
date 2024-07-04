% Eliza - Reply Rules
   
% The format of the rules is:
% rules(ID ,importance of rule , [the pattern], [
%             [response 1],
%             [response 2],
%             ...
%             [response n]]).
% Content of rules is based on Viren Patel's ELIZA in Prolog 

:- dynamic user_name/1.

rules(1, 0, [sorry|_], [
    ["Please", "do", "not", "apologize,", Name , "."],
    ["Apologies", "are", "not", "necessary,", Name, "."],
    ["What", "feelings", "do", "you", "have", "when", "you", "apologize,", Name, "?"],
    ["I", "have", "told", "you", "that", "apologies", "are", "not", "required,", Name, "."]
]) :- user_name(Name).

rules(2, 5, [you, remember|Y], [
    ["Do", "you", "often", "think", "of", Y, "?"],
    ["Does", "thinking", "of", Y, "bring", "anything", "else", "to", "mind", "?"],
    ["What", "else", "do", "you", "remember", "?"],
    ["Why", "do", "you", "remember", Y, "just", "now", "?"],
    ["What", "in", "the", "present", "situation", "reminds", "you", "of", Y, "?"],
    ["What", "is", "the", "connection", "between", "me", "and", Y, "?"]
]).

rules(3, 5, [do, i , remember|Y], [
    ["Did", "you", "think", "I", "would", "forget", Y, "?"],
    ["Why", "do", "you", "think", "I", "should", "recall", Y, "now", "?"],
    ["What", "about", Y, "?"],
    ["You", "mentioned", Y, "."]
]).

rules(4, 3, [if|Y], [
    ["Do", "you", "think", "it", "is", "likely", "that", Y, "?"],
    ["Do", "you", "wish", "that", Y, "?"],
    [ Name, "what", "do", "you", "think", "about", Y, "?"],
    ["Really", ",", "if", Y, "?"]
]) :- user_name(Name).

rules(5, 4, [you,dreamt|Y], [
    ["Really", ",", Y, "?"],
    ["Have", "you", "ever", "fantasied", Y, "while", "you", "were", "awake", "?"],
    ["Have", "you", "dreamt", Y, "before", "?"]
]).

rules(6, 3, [dream|_], [
    [ Name,"what", "does", "that", "dream", "suggest", "to", "you", "?"],
    ["Do", "you", "dream", "often", "?"],
    ["What", "persons", "appear", "in", "your", "dreams", "?"],
    ["Do", "you", "believe", "that", "dreaming", "has", "something", "to", "do", "with", "your", "problem", "?"]
]):- user_name(Name).

rules(7, -1, [_], [
    ["Please", "tell", "me", "more", "..."],
    ["'I'", "am", "not", "sure", "'I'", "understand", "you", "fully", "."],
    ["Please", "go", "on", "."],
    [ Name, "what", "does", "that", "suggest", "to", "you", "?"],
    ["Do", "you", "feel", "strongly", "about", "discussing", "such", "things", "?"]
]):- user_name(Name).

rules(8, 0, [perhaps|_], [
    ["You", "do", "not", "seem", "quite", "certain", "."],
    ["Why", "the", "uncertain", "tone", "?"],
    ["Can", "you", "not", "be", "more", "positive", "?"],
    ["You", "are", "not", "sure", "?"],
    ["Do", "you", "not", "know", "?"]
]).

rules(9, 15, [name|_], [
    [ Name, "I", "am", "not", "interested", "in", "names", "."],
    ["'I'", "have", "told", "you", "before", ",", "'I'", "do", "not", "care", "about", "names", "."],
    ["Please", Name, "continue", "."]
]) :- user_name(Name).

rules(10, 75, [xfremd|_], [
    [ Name,"I", "am", "sorry", ",", "'I'", "only", "speak", "English", "."]
]) :- user_name(Name).

rules(11, 0, [hello|_], [
['Hello, ', Name,'. How are you today?']
]):-user_name(Name).


rules(12, 50, [computer|_], [
    [ Name,"do", "computers", "worry", "you", "?"],
    ["Why", "do", "you", "mention", "computers", "?"],
    ["What", "do", "you", "think", "machines", "have", "to", "do", "with", "your", "problem", "?"],
    [ Name,"do", "you", "not", "think", "computers", "can", "help", "people", "?"],
    ["What", "about", "machines", "worries", "you", "?"],
    ["What", "do", "you", "think", "about", "machines", "?"]
]) :- user_name(Name).

rules(13, 0, [are,you|Y], [
    ["Do", "you", "believe", "you", "are", Y, "?"],
    [ Name,"Would", "you", "want", "to", "be", Y, "?"],
    ["You", "wish", "'I'", "would", "tell", "you", "you", "are", Y, "?"],
    [ Name, "What", "would", "it", "mean", "if", "you", "were", Y, "?"]
]):-user_name(Name).

rules(14, 0, [are,i|Y], [
    ["Why", "are", "you", "interested", "in", "whether", "'I'", "am", Y, "or", "not", "?"],
    [ Name,"would", "you", "prefer", "if", "'I'", "were", "not", Y, "?"],
    ["Perhaps", "'I'", "am", Y, "in", "your", "fantasies", "."],
    [ Name,"do", "you", "sometimes", "think", "'I'", "am", Y, "?"]
]) :- user_name(Name).

rules(15, 0, [are|Y], [
    ["Did", "you", "think", "they", "might", "not", "be", Y, "?"],
    ["Would", "you", "like", "it", "if", "they", "were", "not", Y, "?"],
    ["What", "if", "they", "were", "not", Y, "?"],
    ["Possibly", "they", "are", Y, "."]
]).

rules(16, 0, [are|_], [
    ["Why", "do", "you", "say", "am", "?"],
    ["'I'", "do", "not", "understand", "that", "."]
]).

rules(17, 0, [my|Y], [
    ["Why", "are", "you", "concerned", "over", "my", Y, "?"],
    [ Name,"what", "about", "your", "own", Y, "?"],
    ["Are", "you", "worried", "about", "someone", "else's", Y, "?"],
    ["Really", ",", "my", Y, "?"]
]) :- user_name(Name).

rules(18, 2, [was,you|Y], [
    ["What", "if", "you", "were", Y, "?"],
    ["Do", "you", "think", "you", "were", Y, "?"],
    ["Were", "you", Y, "?"],
    ["What", "would", "it", "mean", "if", "you", "were", Y, "?"],
    ["What", "does", Y, "suggest", "to", "you", "?"]
]).

rules(19, 2, [you,was|Y], [
    [ Name,"were", "you", "really", Y, "?"],
    [ Name,"why", "do", "you", "tell", "me", "you", "were", Y, "just", "now", "?"],
    ["Perhaps", "'I'", "already", "knew", "you", "were", Y, "."]
]) :- user_name(Name).

rules(20, 2, [was,i|Y], [
    ["Would", "you", "like", "to", "believe", "'I'", "was", Y, "?"],
    ["What", "suggests", "that", "'I'", "was", Y, "?"],
    ["What", "do", "you", "think", "?"],
    ["Perhaps", "'I'", "was", Y, "."],
    [ Name,"what", "if", "'I'", "had", "been", Y, "?"]
]) :- user_name(Name).

rules(21, 1, [you,cant|Y], [
    ["How", "do", "you", "know", "you", "cannot", Y, "?"],
    ["Have", "you", "tried", "?"],
    ["Perhaps", "you", "could", Y, "now", "?"],
    ["Do", "you", "really", "want", "to", "be", "able", "to", Y, "?"]
]).

rules(22, 1, [you,dont|Y], [
    ["Do", "you", "not", "really", Y, "?"],
    ["Why", "do", "you", "not", Y, "?"],
    ["Do", "you", "wish", "to", "be", "able", "to", Y, "?"],
    ["Does", "that", "trouble", "you", "?"]
]).

rules(23, 1, [you,feel|Y], [
    [ Name,"tell", "me", "more", "about", "such", "feelings", "."],
    ["Do", "you", "often", "feel", Y, "?"],
    ["Do", "you", "enjoy", "feeling", Y, "?"],
    ["Of", "what", "does", "feeling", Y, "remind", "you", "?"]
]) :- user_name(Name).

rules(24, 1, [you,Y,i,_|_], [
    ["Perhaps", ",", "in", "your", "fantasy", ",", "we", Y, "each", "other", "?"],
    ["Do", "you", "wish", "to", Y, "me", "?"],
    ["You", "seem", "to", "need", "to", Y, "me", "."],
    ["Do", "you", Y, "anyone", "else", "?"]
]).

rules(25, 1, [you,M|Y], [
    ["What", "would", "it", "mean", "to", "you", "if", "you", "got", Y, "?"],
    ["Why", "do", "you", "want", Y, "?"],
    ["Suppose", "you", "got", Y, "soon", "?"],
    ["What", "if", "you", "never", "got", Y, "?"],
    ["What", "would", "getting", Y, "mean", "to", "you", "?"],
    ["What", "does", "wanting", Y, "have", "to", "do", "with", "this", "discussion", "?"]
]):-member(M,[want,need]).

rules(26, 1, [you,M,you,Y|_], [
    ["Do", "you", "really", "think", "so", "?"],
    ["But", "you", "are", "not", "sure", "you", Y, "?"],
    ["Do", "you", "really", "doubt", "you", Y, "?"]
]):-member(M,[feel,think,believe,wish]).

rules(27, 1, [youre|Res], [
    ["'I'", "am", "sorry", "to", "hear", "you", "are", M, "."],
    ["Do", "you", "think", "coming", "here", "will", "help", "you", "not", "to", "be", M, "?"],
    ["'I'", "am", "sure", "it", "is", "not", "pleasant", "to", "be", M, "."],
    ["Can", "you", "explain", "what", "made", "you", M, "?"]
]):-member(M,Res),member(M,[sad,unhappy,depressed,sick]).

rules(28, 1, [youre|Res], [
    ["How", "have", "'I'", "helped", "you", "to", "be", M, "?"],
    ["Has", "your", "treatment", "made", "you", M, "?"],
    ["What", "makes", "you", M, "just", "now", "?"],
    ["Can", "you", "explain", "why", "you", "are", "suddenly", M, "?"]
]):- member(M,Res), member(M,[happy,elated,glad,better]).

rules(29, 1, [youre|Y], [
    [ Name,"is", "it", "because", "you", "are", Y, "that", "you", "came", "to", "me", "?"],
    [ Name,"how", "long", "have", "you", "been", Y, "?"],
    ["Do", "you", "believe", "it", "normal", "to", "be", Y, "?"],
    ["Do", "you", "enjoy", "being", Y, "?"]
]) :- user_name(Name).

rules(30, 0, [im|Y], [
    [ Name,"what", "makes", "you", "think", "'I'", "am", Y, "?"],
    ["Does", "it", "please", "you", "to", "believe", "'I'", "am", Y, "?"],
    ["Do", "you", "sometimes", "wish", "you", "were", Y, "?"],
    ["Perhaps", "you", "would", "like", "to", "be", Y, "?"]
]) :- user_name(Name).

rules(31, 0, [i,Y,you|_], [
    ["Why", "do", "you", "think", "'I'", Y, "you", "?"],
    ["You", "like", "to", "think", "'I'", Y, "you", ",", "do", "you", "not", "?"],
    ["What", "makes", "you", "think", "'I'", Y, "you", "?"],
    ["Really", ",", "'I'", Y, "you", "."],
    ["Do", "you", "wish", "to", "believe", "'I'", Y, "you", "?"],
    ["Suppose", "'I'", "did", Y, "you", ",", "what", "would", "that", "mean", "to", "you", "?"],
    ["Does", "someone", "else", "believe", "'I'", Y, "you", "?"]
]).

rules(32, 0, [i|Y], [
    [ Name,"we", "were", "discussing", "you", ",", "not", "me", "."],
    ["Oh", Name, ",", "I", Y, "."],
    ["You", "are", "not", "really", "talking", "about", "me", ",", "are", "you", "?"],
    ["What", "are", "your", "feelings", "now", "?"]
]) :- user_name(Name).

rules(33, 0, [yes|_], [
    [ Name,"you", "seem", "quite", "positive", "."],
    ["You", "are", "sure", "?"],
    [ Name,"I", "see", "."],
    ["I", "understand", "."]
]) :- user_name(Name).

rules(34, 0, [no|_], [
    [ Name,"are", "you", "saying", "no", "just", "to", "be", "negative", "?"],
    ["you", "are", "being", "a", "bit", "negative", "."],
    ["Why", "not", "?"],
    [ Name,"why", "no", "?"]
]) :- user_name(Name).

rules(35, 2, [your,M,Z|_], [
    ["Tell", "me", "more", "about", "your", "family", "."],
    ["Who", "else", "in", "your", "family", Z, "?"],
    ["Your", M, "?"],
    ["What", "else", "comes", "to", "mind", "when", "you", "think", "of", "your", M, "?"]
]):-
    member(M,[mother,father,brother,sister,children,wife]).

rules(36, 2, [your|Y], [
    ["Your", Y, "?"],
    [ Name,"why", "do", "you", "say", "your", Y, "?"],
    ["Does", "that", "suggest", "anything", "else", "which", "belongs", "to", "you", "?"],
    ["Is", "it", "important", "to", "you", "that", "your", Y, "?"]
]) :- user_name(Name).

rules(37, 0, [can,i|Y], [
    ["You", "believe", "'I'", "can", Y, ",", "do", "you", "not", "?"],
    [ Name,"you", "want", "me", "to", "be", "able", "to", Y, "?"],
    ["Perhaps", "you", "would", "like", "to", "be", "able", "to", Y, "yourself", "?"]
]) :- user_name(Name).

rules(38, 0, [can,you|Y], [
    [ Name,"whether", "or", "not", "you", "can", Y, "depends", "on", "you", "more", "than", "on", "me", "."],
    ["Do", "you", "want", "to", "be", "able", "to", Y, "?"],
    ["Perhaps", "you", "do", "not", "want", "to", Y, "."]
]) :- user_name(Name).

rules(39, 0, [what|_], [
    [ Name,"why", "do", "you", "ask", "?"],
    ["Does", "that", "question", "interest", "you", "?"],
    ["What", "is", "it", "you", "really", "want", "to", "know", "?"],
    ["Are", "such", "questions", "much", "on", "your", "mind", "?"],
    ["What", "answer", "would", "please", "you", "most", "?"],
    ["What", "do", "you", "think", "?"],
    ["What", "comes", "to", "your", "mind", "when", "you", "ask", "that", "?"],
    ["Have", "you", "asked", "such", "questions", "before", "?"],
    ["Have", "you", "asked", "anyone", "else", "?"]
]) :- user_name(Name).

rules(40, 0, [because|_], [
    [ Name,"is", "that", "the", "real", "reason?"],
    ["Do", "any", "other", "reasons", "not", "come", "to", "mind?"],
    ["Does", "that", "reason", "seem", "to", "explain", "anything", "else?"],
    ["What", "other", "reasons", "might", "there", "be?"]
]) :- user_name(Name).

rules(41, 0, [why,dont,i|Y], [
    [ Name,"do", "you", "believe", "'I'", "do", "not", Y, "?"],
    ["Perhaps", "'I'", "will", Y, "in", "good", "time."],
    ["Should", "you", Y, "yourself", "?"]
]) :- user_name(Name).

rules(42, 0, [why,cant,you|Y], [
    ["Do", "you", "think", "you", "should", "be", "able", "to", Y, "?"],
    ["Do", "you", "want", "to", "be", "able", "to", Y, "?"],
    ["Do", "you", "believe", "this", "will", "help", "you", "to", Y, "?"]
]).

rules(43, 0, [M|_], [
    ["Really,", M, "?"],
    ["Surely", "not", M, "?"],
    ["Can", "you", "think", "of", "anyone", "in", "particular", "?"],
    ["Who,", "for", "example", "?"],
    ["You", "are", "thinking", "of", "a", "very", "special", "person", "?"],
    ["Who,", "may", "I", "ask", "?"],
    ["Someone", "special", "perhaps", "?"],
    ["You", "have", "a", "particular", "person", "in", "mind,", "do", "you", "not", "?"],
    ["Who", "do", "you", "think", "you", "are", "talking", "about", "?"]
]):-member(M,[everyone,everybody,nobody,noone]).

rules(44, 1, [always|_], [
    ["Can", "you", "think", "of", "a", "specific", "example?"],
    ["When?"],
    ["What", "incident", "are", "you", "thinking", "of?"],
    ["Really,", "always?"]
]).

rules(45, 10, [dit|_], [
    ["In", "what", "way?"],
    ["What", "resemblance", "do", "you", "see?"],
    ["What", "does", "that", "similarity", "suggest", "to", "you?"],
    ["What", "other", "connections", "do", "you", "see?"],
    ["What", "so", "you", "suppose", "that", "resemblance", "means?"],
    ["What", "is", "the", "connection,", "do", "you", "suppose?"],
    ["Could", "there", "really", "be", "some", "connection?"],
    ["How?"]
]).

rules(46, 100, [quit|_], [
    [ Name,"have a good day!", "My", "secretary", "will", "send", "you", "a", "bill."]
]) :- user_name(Name).

rules(47, 3, [think|_], [
    ["What", "do", "you", "think", "about", "that?"],
    ["How", "does", "that", "make", "you", "feel?"],
    ["Have", "you", "considered", "other", "perspectives", "on", "this?"]
]).

rules(48, 4, [feel|_], [
    ["Tell", "me", "more", "about", "those", "feelings."],
    ["How", "long", "have", "you", "been", "feeling", "this", "way?"],
    ["Do", "you", "think", "your", "feelings", "are", "affecting", "your", "decisions?"]
]).

rules(49, 2, [want|_], [
    ["What", "do", "you", "think", "you'll", "achieve", "by", "getting", "what", "you", "want?"],
    ["Is", "there", "a", "reason", "you", "want", "this?"],
    ["Have", "you", "considered", "the", "consequences", "of", "getting", "what", "you", "want?"]
]).

rules(50, 5, [need|_], [
    ["Why", "do", "you", "feel", "you", "need", "this?"],
    ["Is", "there", "anything", "else", "you", "need?"],
    ["Have", "you", "tried", "finding", "alternatives", "to", "fulfill", "this", "need?"]
]).

rules(51, 3, [like|_], [
    ["What", "is", "it", "about", "that", "you", "like?"],
    ["How", "does", "it", "make", "you", "feel", "when", "you", "like", "something?"],
    ["Have", "you", "liked", "similar", "things", "in", "the", "past?"]
]).

rules(52, 4, [dislike|_], [
    ["What", "is", "it", "about", "that", "you", "dislike?"],
    ["How", "does", "it", "make", "you", "feel", "when", "you", "dislike", "something?"],
    ["Have", "you", "tried", "avoiding", "things", "you", "dislike?"]
]).

rules(53, 2, [remember|_], [
    ["What", "triggered", "that", "memory?"],
    ["How", "vivid", "is", "that", "memory", "for", "you?"],
    ["Does", "that", "memory", "bring", "up", "any", "strong", "emotions?"]
]).

rules(54, 5, [forget|_], [
    ["Why", "do", "you", "think", "you", "forgot", "that?"],
    ["Is", "there", "anything", "else", "on", "your", "mind", "that", "could", "be", "causing", "you", "to", "forget?"],
    ["Do", "you", "often", "forget", "things", "like", "this?"]
]).

rules(55, 3, [believe|_], [
    ["What", "leads", "you", "to", "believe", "that?"],
    ["Have", "you", "ever", "doubted", "your", "beliefs", "before?"],
    ["Do", "you", "feel", "strongly", "about", "your", "beliefs?"]
]).

rules(56, 4, [doubt|_], [
    ["What", "makes", "you", "doubt", "that?"],
    ["Have", "you", "had", "any", "experiences", "that", "caused", "you", "to", "doubt", "similar", "things", "in", "the", "past?"],
    ["How", "do", "you", "usually", "handle", "doubt?"]
]).

rules(57, 2, [understand|_], [
    ["Can", "you", "explain", "why", "you", "don't", "understand?"],
    ["Is", "there", "anything", "specific", "you're", "having", "trouble", "understanding?"],
    ["Would", "you", "like", "me", "to", "clarify", "anything", "for", "you?"]
]).

rules(58, 3, [confused|_], [
    ["What", "is", "it", "that's", "confusing", "you?"],
    ["Have", "you", "tried", "breaking", "the", "problem", "down", "into", "smaller", "parts?"],
    ["Would", "you", "like", "some", "help", "figuring", "things", "out?"]
]).

rules(59, 4, [happy|_], [
    ["What's", "making", "you", "feel", "happy", "right", "now?"],
    ["How", "often", "do", "you", "feel", "this", "level", "of", "happiness?"],
    ["Do", "you", "feel", "like", "celebrating", "your", "happiness?"]
]).

rules(60, 4, [sad|_], [
    ["What's", "causing", "you", "to", "feel", "sad?"],
    ["Have", "you", "talked", "to", "anyone", "about", "why", "you're", "feeling", "sad?"],
    ["Do", "you", "feel", "comfortable", "expressing", "your", "sadness?"]
]).

rules(61, 5, [angry|_], [
    ["What", "provoked", "your", "anger?"],
    ["How", "do", "you", "usually", "cope", "with", "feelings", "of", "anger?"],
    ["Have", "you", "experienced", "similar", "situations", "that", "made", "you", "angry", "before?"]
]).

rules(62, 3, [anxious|_], [
    ["What's", "causing", "your", "anxiety?"],
    ["Have", "you", "tried", "any", "relaxation", "techniques", "to", "calm", "your", "anxiety?"],
    ["Do", "you", "notice", "any", "patterns", "in", "your", "anxiety", "triggers?"]
]).

rules(63, 5, [excited|_], [
    ["What's", "getting", "you", "excited?"],
    ["Do", "you", "feel", "like", "sharing", "your", "excitement", "with", "someone?"],
    ["Have", "you", "made", "any", "plans", "to", "channel", "your", "excitement", "into", "something", "productive?"]
]).

rules(64, 3, [surprised|_], [
    ["What", "caught", "you", "by", "surprise?"],
    ["How", "do", "you", "typically", "react", "when", "you're", "surprised?"],
    ["Do", "you", "enjoy", "the", "feeling", "of", "being", "surprised?"]
]).

rules(65, 4, [tired|_], [
    ["What", "do", "you", "think", "is", "causing", "your", "fatigue?"],
    ["Have", "you", "been", "getting", "enough", "rest", "lately?"],
    ["Do", "you", "notice", "any", "patterns", "in", "your", "energy", "levels", "throughout", "the", "day?"]
]).

rules(66, 3, [energetic|_], [
    ["What's", "giving", "you", "all", "this", "energy?"],
    ["Do", "you", "feel", "like", "channeling", "your", "energy", "into", "something", "productive?"],
    ["How", "do", "you", "plan", "to", "sustain", "this", "level", "of", "energy?"]
]).

rules(67, 2, [motivated|_], [
    ["What's", "motivating", "you", "right", "now?"],
    ["Do", "you", "feel", "like", "setting", "some", "goals", "to", "keep", "your", "motivation", "going?"],
    ["Have", "you", "experienced", "this", "level", "of", "motivation", "before?"]
]).

rules(68, 4, [bored|_], [
    ["What", "do", "you", "usually", "do", "when", "you're", "feeling", "bored?"],
    ["Have", "you", "considered", "trying", "something", "new", "to", "alleviate", "your", "boredom?"],
    ["Do", "you", "feel", "like", "you're", "lacking", "stimulation", "in", "your", "life", "right", "now?"]
]).

rules(69, 3, [lonely|_], [
    ["What's", "making", "you", "feel", "lonely?"],
    ["Have", "you", "reached", "out", "to", "anyone", "for", "companionship?"],
    ["Do", "you", "have", "any", "hobbies", "or", "activities", "that", "make", "you", "feel", "less", "lonely?"]
]).

rules(70, 4, [connected|_], [
    ["What", "makes", "you", "feel", "connected", "to", "others?"],
    ["Have", "you", "had", "any", "meaningful", "interactions", "lately", "that", "made", "you", "feel", "connected?"],
    ["Do", "you", "feel", "like", "you", "belong", "to", "a", "community", "or", "group", "that", "supports", "you?"]
]).

rules(71, 5, [forgive|_], [
    ["What", "would", "it", "take", "for", "you", "to", "forgive", "someone?"],
    ["Do", "you", "believe", "forgiveness", "is", "important", "for", "your", "own", "well-being?"],
    ["Have", "you", "ever", "struggled", "with", "forgiving", "someone", "in", "the", "past?"]
]).

rules(72, 3, [apologize|_], [
    ["What", "made", "you", "realize", "you", "need", "to", "apologize?"],
    ["Do", "you", "feel", "remorseful", "for", "your", "actions?"],
    ["Have", "you", "considered", "how", "your", "apology", "might", "impact", "the", "other", "person?"]
]).

rules(73, 4, [trust|_], [
    ["What", "does", "trust", "mean", "to", "you?"],
    ["Have", "you", "had", "any", "experiences", "that", "have", "affected", "your", "ability", "to", "trust", "others?"],
    ["Do", "you", "feel", "like", "you", "can", "trust", "yourself", "in", "difficult", "situations?"]
]).

rules(74, 3, [distrust|_], [
    ["What", "has", "led", "to", "your", "distrust?"],
    ["Have", "you", "noticed", "any", "red", "flags", "that", "contributed", "to", "your", "feelings", "of", "distrust?"],
    ["Do", "you", "feel", "like", "you've", "been", "let", "down", "by", "others", "in", "the", "past?"]
]).

rules(75, 5, [hope|_], [
    ["What", "are", "you", "hoping", "for?"],
    ["Do", "you", "feel", "optimistic", "about", "the", "future?"],
    ["Have", "you", "taken", "any", "steps", "towards", "achieving", "what", "you", "hope", "for?"]
]).

rules(76, 3, [despair|_], [
    ["What's", "causing", "you", "to", "feel", "despair?"],
    ["Do", "you", "feel", "like", "you're", "in", "a", "hopeless", "situation?"],
    ["Have", "you", "sought", "help", "or", "support", "to", "cope", "with", "your", "feelings", "of", "despair?"]
]).

rules(77, 4, [love|_], [
    ["What", "does", "love", "mean", "to", "you?"],
    ["Have", "you", "experienced", "unconditional", "love", "before?"],
    ["Do", "you", "believe", "love", "is", "essential", "for", "human", "connection?"]
]).

rules(78, 3, [hate|_], [
    ["What's", "causing", "you", "to", "feel", "hatred?"],
    ["Do", "you", "feel", "like", "your", "hatred", "is", "justified?"],
    ["Have", "you", "tried", "to", "understand", "where", "your", "feelings", "of", "hatred", "come", "from?"]
]).

rules(79, 5, [insecure|_], [
    ["What", "makes", "you", "feel", "insecure?"],
    ["Do", "you", "compare", "yourself", "to", "others", "often?"],
    ["Have", "you", "considered", "seeking", "validation", "from", "within", "rather", "than", "from", "external", "sources?"]
]).

rules(80, 3, [confident|_], [
    ["What", "makes", "you", "feel", "confident?"],
    ["Do", "you", "believe", "in", "your", "abilities", "and", "strengths?"],
    ["Have", "you", "overcome", "challenges", "in", "the", "past", "that", "boosted", "your", "confidence?"]
]).

rules(81, 4, [jealous|_], [
    ["What", "triggered", "your", "jealousy?"],
    ["Do", "you", "feel", "threatened", "by", "someone", "or", "something?"],
    ["Have", "you", "communicated", "your", "feelings", "of", "jealousy", "to", "the", "relevant", "person?"]
]).

rules(82, 3, [admire|_], [
    ["What", "qualities", "do", "you", "admire", "in", "others?"],
    ["Do", "you", "strive", "to", "embody", "the", "qualities", "you", "admire?"],
    ["Have", "you", "expressed", "your", "admiration", "to", "the", "person", "you", "admire?"]
]).

rules(83, 5, [proud|_], [
    ["What", "are", "you", "proud", "of?"],
    ["Do", "you", "feel", "validated", "when", "others", "acknowledge", "your", "achievements?"],
    ["Have", "you", "celebrated", "your", "achievements", "in", "any", "way?"]
]).

rules(84, 3, [ashamed|_], [
    ["What", "made", "you", "feel", "ashamed?"],
    ["Do", "you", "believe", "your", "actions", "were", "justified?"],
    ["Have", "you", "apologized", "to", "anyone", "for", "your", "actions?"]
]).
rules(85, 3, [proud|_], [
    ["What", "are", "you", "proud", "of?"],
    ["Do", "you", "believe", "it's", "important", "to", "celebrate", "your", "achievements?"],
    ["Have", "you", "shared", "your", "achievements", "with", "others?"]
]).

rules(86, 4, [ashamed|_], [
    ["What", "caused", "you", "to", "feel", "ashamed?"],
    ["Do", "you", "believe", "it's", "possible", "to", "learn", "from", "your", "mistakes?"],
    ["Have", "you", "taken", "responsibility", "for", "your", "actions", "that", "led", "to", "shame?"]
]).

rules(87, 3, [regret|_], [
    ["What", "do", "you", "regret?"],
    ["Do", "you", "believe", "in", "forgiving", "yourself", "for", "past", "mistakes?"],
    ["Have", "you", "tried", "to", "make", "amends", "for", "things", "you", "regret?"]
]).

rules(88, 4, [motivate|_], [
    ["What", "motivates", "you", "to", "keep", "going?"],
    ["Do", "you", "set", "goals", "to", "keep", "yourself", "motivated?"],
    ["Have", "you", "noticed", "any", "patterns", "in", "what", "motivates", "you?"]
]).

rules(89, 3, [inspire|_], [
    ["What", "inspires", "you?"],
    ["Do", "you", "seek", "out", "sources", "of", "inspiration", "regularly?"],
    ["Have", "you", "ever", "inspired", "others", "with", "your", "actions", "or", "words?"]
]).

rules(90, 4, [discouraged|_], [
    ["What's", "causing", "you", "to", "feel", "discouraged?"],
    ["Do", "you", "feel", "like", "giving", "up", "because", "of", "this", "discouragement?"],
    ["Have", "you", "considered", "seeking", "support", "to", "overcome", "your", "feelings", "of", "discouragement?"]
]).

rules(91, 3, [encouraged|_], [
    ["What's", "giving", "you", "hope", "or", "encouragement?"],
    ["Do", "you", "have", "a", "support", "system", "that", "encourages", "you?"],
    ["Have", "you", "overcome", "similar", "challenges", "in", "the", "past", "that", "have", "encouraged", "you?"]
]).

rules(92, 4, [independent|_], [
    ["What", "makes", "you", "feel", "independent?"],
    ["Do", "you", "enjoy", "being", "self-reliant?"],
    ["Have", "you", "faced", "situations", "where", "your", "independence", "was", "tested?"]
]).

rules(93, 3, [dependent|_], [
    ["What", "makes", "you", "feel", "dependent", "on", "others?"],
    ["Do", "you", "find", "it", "challenging", "to", "rely", "on", "others?"],
    ["Have", "you", "experienced", "situations", "where", "being", "dependent", "was", "beneficial", "for?"]
]).


rules(94, 4, [rational|_], [
    ["What", "makes", "you", "approach", "situations", "rationally?"],
    ["Do", "you", "find", "it", "helpful", "to", "weigh", "pros", "and", "cons", "before", "making", "decisions?"],
    ["Have", "you", "noticed", "any", "benefits", "from", "thinking", "rationally", "in", "the", "past?"]
]).


rules(95, 3, [emotional|_], [
    ["What", "triggers", "your", "emotional", "responses?"],
    ["Do", "you", "feel", "comfortable", "expressing", "your", "emotions?"],
    ["Have", "you", "explored", "the", "roots", "of", "your", "emotional", "reactions?"]
]).

rules(96, 4, [logical|_], [
    ["What", "makes", "you", "think", "logically", "about", "things?"],
    ["Do", "you", "find", "it", "easier", "to", "solve", "problems", "using", "logic?"],
    ["Have", "you", "noticed", "any", "drawbacks", "to", "relying", "solely", "on", "logic?"]
]).

rules(97, 3, [creative|_], [
    ["What", "inspires", "your", "creativity?"],
    ["Do", "you", "enjoy", "exploring", "new", "ideas", "and", "concepts?"],
    ["Have", "you", "ever", "surprised", "yourself", "with", "your", "creative", "solutions?"]
]).

rules(98, 4, [routine|_], [
    ["How", "do", "you", "feel", "about", "your", "daily", "routine?"],
    ["Do", "you", "find", "comfort", "in", "having", "a", "routine?"],
    ["Have", "you", "ever", "felt", "stuck", "in", "a", "monotonous", "routine?"]
]).

rules(99, 3, [spontaneous|_], [
    ["What", "prompts", "your", "spontaneous", "actions?"],
    ["Do", "you", "enjoy", "the", "unpredictability", "of", "spontaneity?"],
    ["Have", "you", "ever", "regretted", "being", "too", "spontaneous?"]
]).

rules(100, 4, [optimistic|_], [
    ["What", "gives", "you", "hope", "for", "the", "future?"],
    ["Do", "you", "believe", "things", "will", "get", "better", "over", "time?"],
    ["Have", "you", "experienced", "situations", "where", "optimism", "helped", "you", "overcome", "challenges?"]
]).
rules(101, 1, [exhausted|_], [
    ["You", "seem", "tired.", "Have", "you", "been", "resting", "enough", "lately?"],
    ["Feeling", "exhausted", "can", "be", "tough.", "Have", "you", "tried", "taking", "a", "break?"],
    ["Being", "exhausted", "can", "affect", "your", "mood.", "What", "do", "you", "think", "you", "need", "right", "now?"]
]).

rules(102, 1, [depressed|_], [
    ["I'm", "sorry", "to", "hear", "you're", "feeling", "depressed.", "Have", "you", "considered", "seeking", "support", "from", "friends", "or", "family?"],
    ["Feeling", "depressed", "is", "difficult.", "Have", "you", "spoken", "to", "a", "professional", "about", "how", "you're", "feeling?"],
    ["Depression", "can", "be", "overwhelming.", "Is", "there", "anything", "specific", "that's", "been", "bothering", "you?"]
]).

rules(103, 1, [joyful|_], [
    ["It's", "great", "to", "hear", "you're", "feeling", "joyful!", "What's", "been", "bringing", "you", "happiness", "lately?"],
    ["Feeling", "joyful", "can", "really", "brighten", "your", "day.", "What's", "been", "the", "highlight", "of", "your", "day", "so", "far?"],
    ["Being", "joyful", "is", "wonderful!", "Is", "there", "anything", "special", "you'd", "like", "to", "share", "that's", "made", "you", "feel", "this", "way?"]
]).

rules(104, 1, [adore|_], [
    ["It", "sounds", "like", "you", "really", "adore", "someone", "or", "something.", "What", "is", "it", "about", "them", "that", "you", "love", "so", "much?"],
    ["Adoration", "is", "a", "strong", "emotion.", "What", "do", "you", "admire", "most", "about", "the", "person", "or", "thing", "you", "adore?"],
    ["Adoring", "someone", "or", "something", "can", "bring", "a", "lot", "of", "joy.", "Is", "there", "a", "particular", "memory", "or", "moment", "that", "stands", "out", "to", "you?"]
]).

rules(105, 1, [detest|_], [
    ["It", "seems", "you", "really", "detest", "something.", "What", "is", "it", "about", "that", "thing", "that", "bothers", "you", "so", "much?"],
    ["Feeling", "strong", "dislike", "or", "detesting", "something", "can", "be", "challenging.", "Have", "you", "tried", "to", "understand", "why", "you", "feel", "this", "way?"],
    ["Detesting", "something", "can", "affect", "your", "mood.", "Is", "there", "anything", "you", "can", "do", "to", "avoid", "or", "mitigate", "your", "feelings", "of", "dislike?"]
]).

rules(106, 1, [furious|_], [
    ["Feeling", "furious", "can", "be", "intense.", "What", "happened", "to", "make", "you", "feel", "this", "way?"],
    ["It", "sounds", "like", "you're", "really", "angry.", "Have", "you", "tried", "taking", "deep", "breaths", "or", "finding", "a", "healthy", "way", "to", "express", "your", "anger?"],
    ["Being", "furious", "can", "be", "overwhelming.", "Is", "there", "someone", "you", "trust", "that", "you", "can", "talk", "to", "about", "what's", "bothering", "you?"]
]).

rules(107, 1, [bewildered|_], [
    ["Feeling", "bewildered", "means", "you're", "feeling", "confused", "or", "puzzled.", "What", "situation", "led", "to", "this", "feeling?"],
    ["Being", "bewildered", "can", "be", "disorienting.", "Is", "there", "any", "specific", "information", "you're", "struggling", "to", "understand?"],
    ["Feeling", "bewildered", "is", "tough.", "Is", "there", "anything", "I", "can", "do", "to", "help", "clarify", "things", "for", "you?"]
]).

rules(108, 1, [nervous|_], [
    ["Feeling", "nervous", "is", "common", "in", "certain", "situations.", "What's", "causing", "you", "to", "feel", "this", "way?"],
    ["It's", "natural", "to", "feel", "nervous", "sometimes.", "Is", "there", "anything", "you", "can", "do", "to", "calm", "your", "nerves?"],
    ["Being", "nervous", "can", "be", "challenging.", "Is", "there", "someone", "you", "trust", "who", "can", "offer", "support", "or", "reassurance?"]
]).

rules(109, 1, [enthusiastic|_], [
    ["Feeling", "enthusiastic", "means", "you're", "excited", "or", "eager", "about", "something.", "What's", "got", "you", "feeling", "so", "enthusiastic?"],
    ["Being", "enthusiastic", "is", "great!", "What's", "been", "the", "highlight", "of", "your", "day", "so", "far?"],
    ["Feeling", "enthusiastic", "can", "energize", "you.", "Is", "there", "something", "specific", "you're", "looking", "forward", "to?"]
]).

rules(110, 1, [astonished|_], [
    ["Being", "astonished", "means", "you're", "surprised", "or", "amazed.", "What", "happened", "to", "cause", "such", "a", "strong", "reaction?"],
    ["Feeling", "astonished", "can", "be", "overwhelming.", "Is", "there", "anything", "you", "can", "do", "to", "process", "this", "feeling?"],
    ["It", "sounds", "like", "you're", "really", "astonished.", "Is", "there", "something", "you'd", "like", "to", "share", "about", "what", "surprised", "you?"]
]).

rules(ID, Score,[im|X],R):-rules(ID, Score,[i|X],R),!.
rules(ID, Score,[youre|X],R):-rules(ID, Score,[you|X],R),!.

resetName:-
    retractall(user_name(_)).