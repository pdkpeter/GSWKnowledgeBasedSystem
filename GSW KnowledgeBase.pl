/*
 *-NBA Golden State Warriors championship roster 2021-2022 identifaction system
 */

/*Information about program
 *Knowledge based system that can determine players based on users responses
 *Begin program with ?- play
 *Must type in yes or no
 *
 *This system can determine between all 15 players on the roster of the 2021-2022 Golden State Warriors
 *If you're not familiar with the roster, visit this link attached for the roster
 *https://basketball.realgm.com/nba/teams/Golden-State-Warriors/9/Rosters/Playoff
 *
 *Example tests are provided at the bottom of the file labeled TESTS
 */

% begin program with ?- play

play :- subject(Player),
    	write('I believe you are: '),
    	write(Player),
    	nl,
    	undo.

/*Different subjects to be tested aka players*/
subject(juan_toscano) :- juan_toscano, !.
subject(nemanja_bjelica) :- nemanja_bjelica, !.
subject(steph_curry) :- steph_curry, !.
subject(draymond_green) :- draymond_green, !.
subject(andre_iguodala) :- andre_iguodala, !.
subject(jonathan_kuminga) :- jonathan_kuminga, !.
subject(damion_lee) :- damion_lee, !.
subject(kevon_looney) :- kevon_looney, !.
subject(moses_moody) :- moses_moody, !.
subject(gary_payton2) :- gary_payton2, !.
subject(jordan_poole) :- jordan_poole, !.
subject(otto_porter) :- otto_porter, !.
subject(klay_thompson) :- klay_thompson, !.
subject(andrew_wiggins) :- andrew_wiggins, !.
subject(james_wiseman) :- james_wiseman, !.


/*Rules to determine each player*/
juan_toscano :- checkAttr(comes_off_the_bench), checkAttr(goofy), checkAttr(slasher), 
    write('A funny guy, who brings the excitement on the bench'), nl,
    write('Not the best shooter but good at the rim'),
    nl.
    
    
nemanja_bjelica :- checkAttr(comes_off_the_bench), checkAttr(unathletic), checkAttr(shooter), checkAttr(foreign_player), 
    write('A foreign player picked up on a one year contract'), nl,
    write('Unathletic but a reliable shooter'),
    nl.
    
    
steph_curry :- checkAttr(four_championships), splash_brother, checkAttr(unanimous_MVP), 
    write('The greatest shooter of all time'), nl,
    write('Splash brother and only unanimous MVP'),
    nl.
    
    
draymond_green :- checkAttr(four_championships), checkAttr(defensive_player_of_the_year), 
    write('Defensive player of the year'), nl,
    write('High IQ and fundamental player'),
    nl.
    
    
andre_iguodala :- checkAttr(four_championships), checkAttr(comes_off_the_bench), checkAttr(finals_MVP), 
    write('A huge factor in the dynasty'), nl,
    write('Old but gold'),
    nl.
    
    
jonathan_kuminga :- checkAttr(comes_off_the_bench), rookie, checkAttr(super_athletic), 
    write('Insane potential from this rookie'), nl,
    write('At only 18 years old, we are starting to see what he can do'),
    nl.
    
    
damion_lee :-checkAttr(comes_off_the_bench), checkAttr(worst_player_on_the_team), 
    write('Steph currys brother in law'), nl,
    write('Not much to say but...this guy kind of sucks'),
    nl.
    
    
kevon_looney :- checkAttr(unathletic), checkAttr(center_position), checkAttr(rebound_machine), 
    write('Slow, tall, and unathletic'), nl,
    write('This beast of a man makes a big impact under the rim'),
    nl.
    
    
moses_moody :- checkAttr(comes_off_the_bench), rookie , 
    write('This rookie has shown glimpses of becoming an amazing shooter'), nl,
    write('At only eighteen, lets hope he can continue and have a strong future'),
    nl.
    
    
gary_payton2 :-checkAttr(comes_off_the_bench), checkAttr(super_athletic), checkAttr(amazing_dunks),
    			checkAttr(amazing_defender), 
    write('GP2, the young glove'), nl,
    write('Amazing defender and amazing dunker'),
    nl.
    
    
jordan_poole :-checkAttr(comes_off_the_bench), checkAttr(goofy), checkAttr(shooter), 
    write('A young talent whos improved tremendously this season'), nl,
    write('A funny player to have and an amazing shooter'),
    nl.
    
    
otto_porter :-checkAttr(comes_off_the_bench), checkAttr(unathletic), checkAttr(shooter), 
    write('Picked up on a 1 year contract, his shooting was very useful'), nl,
    write('Coming off the bench to make some important shots, you cannot hate this player'),
    nl.
    
    
klay_thompson :- checkAttr(four_championships), splash_brother, checkAttr(two_way_player), 
    write('Fellow splash brother and two way player'), nl,
    write('The ball is always safe in his hands'),
    nl.
    
    
andrew_wiggins :-checkAttr(two_way_player), checkAttr(rookie_of_the_year),checkAttr(amazing_dunks), checkAttr(canadian), 
    write('Wiggs, Maple jordan, whatever you call him hes good'), nl,
    write('All around great game by this player'),
    nl.
    
    
