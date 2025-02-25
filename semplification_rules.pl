% Eliza - Simlification rules

sr([do,not|X],[dont|Y],X,Y).
sr([can,not|X],[cant|Y],X,Y).
sr([cannot|X],[cant|Y],X,Y).
sr([will,not|X],[wont|Y],X,Y).
sr([dreamed|X],[dreamt|Y],X,Y).
sr([dreams|X],[dream|Y],X,Y).
sr([how|X],[what|Y],X,Y).
sr([when|X],[what|Y],X,Y).
sr([alike|X],[dit|Y],X,Y).
sr([same|X],[dit|Y],X,Y).
sr([certainly|X],[yes|Y],X,Y).
sr([maybe|X],[perhaps|Y],X,Y).
sr([deutsch|X],[xfremd|Y],X,Y).
sr([francais|X],[xfremd|Y],X,Y).
sr([czech|X],[xfremd|Y],X,Y).
sr([slovak|X],[xfremd|Y],X,Y).
sr([espanol|X],[xfremd|Y],X,Y).
sr([machine|X],[computer|Y],X,Y).
sr([machines|X],[computer|Y],X,Y).
sr([computers|X],[computer|Y],X,Y).
sr([im|X],[youre|Y],X,Y).
sr([youre|X],[im|Y],X,Y).
sr([am|X],[are|Y],X,Y).
sr([your|X],[my|Y],X,Y).
sr([were|X],[was|Y],X,Y).
sr([me|X],[you|Y],X,Y).
sr([you,are|X],[im|Y],X,Y).      % im = i'm = i am
sr([i,am|X],[youre|Y],X,Y).      % youre = you're = you are =\= your
sr([myself|X],[yourself|Y],X,Y).
sr([yourself|X],[myself|Y],X,Y).
sr([mom|X],[mother|Y],X,Y).
sr([dad|X],[father|Y],X,Y).
sr([i|X],[you|Y],X,Y).
sr([you|X],[me|Y],X,Y).
sr([my|X],[your|Y],X,Y).
sr([everybody|X],[everyone|Y],X,Y).
sr([nobody|X],[noone|Y],X,Y).
sr([you,remind,me,of|X],[dit|Y],X,Y).
sr([like|X],[dit|Y],X,Y).
sr([bye|X],[quit|Y],X,Y).
sr([goodbye|X],[quit|Y],X,Y).
sr([hi|X],[hello|Y],X,Y).
sr([ok|X],[yes|Y],X,Y).
sr([okay|X],[yes|Y],X,Y).
sr([yup|X],[yes|Y],X,Y).
sr([tired|X],[exhausted|Y],X,Y).
sr([sad|X],[depressed|Y],X,Y).
sr([happy|X],[joyful|Y],X,Y).
sr([love|X],[adore|Y],X,Y).
sr([hate|X],[detest|Y],X,Y).
sr([angry|X],[furious|Y],X,Y).
sr([confused|X],[bewildered|Y],X,Y).
sr([anxious|X],[nervous|Y],X,Y).
sr([excited|X],[enthusiastic|Y],X,Y).
sr([surprised|X],[astonished|Y],X,Y).
sr([forgive|X],[pardon|Y],X,Y).
sr([apologize|X],[apologise|Y],X,Y).
sr([trust|X],[rely|Y],X,Y).
sr([distrust|X],[suspicion|Y],X,Y).
sr([hope|X],[wish|Y],X,Y).
sr([despair|X],[hopelessness|Y],X,Y).
sr([motivate|X],[inspire|Y],X,Y).
sr([inspire|X],[motivate|Y],X,Y).
sr([bored|X],[uninterested|Y],X,Y).
sr([lonely|X],[solitary|Y],X,Y).
sr([connected|X],[linked|Y],X,Y).
sr([insecure|X],[uncertain|Y],X,Y).
sr([confident|X],[assured|Y],X,Y).
sr([jealous|X],[envious|Y],X,Y).
sr([admire|X],[esteem|Y],X,Y).
sr([envy|X],[jealousy|Y],X,Y).
sr([excuse|X],[justify|Y],X,Y).
sr([proud|X],[proudly|Y],X,Y).
sr([ashamed|X],[embarrassed|Y],X,Y).
sr([regret|X],[repent|Y],X,Y).
sr([dependent|X],[reliant|Y],X,Y).
sr([independent|X],[self-reliant|Y],X,Y).
sr([rational|X],[logical|Y],X,Y).
sr([emotional|X],[sentimental|Y],X,Y).
sr([logical|X],[rational|Y],X,Y).
sr([creative|X],[imaginative|Y],X,Y).
sr([routine|X],[schedule|Y],X,Y).
sr([spontaneous|X],[impulsive|Y],X,Y).
sr([optimistic|X],[hopeful|Y],X,Y).
sr([discouraged|X],[disheartened|Y],X,Y).
sr([encouraged|X],[motivated|Y],X,Y).
sr([dreamt|X],[dreamed|Y],X,Y).
sr([dream|X],[daydream|Y],X,Y).
sr([no|X],[negative|Y],X,Y).
sr([yes|X],[affirmative|Y],X,Y).
