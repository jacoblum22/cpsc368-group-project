drop table salesdetails;
drop table sales;
drop table titleditors;
drop table titleauthors;
drop table titles;
drop table publishers;
drop table authors;
drop table editors;
purge recyclebin;

create table authors
	(au_id char(11) not null,
	au_lname varchar(40) not null,
	au_fname varchar(20) not null,
	phone char(12) null,
	address varchar(40) null,
	city varchar(20) null,
	state char(2) null,
	zip char(5) null,
	primary key (au_id));

grant select on authors to public;

create table publishers
	(pub_id char(4) not null,
	pub_name varchar(40) null,
	address varchar(40) null,
	city varchar(20) null,
	state char(2) null,
	primary key (pub_id));

grant select on publishers to public;

create table titles
	(title_id char(8) not null,
	title varchar(80) not null,
	type char(12) null,
	pub_id char(4) null,
	price int      null,
	advance char(9) null,
	ytd_sales int null,
	contract char(1) not null,
	notes varchar(200) null,
	pubdate char(20) null,
	primary key (title_id),
	foreign key (pub_id) references publishers
	ON DELETE CASCADE);
grant select on titles to public;




create table titleauthors
	(au_id char(11) not null,
	title_id char(8) not null,
	au_ord number(5) null,
	royaltyshare float null,
	primary key (au_id, title_id),
	foreign key (au_id) references authors ON DELETE CASCADE,
	foreign key (title_id) references titles ON DELETE CASCADE);

grant select on titleauthors to public;


create table editors
	(ed_id char(11) not null,
	ed_lname varchar(40) not null,
	ed_fname varchar(20) not null,
	ed_pos varchar(12) null,
	phone char(12) null,
	address varchar(40) null,
	city varchar(20) null,
	state char(2) null,
	zip char(5) null,
	ed_boss char(11) null,
	primary key (ed_id),
	foreign key (ed_boss) references editors ON DELETE CASCADE);

grant select on editors to public;

create table titleditors
	(ed_id char(11) not null,
	title_id char(8) not null,
	ed_ord number(5) null,
	primary key (ed_id, title_id),
	foreign key (ed_id) references editors ON DELETE CASCADE,
	foreign key (title_id) references titles ON DELETE CASCADE);

grant select on titleditors to public;

create table sales
	(sonum int not null,
	stor_id char(4) not null,
	ponum varchar(20) not null,
	sdate char(20) null,
	primary key (sonum));

grant select on sales to public;

create table salesdetails
	(sonum int not null,
	qty_ordered smallint not null,
	qty_shipped smallint null,
	title_id char(8) not null,
	date_shipped char(20) null,
	primary key (sonum, title_id),
	foreign key (sonum) references sales ON DELETE CASCADE,
	foreign key (title_id) references titles ON DELETE CASCADE);


grant select on salesdetails to public;


insert into authors
values('409-56-7008', 'Bennet', 'Abraham',
'415 658-9932', '6223 Bateman St.', 'Berkeley', 'CA', '94705');

insert into authors
values ('213-46-8915', 'Green', 'Marjorie',
'415 986-7020', '309 63rd St. #411', 'Oakland', 'CA', '94618');

insert into authors
values('238-95-7766', 'Carson', 'Cheryl',
'415 548-7723', '589 Darwin Ln.', 'Berkeley', 'CA', '94705');

insert into authors
values('998-72-3567', 'Ringer', 'Albert',
'801 826-0752', '67 Seventh Av.', 'Salt Lake City', 'UT', '84152');

insert into authors
values('899-46-2035', 'Ringer', 'Anne',
'801 826-0752', '67 Seventh Av.', 'Salt Lake City', 'UT', '84152');

insert into authors
values('722-51-5454', 'DeFrance', 'Michel',
'219 547-9982', '3 Balding Pl.', 'Gary', 'IN', '46403');

insert into authors
values('807-91-6654', 'Panteley', 'Sylvia',
'301 946-8853', '1956 Arlington Pl.', 'Rockville', 'MD', '20853');

insert into authors
values('893-72-1158', 'McBadden', 'Heather',
'707 448-4982', '301 Putnam', 'Vacaville', 'CA', '95688');