james_wiseman :- giant, 
    write('Although he has been injured this entire season, we know what he is capable of'), nl,
    write('Lets hope he grows from this run and develops into a beast of a center'),
    nl.
    
/*Rules and facts*/
rookie :- checkAttr(just_got_drafted), checkAttr(eighteen_years_old).
giant :- checkAttr(center_position), checkAttr(seven_feet).
splash_brother :- checkAttr(knockdown_shooter), checkAttr(freethrow_shooter), checkAttr(starter).

/*User interaction for responding to questions*/
askQuestion(Question) :- 
        write('Does the following attribute describe the player: '), 
        write(Question), %paramater from checkAttr
         read(Response),
		 nl, 
         ((Response == yes)
         -> 
         assert(yes(Question)) ; %recording answer to avoid asking repeated questions
         assert(no(Question)), fail). 
:- dynamic yes/1,no/1. %yes and no will change dynamically according to the conditions

/*check the attributes*/
/*S is the paramater. Will be replaced with the attribute*/
checkAttr(S) :-
    (yes(S)
    ->
    true ; %if yes is true 
    (no(S) %otherwise
    ->  
    fail ;
    askQuestion(S))). %jump to askQuestion

/*delete the recorded answers*/
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.


/*TESTS
 * Andre Iguodala
 * Does the following attribute describe the player: comes_off_the_bench
yes

Does the following attribute describe the player: goofy
no

Does the following attribute describe the player: unathletic
no

Does the following attribute describe the player: four_championships
yes

Does the following attribute describe the player: knockdown_shooter
no

Does the following attribute describe the player: defensive_player_of_the_year
no

Does the following attribute describe the player: finals_MVP
yes

A huge factor in the dynasty
Old but gold
I believe you are: andre_iguodala
true

-----------------------------------------------------------------------------------------
James Wiseman
Does the following attribute describe the player: comes_off_the_bench
no

Does the following attribute describe the player: four_championships
no

Does the following attribute describe the player: unathletic
no

Does the following attribute describe the player: two_way_player
no

Does the following attribute describe the player: center_position
yes

Does the following attribute describe the player: seven_feet
yes

Although he has been injured this entire season, we know what he is capable of
Lets hope he grows from this run and develops into a beast of a center
I believe you are: james_wiseman
true
--------------------------------------------------------------------------------------------
Out of range of knowledge system (false)
Does the following attribute describe the player: comes_off_the_bench
yes

Does the following attribute describe the player: goofy
yes

Does the following attribute describe the player: slasher
no

Does the following attribute describe the player: unathletic
no

Does the following attribute describe the player: four_championships
no

Does the following attribute describe the player: just_got_drafted
no

Does the following attribute describe the player: worst_player_on_the_team
no

Does the following attribute describe the player: super_athletic
no

Does the following attribute describe the player: shooter
no

Does the following attribute describe the player: two_way_player
no

Does the following attribute describe the player: center_position
no

false
----------------------------------------------------------------------------------------------
Gary Payton 2
Does the following attribute describe the player: comes_off_the_bench
yes

Does the following attribute describe the player: goofy
no

Does the following attribute describe the player: unathletic
no

Does the following attribute describe the player: four_championships
no

Does the following attribute describe the player: just_got_drafted
no

Does the following attribute describe the player: worst_player_on_the_team
no

Does the following attribute describe the player: super_athletic
yes

Does the following attribute describe the player: amazing_dunks
yes

Does the following attribute describe the player: amazing_defender
yes

GP2, the young glove
Amazing defender and amazing dunker
I believe you are: gary_payton2
true
----------------------------------------------------------------------------------------------
Otto Porter
Does the following attribute describe the player: comes_off_the_bench
yes

Does the following attribute describe the player: goofy
no

Does the following attribute describe the player: unathletic
yes

Does the following attribute describe the player: shooter
yes

Does the following attribute describe the player: foreign_player
no

Does the following attribute describe the player: four_championships
no

Does the following attribute describe the player: just_got_drafted
no

Does the following attribute describe the player: worst_player_on_the_team
no

Does the following attribute describe the player: center_position
no

Does the following attribute describe the player: super_athletic
no

Picked up on a 1 year contract, his shooting was very useful
Coming off the bench to make some important shots, you cannot hate this player
I believe you are: otto_porter
true
---------------------------------------------------------------------------------------------------
Klay Thompson
Does the following attribute describe the player: comes_off_the_bench
no

Does the following attribute describe the player: four_championships
yes

Does the following attribute describe the player: knockdown_shooter
yes

Does the following attribute describe the player: freethrow_shooter
yes

Does the following attribute describe the player: starter
yes

Does the following attribute describe the player: unanimous_MVP
no

Does the following attribute describe the player: defensive_player_of_the_year
no

Does the following attribute describe the player: unathletic
no

Does the following attribute describe the player: two_way_player
yes

Fellow splash brother and two way player
The ball is always safe in his hands
I believe you are: klay_thompson
true
 */