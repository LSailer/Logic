answer(NameDarm, CarKurt, Hospital) :-
	is_hospital( Hospital ),

	% Im Zimmer neben Michael wird Camel geraucht.
	one_of_them(Michael, Hospital),
	one_of_them(Camel, Hospital),
	first_name(Michael, michael),
	smokes(Camel, camel),
	next_to(Michael, Camel, Hospital),

	% Der Trabant-Fahrer raucht Ernte 23 und liegt im Zimmer neben dem 
	% Zungen-Krebs Patienten.
	one_of_them(Trabant, Hospital),
	one_of_them(Zunge, Hospital),
	cancer(Zunge, zunge),
	car(Trabant, trabant),
	smokes(Trabant, ernte),
	next_to(Trabant, Zunge, Hospital),	

	% Rolf liegt im letzten Zimmer und hat Kehlkopf-Krebs.
	one_of_them(Rolf, Hospital),
	first_name(Rolf, rolf),
	cancer(Rolf, kehlkopf),
	last(Rolf, Hospital),

	% Der West-Raucher liegt im ersten Zimmer.
	one_of_them(West, Hospital),
	smokes(West, west),
	first(West, Hospital),

	% Der Mazda-Fahrer hat Zungen-Krebs und liegt neben dem Trabant-Fahrer.
	one_of_them(Mazda, Hospital),
	car(Mazda, mazda),
	cancer(Mazda, zunge),
	next_to(Trabant, Mazda, Hospital),

	% Der Nissan-Fahrer liegt neben dem Zungen-Krebs Patient.
	one_of_them(Nissan, Hospital),
	car(Nissan, nissan),
	next_to(Nissan, Zunge, Hospital),

	% Rudolf w�nscht sich Sterbe-Hilfe und liegt zwischen dem Camel-Raucher
	% und dem Trabant-Fahrer.
	one_of_them(Rudolf, Hospital),
	first_name(Rudolf, rudolf),
	next_to(Camel, Rudolf, Hospital),
	next_to(Rudolf, Trabant, Hospital),

	% Der Seat Fahrer hat morgen (seinen vermutlich letzten) Geburtstag.
	one_of_them(Seat, Hospital),
	car(Seat, seat),

	% Der Luckies Raucher liegt neben dem Patienten mit Lungen-Krebs.
	one_of_them(Luckies, Hospital),
	one_of_them(Lunge, Hospital),
	smokes(Luckies, luckies),
	cancer(Lunge, lunge),
	next_to(Lunge, Luckies, Hospital),

	% Der Camel Raucher liegt neben dem Patienten mit Darm-Krebs.
	one_of_them(Darm, Hospital),
	smokes(Camel, camel),
	cancer(Darm, darm),
	next_to(Camel, Darm, Hospital),

	% Der Nissan Fahrer liegt neben dem Mazda-Fahrer
	one_of_them(Nissan, Hospital),
	car(Nissan, nissan),
	next_to(Nissan, Mazda, Hospital),

	% Welche Zigaretten-Marke raucht der Darmkrebs-Patient.
	one_of_them(Darm, Hospital),
	cancer(Darm, darm),
	first_name(Darm, NameDarm),

	% Welches Auto f�hrt Kurt?
	one_of_them(Kurt, Hospital),
	first_name(Kurt, kurt),
	car(Kurt, CarKurt).
	

is_hospital( hospital(_First, _Second, _Third, _Fourth) ).

one_of_them(A, hospital(A, _, _, _)).
one_of_them(B, hospital(_, B, _, _)).
one_of_them(C, hospital(_, _, C, _)).
one_of_them(D, hospital(_, _, _, D)).

next_to(A, B, hospital(A, B, _, _)).
next_to(B, C, hospital(_, B, C, _)).
next_to(C, D, hospital(_, _, C, D)).
next_to(B, A, hospital(A, B, _, _)).
next_to(C, B, hospital(_, B, C, _)).
next_to(D, C, hospital(_, _, C, D)).

first(A, hospital(A, _, _, _)).
last(D, hospital(_, _, _, D)).

first_name(person(Name, _Car, _Cancer, _Cigarette), Name).

car(person(_Name, Car, _Cancer, _Cigarette), Car).

cancer(person(_Name, _Car, Cancer, _Cigarette), Cancer).

smokes(person(_Name, _Car, _Cancer, Cigarette), Cigarette).


% NameDarm = michael
% CarKurt = nissan
% Hospital = hospital( person(michael, seat, darm, west), 
%                      person(kurt, nissan, lunge, camel), 
%                      person(rudolf, mazda, zunge, luckies), 
%                      person(rolf, trabant, kehlkopf, ernte) ) 