insert into authors
values('724-08-9931', 'Stringer', 'Dirk',
'415 843-2991', '5420 Telegraph Av.', 'Oakland', 'CA', '94609');

insert into authors
values('274-80-9391', 'Straight', 'Dick',
'415 834-2919', '5420 College Av.', 'Oakland', 'CA', '94609');

insert into authors
values('756-30-7391', 'Karsen', 'Livia',
'415 534-9219', '5720 McAuley St.', 'Oakland', 'CA', '94609');

insert into authors
values('724-80-9391', 'MacFeather', 'Stearns',
'415 354-7128', '44 Upland Hts.', 'Oakland', 'CA', '94612');

insert into authors
values('427-17-2319', 'Dull', 'Ann',
'415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', '94301');

insert into authors
values('672-71-3249', 'Yokomoto', 'Akiko',
'415 935-4228', '3 Silver Ct.', 'Walnut Creek', 'CA', '94595');

insert into authors
values('267-41-2394', 'O''Leary', 'Michael',
'408 286-2428', '22 Cleveland Av. #14', 'San Jose', 'CA', '95128');

insert into authors
values('472-27-2349', 'Gringlesby', 'Burt',
'707 938-6445', 'PO Box 792', 'Covelo', 'CA', '95428');

insert into authors
values('527-72-3246', 'Greene', 'Morningstar',
'615 297-2723', '22 Graybar House Rd.', 'Nashville', 'TN', '37215');

insert into authors
values('172-32-1176', 'White', 'Johnson',
'408 496-7223', '10932 Bigge Rd.', 'Menlo Park', 'CA', '94025');

insert into authors
values('712-45-1867', 'del Castillo', 'Innes',
'615 996-8275', '2286 Cram Pl. #86', 'Ann Arbor', 'MI', '48105');

insert into authors
values('846-92-7186', 'Hunter', 'Sheryl',
'415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', '94301');

insert into authors
values('486-29-1786', 'Locksley', 'Chastity',
'415 585-4620', '18 Broadway Av.', 'San Francisco', 'CA', '94130');

insert into authors
values('648-92-1872', 'Blotchet-Halls', 'Reginald',
'503 745-6402', '55 Hillsdale Bl.', 'Corvallis', 'OR', '97330');

insert into authors
values('341-22-1782', 'Smith', 'Meander',
'913 843-0462', '10 Misisipi Dr.', 'Lawrence', 'KS', '66044');

insert into publishers
values('0736', 'New Age Books', '1 1st St','Boston', 'MA');

insert into publishers
values('0877', 'Binnet and Hardley','2 2nd Ave.', 'Washington', 'DC');

insert into publishers
values('1389', 'Algodata Infosystems', '3 3rd Dr.','Berkeley', 'CA');

insert into titles
values ('PC8888', 'Secrets of Silicon Valley',
'popular_comp', '1389', ' 20.00',' 8000.00', '4095','1',
'Muckraking reporting on the world''s largest computer
hardware and software manufacturers.','1985-06-12');

insert into titles
values ('BU1032', 'The Busy Executive''s Database Guide',
'business', '1389', ' 19.99', ' 5000.00', '4095', '1',
'An overview of available database systems with emphasis
 on common business applications.  Illustrated.','1985-06-12');

insert into titles
values ('PS7777', 'Emotional Security: A New Algorithm',
'psychology', '0736', ' 7.99', ' 4000.00', '3336', '1',
'Protecting yourself and your loved ones from undue
 emotional stress in the modern world.
Use of computer and nutritional aids emphasized.','1985-06-12');

insert into titles
values ('PS3333', 'Prolonged Data Deprivation: Four Case Studies',
'psychology', '0736', ' 19.99', ' 2000.00', '4072','1',
'What happens when the data runs dry?
Searching evaluations of information-shortage effects.','1985-06-12');

insert into titles
values ('BU1111', 'Cooking with Computers: Surreptitious Balance Sheets',
'business', '1389', ' 11.95', ' 5000.00', '3876', '1',
'Helpful hints on how to use your electronic resources
to the best advantage.', '1985-06-09');

insert into titles
values ('MC2222', 'Silicon Valley Gastronomic Treats',
'mod_cook', '0877', ' 19.99', ' 0.00', '2032', '1',
 'Favorite recipes for quick, easy, and elegant meals tried and
tested by people who never have time to eat, let alone cook.','1985-06-09');
insert into titles
values ('TC7777', 'Sushi, Anyone?',
'trad_cook', '0877', ' 14.99', ' 8000.00', '4095', '1',
'Detailed instructions on improving your position in life by
learning how to make authentic Japanese sushi in your spare time.
5-10% increase in number of friends per recipe reported from beta test. ',
'1985-06-12');

insert into titles
values ('TC4203', 'Fifty Years in Buckingham Palace Kitchens',
'trad_cook', '0877', ' 11.95', ' 4000.00', '15096', '1',
'More anecdotes from the Queen''s favorite cook describing life among
English royalty.  Recipes, techniques, tender vignettes.','06/12/85');

insert into titles
values ('PC1035', 'But Is It User Friendly?',
'popular_comp', '1389', ' 22.95', ' 7000.00', '8780', '1',
'A survey of software for the naive user, focusing on
the ''friendliness'' of each.','06/30/85');

insert into titles
values('BU2075', 'You Can Combat Computer Stress!',
'business', '0736', ' 2.99', ' 10125.00', '18722', '1',
'The latest medical and psychological techniques for living with
the electronic office.  Easy-to-understand explanations.','06/30/85');

insert into titles
values('PS2091', 'Is Anger the Enemy?',
'psychology', '0736', ' 10.95', ' 2275.00', '2045', '1',
'Carefully researched study of the effects of strong emotions
on the body. Metabolic charts included.','06/15/85');

insert into titles
values('PS2106', 'Life Without Fear',
'psychology', '0736', ' 7.00', ' 6000.00', '111', '1',
'New exercise, meditation, and nutritional techniques
that can reduce the shock of daily interactions. Popular audience.
Sample menus included,exercise video available separately.','10/05/85');

insert into titles
values('MC3021', 'The Gourmet Microwave',
'mod_cook', '0877', ' 2.99', ' 15000.00','22246', '1',
'Traditional French gourmet recipes
adapted for modern microwave cooking.','1985-06-18');

insert into titles
values('TC3218','Onions, Leeks, and Garlic:
Cooking Secrets of the Mediterranean',
'trad_cook', '0877', ' 20.95', ' 7000.00', '375', '1',
'Profusely illustrated in color, this makes a wonderful
gift book for a cuisine-oriented friend.','1985-02-23');

insert into titles (title_id, title, pub_id, contract)
values('MC3026', 'The Psychology of Computer Cooking', '0877', 0);

insert into titles
values ('BU7832', 'Straight Talk About Computers',
'business', '1389', ' 19.99', ' 5000.00', '4095', '1',
'Annotated analysis of what computers can do for you: a no-hype
guide for the critical user.','1985-06-22');

insert into titles
values('PS1372',
'Computer Phobic and Non-Phobic Individuals: Behavior Variations',
'psychology', '0736', ' 21.59', ' 7000.00', '375', '1',
'A must for the specialist, this book examines the difference
between those who hate and fear computers and those who think
they are swell.','1985-12-21');

insert into titles (title_id, title, type, pub_id, contract, notes)
values('PC9999', 'Net Etiquette', 'popular_comp', '1389', 0,
'A must-read for computer conferencing debutantes!.');



insert into titleauthors
values('409-56-7008', 'BU1032', 1, .60);

insert into titleauthors
values('486-29-1786', 'PS7777', 1, 1.00);

insert into titleauthors
values('486-29-1786', 'PC9999', 1, 1.00);

insert into titleauthors
values('712-45-1867', 'MC2222', 1, 1.00);

insert into titleauthors
values('172-32-1176', 'PS3333', 1, 1.00);

insert into titleauthors
values('213-46-8915', 'BU1032', 2, .40);

insert into titleauthors
values('238-95-7766', 'PC1035', 1, 1.00);

insert into titleauthors
values('213-46-8915', 'BU2075', 1, 1.00);

insert into titleauthors
values('998-72-3567', 'PS2091', 1, .50);

insert into titleauthors
values('899-46-2035', 'PS2091', 2, .50);

insert into titleauthors
values('998-72-3567', 'PS2106', 1, 1.00);

insert into titleauthors
values('722-51-5454', 'MC3021', 1, .75);

insert into titleauthors
values('899-46-2035', 'MC3021', 2, .25);

insert into titleauthors
values('807-91-6654', 'TC3218', 1, 1.00);

insert into titleauthors
values('274-80-9391', 'BU7832', 1, 1.00);

insert into titleauthors
values('427-17-2319', 'PC8888', 1, .50);

insert into titleauthors
values('846-92-7186', 'PC8888', 2, .50);

insert into titleauthors
values('756-30-7391', 'PS1372', 1, .75);

insert into titleauthors
values('724-80-9391', 'PS1372', 2, .25);

insert into titleauthors
values('724-80-9391', 'BU1111', 1, .60);

insert into titleauthors
values('267-41-2394', 'BU1111', 2, .40);

insert into titleauthors
values('672-71-3249', 'TC7777', 1, .40);

insert into titleauthors
values('267-41-2394', 'TC7777', 2, .30);

insert into titleauthors
values('472-27-2349', 'TC7777', 3, .30);

insert into titleauthors
values('648-92-1872', 'TC4203', 1, 1.00);



insert into editors
values ('321-55-8906', 'DeLongue', 'Martinella', 'project',
'415 843-2222', '3000 6th St.', 'Berkeley', 'CA', '94710', null);

insert into editors
values ('993-86-0420', 'McCann', 'Dennis', 'acquisition',
'301 468-3909', '32 Rockbill Pike', 'Rockbill', 'MD', '20852', '321-55-8906');

insert into editors
values ('723-48-9010', 'Sparks', 'Manfred', 'copy',
'303 721-3388', '15 Sail', 'Denver', 'CO', '80237', '321-55-8906');

insert into editors
values ('777-02-9831', 'Samuelson', 'Bernard', 'project',
'415 843-6990', '27 Yosemite', 'Oakland', 'CA', '94609', null);

insert into editors
values ('777-66-9902', 'Almond', 'Alfred', 'copy',
'312 699-4177', '1010 E. Devon', 'Chicago', 'IL', '60018', '723-48-9010');

insert into editors
values ('826-11-9034', 'Himmel', 'Eleanore', 'project',
'617 423-0552', '97 Bleaker', 'Boston', 'MA', '02210', '993-86-0420');

insert into editors
values ('885-23-9140', 'Rutherford-Hayes', 'Hannah', 'project',
'301 468-3909', '32 Rockbill Pike', 'Rockbill', 'MD', '20852', '321-55-8906');

insert into editors
values ('943-88-7920', 'Kaspchek', 'Christof', 'acquisition',
'415 549-3909', '18 Severe Rd.', 'Berkeley', 'CA', '94710', null);

insert into editors
values ('234-88-9720', 'Hunter', 'Amanda', 'acquisition',
'617 432-5586', '18 Dowdy Ln.', 'Boston', 'MA', '02210', '993-86-0420');

insert into titleditors values
('826-11-9034', 'BU2075', 2);

insert into titleditors values
('826-11-9034', 'PS2091', 2);

insert into titleditors values
('826-11-9034', 'PS2106', 2);

insert into titleditors values
('826-11-9034', 'PS3333', 2);

insert into titleditors values
('826-11-9034', 'PS7777', 2);

insert into titleditors values
('826-11-9034', 'PS1372', 2);

insert into titleditors values
('885-23-9140', 'MC2222', 2);

insert into titleditors values
('885-23-9140', 'MC3021', 2);

insert into titleditors values
('885-23-9140', 'TC3218', 2);

insert into titleditors values
('885-23-9140', 'TC4203', 2);

insert into titleditors values
('885-23-9140', 'TC7777', 2);

insert into titleditors values
('321-55-8906', 'BU1032', 2);

insert into titleditors values
('321-55-8906', 'BU1111', 2);

insert into titleditors values
('321-55-8906', 'BU7832', 2);

insert into titleditors values
('321-55-8906', 'PC1035', 2);

insert into titleditors values
('321-55-8906', 'PC8888', 2);

insert into titleditors values
('321-55-8906', 'BU2075', 3);

insert into titleditors values
('777-02-9831', 'PC1035', 3);

insert into titleditors values
('777-02-9831', 'PC8888', 3);

insert into titleditors values
('943-88-7920', 'BU1032', 1);

insert into titleditors values
('943-88-7920', 'BU1111', 1);

insert into titleditors values
('943-88-7920', 'BU2075', 1);

insert into titleditors values
('943-88-7920', 'BU7832', 1);

insert into titleditors values
('943-88-7920', 'PC1035', 1);

insert into titleditors values
('943-88-7920', 'PC8888', 1);

insert into titleditors values
('993-86-0420', 'PS1372', 1);

insert into titleditors values
('993-86-0420', 'PS2091', 1);

insert into titleditors values
('993-86-0420', 'PS2106', 1);

insert into titleditors values
('993-86-0420', 'PS3333', 1);

insert into titleditors values
('993-86-0420', 'PS7777', 1);

insert into titleditors values
('993-86-0420', 'MC2222', 1);

insert into titleditors values
('993-86-0420', 'MC3021', 1);

insert into titleditors values
('993-86-0420', 'TC3218', 1);

insert into titleditors values
('993-86-0420', 'TC4203', 1);

insert into titleditors values
('993-86-0420', 'TC7777', 1);

insert into sales
values(1,'7066', 'QA7442.3', '1985-09-13');

insert into sales
values(2,'7067', 'D4482', '1985-09-14');

insert into sales
values(3,'7131', 'N914008', '1985-09-14');

insert into sales
values(4,'7131', 'N914014', '1985-09-14');

insert into sales
values(5,'8042', 'K423LL922', '1985-09-14');

insert into sales
values(6,'8042', 'E423LL930', '1985-09-14');

insert into sales
values(7, '6380', 'G722a', '1985-09-13');

insert into sales
values(8,'6380', 'W6871', '1985-09-14');

insert into sales
values(9,'8042','P723', '1988-03-11');

insert into sales
values(19,'7896','X999', '1988-02-21');

insert into sales
values(10,'7896','QQ2299', '1987-10-28');

insert into sales
values(11,'7896','TQ456', '1987-12-12');

insert into sales
values(12,'8042','QA879.1', '1987-5-22');

insert into sales
values(13,'7066','A2976', '1987-5-24');

insert into sales
values(14,'7131','P3087a', '1987-5-29');

insert into sales
values(15,'7067','P2121', '1987-6-15');

insert into salesdetails
values(1, 75, 75,'PS2091', '1985-9-15');

insert into salesdetails
values(2, 10, 10,'PS2091', '1985-9-15');

insert into salesdetails
values(3, 20, 720,'PS2091', '1985-9-18');

insert into salesdetails
values(4, 25, 20,'MC3021', '1985-9-18');

insert into salesdetails
values(5, 15, 15,'MC3021', '1985-9-14');

insert into salesdetails
values(6, 10, 3,'BU1032', '1985-9-22');

insert into salesdetails
values(7, 3, 3,'PS2091', '1985-9-20');

insert into salesdetails
values(8, 5, 5,'BU1032', '1985-9-14');

insert into salesdetails
values(9, 25, 5,'BU1111', '1988-03-28');

insert into salesdetails
values(19, 35, 35,'BU2075', '1988-03-15');

insert into salesdetails
values(10, 15, 15,'BU7832', '1987-10-29');

insert into salesdetails
values(11, 10, 10,'MC2222', '1987-1-12');

insert into salesdetails
values(12, 30, 30,'PC1035', '1987-5-24');

insert into salesdetails
values(13, 50, 50,'PC8888', '1987-5-24');

insert into salesdetails
values(14, 20, 20,'PS1372', '1987-5-29');

insert into salesdetails
values(14, 25, 25,'PS2106', '1987-4-29');

insert into salesdetails
values(14, 15, 10,'PS3333', '1987-5-29');

insert into salesdetails
values(14, 25, 25,'PS7777', '1987-6-13');

insert into salesdetails
values(15, 40, 40,'TC3218', '1987-6-15');

insert into salesdetails
values(15, 20, 20,'TC4203', '1987-5-30');

insert into salesdetails
values(15, 20, 10,'TC7777', '1987-6-17');

commit;
