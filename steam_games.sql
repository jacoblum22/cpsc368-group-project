-- Drop new and legacy table names to handle renames cleanly
drop table reviews;
drop table player_stats;
drop table scores;
drop table players;
drop table games;
purge recyclebin;

create table games
	(app_id      int not null,
	name         varchar(200) not null,
	genre        varchar(50) null,
	price_usd    float null,
	release_year int null,
	is_free      int null,
	primary key (app_id));

grant select on games to public;

create table reviews
	(app_id     int not null,
	metascore   float null,
	user_score  int null,
	primary key (app_id),
	foreign key (app_id) references games ON DELETE CASCADE);

grant select on reviews to public;

create table player_stats
	(app_id          int not null,
	ccu              int null,
	owners           varchar(30) null,
	avg_playtime_min int null,
	ccu_at_1yr       int null,
	ccu_peak         int null,
	primary key (app_id),
	foreign key (app_id) references games ON DELETE CASCADE);

grant select on player_stats to public;

insert into games
values(1172470, 'Apex Legends™', 'Action', 0.00, 2020, 1);
insert into games
values(1938090, 'Call of Duty®', 'Action', 0.00, 2022, 1);
insert into games
values(1203220, 'NARAKA: BLADEPOINT', 'MMO', 0.00, 2021, 1);
insert into games
values(1086940, 'Baldur''s Gate 3', 'Adventure', 47.99, 2023, 0);
insert into games
values(553850, 'HELLDIVERS™ 2', 'Action', 39.99, 2024, 0);
insert into games
values(2252570, 'Football Manager 2024', 'Sports', 59.99, 2023, 0);
insert into games
values(2669320, 'EA SPORTS FC™ 25', 'Sports', 69.99, 2024, 0);
insert into games
values(1245620, 'ELDEN RING', 'Action', 59.99, 2022, 0);
insert into games
values(2878980, 'NBA 2K25', 'Sports', 39.99, 2024, 0);
insert into games
values(1222670, 'The Sims™ 4', 'Adventure', 0.00, 2020, 1);
insert into games
values(1091500, 'Cyberpunk 2077', 'RPG', 29.99, 2020, 0);
insert into games
values(1599340, 'Lost Ark', 'MMO', 0.00, 2022, 1);
insert into games
values(2379780, 'Balatro', 'Casual', 14.99, 2024, 0);
insert into games
values(1142710, 'Total War: WARHAMMER III', 'Action', 59.99, 2022, 0);
insert into games
values(427520, 'Factorio', 'Casual', 35.00, 2020, 0);
insert into games
values(2358720, 'Black Myth: Wukong', 'Action', 59.99, 2024, 0);
insert into games
values(1364780, 'Street Fighter™ 6', 'Action', 59.99, 2023, 0);
insert into games
values(261550, 'Mount & Blade II: Bannerlord', 'Action', 49.99, 2022, 0);
insert into games
values(1158310, 'Crusader Kings III', 'RPG', 14.99, 2020, 0);
insert into games
values(526870, 'Satisfactory', 'Adventure', 39.99, 2024, 0);
insert into games
values(1604030, 'V Rising', 'MMO', 34.99, 2024, 0);
insert into games
values(1551360, 'Forza Horizon 5', 'Racing', 59.99, 2021, 0);
insert into games
values(2221490, 'Tom Clancy’s The Division® 2', 'Action', 9.99, 2023, 0);
insert into games
values(1237950, 'STAR WARS™ Battlefront™ II', 'Action', 9.99, 2020, 0);
insert into games
values(2344520, 'Diablo® IV', 'Action', 49.99, 2023, 0);
insert into games
values(1151340, 'Fallout 76', 'RPG', 39.99, 2020, 0);
insert into games
values(1466060, 'Tainted Grail: The Fall of Avalon', 'Action', 29.99, 2023, 0);
insert into games
values(632360, 'Risk of Rain 2', 'Action', 24.99, 2020, 0);
insert into games
values(1284190, 'The Planet Crafter', 'Adventure', 23.99, 2024, 0);
insert into games
values(1361210, 'Warhammer 40,000: Darktide', 'Action', 39.99, 2022, 0);
insert into games
values(1286830, 'STAR WARS™: The Old Republic™', 'MMO', 0.00, 2020, 1);
insert into games
values(1238810, 'Battlefield™ V', 'Action', 49.99, 2020, 0);
insert into games
values(1238840, 'Battlefield™ 1', 'MMO', 5.99, 2020, 0);
insert into games
values(899770, 'Last Epoch', 'Action', 34.99, 2024, 0);
insert into games
values(990080, 'Hogwarts Legacy', 'Action', 59.99, 2023, 0);
insert into games
values(1063730, 'New World: Aeternum', 'MMO', 59.99, 2021, 0);
insert into games
values(1248130, 'Farming Simulator 22', 'Simulation', 29.99, 2021, 0);
insert into games
values(949230, 'Cities: Skylines II', 'Simulation', 49.99, 2023, 0);
insert into games
values(548430, 'Deep Rock Galactic', 'Action', 9.89, 2020, 0);
insert into games
values(2707930, 'Palia', 'Adventure', 0.00, 2024, 1);
insert into games
values(2195250, 'EA SPORTS FC™ 24', 'Sports', 69.99, 2023, 0);
insert into games
values(1426210, 'It Takes Two', 'Action', 13.99, 2021, 0);
insert into games
values(1687950, 'Persona 5 Royal', 'RPG', 59.99, 2022, 0);
insert into games
values(239140, 'Dying Light', 'Action', 8.99, 2021, 0);
insert into games
values(1293830, 'Forza Horizon 4', 'Racing', 59.99, 2021, 0);
insert into games
values(529340, 'Victoria 3', 'Simulation', 49.99, 2022, 0);
insert into games
values(1326470, 'Sons Of The Forest', 'Action', 29.99, 2024, 0);
insert into games
values(1778820, 'TEKKEN 8', 'Action', 69.99, 2024, 0);
insert into games
values(1144200, 'Ready or Not', 'Action', 49.99, 2023, 0);
insert into games
values(1904540, 'Football Manager 2023', 'Sports', 0.00, 2022, 1);
insert into games
values(1888930, 'The Last of Us™ Part I', 'Action', 35.99, 2023, 0);
insert into games
values(1407200, 'World of Tanks', 'MMO', 0.00, 2021, 1);
insert into games
values(2050650, 'Resident Evil 4', 'Action', 39.99, 2023, 0);
insert into games
values(1304930, 'The Outlast Trials', 'Action', 39.99, 2024, 0);
insert into games
values(1716740, 'Starfield', 'RPG', 69.99, 2023, 0);
insert into games
values(1621690, 'Core Keeper', 'Adventure', 14.99, 2024, 0);
insert into games
values(1446780, 'MONSTER HUNTER RISE', 'Action', 9.99, 2022, 0);
insert into games
values(1401590, 'Disney Dreamlight Valley', 'Action', 39.99, 2023, 0);
insert into games
values(2186680, 'Warhammer 40,000: Rogue Trader', 'Adventure', 49.99, 2023, 0);
insert into games
values(686810, 'Hell Let Loose', 'MMO', 24.99, 2021, 0);
insert into games
values(1868140, 'DAVE THE DIVER', 'Adventure', 19.99, 2023, 0);
insert into games
values(1284210, 'Guild Wars 2', 'MMO', 0.00, 2022, 1);
insert into games
values(397540, 'Borderlands 3', 'Action', 59.99, 2020, 0);
insert into games
values(1465360, 'SnowRunner', 'Adventure', 29.99, 2021, 0);
insert into games
values(1260320, 'Party Animals', 'Action', 11.99, 2023, 0);
insert into games
values(933110, 'Age of Empires III: Definitive Edition', 'Strategy', 0.00, 2020, 1);
insert into games
values(1794680, 'Vampire Survivors', 'Action', 4.99, 2022, 0);
insert into games
values(1517290, 'Battlefield™ 2042', 'Action', 4.79, 2021, 0);
insert into games
values(2071280, 'Ravenswatch', 'Action', 24.99, 2024, 0);
insert into games
values(1290000, 'PowerWash Simulator', 'Casual', 24.99, 2022, 0);
insert into games
values(1190970, 'House Flipper 2', 'Casual', 39.99, 2023, 0);
insert into games
values(1384160, 'GUILTY GEAR -STRIVE-', 'Action', 39.99, 2021, 0);
insert into games
values(1328670, 'Mass Effect™ Legendary Edition', 'Action', 8.99, 2021, 0);
insert into games
values(962130, 'Grounded', 'Action', 39.99, 2022, 0);
insert into games
values(1774580, 'STAR WARS Jedi: Survivor™', 'Action', 24.49, 2023, 0);
insert into games
values(1222140, 'Detroit: Become Human', 'Action', 39.99, 2020, 0);
insert into games
values(1240440, 'Halo Infinite', 'Action', 0.00, 2021, 1);
insert into games
values(782330, 'DOOM Eternal', 'Action', 39.99, 2020, 0);
insert into games
values(1145360, 'Hades', 'Action', 9.99, 2020, 0);
insert into games
values(1677280, 'Company of Heroes 3', 'Action', 59.99, 2023, 0);
insert into games
values(304390, 'FOR HONOR™', 'Action', 29.99, 2024, 0);
insert into games
values(2488620, 'F1® 24', 'Racing', 69.99, 2024, 0);
insert into games
values(2215430, 'Ghost of Tsushima DIRECTOR''S CUT', 'Action', 59.99, 2024, 0);
insert into games
values(1167630, 'Teardown', 'Action', 29.99, 2022, 0);
insert into games
values(1145350, 'Hades II', 'Action', 29.99, 2024, 0);
insert into games
values(872410, 'ROMANCE OF THE THREE KINGDOMS XIV', 'Simulation', 59.99, 2020, 0);
insert into games
values(2679460, 'Metaphor: ReFantazio', 'Action', 69.99, 2024, 0);
insert into games
values(1569040, 'Football Manager 2022', 'Sports', 0.00, 2021, 1);
insert into games
values(2113850, 'Spirit City: Lofi Sessions', 'Casual', 11.99, 2024, 0);
insert into games
values(2157560, 'Granblue Fantasy Versus: Rising', 'Action', 49.99, 2023, 0);
insert into games
values(1669000, 'Age of Wonders 4', 'Strategy', 32.49, 2023, 0);
insert into games
values(2161700, 'Persona 3 Reload', 'Adventure', 69.99, 2024, 0);
insert into games
values(1876890, 'Wandering Sword', 'Adventure', 24.99, 2023, 0);
insert into games
values(699130, 'World War Z', 'Action', 29.99, 2021, 0);
insert into games
values(1527950, 'Wartales', 'Adventure', 34.99, 2023, 0);
insert into games
values(1850570, 'DEATH STRANDING DIRECTOR''S CUT', 'Action', 19.99, 2022, 0);
insert into games
values(1259420, 'Days Gone', 'Action', 49.99, 2021, 0);
insert into games
values(1282100, 'REMNANT II®', 'Action', 49.99, 2023, 0);
insert into games
values(1824220, 'Chivalry 2', 'MMO', 39.99, 2022, 0);
insert into games
values(1934680, 'Age of Mythology: Retold', 'Strategy', 23.99, 2024, 0);
insert into games
values(1029690, 'Sniper Elite 5', 'Action', 49.99, 2022, 0);
insert into games
values(1313140, 'Cult of the Lamb', 'Action', 24.99, 2022, 0);
insert into games
values(1084600, 'My Time at Sandrock', 'Adventure', 39.99, 2023, 0);
insert into games
values(1149460, 'ICARUS', 'Action', 17.49, 2021, 0);
insert into games
values(427410, 'Abiotic Factor', 'Action', 24.99, 2024, 0);
insert into games
values(1325200, 'Nioh 2 – The Complete Edition', 'Action', 49.99, 2021, 0);
insert into games
values(2231380, 'Tom Clancy''s Ghost Recon® Breakpoint', 'Action', 59.99, 2023, 0);
insert into games
values(1244460, 'Jurassic World Evolution 2', 'Simulation', 59.99, 2021, 0);
insert into games
values(1449560, 'Metro Exodus', 'Action', 29.99, 2020, 0);
insert into games
values(1222680, 'Need for Speed™ Heat', 'Racing', 10.49, 2020, 0);
insert into games
values(1593500, 'God of War', 'Action', 49.99, 2022, 0);
insert into games
values(2208920, 'Assassin''s Creed Valhalla', 'Action', 59.99, 2022, 0);
insert into games
values(1129580, 'Medieval Dynasty', 'Action', 34.99, 2021, 0);
insert into games
values(1627720, 'Lies of P', 'Action', 59.99, 2023, 0);
insert into games
values(1158160, 'Coral Island', 'Adventure', 29.99, 2023, 0);
insert into games
values(1506830, 'FIFA 22', 'Sports', 0.00, 2021, 1);
insert into games
values(1092790, 'Inscryption', 'Adventure', 7.99, 2021, 0);
insert into games
values(2321470, 'Deep Rock Galactic: Survivor', 'Action', 7.49, 2024, 0);
insert into games
values(924970, 'Back 4 Blood', 'Action', 59.99, 2021, 0);
insert into games
values(1196590, 'Resident Evil Village', 'Action', 15.99, 2021, 0);
insert into games
values(2591280, 'F1® Manager 2024', 'Simulation', 34.99, 2024, 0);
insert into games
values(2688950, 'Planet Coaster 2', 'Simulation', 49.99, 2024, 0);
insert into games
values(1147560, 'Skul: The Hero Slayer', 'Action', 19.99, 2021, 0);
insert into games
values(1817070, 'Marvel’s Spider-Man Remastered', 'Action', 59.99, 2022, 0);
insert into games
values(2666510, 'Rusty''s Retirement', 'Casual', 6.99, 2024, 0);
insert into games
values(1237970, 'Titanfall® 2', 'Action', 4.79, 2020, 0);
insert into games
values(1238860, 'Battlefield 4™', 'Action', 3.99, 2020, 0);
insert into games
values(1971870, 'Mortal Kombat 1', 'Action', 49.99, 2023, 0);
insert into games
values(1263850, 'Football Manager 2021', 'Sports', 0.00, 2020, 1);
insert into games
values(1940340, 'Darkest Dungeon® II', 'Indie', 39.99, 2023, 0);
insert into games
values(934700, 'Dead Island 2', 'Action', 49.99, 2024, 0);
insert into games
values(1888160, 'ARMORED CORE™ VI FIRES OF RUBICON™', 'Action', 59.99, 2023, 0);
insert into games
values(2420110, 'Horizon Forbidden West™ Complete Edition', 'Action', 59.99, 2024, 0);
insert into games
values(881020, 'Granblue Fantasy: Relink', 'Action', 59.99, 2024, 0);
insert into games
values(1044720, 'Farthest Frontier', 'Indie', 29.99, 2022, 0);
insert into games
values(1113000, 'Persona 4 Golden', 'RPG', 19.99, 2020, 0);
insert into games
values(1336490, 'Against the Storm', 'Simulation', 29.99, 2023, 0);
insert into games
values(1790600, 'DRAGON BALL: Sparking! ZERO', 'Action', 69.99, 2024, 0);
insert into games
values(1210320, 'Potion Craft: Alchemist Simulator', 'Indie', 19.99, 2022, 0);
insert into games
values(753640, 'Outer Wilds', 'Action', 24.99, 2020, 0);
insert into games
values(975370, 'Dwarf Fortress', 'Indie', 29.99, 2022, 0);
insert into games
values(362890, 'Black Mesa', 'Action', 19.99, 2020, 0);
insert into games
values(1286680, 'Tiny Tina''s Wonderlands', 'Action', 59.99, 2022, 0);
insert into games
values(2000950, 'Call of Duty®: Modern Warfare®', 'Action', 59.99, 2023, 0);
insert into games
values(1501750, 'Lords of the Fallen', 'Action', 29.99, 2023, 0);
insert into games
values(1845910, 'Dragon Age™: The Veilguard', 'Action', 59.99, 2024, 0);
insert into games
values(2835570, 'Buckshot Roulette', 'Action', 2.99, 2024, 0);
insert into games
values(2054970, 'Dragon''s Dogma 2', 'Action', 39.89, 2024, 0);
insert into games
values(885970, 'Total War: ROME REMASTERED', 'Strategy', 29.99, 2021, 0);
insert into games
values(1462040, 'FINAL FANTASY VII REMAKE INTERGRADE', 'Action', 69.99, 2022, 0);
insert into games
values(1718570, 'ASTLIBRA Revision', 'Action', 24.99, 2022, 0);
insert into games
values(2515020, 'FINAL FANTASY XVI', 'Action', 49.99, 2024, 0);
insert into games
values(920210, 'LEGO® Star Wars™: The Skywalker Saga', 'Action', 49.99, 2022, 0);
insert into games
values(1151640, 'Horizon Zero Dawn™ Complete Edition', 'Action', 0.00, 2020, 1);
insert into games
values(848450, 'Subnautica: Below Zero', 'Adventure', 29.99, 2021, 0);
insert into games
values(1057090, 'Ori and the Will of the Wisps', 'Action', 29.99, 2020, 0);
insert into games
values(1030840, 'Mafia: Definitive Edition', 'Action', 39.99, 2020, 0);
insert into games
values(1097150, 'Fall Guys', 'MMO', 0.00, 2020, 1);
insert into games
values(2072450, 'Like a Dragon: Infinite Wealth', 'Action', 69.99, 2024, 0);
insert into games
values(870780, 'Control Ultimate Edition', 'Action', 7.99, 2020, 0);
insert into games
values(1272080, 'PAYDAY 3', 'Action', 29.99, 2023, 0);
insert into games
values(1985810, 'Call of Duty®: Black Ops Cold War', 'Action', 59.99, 2023, 0);
insert into games
values(784080, 'MechWarrior 5: Mercenaries', 'Action', 29.99, 2021, 0);
insert into games
values(2369390, 'Far Cry® 6', 'Action', 59.99, 2023, 0);
insert into games
values(1809540, 'Nine Sols', 'Action', 29.99, 2024, 0);
insert into games
values(1846380, 'Need for Speed™ Unbound', 'Racing', 9.79, 2022, 0);
insert into games
values(1651560, 'Fabledom', 'Casual', 20.99, 2024, 0);
insert into games
values(1102190, 'Monster Train', 'Strategy', 24.99, 2020, 0);
insert into games
values(1054490, 'Wingspan', 'Indie', 19.99, 2020, 0);
insert into games
values(1213210, 'Command & Conquer™ Remastered Collection', 'Strategy', 5.99, 2020, 0);
insert into games
values(1072040, 'Panzer Corps 2', 'Strategy', 39.99, 2020, 0);
insert into games
values(1575940, 'Sins of a Solar Empire II', 'Simulation', 49.99, 2024, 0);
insert into games
values(1030830, 'Mafia II: Definitive Edition', 'Action', 29.99, 2020, 0);
insert into games
values(1324130, 'Stranded: Alien Dawn', 'Simulation', 34.99, 2023, 0);
insert into games
values(1601580, 'Frostpunk 2', 'Simulation', 44.99, 2024, 0);
insert into games
values(1562430, 'DREDGE', 'Adventure', 16.19, 2023, 0);
insert into games
values(2108330, 'F1® 23', 'Racing', 69.99, 2023, 0);
insert into games
values(2124490, 'SILENT HILL 2', 'Action', 69.99, 2024, 0);
insert into games
values(1244090, 'Sea of Stars', 'Adventure', 34.99, 2023, 0);
insert into games
values(2440510, 'Forza Motorsport', 'Racing', 69.99, 2023, 0);
insert into games
values(1451190, 'Undisputed', 'Sports', 49.99, 2024, 0);
insert into games
values(1332010, 'Stray', 'Adventure', 29.99, 2022, 0);
insert into games
values(850190, 'Goat Simulator 3', 'Adventure', 29.99, 2024, 0);
insert into games
values(597180, 'Old World', 'Simulation', 39.99, 2022, 0);
insert into games
values(1235140, 'Yakuza: Like a Dragon', 'Action', 19.99, 2020, 0);
insert into games
values(1659420, 'UNCHARTED™: Legacy of Thieves Collection', 'Adventure', 49.99, 2022, 0);
insert into games
values(668580, 'Atomic Heart', 'Action', 59.99, 2023, 0);
insert into games
values(1272320, 'Diplomacy is Not an Option', 'Indie', 29.99, 2024, 0);
insert into games
values(1222690, 'Dragon Age™ Inquisition', 'Action', 39.99, 2020, 0);
insert into games
values(1267540, 'WRC 9 FIA World Rally Championship', 'Racing', 29.99, 2021, 0);
insert into games
values(368260, 'Marvel''s Midnight Suns', 'RPG', 59.99, 2022, 0);
insert into games
values(694280, 'Zombie Army 4: Dead War', 'Action', 49.99, 2021, 0);
insert into games
values(1588010, 'PGA TOUR 2K23', 'Sports', 59.99, 2022, 0);
insert into games
values(780290, 'Gloomhaven', 'Adventure', 34.99, 2021, 0);
insert into games
values(756800, 'Contraband Police', 'Action', 29.99, 2023, 0);
insert into games
values(1265820, 'Fights in Tight Spaces', 'Action', 24.99, 2021, 0);
insert into games
values(1105670, 'The Last Spell', 'Action', 14.99, 2023, 0);
insert into games
values(1629520, 'A Little to the Left', 'Casual', 14.99, 2022, 0);
insert into games
values(1124300, 'HUMANKIND™', 'Strategy', 49.99, 2021, 0);
insert into games
values(1875830, 'Shin Megami Tensei V: Vengeance', 'Adventure', 59.99, 2024, 0);
insert into games
values(1488200, 'Symphony of War: The Nephilim Saga', 'Adventure', 19.99, 2022, 0);
insert into games
values(1458140, 'Pacific Drive', 'Racing', 20.99, 2024, 0);
insert into games
values(1637320, 'Dome Keeper', 'Action', 17.99, 2022, 0);
insert into games
values(1971650, 'OCTOPATH TRAVELER II', 'RPG', 59.99, 2023, 0);
insert into games
values(1096530, 'Solasta: Crown of the Magister', 'Adventure', 29.99, 2021, 0);
insert into games
values(2138710, 'Sifu', 'Action', 39.99, 2023, 0);
insert into games
values(1295500, 'Warhammer 40,000: Battlesector', 'Strategy', 39.99, 2021, 0);
insert into games
values(1817190, 'Marvel’s Spider-Man: Miles Morales', 'Action', 49.99, 2022, 0);
insert into games
values(1676840, 'For The King II', 'Adventure', 24.99, 2023, 0);
insert into games
values(1611910, 'Warhammer 40,000: Chaos Gate - Daemonhunters', 'RPG', 44.99, 2022, 0);
insert into games
values(2933130, 'The Lord of the Rings: Return to Moria™', 'Adventure', 24.99, 2024, 0);
insert into games
values(2291060, 'EARTH DEFENSE FORCE 6', 'Action', 59.99, 2024, 0);
insert into games
values(2231450, 'Pizza Tower', 'Action', 19.99, 2023, 0);
insert into games
values(1455840, 'Dorfromantik', 'Casual', 13.99, 2022, 0);
insert into games
values(1084160, 'Jagged Alliance 3', 'Action', 44.99, 2023, 0);
insert into games
values(760160, 'Vampire: The Masquerade - Bloodhunt', 'Action', 0.00, 2022, 1);
insert into games
values(952060, 'Resident Evil 3', 'Action', 9.99, 2020, 0);
insert into games
values(2218750, 'Halls of Torment', 'Action', 6.66, 2024, 0);
insert into games
values(1372110, 'JoJo''s Bizarre Adventure: All-Star Battle R', 'Action', 49.99, 2022, 0);
insert into games
values(2064650, 'Tower of Fantasy', 'MMO', 0.00, 2022, 1);
insert into games
values(1282730, 'Loop Hero', 'Indie', 14.99, 2021, 0);
insert into games
values(1433140, 'The Texas Chain Saw Massacre', 'Action', 19.99, 2023, 0);
insert into games
values(1245560, 'Roots of Pacha', 'Indie', 24.99, 2023, 0);
insert into games
values(1128920, 'EVERSPACE™ 2', 'Action', 19.99, 2023, 0);
insert into games
values(1357210, 'Galactic Civilizations IV', 'Simulation', 49.99, 2023, 0);
insert into games
values(1180660, 'Tell Me Why', 'Adventure', 19.99, 2020, 0);
insert into games
values(1127500, 'Mini Motorways', 'Casual', 9.99, 2021, 0);
insert into games
values(418530, 'Spelunky 2', 'Action', 19.99, 2020, 0);
insert into games
values(1693980, 'Dead Space', 'Action', 17.99, 2023, 0);
insert into games
values(493520, 'GTFO', 'Action', 39.99, 2021, 0);
insert into games
values(1785650, 'TopSpin 2K25', 'Sports', 59.99, 2024, 0);
insert into games
values(1071870, 'Biped', 'Sports', 14.99, 2020, 0);
insert into games
values(1583230, 'High On Life', 'Action', 25.99, 2022, 0);
insert into games
values(2315690, 'WWE 2K24', 'Sports', 29.99, 2024, 0);
insert into games
values(2198150, 'Tiny Glade', 'Casual', 13.49, 2024, 0);
insert into games
values(986130, 'Shadows of Doubt', 'Action', 24.99, 2024, 0);
insert into games
values(1268750, 'Starship Troopers: Extermination', 'Action', 49.99, 2024, 0);
insert into games
values(898750, 'Super Robot Wars 30', 'RPG', 59.99, 2021, 0);
insert into games
values(2005010, 'Warhammer 40,000: Boltgun', 'Action', 21.99, 2023, 0);
insert into games
values(1549970, 'Aliens: Fireteam Elite', 'Action', 29.99, 2021, 0);
insert into games
values(1150440, 'Aliens: Dark Descent', 'Action', 39.99, 2023, 0);
insert into games
values(1545560, 'Shadow Gambit: The Cursed Crew', 'Adventure', 39.99, 2023, 0);
insert into games
values(2840770, 'Avatar: Frontiers of Pandora™', 'Action', 34.99, 2024, 0);
insert into games
values(763890, 'Wildermyth', 'Indie', 24.99, 2021, 0);
insert into games
values(1161580, 'Hardspace: Shipbreaker', 'Simulation', 34.99, 2022, 0);
insert into games
values(2395210, 'Tony Hawk''s™ Pro Skater™ 1 + 2', 'Sports', 39.99, 2023, 0);
insert into games
values(2561580, 'Horizon Zero Dawn™ Remastered', 'Action', 49.99, 2024, 0);
insert into games
values(851850, 'DRAGON BALL Z: KAKAROT', 'Action', 59.99, 2020, 0);
insert into games
values(1222700, 'A Way Out', 'Action', 5.99, 2020, 0);
insert into games
values(861650, 'Session: Skate Sim', 'Sports', 39.99, 2022, 0);
insert into games
values(1782120, 'ZERO Sievert', 'Action', 19.99, 2024, 0);
insert into games
values(1135690, 'Unpacking', 'Casual', 19.99, 2021, 0);
insert into games
values(1672970, 'Minecraft Dungeons', 'Action', 19.99, 2021, 0);
insert into games
values(1207650, 'Suzerain', 'Adventure', 19.99, 2020, 0);
insert into games
values(1577120, 'The Quarry', 'Adventure', 59.99, 2022, 0);
insert into games
values(633230, 'NARUTO TO BORUTO: SHINOBI STRIKER', 'Action', 19.99, 2023, 0);
insert into games
values(2478970, 'Tomb Raider I-III Remastered Starring Lara Croft', 'Action', 29.99, 2024, 0);
insert into games
values(1218210, 'Coromon', 'Adventure', 19.99, 2022, 0);
insert into games
values(2187220, 'Apollo Justice: Ace Attorney Trilogy', 'Adventure', 29.99, 2024, 0);
insert into games
values(2853730, 'Skull and Bones', 'Action', 59.99, 2024, 0);
insert into games
values(1681430, 'RoboCop: Rogue City', 'Action', 49.99, 2023, 0);
insert into games
values(2140020, 'Stronghold: Definitive Edition', 'Simulation', 14.99, 2023, 0);
insert into games
values(1692250, 'F1® 22', 'Racing', 0.00, 2022, 1);
insert into games
values(2058190, 'Lost Judgment', 'Action', 59.99, 2022, 0);
insert into games
values(780310, 'The Riftbreaker', 'Action', 29.99, 2021, 0);
insert into games
values(1157390, 'King Arthur: Knight''s Tale', 'RPG', 44.99, 2022, 0);
insert into games
values(860510, 'Little Nightmares II', 'Adventure', 29.99, 2021, 0);
insert into games
values(1644320, 'Railway Empire 2', 'Simulation', 49.99, 2023, 0);
insert into games
values(2698940, 'The Crew Motorfest', 'Racing', 69.99, 2024, 0);
insert into games
values(1337520, 'Risk of Rain Returns', 'Action', 14.99, 2023, 0);
insert into games
values(1088850, 'Marvel''s Guardians of the Galaxy', 'Action', 59.99, 2021, 0);
insert into games
values(719040, 'Wasteland 3', 'RPG', 39.99, 2020, 0);
insert into games
values(1338770, 'Sniper Ghost Warrior Contracts 2', 'Action', 39.99, 2021, 0);
insert into games
values(1641960, 'Forever Skies', 'Action', 29.99, 2023, 0);
insert into games
values(979690, 'The Ascent', 'Action', 29.99, 2021, 0);
insert into games
values(960990, 'Beyond: Two Souls', 'Action', 19.99, 2020, 0);
insert into games
values(1735700, 'Back to the Dawn', 'Adventure', 19.99, 2023, 0);
insert into games
values(1259980, 'RIDE 4', 'Racing', 5.99, 2020, 0);
insert into games
values(1113560, 'NieR Replicant™ ver.1.22474487139...', 'Action', 59.99, 2021, 0);
insert into games
values(1937500, 'Let''s School', 'Casual', 19.99, 2023, 0);
insert into games
values(1262580, 'Need for Speed™ Payback', 'Racing', 7.49, 2020, 0);
insert into games
values(1496790, 'Gotham Knights', 'Action', 59.99, 2022, 0);
insert into games
values(2455640, 'Romancing SaGa 2: Revenge of the Seven', 'RPG', 49.99, 2024, 0);
insert into games
values(1605220, 'Dune: Spice Wars', 'Strategy', 34.99, 2023, 0);
insert into games
values(1321440, 'Cassette Beasts', 'Indie', 19.99, 2023, 0);
insert into games
values(2114740, 'Blasphemous 2', 'Action', 14.99, 2023, 0);
insert into games
values(546560, 'Half-Life: Alyx', 'Action', 59.99, 2020, 0);
insert into games
values(2058180, 'Judgment', 'Action', 39.99, 2022, 0);
insert into games
values(745920, 'Temtem', 'MMO', 44.99, 2022, 0);
insert into games
values(1382330, 'Persona® 5 Strikers', 'Action', 59.99, 2021, 0);
insert into games
values(960910, 'Heavy Rain', 'Action', 19.99, 2020, 0);
insert into games
values(1199030, 'Tainted Grail: Conquest', 'Action', 19.99, 2021, 0);
insert into games
values(1498570, 'THE KING OF FIGHTERS XV', 'Action', 59.99, 2022, 0);
insert into games
values(2239550, 'Watch Dogs®: Legion', 'Action', 59.99, 2023, 0);
insert into games
values(2000890, 'MechWarrior 5: Clans', 'Action', 49.99, 2024, 0);
insert into games
values(874390, 'The Battle of Polytopia', 'Action', 14.99, 2020, 0);
insert into games
values(2401970, 'Ace Attorney Investigations Collection', 'Adventure', 39.99, 2024, 0);
insert into games
values(1089090, 'ONE PIECE: PIRATE WARRIORS 4', 'Action', 39.99, 2020, 0);
insert into games
values(1649080, 'Two Point Campus', 'Casual', 29.99, 2022, 0);
insert into games
values(736820, 'Knights of Honor II: Sovereign', 'Simulation', 44.99, 2022, 0);
insert into games
values(1487210, 'Super Mega Baseball™ 4', 'Sports', 14.99, 2023, 0);
insert into games
values(1451090, 'Tactics Ogre: Reborn', 'RPG', 49.99, 2022, 0);
insert into games
values(1280930, 'Astral Ascent', 'Action', 24.99, 2023, 0);
insert into games
values(990630, 'The Last Campfire', 'Adventure', 14.99, 2021, 0);
insert into games
values(1341290, 'We Were Here Forever', 'Adventure', 8.99, 2022, 0);
insert into games
values(1016920, 'Unrailed!', 'Action', 19.99, 2020, 0);
insert into games
values(740130, 'Tales of Arise', 'Action', 39.99, 2021, 0);
insert into games
values(1369630, 'ENDER LILIES: Quietus of the Knights', 'Action', 24.99, 2021, 0);
insert into games
values(1896700, 'Wylde Flowers', 'Adventure', 24.99, 2022, 0);
insert into games
values(1351080, 'Pharaoh™: A New Era', 'Simulation', 14.94, 2023, 0);
insert into games
values(680420, 'OUTRIDERS', 'Action', 19.99, 2021, 0);
insert into games
values(1062810, 'Inkbound', 'RPG', 17.99, 2024, 0);
insert into games
values(839770, 'Phoenix Point', 'RPG', 24.99, 2020, 0);
insert into games
values(2725260, 'ENDER MAGNOLIA: Bloom in the Mist', 'Action', 19.99, 2024, 0);
insert into games
values(1426450, 'Age of Darkness: Final Stand', 'Strategy', 27.99, 2021, 0);
insert into games
values(1158850, 'The Great Ace Attorney Chronicles', 'Adventure', 15.99, 2021, 0);
insert into games
values(1139900, 'Ghostrunner', 'Action', 8.99, 2020, 0);
insert into games
values(2290180, 'Riders Republic', 'MMO', 39.99, 2023, 0);
insert into games
values(1205970, 'MX vs ATV Legends', 'Racing', 39.99, 2022, 0);
insert into games
values(1253920, 'Rogue Legacy 2', 'Action', 24.99, 2022, 0);
insert into games
values(814370, 'Monster Sanctuary', 'Action', 7.49, 2020, 0);
insert into games
values(1121640, 'The Wandering Village', 'Simulation', 18.74, 2022, 0);
insert into games
values(1147860, 'UFO 50', 'Action', 24.99, 2024, 0);
insert into games
values(2084000, 'Shogun Showdown', 'Indie', 11.99, 2024, 0);
insert into games
values(1202130, 'Starship Troopers: Terran Command', 'Strategy', 29.99, 2022, 0);
insert into games
values(3035570, 'Assassin''s Creed Mirage', 'Action', 49.99, 2024, 0);
insert into games
values(2155180, 'Pioneers of Pagonia', 'Simulation', 29.99, 2023, 0);
insert into games
values(788100, 'Neon Abyss', 'Action', 4.99, 2020, 0);
insert into games
values(1522820, 'Orcs Must Die! 3', 'Action', 29.99, 2021, 0);
insert into games
values(1536620, 'Galactic Glitch', 'Action', 12.99, 2024, 0);
insert into games
values(1533420, 'Neon White', 'Action', 24.99, 2022, 0);
insert into games
values(1562700, 'SANABI', 'Action', 14.99, 2023, 0);
insert into games
values(2933080, 'Crime Boss: Rockay City', 'Action', 13.99, 2024, 0);
insert into games
values(1043810, 'Tactical Breach Wizards', 'Adventure', 19.99, 2024, 0);
insert into games
values(315210, 'Suicide Squad: Kill the Justice League', 'Action', 69.99, 2024, 0);
insert into games
values(1448440, 'Wo Long: Fallen Dynasty', 'Action', 39.99, 2023, 0);
insert into games
values(700600, 'Evil Genius 2: World Domination', 'Simulation', 39.99, 2021, 0);
insert into games
values(578650, 'The Outer Worlds', 'RPG', 29.99, 2020, 0);
insert into games
values(1556790, 'Isonzo', 'MMO', 29.99, 2022, 0);
insert into games
values(1931770, 'Chants of Sennaar', 'Adventure', 19.99, 2023, 0);
insert into games
values(835960, 'The Talos Principle 2', 'Action', 29.99, 2023, 0);
insert into games
values(1887840, 'Another Crab''s Treasure', 'Action', 29.99, 2024, 0);
insert into games
values(1484280, 'Demeo', 'Adventure', 39.99, 2021, 0);
insert into games
values(257420, 'Serious Sam 4', 'Action', 39.99, 2020, 0);
insert into games
values(1466640, 'Road 96 🛣️', 'Action', 19.96, 2021, 0);
insert into games
values(1237320, 'Sonic Frontiers', 'Action', 59.99, 2022, 0);
insert into games
values(2076010, 'UNDER NIGHT IN-BIRTH II Sys:Celes', 'Action', 49.99, 2024, 0);
insert into games
values(1353230, 'Bomb Rush Cyberfunk', 'Action', 39.99, 2023, 0);
insert into games
values(2996040, 'Teenage Mutant Ninja Turtles: Splintered Fate', 'Action', 26.99, 2024, 0);
insert into games
values(1182900, 'A Plague Tale: Requiem', 'Action', 49.99, 2022, 0);
insert into games
values(1556100, 'Killer Klowns from Outer Space: The Game', 'Action', 39.99, 2024, 0);
insert into games
values(1574580, 'Strange Horticulture', 'Adventure', 15.99, 2022, 0);
insert into games
values(1262560, 'Need for Speed™ Most Wanted', 'Racing', 4.99, 2020, 0);
insert into games
values(1113120, 'IXION', 'Indie', 34.99, 2022, 0);
insert into games
values(1337760, 'Potion Permit', 'Action', 19.99, 2022, 0);
insert into games
values(1531540, 'Distant Worlds 2', 'Simulation', 49.99, 2022, 0);
insert into games
values(1378990, 'Crash Bandicoot™ 4: It’s About Time', 'Action', 39.99, 2022, 0);
insert into games
values(629820, 'Maneater', 'Action', 39.99, 2021, 0);
insert into games
values(1262540, 'Need for Speed™', 'Racing', 7.49, 2020, 0);
insert into games
values(867210, 'Songs of Conquest', 'Adventure', 34.99, 2024, 0);
insert into games
values(2229870, 'Command & Conquer™ Generals', 'Action', 0.00, 2024, 1);
insert into games
values(1164940, 'Trepang2', 'Action', 19.99, 2023, 0);
insert into games
values(1249970, 'Test Drive Unlimited Solar Crown', 'MMO', 49.99, 2024, 0);
insert into games
values(793460, '112 Operator', 'Indie', 24.99, 2020, 0);
insert into games
values(1277400, 'Monster Hunter Stories 2: Wings of Ruin', 'Adventure', 29.99, 2021, 0);
insert into games
values(1581770, 'SpellForce: Conquest of Eo', 'RPG', 29.99, 2023, 0);
insert into games
values(610370, 'Desperados III', 'Strategy', 39.99, 2020, 0);
insert into games
values(1643310, 'Dungeons 4', 'Simulation', 49.99, 2023, 0);
insert into games
values(1328660, 'Need for Speed™ Hot Pursuit Remastered', 'Racing', 7.49, 2020, 0);
insert into games
values(1041720, 'Kingdoms of Amalur: Re-Reckoning', 'Action', 39.99, 2020, 0);
insert into games
values(1458100, 'Cozy Grove', 'Casual', 14.99, 2021, 0);
insert into games
values(553420, 'TUNIC', 'Action', 29.99, 2022, 0);
insert into games
values(1811990, 'Wildfrost', 'Indie', 13.99, 2023, 0);
insert into games
values(858820, 'Tribes of Midgard', 'Action', 19.99, 2021, 0);
insert into games
values(1684350, 'The Thaumaturge', 'Adventure', 34.99, 2024, 0);
insert into games
values(807120, 'Iratus: Lord of the Dead', 'Indie', 29.99, 2020, 0);
insert into games
values(1658280, 'Eiyuden Chronicle: Hundred Heroes', 'Action', 32.49, 2024, 0);
insert into games
values(1408610, 'Call of the Wild: The Angler™', 'Sports', 14.99, 2022, 0);
insert into games
values(1065310, 'Evil West', 'Action', 49.99, 2022, 0);
insert into games
values(1262350, 'SIGNALIS', 'Action', 19.99, 2022, 0);
insert into games
values(1547890, 'Let''s Build a Zoo', 'Simulation', 7.99, 2021, 0);
insert into games
values(1262240, 'Plants vs. Zombies: Battle for Neighborville™', 'Action', 9.89, 2020, 0);
insert into games
values(1658150, 'Moonstone Island', 'Adventure', 19.99, 2023, 0);
insert into games
values(757320, 'Atomicrops', 'Action', 14.99, 2020, 0);
insert into games
values(1805480, 'Like a Dragon: Ishin!', 'Action', 59.99, 2023, 0);
insert into games
values(536270, 'Ancestors: The Humankind Odyssey', 'Action', 39.99, 2020, 0);
insert into games
values(377300, 'Thunder Tier One', 'Action', 19.99, 2021, 0);
insert into games
values(1585180, 'Drova - Forsaken Kin', 'Action', 24.99, 2024, 0);
insert into games
values(1229240, 'Chained Echoes', 'Indie', 24.99, 2022, 0);
insert into games
values(1963570, 'Cuisineer', 'Action', 17.49, 2023, 0);
insert into games
values(1951410, 'WE ARE FOOTBALL 2024', 'Sports', 24.79, 2024, 0);
insert into games
values(1649950, 'News Tower', 'Simulation', 19.99, 2024, 0);
insert into games
values(837470, 'Untitled Goose Game', 'Action', 19.99, 2020, 0);
insert into games
values(2751000, 'Prince of Persia The Lost Crown', 'Action', 39.99, 2024, 0);
insert into games
values(1003590, 'Tetris® Effect: Connected', 'Casual', 19.99, 2021, 0);
insert into games
values(970830, 'The Dungeon Of Naheulbeuk: The Amulet Of Chaos', 'Action', 34.99, 2020, 0);
insert into games
values(1593030, 'Terra Nil', 'Casual', 24.99, 2023, 0);
insert into games
values(933820, 'Endzone - A World Apart', 'Indie', 4.49, 2021, 0);
insert into games
values(656350, 'UnderMine', 'Action', 19.99, 2020, 0);
insert into games
values(1475810, 'Ghostwire: Tokyo', 'Action', 59.99, 2022, 0);
insert into games
values(2230110, 'Fae Farm', 'Action', 29.99, 2023, 0);
insert into games
values(607080, 'Psychonauts 2', 'Action', 59.99, 2021, 0);
insert into games
values(1211630, 'The Jackbox Party Pack 7', 'Casual', 29.99, 2020, 0);
insert into games
values(674140, 'Bugsnax', 'Action', 24.99, 2022, 0);
insert into games
values(1099410, 'A Total War Saga: TROY', 'Action', 49.99, 2021, 0);
insert into games
values(1351240, 'Taxi Life: A City Driving Simulator', 'Simulation', 29.99, 2024, 0);
insert into games
values(1895880, 'Ratchet & Clank: Rift Apart', 'Action', 59.99, 2023, 0);
insert into games
values(1163550, 'Captain Tsubasa: Rise of New Champions', 'Sports', 9.99, 2020, 0);
insert into games
values(826630, 'Iron Harvest', 'Strategy', 29.99, 2020, 0);
insert into games
values(1701520, 'Afterimage', 'Action', 24.99, 2023, 0);
insert into games
values(1740720, 'Have a Nice Death', 'Action', 24.99, 2023, 0);
insert into games
values(1094520, 'Sands of Salzaar', 'Adventure', 14.99, 2021, 0);
insert into games
values(1238820, 'Battlefield 3™', 'Action', 5.99, 2020, 0);
insert into games
values(682990, 'Drug Dealer Simulator', 'Action', 19.99, 2020, 0);
insert into games
values(1574820, 'Until Then', 'Adventure', 19.99, 2024, 0);
insert into games
values(1388590, 'Yakuza 6: The Song of Life', 'Action', 19.99, 2021, 0);
insert into games
values(1850510, 'TRIANGLE STRATEGY', 'RPG', 59.99, 2022, 0);
insert into games
values(1817230, 'Hi-Fi RUSH', 'Action', 29.99, 2023, 0);
insert into games
values(1985820, 'Call of Duty®: Vanguard', 'Action', 59.99, 2023, 0);
insert into games
values(1493640, 'Banishers: Ghosts of New Eden', 'Action', 49.99, 2024, 0);
insert into games
values(482400, 'System Shock', 'Action', 15.99, 2023, 0);
insert into games
values(2172010, 'Until Dawn™', 'Adventure', 59.99, 2024, 0);
insert into games
values(1123770, 'Curse of the Dead Gods', 'Action', 19.99, 2021, 0);
insert into games
values(1649240, 'Returnal™', 'Action', 59.99, 2023, 0);
insert into games
values(1413480, 'Shin Megami Tensei III Nocturne HD Remaster', 'RPG', 49.99, 2021, 0);
insert into games
values(1715130, 'Crysis Remastered', 'Action', 29.99, 2021, 0);
insert into games
values(1656780, 'Hero''s Hour', 'RPG', 17.99, 2022, 0);
insert into games
values(2138610, 'The Legend of Heroes: Trails through Daybreak', 'Action', 47.99, 2023, 0);
insert into games
values(1238060, 'Dead Space™ 3', 'Action', 3.99, 2020, 0);
insert into games
values(1382070, 'Viewfinder', 'Adventure', 24.99, 2023, 0);
insert into games
values(1295920, 'The Mortuary Assistant', 'Adventure', 24.99, 2022, 0);
insert into games
values(1020790, 'NARUTO X BORUTO Ultimate Ninja STORM CONNECTIONS', 'Action', 49.29, 2023, 0);
insert into games
values(2703850, 'Rooftops & Alleys: The Parkour Game', 'Sports', 15.99, 2024, 0);
insert into games
values(1222730, 'STAR WARS™: Squadrons', 'Action', 7.99, 2020, 0);
insert into games
values(2287220, 'F1® Manager 2023', 'Simulation', 54.99, 2023, 0);
insert into games
values(1677350, 'EA SPORTS™ PGA TOUR™', 'Sports', 9.79, 2023, 0);
insert into games
values(2375550, 'Like a Dragon Gaiden: The Man Who Erased His Name', 'Action', 24.99, 2023, 0);
insert into games
values(1624540, 'Storyteller', 'Adventure', 14.99, 2023, 0);
insert into games
values(1388880, 'Doki Doki Literature Club Plus!', 'Casual', 14.99, 2021, 0);
insert into games
values(2221920, 'Immortals Fenyx Rising', 'Action', 39.99, 2022, 0);
insert into games
values(1839950, 'Terminator: Dark Fate - Defiance', 'Strategy', 39.99, 2024, 0);
insert into games
values(1983260, 'Dungeons of Hinterberg', 'Action', 29.99, 2024, 0);
insert into games
values(813230, 'ANIMAL WELL', 'Action', 24.99, 2024, 0);
insert into games
values(2052040, 'Golden Lap', 'Racing', 14.99, 2024, 0);
insert into games
values(601840, 'Griftlands', 'Indie', 19.99, 2021, 0);
insert into games
values(1177980, 'Little Kitty, Big City', 'Adventure', 17.49, 2024, 0);
insert into games
values(1703340, 'The Stanley Parable: Ultra Deluxe', 'Adventure', 24.99, 2022, 0);
insert into games
values(1260520, 'Patrick''s Parabox', 'Casual', 19.99, 2022, 0);
insert into games
values(2272900, 'Mirthwood', 'RPG', 22.49, 2024, 0);
insert into games
values(1220140, 'Cartel Tycoon', 'Action', 29.99, 2022, 0);
insert into games
values(1252330, 'DEATHLOOP', 'Action', 59.99, 2021, 0);
insert into games
values(973810, 'Journey To The Savage Planet', 'Action', 8.99, 2021, 0);
insert into games
values(2750080, 'The Settlers: New Allies', 'Strategy', 59.99, 2024, 0);
insert into games
values(987840, 'Expeditions: Rome', 'RPG', 44.99, 2022, 0);
insert into games
values(985890, 'Streets of Rage 4', 'Action', 9.99, 2020, 0);
insert into games
values(1148760, 'I Was a Teenage Exocolonist', 'Indie', 12.49, 2022, 0);
insert into games
values(1179580, 'KAKU: Ancient Seal', 'Action', 24.99, 2024, 0);
insert into games
values(742420, 'Saints Row', 'Action', 29.99, 2023, 0);
insert into games
values(1469610, 'Last Train Home', 'Strategy', 39.99, 2023, 0);
insert into games
values(2369900, 'Castlevania Dominus Collection', 'Action', 24.99, 2024, 0);
insert into games
values(1902690, 'Fate/Samurai Remnant', 'Action', 59.99, 2023, 0);
insert into games
values(1227690, 'Severed Steel', 'Action', 24.99, 2021, 0);
insert into games
values(1128860, 'Men of War II', 'Action', 44.99, 2024, 0);
insert into games
values(2475490, 'Mouthwashing', 'Adventure', 12.99, 2024, 0);
insert into games
values(882100, 'XCOM®: Chimera Squad', 'Strategy', 19.99, 2020, 0);
insert into games
values(803050, 'Per Aspera', 'Indie', 29.99, 2020, 0);
insert into games
values(1874170, 'Shredders', 'Sports', 29.99, 2022, 0);
insert into games
values(1257290, 'Atelier Ryza 2: Lost Legends & the Secret Fairy', 'RPG', 59.99, 2021, 0);
insert into games
values(2477340, 'Expeditions: A MudRunner Game', 'Racing', 39.99, 2024, 0);
insert into games
values(1672500, 'GUNDAM BREAKER 4', 'Action', 59.99, 2024, 0);
insert into games
values(2396240, 'SteamWorld Heist II', 'Indie', 29.99, 2024, 0);
insert into games
values(1049410, 'Superliminal', 'Action', 19.99, 2020, 0);
insert into games
values(1150530, 'Wizard with a Gun', 'Action', 24.99, 2023, 0);
insert into games
values(790710, 'World of Warplanes', 'MMO', 0.00, 2022, 1);
insert into games
values(2144740, 'Ghostrunner 2', 'Action', 15.99, 2023, 0);
insert into games
values(2109370, 'The Great War: Western Front™', 'Strategy', 34.99, 2023, 0);
insert into games
values(2436570, 'DRAGON QUEST BUILDERS', 'Action', 27.99, 2024, 0);
insert into games
values(2296990, 'We Were Here Expeditions: The FriendShip', 'Adventure', 1.99, 2023, 0);
insert into games
values(1702330, 'Rune Factory 5', 'Adventure', 15.99, 2022, 0);
insert into games
values(1587130, 'Blood West', 'Action', 24.99, 2023, 0);
insert into games
values(1590910, 'Forgive Me Father', 'Action', 19.99, 2022, 0);
insert into games
values(900040, 'ELEX II', 'Action', 49.99, 2022, 0);
insert into games
values(1944430, 'Amnesia: The Bunker', 'Action', 24.99, 2023, 0);
insert into games
values(774181, 'Rhythm Doctor', 'Indie', 14.39, 2021, 0);
insert into games
values(1276760, 'DRAGON BALL: THE BREAKERS', 'Action', 19.99, 2022, 0);
insert into games
values(1608070, 'CRISIS CORE –FINAL FANTASY VII– REUNION', 'Action', 49.99, 2022, 0);
insert into games
values(1580240, 'Rune Factory 4 Special', 'RPG', 8.99, 2021, 0);
insert into games
values(1602010, 'Persona 4 Arena Ultimax', 'Action', 29.99, 2022, 0);
insert into games
values(1040230, 'Curious Expedition 2', 'Adventure', 19.99, 2021, 0);
insert into games
values(1374840, 'Dark Deity', 'Adventure', 24.99, 2021, 0);
insert into games
values(775500, 'SCARLET NEXUS', 'Action', 59.99, 2021, 0);
insert into games
values(758870, 'Kynseed', 'Adventure', 24.99, 2022, 0);
insert into games
values(978300, 'Saints Row®: The Third™ Remastered', 'Action', 29.99, 2021, 0);
insert into games
values(2603020, 'Citadelum', 'Indie', 24.99, 2024, 0);
insert into games
values(1274600, 'The Last Faith', 'Action', 27.99, 2023, 0);
insert into games
values(1939970, 'Nobody Wants to Die', 'Adventure', 24.99, 2024, 0);
insert into games
values(2008920, 'Lorelei and the Laser Eyes', 'Adventure', 24.99, 2024, 0);
insert into games
values(1307710, 'GRID Legends', 'Racing', 11.99, 2022, 0);
insert into games
values(1237980, 'STAR WARS™ Battlefront', 'Action', 4.99, 2020, 0);
insert into games
values(1818750, 'MultiVersus', 'Action', 0.00, 2022, 1);
insert into games
values(1874490, 'Potionomics', 'Indie', 19.99, 2022, 0);
insert into games
values(1024650, 'Port Royale 4', 'Simulation', 39.99, 2020, 0);
insert into games
values(918570, 'Century: Age of Ashes', 'Racing', 0.00, 2021, 1);
insert into games
values(894020, 'Death''s Door', 'Action', 19.99, 2021, 0);
insert into games
values(969990, 'SpongeBob SquarePants: Battle for Bikini Bottom - Rehydrated', 'Action', 29.99, 2020, 0);
insert into games
values(1358700, 'STRANGER OF PARADISE FINAL FANTASY ORIGIN', 'Action', 39.99, 2023, 0);
insert into games
values(1796220, 'Laika: Aged Through Blood', 'Action', 19.99, 2023, 0);
insert into games
values(1677770, 'The Case of the Golden Idol', 'Adventure', 17.99, 2022, 0);
insert into games
values(874260, 'The Forgotten City', 'Adventure', 24.99, 2021, 0);
insert into games
values(1434950, 'HighFleet', 'Action', 19.49, 2021, 0);
insert into games
values(936790, 'Life is Strange: True Colors', 'Action', 59.99, 2021, 0);
insert into games
values(1515210, 'The Past Within', 'Adventure', 5.99, 2022, 0);
insert into games
values(1202200, 'Paleo Pines', 'Adventure', 29.99, 2023, 0);
insert into games
values(1361510, 'Teenage Mutant Ninja Turtles: Shredder''s Revenge', 'Action', 16.24, 2022, 0);
insert into games
values(604540, 'Empire of Sin', 'RPG', 39.99, 2020, 0);
insert into games
values(2634890, 'MARVEL vs. CAPCOM Fighting Collection: Arcade Classics', 'Action', 49.99, 2024, 0);
insert into games
values(1712350, 'Riven', 'Adventure', 34.99, 2024, 0);
insert into games
values(907650, 'Stronghold: Warlords', 'Simulation', 39.99, 2021, 0);
insert into games
values(1760250, 'Madden NFL 23', 'Sports', 0.00, 2022, 1);
insert into games
values(893850, 'THE LONGING', 'Adventure', 11.24, 2020, 0);
insert into games
values(1668510, 'The Legend of Heroes: Trails from Zero', 'RPG', 27.99, 2022, 0);
insert into games
values(1227530, 'Partisans 1941', 'Indie', 29.99, 2020, 0);
insert into games
values(981430, 'Gordian Quest', 'Adventure', 19.99, 2022, 0);
insert into games
values(897450, 'The Survivalists', 'Action', 24.99, 2020, 0);
insert into games
values(2380050, 'Star Trucker', 'Simulation', 19.99, 2024, 0);
insert into games
values(1623070, 'Master of Magic', 'Indie', 39.99, 2022, 0);
insert into games
values(977880, 'Eastward', 'Action', 24.99, 2021, 0);
insert into games
values(1422440, 'Cataclismo', 'Simulation', 29.99, 2024, 0);
insert into games
values(1480560, 'Lawn Mowing Simulator', 'Simulation', 19.99, 2021, 0);
insert into games
values(2272250, 'Forgive Me Father 2', 'Action', 24.99, 2024, 0);
insert into games
values(1276790, 'Ruined King: A League of Legends Story™', 'Indie', 29.99, 2021, 0);
insert into games
values(1225570, 'Unravel Two', 'Action', 4.99, 2020, 0);
insert into games
values(1544020, 'The Callisto Protocol™', 'Action', 59.99, 2022, 0);
insert into games
values(2067050, 'Squirrel with a Gun', 'Action', 19.99, 2024, 0);
insert into games
values(1599660, 'Sackboy™: A Big Adventure', 'Adventure', 59.99, 2022, 0);
insert into games
values(1061910, 'Metal: Hellsinger', 'Action', 9.89, 2022, 0);
insert into games
values(1069160, 'SKALD: Against the Black Priory', 'Indie', 11.99, 2024, 0);
insert into games
values(2638370, 'Five Nights at Freddy''s: Into the Pit', 'Action', 19.99, 2024, 0);
insert into games
values(1184050, 'Gears Tactics', 'Strategy', 29.99, 2020, 0);
insert into games
values(1178830, 'Bright Memory: Infinite', 'Action', 19.99, 2021, 0);
insert into games
values(550320, 'art of rally', 'Racing', 24.99, 2020, 0);
insert into games
values(1030210, 'Torchlight III', 'Action', 39.99, 2020, 0);
insert into games
values(1281590, 'The Dark Pictures Anthology: House of Ashes', 'Adventure', 29.99, 2021, 0);
insert into games
values(2021880, 'Ara: History Untold', 'Strategy', 59.99, 2024, 0);
insert into games
values(2527390, 'Dead Rising Deluxe Remaster', 'Action', 49.99, 2024, 0);
insert into games
values(953490, 'CARRION', 'Action', 19.99, 2020, 0);
insert into games
values(1954200, 'Kena: Bridge of Spirits', 'Action', 39.99, 2022, 0);
insert into games
values(1076200, 'Roguebook', 'Adventure', 24.99, 2021, 0);
insert into games
values(1794960, 'Sonic Origins', 'Action', 29.99, 2022, 0);
insert into games
values(1716120, 'Monster Rancher 1 & 2 DX', 'RPG', 29.99, 2021, 0);
insert into games
values(1268590, 'Millennia', 'Simulation', 39.99, 2024, 0);
insert into games
values(2356560, 'Monster Hunter Stories', 'RPG', 23.99, 2024, 0);
insert into games
values(1436700, 'Trine 5: A Clockwork Conspiracy', 'Action', 29.99, 2023, 0);
insert into games
values(1262600, 'Need for Speed™ Rivals', 'Racing', 9.99, 2020, 0);
insert into games
values(1446650, 'BRAVELY DEFAULT II', 'Adventure', 59.99, 2021, 0);
insert into games
values(1386780, 'City of Gangsters', 'Simulation', 29.99, 2021, 0);
insert into games
values(1755910, 'Capcom Arcade 2nd Stadium', 'Action', 0.00, 2022, 1);
insert into games
values(1668540, 'The Legend of Heroes: Trails into Reverie', 'RPG', 38.99, 2023, 0);
insert into games
values(1556200, 'Predator: Hunting Grounds', 'Action', 19.99, 2021, 0);
insert into games
values(2637990, 'Duck Detective: The Secret Salami', 'Adventure', 9.99, 2024, 0);
insert into games
values(1771980, 'The Operator', 'Adventure', 11.89, 2024, 0);
insert into games
values(1582650, 'Caravan SandWitch', 'Adventure', 24.99, 2024, 0);
insert into games
values(1136370, 'Bear and Breakfast', 'Adventure', 19.99, 2022, 0);
insert into games
values(1668520, 'The Legend of Heroes: Trails to Azure', 'RPG', 39.99, 2023, 0);
insert into games
values(1272160, 'The Life and Suffering of Sir Brante', 'Adventure', 19.99, 2021, 0);
insert into games
values(1340480, 'The Cosmic Wheel Sisterhood', 'Adventure', 8.99, 2023, 0);
insert into games
values(1170080, 'Foretales', 'Adventure', 19.99, 2022, 0);
insert into games
values(1552350, 'The Jackbox Party Pack 8', 'Casual', 29.99, 2021, 0);
insert into games
values(1233570, 'Mirror''s Edge™ Catalyst', 'Action', 4.99, 2020, 0);
insert into games
values(988910, 'Super Mega Baseball 3', 'Sports', 44.99, 2020, 0);
insert into games
values(1205520, 'Pentiment', 'Adventure', 19.99, 2022, 0);
insert into games
values(1283410, 'Tails of Iron', 'Action', 24.99, 2021, 0);
insert into games
values(750130, 'The Sinking City', 'Action', 39.99, 2021, 0);
insert into games
values(1567020, 'The Dark Pictures Anthology: The Devil in Me', 'Adventure', 39.99, 2022, 0);
insert into games
values(2071500, 'Islands of Insight', 'Adventure', 29.99, 2024, 0);
insert into games
values(1194630, 'The Dark Pictures Anthology: Little Hope', 'Adventure', 19.99, 2020, 0);
insert into games
values(956030, 'Creaks', 'Adventure', 4.99, 2020, 0);
insert into games
values(1937780, 'Total War: PHARAOH', 'Action', 39.99, 2023, 0);
insert into games
values(1675830, '1000xRESIST', 'Adventure', 15.99, 2024, 0);
insert into games
values(738520, 'Breathedge', 'Action', 24.99, 2021, 0);
insert into games
values(1939160, 'Shadows Over Loathing', 'Adventure', 22.99, 2022, 0);
insert into games
values(1356670, 'Sakuna: Of Rice and Ruin', 'Action', 14.99, 2020, 0);
insert into games
values(1967430, 'Ghost Trick: Phantom Detective', 'Action', 14.99, 2023, 0);
insert into games
values(1395030, 'Kathy Rain: Director''s Cut', 'Adventure', 14.99, 2021, 0);
insert into games
values(597820, 'BIOMUTANT', 'Action', 39.99, 2021, 0);
insert into games
values(2741560, 'SimCity™ 3000 Unlimited', 'Casual', 2.49, 2024, 0);
insert into games
values(895620, 'Spellcaster University', 'Simulation', 24.99, 2021, 0);
insert into games
values(1578650, 'Citizen Sleeper', 'Adventure', 19.99, 2022, 0);
insert into games
values(1812090, 'Escape Academy', 'Adventure', 19.99, 2022, 0);
insert into games
values(1140270, 'Monster Prom 2: Monster Camp', 'Indie', 11.99, 2020, 0);
insert into games
values(466630, 'The Pedestrian', 'Adventure', 19.99, 2020, 0);
insert into games
values(2012510, 'Stormgate', 'Action', 0.00, 2024, 1);
insert into games
values(1115690, 'Yes, Your Grace', 'Adventure', 4.99, 2020, 0);
insert into games
values(1355090, 'RAILGRADE', 'Simulation', 29.99, 2023, 0);
insert into games
values(1123050, 'GRIME', 'Action', 24.99, 2021, 0);
insert into games
values(1874000, 'Life is Strange: Double Exposure', 'Action', 49.99, 2024, 0);
insert into games
values(1282150, 'SpongeBob SquarePants: The Cosmic Shake', 'Action', 39.99, 2023, 0);
insert into games
values(2370170, 'EARTH DEFENSE FORCE: WORLD BROTHERS 2', 'Action', 49.99, 2024, 0);
insert into games
values(2510710, 'Kunitsu-Gami: Path of the Goddess', 'Action', 49.99, 2024, 0);
insert into games
values(1240210, 'There Is No Game: Wrong Dimension', 'Adventure', 12.99, 2020, 0);
insert into games
values(1147550, 'Not For Broadcast', 'Adventure', 24.99, 2022, 0);
insert into games
values(2446550, 'STAR WARS™: Battlefront Classic Collection', 'Action', 35.01, 2024, 0);
insert into games
values(2111190, 'MULLET MADJACK', 'Action', 19.99, 2024, 0);
insert into games
values(2238900, 'STAR OCEAN THE SECOND STORY R', 'Action', 49.99, 2023, 0);
insert into games
values(1137300, 'Sherlock Holmes Chapter One', 'Action', 44.99, 2021, 0);
insert into games
values(2445990, 'Bloomtown: A Different Story', 'Adventure', 24.99, 2024, 0);
insert into games
values(1291340, 'Townscaper', 'Casual', 5.99, 2021, 0);
insert into games
values(690040, 'SUPERHOT: MIND CONTROL DELETE', 'Action', 24.99, 2020, 0);
insert into games
values(1570010, 'FAR: Changing Tides', 'Action', 19.99, 2022, 0);
insert into games
values(1354830, 'Cat Cafe Manager', 'Indie', 19.99, 2022, 0);
insert into games
values(1840080, 'Homeworld 3', 'Simulation', 59.99, 2024, 0);
insert into games
values(998740, 'Ring of Pain', 'Indie', 19.99, 2020, 0);
insert into games
values(1222370, 'Necromunda: Hired Gun', 'Action', 39.99, 2021, 0);
insert into games
values(1004750, 'WRC 8 FIA World Rally Championship', 'Racing', 29.99, 2020, 0);
insert into games
values(1451810, 'LEGO® 2K Drive', 'Racing', 29.99, 2023, 0);
insert into games
values(2230650, 'TEVI', 'Action', 29.99, 2023, 0);
insert into games
values(1622910, 'Still Wakes the Deep', 'Action', 34.99, 2024, 0);
insert into games
values(1622900, 'Star Trek: Infinite', 'Adventure', 29.99, 2023, 0);
insert into games
values(1238880, 'Battlefield™ Hardline', 'Action', 5.99, 2020, 0);
insert into games
values(1766740, 'Choo-Choo Charles', 'Action', 19.99, 2022, 0);
insert into games
values(1100410, 'Commandos 2 - HD Remaster', 'Strategy', 19.99, 2020, 0);
insert into games
values(2195410, 'Songs of Silence', 'Indie', 39.99, 2024, 0);
insert into games
values(2111170, 'STORY OF SEASONS: A Wonderful Life', 'Casual', 19.99, 2023, 0);
insert into games
values(1590760, 'Metal Slug Tactics', 'Action', 22.49, 2024, 0);
insert into games
values(1816300, 'HARVESTELLA', 'Action', 59.99, 2022, 0);
insert into games
values(1072500, 'AO Tennis 2', 'Sports', 49.99, 2020, 0);
insert into games
values(1271100, 'Deadly Premonition 2: A Blessing in Disguise', 'Action', 39.99, 2022, 0);
insert into games
values(924980, 'Trials of Mana', 'RPG', 49.99, 2020, 0);
insert into games
values(1335790, 'Operation: Tango', 'Adventure', 8.99, 2021, 0);
insert into games
values(1540210, 'Arizona Sunshine® 2', 'Action', 39.99, 2023, 0);
insert into games
values(1998340, 'Labyrinth of Galleria: The Moon Society', 'RPG', 49.99, 2023, 0);
insert into games
values(424370, 'Wolcen: Lords of Mayhem', 'Action', 29.99, 2020, 0);
insert into games
values(1585220, 'Melatonin', 'Action', 14.99, 2022, 0);
insert into games
values(1644940, 'Loddlenaut', 'Adventure', 19.99, 2023, 0);
insert into games
values(1135300, 'King''s Bounty II', 'Adventure', 39.99, 2021, 0);
insert into games
values(1792250, 'Serious Sam: Siberian Mayhem', 'Action', 19.99, 2022, 0);
insert into games
values(1283400, 'Steelrising', 'Action', 49.99, 2022, 0);
insert into games
values(1287840, 'Disciples: Liberation', 'RPG', 39.99, 2021, 0);
insert into games
values(824600, 'HROT', 'Action', 19.99, 2023, 0);
insert into games
values(2305840, 'Cat Quest III', 'Action', 19.99, 2024, 0);
insert into games
values(2878600, 'Harry Potter: Quidditch Champions', 'Sports', 29.99, 2024, 0);
insert into games
values(921800, 'Encased: A Sci-Fi Post-Apocalyptic RPG', 'Adventure', 29.99, 2021, 0);
insert into games
values(1029210, '30XX', 'Action', 19.99, 2023, 0);
insert into games
values(2490990, 'Visions of Mana', 'Action', 59.99, 2024, 0);
insert into games
values(751630, 'After the Fall®', 'Action', 29.99, 2021, 0);
insert into games
values(1266700, 'Destroy All Humans! 2 - Reprobed', 'Action', 39.99, 2022, 0);
insert into games
values(1328350, 'Turbo Overkill', 'Action', 24.99, 2023, 0);
insert into games
values(798490, 'Othercide', 'Indie', 29.99, 2020, 0);
insert into games
values(553540, 'Phantom Brigade', 'Indie', 29.99, 2023, 0);
insert into games
values(2085000, 'SaGa Emerald Beyond', 'RPG', 49.99, 2024, 0);
insert into games
values(1432050, 'Nobody Saves the World', 'Action', 9.99, 2022, 0);
insert into games
values(1133760, 'CHRONO CROSS: THE RADICAL DREAMERS EDITION', 'Adventure', 19.99, 2022, 0);
insert into games
values(850320, 'PHOGS!', 'Adventure', 24.99, 2020, 0);
insert into games
values(1619520, 'Cross Blitz', 'Adventure', 13.39, 2023, 0);
insert into games
values(651670, 'Star Renegades', 'Action', 24.99, 2020, 0);
insert into games
values(2379390, 'Tom Clancy’s Rainbow Six® Extraction', 'Action', 9.99, 2023, 0);
insert into games
values(2223840, 'The Casting of Frank Stone™', 'Adventure', 39.99, 2024, 0);
insert into games
values(1392960, 'STORY OF SEASONS: Pioneers of Olive Town', 'Casual', 13.99, 2021, 0);
insert into games
values(916840, 'The Walking Dead: Saints & Sinners', 'Action', 39.99, 2020, 0);
insert into games
values(2021210, 'DRAGON QUEST TREASURES', 'Action', 49.99, 2023, 0);
insert into games
values(2719200, 'SAMURAI WARRIORS 4 DX', 'Action', 49.99, 2024, 0);
insert into games
values(1097200, 'Twelve Minutes', 'Adventure', 24.99, 2021, 0);
insert into games
values(1167750, 'The Lamplighters League', 'Adventure', 49.99, 2023, 0);
insert into games
values(958400, 'Project CARS 3', 'Racing', 59.99, 2020, 0);
insert into games
values(1938010, 'WILD HEARTS™', 'Action', 17.49, 2023, 0);
insert into games
values(1977170, 'Jusant', 'Action', 14.99, 2023, 0);
insert into games
values(1898290, 'LEGO® Bricktales', 'Adventure', 29.99, 2022, 0);
insert into games
values(1999770, 'Atelier Ryza 3: Alchemist of the End & the Secret Key', 'Adventure', 59.99, 2023, 0);
insert into games
values(1956040, 'Kingdom Eighties', 'Action', 11.99, 2023, 0);
insert into games
values(2366980, 'Thank Goodness You''re Here!', 'Adventure', 15.99, 2024, 0);
insert into games
values(1419160, 'Souldiers', 'Action', 19.99, 2022, 0);
insert into games
values(2481020, 'Vampire Therapist', 'Indie', 14.99, 2024, 0);
insert into games
values(1522160, 'Disney Epic Mickey: Rebrushed', 'Action', 59.99, 2024, 0);
insert into games
values(1610440, 'Minds Beneath Us', 'Adventure', 17.99, 2024, 0);
insert into games
values(964800, 'Prodeus', 'Action', 24.99, 2022, 0);
insert into games
values(1097130, 'Circuit Superstars', 'Racing', 19.99, 2023, 0);
insert into games
values(1903620, 'Killer Frequency', 'Adventure', 8.49, 2023, 0);
insert into games
values(1978590, 'Anger Foot', 'Action', 17.49, 2024, 0);
insert into games
values(914800, 'Coffee Talk', 'Adventure', 6.49, 2020, 0);
insert into games
values(1138660, 'Black Book', 'Adventure', 24.99, 2021, 0);
insert into games
values(1634860, 'Minishoot'' Adventures', 'Action', 14.99, 2024, 0);
insert into games
values(1574240, 'Dread Delusion', 'Action', 19.99, 2024, 0);
insert into games
values(1920480, 'River City Girls 2', 'Action', 39.99, 2022, 0);
insert into games
values(1196470, 'WE ARE FOOTBALL', 'Sports', 24.99, 2021, 0);
insert into games
values(465200, 'Fury Unleashed', 'Action', 19.99, 2020, 0);
insert into games
values(594330, 'Visage', 'Action', 34.99, 2020, 0);
insert into games
values(1286350, 'BPM: BULLETS PER MINUTE', 'Action', 19.99, 2020, 0);
insert into games
values(1203710, 'UnMetal', 'Action', 19.99, 2021, 0);
insert into games
values(1289380, 'Sheltered 2', 'Indie', 19.99, 2021, 0);
insert into games
values(2243710, 'Rune Factory 3 Special', 'Casual', 15.99, 2023, 0);
insert into games
values(2386310, 'Ultros', 'Adventure', 12.49, 2024, 0);
insert into games
values(1038250, 'DIRT 5', 'Racing', 11.99, 2020, 0);
insert into games
values(1037020, 'ScourgeBringer', 'Action', 16.99, 2020, 0);
insert into games
values(2102450, 'Enotria: The Last Song', 'Action', 39.99, 2024, 0);
insert into games
values(1449200, 'AI: THE SOMNIUM FILES - nirvanA Initiative', 'Adventure', 59.99, 2022, 0);
insert into games
values(1082430, 'Before Your Eyes', 'Adventure', 9.99, 2021, 0);
insert into games
values(913740, 'WORLD OF HORROR', 'Indie', 19.99, 2023, 0);
insert into games
values(2229560, 'Zet Zillions', 'Strategy', 6.99, 2024, 0);
insert into games
values(1580520, 'Lost Eidolons', 'Casual', 34.99, 2022, 0);
insert into games
values(1205450, 'Turnip Boy Commits Tax Evasion', 'Action', 14.99, 2021, 0);
insert into games
values(768520, 'Red Solstice 2: Survivors', 'RPG', 13.49, 2021, 0);
insert into games
values(803330, 'Destroy All Humans!', 'Action', 29.99, 2020, 0);
insert into games
values(1343240, 'Thymesia', 'Action', 9.99, 2022, 0);
insert into games
values(1981570, 'Land of the Vikings', 'Strategy', 25.99, 2023, 0);
insert into games
values(1042490, 'Call of the Sea', 'Adventure', 19.99, 2020, 0);
insert into games
values(1167450, 'DAEMON X MACHINA', 'Action', 19.99, 2020, 0);
insert into games
values(731040, 'The Invincible', 'Action', 29.99, 2023, 0);
insert into games
values(814000, 'ONE PIECE ODYSSEY', 'Action', 59.99, 2023, 0);
insert into games
values(960690, 'One Step From Eden', 'Action', 19.99, 2020, 0);
insert into games
values(1876590, 'I Am Your Beast', 'Action', 19.99, 2024, 0);
insert into games
values(1368030, 'ANNO: Mutationem', 'Action', 24.99, 2022, 0);
insert into games
values(1368870, 'Field of Glory II: Medieval', 'Simulation', 29.99, 2021, 0);
insert into games
values(1082180, 'TT Isle of Man: Ride on the Edge 2', 'Racing', 29.99, 2020, 0);
insert into games
values(1462570, 'Lost in Random™', 'Action', 7.49, 2021, 0);
insert into games
values(1496590, 'Tchia', 'Action', 17.49, 2024, 0);
insert into games
values(1271700, 'HOT WHEELS UNLEASHED™', 'Racing', 39.99, 2021, 0);
insert into games
values(707030, 'POSTAL 4: No Regerts', 'Action', 39.99, 2022, 0);
insert into games
values(1904860, 'Legends of Kingdom Rush', 'Indie', 14.99, 2022, 0);
insert into games
values(2215260, 'Scott Pilgrim vs. The World™: The Game – Complete Edition', 'Action', 14.99, 2023, 0);
insert into games
values(1519090, 'Welcome to ParadiZe', 'Action', 29.99, 2024, 0);
insert into games
values(2216830, 'The Jackbox Party Pack 10', 'Casual', 29.99, 2023, 0);
insert into games
values(1310410, 'Alone in the Dark', 'Action', 59.99, 2024, 0);
insert into games
values(1517970, 'Aeterna Noctis', 'Action', 7.49, 2021, 0);
insert into games
values(2060130, 'Return to Monkey Island', 'Adventure', 12.49, 2022, 0);
insert into games
values(841190, 'Honey, I Joined a Cult', 'Casual', 7.47, 2022, 0);
insert into games
values(1239520, 'Madden NFL 21', 'Sports', 0.00, 2020, 1);
insert into games
values(698670, 'Scorn', 'Action', 12.49, 2022, 0);
insert into games
values(1179210, 'Kill It With Fire', 'Action', 12.99, 2020, 0);
insert into games
values(811320, 'Jupiter Hell', 'Indie', 24.99, 2021, 0);
insert into games
values(2134770, 'SteamWorld Build', 'Simulation', 24.99, 2023, 0);
insert into games
values(1685750, 'Capcom Fighting Collection', 'Action', 15.99, 2022, 0);
insert into games
values(1282410, 'Hard West 2', 'Action', 29.99, 2022, 0);
insert into games
values(2076140, 'Tavern Talk', 'Adventure', 14.39, 2024, 0);
insert into games
values(2739830, 'King Arthur: Legion IX', 'RPG', 19.99, 2024, 0);
insert into games
values(1158370, 'Aragami 2', 'Action', 34.99, 2021, 0);
insert into games
values(1155970, 'Roadwarden', 'Adventure', 10.99, 2022, 0);
insert into games
values(871980, 'Digimon Survive', 'RPG', 59.99, 2022, 0);
insert into games
values(1073910, 'Before We Leave', 'Casual', 19.99, 2021, 0);
insert into games
values(1138850, 'Heavenly Bodies', 'Action', 19.99, 2021, 0);
insert into games
values(628670, 'Hellpoint', 'Action', 34.99, 2020, 0);
insert into games
values(1229380, 'Everhood', 'Action', 9.99, 2021, 0);
insert into games
values(1731070, 'Asterigos: Curse of the Stars', 'Action', 34.99, 2022, 0);
insert into games
values(2233120, 'A Quiet Place: The Road Ahead', 'Action', 29.99, 2024, 0);
insert into games
values(1425350, 'Botany Manor', 'Adventure', 24.99, 2024, 0);
insert into games
values(1058450, 'MY HERO ONE''S JUSTICE 2', 'Action', 39.99, 2020, 0);
insert into games
values(1357860, 'Fuga: Melodies of Steel', 'RPG', 39.99, 2021, 0);
insert into games
values(1622350, 'Copycat', 'Adventure', 11.99, 2024, 0);
insert into games
values(1749750, 'Disgaea 6 Complete', 'RPG', 59.99, 2022, 0);
insert into games
values(757310, 'Sable', 'Adventure', 24.99, 2021, 0);
insert into games
values(1885110, 'Cryptmaster', 'Adventure', 24.99, 2024, 0);
insert into games
values(2420660, 'Neva', 'Adventure', 19.99, 2024, 0);
insert into games
values(1306630, 'Lost Ruins', 'Action', 19.99, 2021, 0);
insert into games
values(1621310, 'Atelier Sophie 2: The Alchemist of the Mysterious Dream', 'RPG', 59.99, 2022, 0);
insert into games
values(1402120, '9 Years of Shadows', 'Action', 19.99, 2023, 0);
insert into games
values(1153640, 'Chorus', 'Action', 24.99, 2021, 0);
insert into games
values(1213700, 'Spirit of the North', 'Adventure', 19.99, 2020, 0);
insert into games
values(1472660, 'No Place Like Home', 'Adventure', 19.99, 2022, 0);
insert into games
values(473950, 'Manifold Garden', 'Adventure', 19.99, 2020, 0);
insert into games
values(1931010, 'Spirittea', 'Adventure', 13.99, 2023, 0);
insert into games
values(1859470, 'PAC-MAN WORLD Re-PAC', 'Action', 29.99, 2022, 0);
insert into games
values(1406850, 'The Legend of Tianding', 'Action', 19.99, 2021, 0);
insert into games
values(2292260, 'STAR WARS™: Dark Forces Remaster', 'Action', 29.99, 2024, 0);
insert into games
values(1844380, 'Warhammer Age of Sigmar: Realms of Ruin', 'Action', 59.99, 2023, 0);
insert into games
values(2014550, 'Voidwrought', 'Action', 19.99, 2024, 0);
insert into games
values(2461850, 'Senua’s Saga: Hellblade II', 'Action', 49.99, 2024, 0);
insert into games
values(1195290, 'Moncage', 'Adventure', 14.99, 2021, 0);
insert into games
values(1663220, 'Coffee Talk Episode 2: Hibiscus & Butterfly', 'Adventure', 10.49, 2023, 0);
insert into games
values(1649010, 'Miasma Chronicles', 'Action', 34.99, 2023, 0);
insert into games
values(1367590, 'Tormented Souls', 'Action', 19.99, 2021, 0);
insert into games
values(957960, 'Inkulinati', 'Indie', 24.99, 2024, 0);
insert into games
values(1416050, 'Shovel Knight Dig', 'Action', 24.99, 2022, 0);
insert into games
values(1249040, 'American Arcadia', 'Adventure', 12.99, 2023, 0);
insert into games
values(1347780, 'Freedom Fighters', 'Action', 0.00, 2020, 1);
insert into games
values(1154810, 'Going Under', 'Action', 4.99, 2020, 0);
insert into games
values(1118240, 'Lake', 'Adventure', 7.99, 2021, 0);
insert into games
values(1087760, 'The Gunk', 'Action', 24.99, 2022, 0);
insert into games
values(1046400, 'Astalon: Tears of the Earth', 'Action', 19.99, 2021, 0);
insert into games
values(1832040, 'Flintlock: The Siege of Dawn', 'Action', 31.49, 2024, 0);
insert into games
values(566440, 'Necromunda: Underhive Wars', 'Action', 19.99, 2020, 0);
insert into games
values(978520, 'Legend of Keepers: Career of a Dungeon Manager', 'Indie', 19.99, 2021, 0);
insert into games
values(746850, 'Cloudpunk', 'Adventure', 6.99, 2020, 0);
insert into games
values(1777620, 'Soul Hackers 2', 'RPG', 59.99, 2022, 0);
insert into games
values(1840800, 'Headquarters: World War II', 'Simulation', 25.99, 2024, 0);
insert into games
values(1119980, 'In Sound Mind', 'Action', 34.99, 2021, 0);
insert into games
values(787810, 'Rogue Heroes: Ruins of Tasos', 'Action', 19.99, 2021, 0);
insert into games
values(1608640, 'OTXO', 'Action', 14.99, 2023, 0);
insert into games
values(1013140, 'Outcast - A New Beginning', 'Action', 39.99, 2024, 0);
insert into games
values(1328840, 'Lost in Play', 'Adventure', 7.99, 2022, 0);
insert into games
values(1730590, 'The Entropy Centre', 'Adventure', 19.99, 2022, 0);
insert into games
values(1497440, 'COCOON', 'Adventure', 24.99, 2023, 0);
insert into games
values(1337010, 'Alba: A Wildlife Adventure', 'Adventure', 4.24, 2020, 0);
insert into games
values(1286990, 'CONSCRIPT', 'Action', 15.59, 2024, 0);
insert into games
values(1388870, 'Arcade Paradise', 'Adventure', 19.99, 2022, 0);
insert into games
values(999220, 'Amnesia: Rebirth', 'Adventure', 29.99, 2020, 0);
insert into games
values(1449280, 'Ghostbusters: The Video Game Remastered', 'Action', 24.99, 2020, 0);
insert into games
values(1849900, 'Among Us VR', 'Casual', 9.99, 2022, 0);
insert into games
values(2051120, 'HOT WHEELS UNLEASHED™ 2 - Turbocharged', 'Racing', 49.99, 2023, 0);
insert into games
values(1089830, 'Monster Energy Supercross - The Official Videogame 3', 'Racing', 24.99, 2020, 0);
insert into games
values(1295270, 'SaGa Frontier Remastered', 'RPG', 24.99, 2021, 0);
insert into games
values(2731870, 'Ys X: Nordics', 'Action', 59.99, 2024, 0);
insert into games
values(1324340, 'Made in Abyss: Binary Star Falling into Darkness', 'Action', 59.99, 2022, 0);
insert into games
values(1979440, 'SAND LAND', 'Action', 59.99, 2024, 0);
insert into games
values(785790, 'WHAT THE GOLF?', 'Action', 6.79, 2020, 0);
insert into games
values(1062830, 'Embr', 'Action', 19.99, 2021, 0);
insert into games
values(1456760, 'ROBOBEAT', 'Action', 19.99, 2024, 0);
insert into games
values(1641700, 'Moving Out 2', 'Action', 29.99, 2023, 0);
insert into games
values(1599020, 'Tinykin', 'Action', 24.99, 2022, 0);
insert into games
values(1893810, 'Solium Infernum', 'Indie', 39.99, 2024, 0);
insert into games
values(1341820, 'As Dusk Falls', 'Adventure', 29.99, 2022, 0);
insert into games
values(1101190, 'Dungeon Defenders: Awakened', 'Action', 29.99, 2020, 0);
insert into games
values(1209490, 'Exit the Gungeon', 'Action', 9.99, 2020, 0);
insert into games
values(1201270, 'A Space for the Unbound', 'Adventure', 19.99, 2023, 0);
insert into games
values(996770, 'Moving Out', 'Action', 4.99, 2020, 0);
insert into games
values(1000010, 'Crown Trick', 'Adventure', 19.99, 2020, 0);
insert into games
values(1009290, 'SWORD ART ONLINE Alicization Lycoris', 'Action', 9.59, 2020, 0);
insert into games
values(1155330, 'Showgunners', 'Other', 29.99, 2023, 0);
insert into games
values(1493750, 'Evil Dead: The Game', 'Action', 29.99, 2023, 0);
insert into games
values(1134100, 'Frozenheim', 'Simulation', 19.99, 2022, 0);
insert into games
values(2803280, 'Dragon Is Dead', 'Action', 17.99, 2024, 0);
insert into games
values(2717880, 'The Rogue Prince of Persia', 'Action', 19.99, 2024, 0);
insert into games
values(2379910, 'Dystopika', 'Casual', 5.59, 2024, 0);
insert into games
values(1013220, 'River City Saga: Three Kingdoms', 'Action', 29.99, 2022, 0);
insert into games
values(2254740, 'Persona 5 Tactica', 'RPG', 59.99, 2023, 0);
insert into games
values(1294810, 'Redfall', 'Action', 39.99, 2023, 0);
insert into games
values(1574260, 'My Friendly Neighborhood', 'Action', 29.99, 2023, 0);
insert into games
values(1112890, 'Calico', 'Casual', 11.99, 2020, 0);
insert into games
values(760650, 'Hammerting', 'Adventure', 2.49, 2021, 0);
insert into games
values(1602080, 'Soulstice', 'Action', 39.99, 2022, 0);
insert into games
values(1898500, 'Worldless', 'Action', 19.99, 2023, 0);
insert into games
values(1286320, 'Exoprimal', 'Action', 19.79, 2023, 0);
insert into games
values(1191630, 'Shantae and the Seven Sirens', 'Adventure', 29.99, 2020, 0);
insert into games
values(1812370, 'Little Goody Two Shoes', 'Adventure', 19.99, 2023, 0);
insert into games
values(1669420, 'Islets', 'Action', 9.99, 2022, 0);
insert into games
values(2394650, 'Crypt Custodian', 'Adventure', 19.99, 2024, 0);
insert into games
values(1931730, 'Fort Solis', 'Adventure', 24.99, 2023, 0);
insert into games
values(1069690, 'Rogue Lords', 'RPG', 24.99, 2021, 0);
insert into games
values(1647550, 'NEO: The World Ends with You', 'Action', 59.99, 2022, 0);
insert into games
values(1627570, 'The Plucky Squire', 'Adventure', 29.99, 2024, 0);
insert into games
values(2081080, 'Capes', 'Indie', 39.99, 2024, 0);
insert into games
values(2217580, 'New Star GP', 'Racing', 29.99, 2024, 0);
insert into games
values(1182620, 'Impostor Factory', 'Adventure', 9.99, 2021, 0);
insert into games
values(1680880, 'Forspoken', 'Action', 69.99, 2023, 0);
insert into games
values(2017080, 'Nickelodeon All-Star Brawl 2', 'Action', 19.99, 2023, 0);
insert into games
values(1532690, 'BLACKTAIL', 'Action', 29.99, 2022, 0);
insert into games
values(1654660, 'En Garde!', 'Action', 19.99, 2023, 0);
insert into games
values(1413870, 'Shadow Man Remastered', 'Action', 19.99, 2021, 0);
insert into games
values(1904790, 'Agatha Christie - Murder on the Orient Express', 'Action', 15.99, 2023, 0);
insert into games
values(1051690, 'Nightmare Reaper', 'Action', 24.99, 2022, 0);
insert into games
values(515960, 'Martha Is Dead', 'Adventure', 29.99, 2022, 0);
insert into games
values(1420290, 'No More Heroes', 'Action', 9.99, 2021, 0);
insert into games
values(226620, 'Desktop Dungeons', 'Adventure', 14.99, 2023, 0);
insert into games
values(2694420, 'KILL KNIGHT', 'Action', 14.99, 2024, 0);
insert into games
values(1414850, 'Nickelodeon All-Star Brawl', 'Action', 49.99, 2021, 0);
insert into games
values(1437400, 'Salt and Sacrifice', 'Action', 19.99, 2023, 0);
insert into games
values(1996430, 'Dicefolk', 'Casual', 14.99, 2024, 0);
insert into games
values(1116580, 'Shady Part of Me', 'Indie', 14.99, 2020, 0);
insert into games
values(1670870, 'MADiSON', 'Action', 34.99, 2022, 0);
insert into games
values(1410640, 'Syberia: The World Before', 'Adventure', 39.99, 2022, 0);
insert into games
values(1402110, 'Eternights', 'Action', 29.99, 2023, 0);
insert into games
values(2287330, 'Empire of the Ants', 'Strategy', 39.99, 2024, 0);
insert into games
values(1272840, 'Dordogne', 'Adventure', 14.99, 2023, 0);
insert into games
values(1345890, 'Deliver Us Mars', 'Action', 29.99, 2023, 0);
insert into games
values(2106840, 'PARANORMASIGHT: The Seven Mysteries of Honjo', 'Adventure', 11.99, 2023, 0);
insert into games
values(1040420, 'Dreamscaper', 'Action', 24.99, 2021, 0);
insert into games
values(1341200, 'DYNASTY WARRIORS 9 Empires', 'Action', 59.99, 2021, 0);
insert into games
values(2085370, 'Classified: France ''44', 'RPG', 24.99, 2024, 0);
insert into games
values(1330470, 'F.I.S.T.: Forged In Shadow Torch', 'Sports', 10.49, 2021, 0);
insert into games
values(2272400, 'Station to Station', 'Casual', 17.99, 2023, 0);
insert into games
values(2494780, '#DRIVE Rally', 'Racing', 19.99, 2024, 0);
insert into games
values(919360, 'Alaloth: Champions of The Four Kingdoms', 'Action', 34.99, 2022, 0);
insert into games
values(1928870, 'Minecraft Legends', 'Action', 39.99, 2023, 0);
insert into games
values(1743850, 'HYPER DEMON', 'Action', 14.99, 2022, 0);
insert into games
values(754890, 'Firmament', 'Adventure', 34.99, 2023, 0);
insert into games
values(1676130, 'Deadlink', 'Action', 24.99, 2023, 0);
insert into games
values(1380420, 'Grow: Song of the Evertree', 'Action', 9.99, 2021, 0);
insert into games
values(1045720, 'The Coma 2: Vicious Sisters', 'Action', 14.99, 2020, 0);
insert into games
values(1436590, 'Phoenotopia: Awakening', 'Action', 19.99, 2021, 0);
insert into games
values(983970, 'Haven', 'Adventure', 24.99, 2020, 0);
insert into games
values(1371720, 'Card Shark', 'Adventure', 7.99, 2022, 0);
insert into games
values(1206060, 'Happy Game', 'Adventure', 3.93, 2021, 0);
insert into games
values(1062140, 'Garden Story', 'Adventure', 19.99, 2021, 0);
insert into games
values(1552810, 'Twin Mirror', 'Adventure', 7.49, 2021, 0);
insert into games
values(1967260, 'Double Dragon Gaiden: Rise Of The Dragons', 'Action', 24.99, 2023, 0);
insert into games
values(1949030, 'Sherlock Holmes The Awakened', 'Adventure', 39.99, 2023, 0);
insert into games
values(1196090, 'Scars Above', 'Action', 29.99, 2023, 0);
insert into games
values(2009100, 'Immortals of Aveum™', 'Action', 14.99, 2023, 0);
insert into games
values(1485590, 'ENDLESS™ Dungeon', 'Action', 19.99, 2023, 0);
insert into games
values(1225560, 'Unravel', 'Action', 4.99, 2020, 0);
insert into games
values(2213300, 'Might & Magic: Clash of Heroes - Definitive Edition', 'Adventure', 10.79, 2023, 0);
insert into games
values(981890, 'Olympic Games Tokyo 2020 – The Official Video Game™', 'Sports', 39.99, 2021, 0);
insert into games
values(1299510, 'Vampire: The Masquerade – Swansong', 'Adventure', 49.99, 2023, 0);
insert into games
values(1766100, 'The Last Hero of Nostalgaia', 'Action', 24.99, 2022, 0);
insert into games
values(1497950, 'EARTH DEFENSE FORCE: WORLD BROTHERS', 'Action', 39.99, 2021, 0);
insert into games
values(1920780, 'Stray Gods: The Roleplaying Musical', 'Adventure', 20.99, 2023, 0);
insert into games
values(1996010, 'Crow Country', 'Action', 19.99, 2024, 0);
insert into games
values(1492680, 'The Pathless', 'Action', 39.99, 2021, 0);
insert into games
values(1975440, 'Under The Waves', 'Adventure', 29.99, 2023, 0);
insert into games
values(1889740, 'Paper Trail', 'Adventure', 19.99, 2024, 0);
insert into games
values(1038370, 'Trials of Fire', 'Indie', 19.99, 2021, 0);
insert into games
values(1123450, 'Chicory: A Colorful Tale', 'Adventure', 19.99, 2021, 0);
insert into games
values(1429850, 'Sumerian Six', 'Action', 29.99, 2024, 0);
insert into games
values(1282690, 'Crysis® 3', 'Action', 0.00, 2020, 1);
insert into games
values(795420, 'The Darkside Detective: A Fumble in the Dark', 'Adventure', 14.99, 2021, 0);
insert into games
values(945770, 'Dark Envoy', 'RPG', 14.99, 2023, 0);
insert into games
values(1110910, 'Mortal Shell', 'Action', 29.99, 2021, 0);
insert into games
values(2653940, 'Star Trek: Resurgence', 'Adventure', 24.99, 2024, 0);
insert into games
values(1413660, 'Elderand', 'Action', 19.99, 2023, 0);
insert into games
values(729000, 'Wytchwood', 'Adventure', 19.99, 2021, 0);
insert into games
values(1591530, 'SAMURAI WARRIORS 5', 'Action', 59.99, 2021, 0);
insert into games
values(982290, 'Airborne Kingdom', 'Adventure', 24.99, 2022, 0);
insert into games
values(674930, 'Boyfriend Dungeon', 'Indie', 9.99, 2021, 0);
insert into games
values(1242980, 'KeyWe', 'Casual', 8.49, 2021, 0);
insert into games
values(1000410, 'WRATH: Aeon of Ruin', 'Action', 24.99, 2024, 0);
insert into games
values(1799930, 'Redout 2', 'Racing', 19.99, 2022, 0);
insert into games
values(1311510, 'Embracelet', 'Adventure', 12.99, 2020, 0);
insert into games
values(1158890, 'White Shadows', 'Action', 19.99, 2021, 0);
insert into games
values(2123640, 'Hollowbody', 'Adventure', 16.99, 2024, 0);
insert into games
values(1190170, 'OlliOlli World', 'Sports', 19.99, 2022, 0);
insert into games
values(1432100, 'The Bookwalker: Thief of Tales', 'Adventure', 14.99, 2023, 0);
insert into games
values(1108590, 'Eldest Souls', 'Action', 19.99, 2021, 0);
insert into games
values(1314000, 'Achilles: Legends Untold', 'Action', 13.74, 2023, 0);
insert into games
values(1553000, 'War Hospital', 'Strategy', 29.99, 2024, 0);
insert into games
values(1658290, 'Eiyuden Chronicle: Rising', 'Action', 4.49, 2022, 0);
insert into games
values(2059660, 'Cavern of Dreams', 'Action', 12.99, 2023, 0);
insert into games
values(2398170, 'BORE BLASTERS', 'Action', 9.99, 2024, 0);
insert into games
values(2006140, 'Withering Rooms', 'Action', 24.99, 2024, 0);
insert into games
values(1924360, 'Lil'' Guardsman', 'Adventure', 13.99, 2024, 0);
insert into games
values(1937620, 'Tennis Manager 2022', 'Racing', 9.99, 2022, 0);
insert into games
values(2060590, 'Wilmot Works It Out', 'Casual', 14.99, 2024, 0);
insert into games
values(1157220, 'Nebuchadnezzar', 'Indie', 19.99, 2021, 0);
insert into games
values(2304640, 'Hidden Through Time 2: Myths & Magic', 'Casual', 12.99, 2023, 0);
insert into games
values(1608230, 'Planet of Lana', 'Action', 19.99, 2023, 0);
insert into games
values(824550, 'SD GUNDAM BATTLE ALLIANCE', 'Action', 59.99, 2022, 0);
insert into games
values(1390410, 'Midnight Fight Express', 'Action', 19.99, 2022, 0);
insert into games
values(1783360, 'Meg''s Monster', 'Adventure', 14.99, 2023, 0);
insert into games
values(720560, 'Vigil: The Longest Night', 'Action', 21.99, 2020, 0);
insert into games
values(1194810, 'Meet Your Maker', 'Action', 19.99, 2023, 0);
insert into games
values(2001340, 'Fuga: Melodies of Steel 2', 'RPG', 39.99, 2023, 0);
insert into games
values(1285670, 'Post Void', 'Action', 2.99, 2020, 0);
insert into games
values(1160220, 'Paradise Killer', 'Adventure', 19.99, 2020, 0);
insert into games
values(2014380, 'LIVE A LIVE', 'Adventure', 49.99, 2023, 0);
insert into games
values(826940, 'Maid of Sker', 'Action', 24.99, 2020, 0);
insert into games
values(1638230, 'Xuan-Yuan Sword: Mists Beyond the Mountains', 'RPG', 6.99, 2023, 0);
insert into games
values(1135910, 'Hunting Simulator 2', 'Sports', 39.99, 2020, 0);
insert into games
values(1182310, 'The Excavation of Hob''s Barrow', 'Adventure', 14.99, 2022, 0);
insert into games
values(1283230, 'Autopsy Simulator', 'Indie', 24.99, 2024, 0);
insert into games
values(1373960, 'INDIKA', 'Adventure', 24.99, 2024, 0);
insert into games
values(1108000, 'Children of Silentown', 'Adventure', 19.99, 2023, 0);
insert into games
values(1235100, 'Rolling Hills: Make Sushi, Make Friends', 'Adventure', 14.99, 2024, 0);
insert into games
values(1231990, 'Gestalt: Steam & Cinder', 'Action', 19.99, 2024, 0);
insert into games
values(1244950, 'Battletoads', 'Action', 19.99, 2020, 0);
insert into games
values(1046790, 'Eternal Threads', 'Adventure', 19.99, 2022, 0);
insert into games
values(1227780, 'Taur', 'Action', 24.99, 2020, 0);
insert into games
values(1137350, 'Filament', 'Indie', 16.99, 2020, 0);
insert into games
values(1913210, 'AEW: Fight Forever', 'Sports', 39.99, 2023, 0);
insert into games
values(1309950, 'Children of the Sun', 'Action', 14.99, 2024, 0);
insert into games
values(1279630, 'Vampire: The Masquerade - Shadows of New York', 'Indie', 12.99, 2020, 0);
insert into games
values(1759380, 'Bandle Tale: A League of Legends Story', 'RPG', 24.99, 2024, 0);
insert into games
values(1046300, 'Pirates Outlaws', 'Adventure', 19.99, 2020, 0);
insert into games
values(1037130, 'Dandy Ace', 'Action', 19.99, 2021, 0);
insert into games
values(1889930, 'Baldur''s Gate: Dark Alliance II', 'Action', 29.99, 2022, 0);
insert into games
values(1867510, 'WrestleQuest', 'Adventure', 29.99, 2023, 0);
insert into games
values(1776380, 'STAR OCEAN THE DIVINE FORCE', 'Action', 59.99, 2022, 0);
insert into games
values(2378620, 'Anomaly Agent', 'Action', 5.99, 2024, 0);
insert into games
values(1574310, 'OXENFREE II: Lost Signals', 'Adventure', 19.99, 2023, 0);
insert into games
values(1607240, 'Mail Time', 'Adventure', 19.99, 2023, 0);
insert into games
values(269190, 'Edge Of Eternity', 'Action', 29.99, 2021, 0);
insert into games
values(1454970, 'New Tales from the Borderlands', 'Adventure', 39.99, 2022, 0);
insert into games
values(2095340, 'Road 96: Mile 0', 'Action', 12.96, 2023, 0);
insert into games
values(1660840, 'Wild Bastards', 'Action', 34.99, 2024, 0);
insert into games
values(1386900, 'Observer: System Redux', 'Adventure', 29.99, 2020, 0);
insert into games
values(1747760, 'Momodora: Moonlit Farewell', 'Action', 16.99, 2024, 0);
insert into games
values(1298140, 'Fobia - St. Dinfna Hotel', 'Indie', 29.99, 2022, 0);
insert into games
values(962580, 'Summer in Mara', 'Adventure', 19.99, 2020, 0);
insert into games
values(593150, 'Ooblets', 'Adventure', 23.99, 2023, 0);
insert into games
values(1069530, 'Narita Boy', 'Adventure', 2.49, 2021, 0);
insert into games
values(1710540, 'Fall of Porcupine', 'Adventure', 19.99, 2023, 0);
insert into games
values(1866180, 'Hooked on You: A Dead by Daylight Dating Sim™', 'Casual', 9.99, 2022, 0);
insert into games
values(1839940, 'Dakar Desert Rally', 'Racing', 14.99, 2022, 0);
insert into games
values(1003090, 'Through the Darkest of Times', 'Adventure', 14.99, 2020, 0);
insert into games
values(1221250, 'NORCO', 'Adventure', 14.99, 2022, 0);
insert into games
values(1334730, 'Dread Templar', 'Action', 19.99, 2023, 0);
insert into games
values(1491670, 'Venba', 'Other', 7.49, 2023, 0);
insert into games
values(1186640, 'Pumpkin Jack', 'Action', 29.99, 2020, 0);
insert into games
values(1257360, 'Bloodstained: Curse of the Moon 2', 'Action', 14.99, 2020, 0);
insert into games
values(1823930, 'Wavetale', 'Adventure', 29.99, 2022, 0);
insert into games
values(2366970, 'Arco', 'Action', 19.99, 2024, 0);
insert into games
values(1546310, 'El Paso, Elsewhere', 'Action', 19.99, 2023, 0);
insert into games
values(1634150, 'Behind the Frame: The Finest Scenery', 'Adventure', 12.99, 2021, 0);
insert into games
values(1446350, 'You Will Die Here Tonight', 'Action', 19.99, 2023, 0);
insert into games
values(1299690, 'Gori: Cuddly Carnage', 'Action', 21.99, 2024, 0);
insert into games
values(2544110, 'Broken Sword - Shadow of the Templars: Reforged', 'Adventure', 25.49, 2024, 0);
insert into games
values(1233260, 'FAIRY TAIL', 'Action', 59.99, 2020, 0);
insert into games
values(1477940, 'Unknown 9: Awakening', 'Action', 49.99, 2024, 0);
insert into games
values(824000, 'Hokko Life', 'Adventure', 3.99, 2022, 0);
insert into games
values(2097230, 'Turnip Boy Robs a Bank', 'Action', 14.99, 2024, 0);
insert into games
values(1373430, 'Leisure Suit Larry - Wet Dreams Dry Twice', 'Adventure', 34.99, 2020, 0);
insert into games
values(1122120, 'STATIONflow', 'Simulation', 17.99, 2020, 0);
insert into games
values(865680, 'The Eternal Cylinder', 'Action', 24.99, 2022, 0);
insert into games
values(1457080, 'The Mageseeker: A League of Legends Story™', 'Action', 29.99, 2023, 0);
insert into games
values(2737300, 'Parking Garage Rally Circuit', 'Racing', 9.99, 2024, 0);
insert into games
values(598550, 'HUNTDOWN', 'Action', 19.99, 2021, 0);
insert into games
values(2313020, 'Umamusume: Pretty Derby – Party Dash', 'Action', 44.99, 2024, 0);
insert into games
values(1140290, 'Murder by Numbers', 'Adventure', 14.99, 2020, 0);
insert into games
values(1296360, 'Archvale', 'Action', 14.99, 2021, 0);
insert into games
values(1955230, 'Penny’s Big Breakaway', 'Adventure', 29.99, 2024, 0);
insert into games
values(1577250, 'The Chant', 'Action', 24.99, 2022, 0);
insert into games
values(1421490, 'Rise of the Triad: Ludicrous Edition', 'Action', 19.99, 2023, 0);
insert into games
values(910830, 'Rebel Galaxy Outlaw', 'Action', 29.99, 2020, 0);
insert into games
values(2633500, 'Dragon Throne: Battle of Red Cliffs', 'RPG', 9.99, 2024, 0);
insert into games
values(1472930, 'Flock', 'Adventure', 19.99, 2024, 0);
insert into games
values(1229580, 'Disc Room', 'Action', 14.99, 2020, 0);
insert into games
values(1921480, '#BLUD', 'Action', 24.99, 2024, 0);
insert into games
values(1538970, 'Hammerwatch II', 'Action', 24.99, 2023, 0);
insert into games
values(1173220, 'Bleak Faith: Forsaken', 'Action', 29.99, 2023, 0);
insert into games
values(1265780, 'The Lord of the Rings: Gollum™', 'Action', 49.99, 2023, 0);
insert into games
values(1843310, 'Funko Fusion', 'Action', 34.99, 2024, 0);
insert into games
values(866140, 'Arise: A Simple Story', 'Adventure', 19.99, 2020, 0);
insert into games
values(1232460, 'Onee Chanbara ORIGIN', 'Action', 59.99, 2020, 0);
insert into games
values(1057750, 'The Suicide of Rachel Foster', 'Adventure', 17.99, 2020, 0);
insert into games
values(2362090, 'Chicken Police: Into the HIVE!', 'Adventure', 24.99, 2024, 0);
insert into games
values(1658920, 'Crown Wars: The Black Prince', 'Adventure', 39.99, 2024, 0);
insert into games
values(2153350, 'Brothers: A Tale of Two Sons Remake', 'Adventure', 11.99, 2024, 0);
insert into games
values(1186040, 'Worms Rumble', 'Action', 1.49, 2020, 0);
insert into games
values(1659600, 'Teenage Mutant Ninja Turtles: The Cowabunga Collection', 'Action', 39.99, 2022, 0);
insert into games
values(1361400, 'Moonglow Bay', 'Adventure', 24.99, 2021, 0);
insert into games
values(2238040, 'Tiny Terry''s Turbo Trip', 'Adventure', 17.99, 2024, 0);
insert into games
values(914750, 'Bee Simulator', 'Adventure', 19.99, 2020, 0);
insert into games
values(906100, 'Observation', 'Adventure', 6.24, 2020, 0);
insert into games
values(1331210, 'Wolfstride', 'Action', 14.99, 2021, 0);
insert into games
values(1370140, 'Kao the Kangaroo', 'Action', 7.49, 2022, 0);
insert into games
values(2851150, 'Tomba! Special Edition', 'Action', 19.99, 2024, 0);
insert into games
values(1324530, 'Warhammer 40,000: Shootas, Blood & Teef', 'Action', 19.99, 2022, 0);
insert into games
values(1981610, 'Wanted: Dead', 'Action', 29.99, 2023, 0);
insert into games
values(1872680, 'The Knight Witch', 'Action', 4.99, 2022, 0);
insert into games
values(1426010, 'STASIS: BONE TOTEM', 'Adventure', 19.99, 2023, 0);
insert into games
values(2305500, 'FAIRY TAIL: DUNGEONS', 'Adventure', 13.99, 2024, 0);
insert into games
values(994140, 'Lightmatter', 'Adventure', 19.99, 2020, 0);
insert into games
values(1233590, 'Warhammer Age of Sigmar: Storm Ground', 'Strategy', 19.99, 2021, 0);
insert into games
values(2235020, 'Contra: Operation Galuga', 'Action', 39.99, 2024, 0);
insert into games
values(1919470, 'Atari 50: The Anniversary Celebration', 'Action', 39.99, 2022, 0);
insert into games
values(1561340, 'Berserk Boy', 'Action', 12.40, 2024, 0);
insert into games
values(1036890, 'Shadow Warrior 3: Definitive Edition', 'Action', 39.99, 2022, 0);
insert into games
values(363860, 'MythForce', 'Action', 29.99, 2023, 0);
insert into games
values(1543710, 'Beyond Galaxyland', 'Action', 9.89, 2024, 0);
insert into games
values(1085220, 'Figment 2: Creed Valley', 'Action', 4.99, 2023, 0);
insert into games
values(1962430, 'Monochrome Mobius: Rights and Wrongs Forgotten', 'Adventure', 41.99, 2022, 0);
insert into games
values(1438480, 'Saviorless', 'Action', 12.99, 2024, 0);
insert into games
values(1259380, 'Submarine Titans', 'Simulation', 4.99, 2020, 0);
insert into games
values(720350, 'Mundaun', 'Action', 19.99, 2021, 0);
insert into games
values(1101360, 'Rock of Ages 3: Make & Break', 'Racing', 29.99, 2020, 0);
insert into games
values(1214650, 'SOUTH PARK: SNOW DAY!', 'Action', 29.99, 2024, 0);
insert into games
values(1121420, 'Kingdom Under Fire: The Crusaders', 'Action', 19.99, 2020, 0);
insert into games
values(1296450, 'Dust & Neon', 'Action', 19.99, 2023, 0);
insert into games
values(1521970, 'Goblin Stone', 'Indie', 24.99, 2024, 0);
insert into games
values(1229460, 'Dice Legacy', 'Indie', 2.99, 2021, 0);
insert into games
values(2076580, 'Pepper Grinder', 'Action', 14.99, 2024, 0);
insert into games
values(541310, 'Tiny Thor', 'Action', 9.99, 2023, 0);
insert into games
values(854940, 'Ikenfell', 'Indie', 19.99, 2020, 0);
insert into games
values(1726120, 'Cursed to Golf', 'Sports', 19.99, 2022, 0);
insert into games
values(878670, 'Shenmue III', 'Action', 29.99, 2020, 0);
insert into games
values(1370050, 'Trek to Yomi', 'Action', 19.99, 2022, 0);
insert into games
values(1730680, 'Klonoa Phantasy Reverie Series', 'Action', 39.99, 2022, 0);
insert into games
values(1273560, 'DeathSprint 66', 'Racing', 24.99, 2024, 0);
insert into games
values(1333200, 'Song of Nunu: A League of Legends Story', 'Adventure', 29.99, 2023, 0);
insert into games
values(1095120, 'Helheim Hassle', 'Adventure', 0.99, 2020, 0);
insert into games
values(829280, 'Kaze and the Wild Masks', 'Action', 14.99, 2021, 0);
insert into games
values(1484900, 'Hoa', 'Action', 14.99, 2021, 0);
insert into games
values(2304440, 'Creatures of Ava', 'Action', 24.99, 2024, 0);
insert into games
values(1167140, 'Siege Survival: Gloria Victis', 'Adventure', 24.99, 2021, 0);
insert into games
values(2596420, 'Arranger: A Role-Puzzling Adventure', 'Adventure', 14.99, 2024, 0);
insert into games
values(1755100, 'The Last Clockwinder', 'Adventure', 24.99, 2022, 0);
insert into games
values(762840, 'Maquette', 'Adventure', 19.99, 2021, 0);
insert into games
values(730430, 'This Is the President', 'Adventure', 14.99, 2021, 0);
insert into games
values(1269640, 'Beacon Pines', 'Adventure', 7.99, 2022, 0);
insert into games
values(1266030, 'The Pale Beyond', 'Adventure', 19.99, 2023, 0);
insert into games
values(2206210, 'GYLT', 'Action', 19.99, 2023, 0);
insert into games
values(1430220, 'BIOMORPH', 'Action', 19.99, 2024, 0);
insert into games
values(1409830, 'Sons of Valhalla', 'Action', 19.99, 2024, 0);
insert into games
values(1252830, 'A Juggler''s Tale', 'Action', 3.59, 2021, 0);
insert into games
values(1921980, 'Between Horizons', 'Adventure', 15.99, 2024, 0);
insert into games
values(924750, 'Harold Halibut', 'Adventure', 34.99, 2024, 0);
insert into games
values(609920, 'Hotshot Racing', 'Racing', 19.99, 2020, 0);
insert into games
values(1736290, 'Crime O''Clock', 'Adventure', 19.99, 2023, 0);
insert into games
values(1336180, 'Floodland', 'Simulation', 19.99, 2022, 0);
insert into games
values(2652000, 'The Jackbox Naughty Pack', 'Casual', 19.99, 2024, 0);
insert into games
values(1042380, 'Hundred Days - Winemaking Simulator', 'Indie', 24.99, 2021, 0);
insert into games
values(1375400, 'Ghosts ''n Goblins Resurrection', 'Action', 9.89, 2021, 0);
insert into games
values(2139300, 'Redemption Reapers', 'Simulation', 24.99, 2023, 0);
insert into games
values(1319460, 'Fashion Police Squad', 'Action', 9.99, 2022, 0);
insert into games
values(1119700, 'As Far As The Eye', 'Indie', 24.99, 2020, 0);
insert into games
values(762940, 'Mineko''s Night Market', 'Adventure', 19.99, 2023, 0);
insert into games
values(938560, 'INMOST', 'Adventure', 14.99, 2020, 0);
insert into games
values(1144770, 'SLUDGE LIFE', 'Adventure', 2.99, 2021, 0);
insert into games
values(721180, 'Dustborn', 'Action', 14.99, 2024, 0);
insert into games
values(1661630, 'KarmaZoo', 'Action', 9.99, 2023, 0);
insert into games
values(1135260, 'The Falconeer', 'Action', 19.99, 2020, 0);
insert into games
values(1519710, 'SCHiM', 'Adventure', 24.99, 2024, 0);
insert into games
values(890720, 'In Other Waters', 'Adventure', 3.74, 2020, 0);
insert into games
values(1982340, 'Blanc', 'Adventure', 14.99, 2023, 0);
insert into games
values(2275150, 'SLUDGE LIFE 2', 'Adventure', 8.99, 2023, 0);
insert into games
values(2138090, 'Atelier Marie Remake: The Alchemist of Salburg', 'Casual', 49.99, 2023, 0);
insert into games
values(898890, 'Endling - Extinction is Forever', 'Adventure', 29.99, 2022, 0);
insert into games
values(1403440, 'Broken Roads', 'RPG', 34.99, 2024, 0);
insert into games
values(1351210, 'Gord', 'Adventure', 8.74, 2023, 0);
insert into games
values(1393370, 'Actraiser Renaissance', 'Action', 29.99, 2021, 0);
insert into games
values(1084640, 'Chicken Police - Paint it RED!', 'Adventure', 19.99, 2020, 0);
insert into games
values(1205900, 'Alwa''s Legacy', 'Action', 17.99, 2020, 0);
insert into games
values(944920, 'Nanotale - Typing Chronicles', 'Adventure', 19.99, 2021, 0);
insert into games
values(1580180, 'Gunbrella', 'Action', 14.99, 2023, 0);
insert into games
values(1107790, 'The Complex', 'Adventure', 6.89, 2020, 0);
insert into games
values(1061880, 'Conan Chop Chop', 'Action', 14.99, 2022, 0);
insert into games
values(1191900, 'Say No! More', 'Casual', 14.99, 2021, 0);
insert into games
values(1946700, 'Layers of Fear', 'Adventure', 29.99, 2023, 0);
insert into games
values(1140890, 'Morbid: The Seven Acolytes', 'Action', 24.99, 2020, 0);
insert into games
values(1011190, 'SIMULACRA 2', 'Indie', 7.99, 2020, 0);
insert into games
values(861250, 'Cyber Shadow', 'Action', 19.99, 2021, 0);
insert into games
values(1998330, 'Yomawari: Lost in the Dark', 'Adventure', 19.99, 2022, 0);
insert into games
values(2231190, 'Magical Delicacy', 'Adventure', 24.99, 2024, 0);
insert into games
values(1225580, 'Fe', 'Action', 4.99, 2020, 0);
insert into games
values(612570, 'Fort Triumph', 'Indie', 19.99, 2020, 0);
insert into games
values(1062110, 'UNSIGHTED', 'Action', 19.99, 2021, 0);
insert into games
values(1708010, 'The Expanse: A Telltale Series', 'Adventure', 24.99, 2023, 0);
insert into games
values(1164050, 'When The Past Was Around', 'Adventure', 4.79, 2020, 0);
insert into games
values(2229940, '[REDACTED]', 'Action', 24.99, 2024, 0);
insert into games
values(1097110, 'Willy Morgan and the Curse of Bone Town', 'Adventure', 19.99, 2020, 0);
insert into games
values(889910, 'Hell Pie', 'Action', 24.99, 2022, 0);
insert into games
values(1523650, 'Stargate: Timekeepers', 'Strategy', 29.99, 2024, 0);
insert into games
values(1335230, 'Sumire', 'Adventure', 0.89, 2021, 0);
insert into games
values(1771360, 'Gerda: A Flame in Winter', 'Adventure', 6.99, 2022, 0);
insert into games
values(948640, 'Wizardry: Labyrinth of Lost Souls', 'RPG', 14.99, 2020, 0);
insert into games
values(1608700, 'Soundfall', 'Action', 29.99, 2022, 0);
insert into games
values(1574270, 'Sucker for Love: First Date', 'Indie', 9.99, 2022, 0);
insert into games
values(2535440, 'Shadows of the Damned: Hella Remastered', 'Action', 24.99, 2024, 0);
insert into games
values(1333470, 'Alex Kidd in Miracle World DX', 'Action', 19.99, 2021, 0);
insert into games
values(1582680, 'Trolley Problem, Inc.', 'Casual', 10.99, 2022, 0);
insert into games
values(1530470, 'Daymare: 1994 Sandcastle', 'Action', 29.99, 2023, 0);
insert into games
values(1610460, 'Monster Energy Supercross - The Official Videogame 5', 'Racing', 3.99, 2022, 0);
insert into games
values(2316580, 'Tales of Kenzera™: ZAU', 'Action', 13.99, 2024, 0);
insert into games
values(581660, 'Super Meat Boy Forever', 'Action', 19.99, 2022, 0);
insert into games
values(1911360, 'Trinity Fusion', 'Action', 19.99, 2023, 0);
insert into games
values(1959390, 'Fear the Spotlight', 'Action', 19.99, 2023, 0);
insert into games
values(2060790, 'Hauntii', 'Action', 19.99, 2024, 0);
insert into games
values(1385100, 'Insurmountable', 'Adventure', 24.99, 2021, 0);
insert into games
values(1782330, 'Green Hell VR', 'Action', 24.99, 2022, 0);
insert into games
values(1099640, 'Jack Move', 'Adventure', 19.99, 2022, 0);
insert into games
values(1049710, 'Minute of Islands', 'Adventure', 3.99, 2021, 0);
insert into games
values(1345820, 'Ragnarock', 'Action', 24.99, 2021, 0);
insert into games
values(773370, 'Exo One', 'Adventure', 5.09, 2021, 0);
insert into games
values(1942010, 'Vengeful Guardian: Moonrider', 'Action', 11.04, 2023, 0);
insert into games
values(916350, 'Saturnalia', 'Adventure', 19.99, 2023, 0);
insert into games
values(814680, 'Unbound: Worlds Apart', 'Adventure', 19.99, 2021, 0);
insert into games
values(1119600, 'Help Will Come Tomorrow', 'Adventure', 19.99, 2020, 0);
insert into games
values(1137450, 'ENCODYA', 'Adventure', 24.99, 2021, 0);
insert into games
values(1132910, 'ITORAH', 'Action', 19.99, 2022, 0);
insert into games
values(1220150, 'Blue Fire', 'Action', 19.99, 2021, 0);
insert into games
values(1341050, 'BALAN WONDERWORLD', 'Action', 39.99, 2021, 0);
insert into games
values(1297330, 'Olija', 'Action', 14.99, 2021, 0);
insert into games
values(2437040, 'Reigns: Three Kingdoms', 'Adventure', 2.99, 2024, 0);
insert into games
values(1393750, 'Ocean''s Heart', 'Action', 14.99, 2021, 0);
insert into games
values(1600910, 'Demon''s Mirror', 'Strategy', 19.99, 2024, 0);
insert into games
values(985950, 'Operencia: The Stolen Sun', 'Action', 29.99, 2020, 0);
insert into games
values(1896880, 'Dungeons of Dreadrock', 'Adventure', 5.99, 2022, 0);
insert into games
values(1932160, 'Neptunia: Sisters VS Sisters', 'Action', 49.99, 2023, 0);
insert into games
values(598730, 'Shakedown: Hawaii', 'Action', 19.99, 2020, 0);
insert into games
values(2337820, 'The Crush House', 'Adventure', 12.74, 2024, 0);
insert into games
values(1346010, 'RiMS Racing', 'Racing', 49.99, 2021, 0);
insert into games
values(1147330, 'Lifeless Moon', 'Action', 10.39, 2023, 0);
insert into games
values(1294420, 'Rollerdrome', 'Sports', 29.99, 2022, 0);
insert into games
values(1783680, 'Thalassa: Edge of the Abyss', 'Adventure', 19.99, 2024, 0);
insert into games
values(1867530, 'Solar Ash', 'Action', 39.99, 2022, 0);
insert into games
values(702680, 'Wattam', 'Adventure', 19.99, 2020, 0);
insert into games
values(374190, 'Infernax', 'Action', 13.39, 2022, 0);
insert into games
values(1114290, 'Windjammers 2', 'Sports', 8.99, 2022, 0);
insert into games
values(1399700, 'Kapital: Sparks of Revolution', 'Indie', 19.99, 2022, 0);
insert into games
values(1016790, 'West of Dead', 'Action', 19.99, 2020, 0);
insert into games
values(1423600, 'BLUE REFLECTION: Second Light', 'RPG', 59.99, 2021, 0);
insert into games
values(1514930, 'Erica', 'Casual', 11.99, 2021, 0);
insert into games
values(809060, 'REVEIL', 'Adventure', 12.99, 2024, 0);
insert into games
values(941570, 'Relicta', 'Action', 19.99, 2020, 0);
insert into games
values(967390, 'Chronos: Before the Ashes', 'Action', 7.49, 2020, 0);
insert into games
values(1678420, 'Blade Runner: Enhanced Edition', 'Adventure', 9.99, 2022, 0);
insert into games
values(1098770, 'The Crimson Diamond', 'Adventure', 13.49, 2024, 0);
insert into games
values(465100, 'LUNA The Shadow Dust', 'Adventure', 13.99, 2020, 0);
insert into games
values(679110, 'Werewolf: The Apocalypse - Earthblood', 'Action', 29.99, 2022, 0);
insert into games
values(1502560, 'The Smurfs - Mission Vileaf', 'Action', 2.99, 2021, 0);
insert into games
values(1263070, 'Blightbound', 'Action', 19.99, 2021, 0);
insert into games
values(1248080, 'CYGNI: All Guns Blazing', 'Action', 29.99, 2024, 0);
insert into games
values(1581480, 'HUMANITY', 'Action', 17.99, 2023, 0);
insert into games
values(1575470, 'Frogun', 'Action', 14.99, 2022, 0);
insert into games
values(1223910, 'Tennis World Tour 2', 'Sports', 39.99, 2020, 0);
insert into games
values(2794770, 'Clock Tower: Rewind', 'Adventure', 19.99, 2024, 0);
insert into games
values(1041920, 'If Found...', 'Casual', 12.99, 2020, 0);
insert into games
values(733210, 'Neversong', 'Action', 2.99, 2020, 0);
insert into games
values(1172650, 'INDUSTRIA', 'Action', 19.99, 2021, 0);
insert into games
values(1000760, 'Foregone', 'Action', 19.99, 2021, 0);
insert into games
values(2738750, 'REYNATIS', 'Action', 59.99, 2024, 0);
insert into games
values(1946070, 'Ten Dates', 'Adventure', 10.39, 2023, 0);
insert into games
values(1602560, 'The Many Pieces of Mr. Coo', 'Adventure', 14.99, 2023, 0);
insert into games
values(1345760, 'Matchpoint - Tennis Championships', 'Sports', 39.99, 2022, 0);
insert into games
values(1015940, 'Welcome to Elk', 'Adventure', 14.99, 2020, 0);
insert into games
values(1998450, 'Black & White', 'Adventure', 9.74, 2023, 0);
insert into games
values(1307660, 'Ravenbound', 'Action', 11.99, 2023, 0);
insert into games
values(1304340, 'Monster Energy Supercross - The Official Videogame 4', 'Racing', 29.99, 2021, 0);
insert into games
values(1350200, 'IMMORTALITY', 'Adventure', 19.99, 2022, 0);
insert into games
values(1178210, 'Stirring Abyss', 'Adventure', 24.99, 2020, 0);
insert into games
values(995980, 'Fae Tactics', 'RPG', 19.99, 2020, 0);
insert into games
values(1071130, 'The Procession to Calvary', 'Adventure', 4.49, 2020, 0);
insert into games
values(840210, 'Arkham Horror: Mother''s Embrace', 'Adventure', 19.99, 2021, 0);
insert into games
values(1506510, 'The Ramp', 'Sports', 5.99, 2021, 0);
insert into games
values(1184760, 'Shovel Knight Pocket Dungeon', 'Action', 19.99, 2021, 0);
insert into games
values(1104380, 'The Room VR: A Dark Matter', 'Adventure', 29.99, 2020, 0);
insert into games
values(1671360, 'Ereban: Shadow Legacy', 'Action', 24.99, 2024, 0);
insert into games
values(1612780, 'The Centennial Case : A Shijima Story', 'Adventure', 49.99, 2022, 0);
insert into games
values(2223740, 'Agatha Christie - Hercule Poirot: The London Case', 'Action', 8.99, 2023, 0);
insert into games
values(1960110, 'Silent Hope', 'Action', 11.99, 2023, 0);
insert into games
values(1125910, 'Crowns and Pawns: Kingdom of Deceit', 'Adventure', 19.99, 2022, 0);
insert into games
values(730390, 'Raji: An Ancient Epic', 'Action', 24.99, 2020, 0);
insert into games
values(1539620, 'MONARK', 'RPG', 59.99, 2022, 0);
insert into games
values(969760, 'Omno', 'Action', 18.99, 2021, 0);
insert into games
values(1162130, 'Windbound', 'Adventure', 19.99, 2020, 0);
insert into games
values(986310, 'Recompile', 'Action', 19.99, 2021, 0);
insert into games
values(1924430, 'Cookie Cutter', 'Action', 19.99, 2023, 0);
insert into games
values(1630110, 'Gungrave G.O.R.E', 'Action', 29.99, 2022, 0);
insert into games
values(2516170, 'G.I. Joe: Wrath of Cobra', 'Action', 19.99, 2024, 0);
insert into games
values(1012570, 'Knuckle Sandwich', 'Adventure', 19.99, 2023, 0);
insert into games
values(1246250, 'An Airport for Aliens Currently Run by Dogs', 'Adventure', 19.99, 2021, 0);
insert into games
values(2131010, 'The Land Beneath Us', 'Indie', 14.99, 2024, 0);
insert into games
values(1150950, 'Timelie', 'Adventure', 17.99, 2020, 0);
insert into games
values(1614270, 'Submerged: Hidden Depths', 'Adventure', 29.99, 2022, 0);
insert into games
values(1325890, 'SILT', 'Adventure', 14.99, 2022, 0);
insert into games
values(2769080, 'Kong: Survivor Instinct', 'Action', 24.99, 2024, 0);
insert into games
values(1983970, 'Affogato', 'Adventure', 11.04, 2023, 0);
insert into games
values(1499120, 'I Expect You To Die 2: The Spy and the Liar', 'Adventure', 24.99, 2021, 0);
insert into games
values(1668530, 'The Legend of Nayuta: Boundless Trails', 'Action', 27.99, 2021, 0);
insert into games
values(1371690, 'GRAVEN', 'Action', 24.99, 2024, 0);
insert into games
values(1912380, 'Soccer Story', 'Sports', 19.99, 2022, 0);
insert into games
values(762220, 'Afterparty', 'Adventure', 19.99, 2020, 0);
insert into games
values(1110050, 'Evan''s Remains', 'Adventure', 6.99, 2020, 0);
insert into games
values(725270, 'Necrobarista', 'Indie', 19.99, 2020, 0);
insert into games
values(865610, 'Tails Noir', 'Adventure', 24.99, 2021, 0);
insert into games
values(946030, 'Axiom Verge 2', 'Action', 19.99, 2022, 0);
insert into games
values(254370, 'Aquanox Deep Descent', 'Action', 29.99, 2020, 0);
insert into games
values(1456880, 'ElecHead', 'Action', 9.99, 2021, 0);
insert into games
values(1976950, 'Desktop Dungeons: Rewind', 'Adventure', 19.99, 2023, 0);
insert into games
values(989440, 'Phantom Abyss', 'MMO', 19.99, 2024, 0);
insert into games
values(1733240, 'Phantom Fury', 'Action', 24.99, 2024, 0);
insert into games
values(1353270, 'Five Dates', 'Adventure', 7.94, 2020, 0);
insert into games
values(628200, 'The Invisible Hand', 'Adventure', 12.99, 2021, 0);
insert into games
values(968370, 'The Blind Prophet', 'Adventure', 19.99, 2020, 0);
insert into games
values(1671410, 'Somerville', 'Adventure', 19.99, 2022, 0);
insert into games
values(1430680, 'Clash: Artifacts of Chaos', 'Action', 29.99, 2023, 0);
insert into games
values(2162020, 'Strayed Lights', 'Action', 12.99, 2023, 0);
insert into games
values(1368130, 'Park Beyond', 'Casual', 29.99, 2023, 0);
insert into games
values(858030, 'Paranoia: Happiness is Mandatory', 'RPG', 29.99, 2023, 0);
insert into games
values(2602020, 'The Smurfs – Dreams', 'Action', 29.99, 2024, 0);
insert into games
values(1045180, 'Shattered - Tale of the Forgotten King', 'Action', 29.99, 2021, 0);
insert into games
values(739080, '9 Monkeys of Shaolin', 'Action', 19.99, 2020, 0);
insert into games
values(840390, 'Spacebase Startopia', 'Simulation', 39.99, 2021, 0);
insert into games
values(1421790, 'Labyrinth City: Pierre the Maze Detective', 'Adventure', 11.99, 2021, 0);
insert into games
values(1399080, 'The DioField Chronicle', 'RPG', 59.99, 2022, 0);
insert into games
values(1015890, 'TASOMACHI: Behind the Twilight', 'Action', 19.99, 2021, 0);
insert into games
values(2243670, 'Return to Grace', 'Adventure', 14.99, 2023, 0);
insert into games
values(1139280, 'The Big Con', 'Adventure', 14.99, 2021, 0);
insert into games
values(2660410, 'CORRUPTION 2029', 'Strategy', 9.99, 2024, 0);
insert into games
values(2081400, 'Gal Guardians: Demon Purge', 'Action', 13.24, 2023, 0);
insert into games
values(968870, 'Close to the Sun', 'Adventure', 19.99, 2020, 0);
insert into games
values(985900, 'Young Souls', 'Action', 9.99, 2022, 0);
insert into games
values(1405790, 'John Wick Hex', 'Action', 19.99, 2020, 0);
insert into games
values(1568970, 'Torn Away', 'Adventure', 8.99, 2023, 0);
insert into games
values(1310330, 'Goodbye Volcano High', 'Adventure', 20.09, 2023, 0);
insert into games
values(1422420, 'Dodgeball Academia', 'Sports', 24.99, 2021, 0);
insert into games
values(1579280, 'The Last Worker', 'Action', 19.99, 2023, 0);
insert into games
values(1229420, 'Company of Crime', 'Action', 19.99, 2020, 0);
insert into games
values(1402320, 'Medal of Honor™: Above and Beyond', 'Action', 39.99, 2020, 0);
insert into games
values(690120, 'Inked: A Tale of Love', 'Adventure', 9.99, 2021, 0);
insert into games
values(1674640, 'XEL', 'Action', 14.99, 2022, 0);
insert into games
values(1190400, 'The Wonderful 101: Remastered', 'Action', 30.00, 2020, 0);
insert into games
values(1154040, 'SpellForce 3 Fallen God', 'RPG', 19.99, 2020, 0);
insert into games
values(2146570, 'RKGK / Rakugaki', 'Action', 13.99, 2024, 0);
insert into games
values(1592540, 'Loretta', 'Adventure', 14.99, 2023, 0);
insert into games
values(1497360, 'Open Roads', 'Adventure', 19.99, 2024, 0);
insert into games
values(982720, 'Paradise Lost', 'Adventure', 14.99, 2021, 0);
insert into games
values(2103680, 'Mediterranea Inferno', 'Adventure', 14.99, 2023, 0);
insert into games
values(1209410, 'King of Seas', 'Action', 24.99, 2021, 0);
insert into games
values(3061910, 'Pirate Hunter', 'Action', 9.99, 2024, 0);
insert into games
values(1843540, 'Akimbot', 'Action', 19.99, 2024, 0);
insert into games
values(750200, 'AWAY: The Survival Series', 'Action', 19.99, 2021, 0);
insert into games
values(1154790, 'XIII', 'Action', 1.99, 2020, 0);
insert into games
values(2015960, 'Parcel Corps', 'Racing', 34.99, 2024, 0);
insert into games
values(1113570, 'Voice of Cards: The Isle Dragon Roars', 'RPG', 29.99, 2021, 0);
insert into games
values(2193050, 'Bleak Sword DX', 'Action', 9.99, 2023, 0);
insert into games
values(347800, 'Ghost Song', 'Action', 19.99, 2022, 0);
insert into games
values(762180, 'Treachery in Beatdown City', 'Sports', 19.99, 2020, 0);
insert into games
values(1284090, 'Chariots of War', 'Strategy', 14.99, 2022, 0);
insert into games
values(1369520, 'Strangeland', 'Adventure', 14.99, 2021, 0);
insert into games
values(1115780, 'The Almost Gone', 'Adventure', 1.99, 2020, 0);
insert into games
values(1662480, 'Nuclear Blaze', 'Action', 9.99, 2021, 0);
insert into games
values(1191260, 'Touken Ranbu Warriors', 'Action', 59.99, 2022, 0);
insert into games
values(1223500, 'Umurangi Generation', 'Casual', 14.99, 2020, 0);
insert into games
values(1050370, 'LUNARK', 'Action', 19.99, 2023, 0);
insert into games
values(1178140, 'Pixel Ripped 1995', 'Action', 19.99, 2020, 0);
insert into games
values(1619230, 'The Star Named EOS', 'Adventure', 14.99, 2024, 0);
insert into games
values(1831700, 'Tin Hearts', 'Adventure', 19.99, 2023, 0);
insert into games
values(1225590, 'Sea of Solitude', 'Adventure', 4.99, 2020, 0);
insert into games
values(1082680, 'The Walking Dead Onslaught', 'Action', 29.99, 2020, 0);
insert into games
values(1302050, 'Milky Way Prince – The Vampire Star', 'Adventure', 14.99, 2020, 0);
insert into games
values(1532460, 'The Fridge is Red', 'Action', 14.99, 2022, 0);
insert into games
values(2562900, 'Eden Genesis', 'Action', 12.49, 2024, 0);
insert into games
values(959860, 'The Valiant', 'RPG', 24.99, 2022, 0);
insert into games
values(599610, 'Lost Words: Beyond the Page', 'Action', 14.99, 2021, 0);
insert into games
values(883360, 'Beyond Blue', 'Adventure', 19.99, 2020, 0);
insert into games
values(1640320, 'B.I.O.T.A.', 'Action', 9.99, 2022, 0);
insert into games
values(1651960, 'Hextech Mayhem: A League of Legends Story™', 'Action', 9.99, 2021, 0);
insert into games
values(596000, 'The Shattering', 'Adventure', 19.99, 2020, 0);
insert into games
values(1337530, 'Maskmaker', 'Adventure', 14.99, 2021, 0);
insert into games
values(1121780, 'Astria Ascending', 'RPG', 34.99, 2021, 0);
insert into games
values(623280, 'Dungeons & Dragons: Dark Alliance', 'Action', 29.99, 2021, 0);
insert into games
values(1991300, 'Closer the Distance', 'Casual', 19.99, 2024, 0);
insert into games
values(1424980, 'The Solitaire Conspiracy', 'Indie', 11.99, 2020, 0);
insert into games
values(1001800, 'KUNAI', 'Action', 4.24, 2020, 0);
insert into games
values(1267930, 'Deadly Dozen: Pacific Theater', 'Action', 9.99, 2020, 0);
insert into games
values(1377920, 'Big Mutha Truckers 2', 'Racing', 9.99, 2020, 0);
insert into games
values(1540350, 'The Fabulous Fear Machine', 'Indie', 17.99, 2023, 0);
insert into games
values(768450, 'NUTS', 'Adventure', 24.99, 2021, 0);
insert into games
values(735290, 'Genesis Noir', 'Adventure', 14.99, 2021, 0);
insert into games
values(593640, 'Papetura', 'Adventure', 6.47, 2021, 0);
insert into games
values(1544360, 'LEGO® Builder''s Journey', 'Adventure', 19.99, 2021, 0);
insert into games
values(922050, 'DOOMBLADE', 'Action', 5.43, 2023, 0);
insert into games
values(2471130, 'Obsidian', 'Adventure', 9.99, 2023, 0);
insert into games
values(1309620, 'Bears In Space', 'Action', 19.99, 2024, 0);
insert into games
values(931310, 'Airplane Mode', 'Indie', 11.99, 2020, 0);
insert into games
values(1277130, 'Deathbound', 'Action', 20.99, 2024, 0);
insert into games
values(910490, 'Killsquad', 'Action', 29.99, 2021, 0);
insert into games
values(1035560, 'Struggling', 'Action', 14.99, 2020, 0);
insert into games
values(817020, 'Unholy', 'Action', 29.99, 2023, 0);
insert into games
values(1164060, 'The Last Show of Mr. Chardish', 'Action', 9.99, 2020, 0);
insert into games
values(1024480, 'Immortal Realms: Vampire Wars', 'Action', 29.99, 2020, 0);
insert into games
values(1969440, 'Sunday Gold', 'Adventure', 21.99, 2022, 0);
insert into games
values(2556990, 'Beyond Good & Evil - 20th Anniversary Edition', 'Action', 15.99, 2024, 0);
insert into games
values(695330, 'SEASON: A letter to the future', 'Adventure', 24.99, 2023, 0);
insert into games
values(1419620, 'Saltsea Chronicles', 'Adventure', 24.99, 2023, 0);
insert into games
values(2161620, 'Lysfanga: The Time Shift Warrior', 'Action', 19.99, 2024, 0);
insert into games
values(2104880, 'Undead Inc.', 'Action', 9.99, 2024, 0);
insert into games
values(2008510, 'Go Mecha Ball', 'Action', 9.99, 2024, 0);
insert into games
values(1672310, 'Decarnation', 'Action', 14.99, 2023, 0);
insert into games
values(1903910, 'Slave Zero X', 'Action', 24.99, 2024, 0);
insert into games
values(2060870, 'Invincible Presents: Atom Eve', 'Adventure', 9.99, 2023, 0);
insert into games
values(2172180, 'Howl', 'Adventure', 9.99, 2023, 0);
insert into games
values(1640630, 'Heading Out', 'Racing', 19.99, 2024, 0);
insert into games
values(1546920, 'Overboard!', 'Adventure', 7.49, 2021, 0);
insert into games
values(1058690, 'Signs of the Sojourner', 'Adventure', 19.99, 2020, 0);
insert into games
values(926580, 'Broken Lines', 'Strategy', 24.99, 2020, 0);
insert into games
values(1075200, 'TOHU', 'Adventure', 14.99, 2021, 0);
insert into games
values(1451080, 'DUNGEON ENCOUNTERS', 'RPG', 29.99, 2021, 0);
insert into games
values(951750, 'I Am Dead', 'Adventure', 19.99, 2020, 0);
insert into games
values(1989320, 'Astor: Blade of the Monolith', 'Action', 24.99, 2024, 0);
insert into games
values(1170060, 'Boomerang X', 'Action', 19.99, 2021, 0);
insert into games
values(794960, 'The Sojourn', 'Adventure', 24.99, 2020, 0);
insert into games
values(1146310, 'Beyond a Steel Sky', 'Action', 6.99, 2020, 0);
insert into games
values(1739900, 'Death of the Reprobate', 'Adventure', 11.69, 2024, 0);
insert into games
values(1293730, 'Broken Pieces', 'Action', 24.99, 2022, 0);
insert into games
values(1905020, 'Greyhill Incident', 'Adventure', 24.99, 2023, 0);
insert into games
values(1811040, 'South of the Circle', 'Adventure', 12.99, 2022, 0);
insert into games
values(1037120, 'Mutropolis', 'Adventure', 12.99, 2021, 0);
insert into games
values(1650810, 'Loopmancer', 'Action', 24.99, 2022, 0);
insert into games
values(1301950, 'Time Loader', 'Action', 1.49, 2021, 0);
insert into games
values(2543760, 'Shadow of the Ninja - Reborn', 'Action', 19.99, 2024, 0);
insert into games
values(1600370, 'Not Tonight 2', 'Adventure', 4.99, 2022, 0);
insert into games
values(2215540, 'Colossal Cave', 'Adventure', 24.99, 2023, 0);
insert into games
values(2450820, 'Radiant Silvergun', 'Action', 19.99, 2023, 0);
insert into games
values(1213750, 'Fight Crab', 'Sports', 19.99, 2020, 0);
insert into games
values(1422410, 'Into the Pit', 'Action', 14.99, 2021, 0);
insert into games
values(2082270, 'Artifact', 'Adventure', 7.99, 2022, 0);
insert into games
values(1432850, 'Farewell North', 'Adventure', 19.19, 2024, 0);
insert into games
values(2081470, 'Red Matter 2', 'Action', 29.99, 2022, 0);
insert into games
values(1183850, 'Pneumata', 'Action', 34.99, 2024, 0);
insert into games
values(899310, 'Iron Danger', 'Action', 19.99, 2020, 0);
insert into games
values(1122680, 'The Artful Escape', 'Action', 19.99, 2021, 0);
insert into games
values(1042670, 'Orangeblood', 'Indie', 19.99, 2020, 0);
insert into games
values(912570, 'BEAUTIFUL DESOLATION', 'Adventure', 12.99, 2020, 0);
insert into games
values(1195360, 'Re:Turn - One Way Trip', 'Adventure', 11.99, 2020, 0);
insert into games
values(989790, 'The Vale: Shadow of the Crown', 'Action', 9.99, 2021, 0);
insert into games
values(1666250, 'Circus Electrique', 'Indie', 19.99, 2022, 0);
insert into games
values(1060210, 'Disaster Report 4: Summer Memories', 'Action', 59.99, 2020, 0);
insert into games
values(1647730, 'Zool Redimensioned', 'Action', 9.99, 2021, 0);
insert into games
values(1617220, 'Thirsty Suitors', 'Action', 29.99, 2023, 0);
insert into games
values(1177030, 'PONG Quest™', 'Action', 14.99, 2020, 0);
insert into games
values(1280300, 'Steel Assault', 'Action', 14.99, 2021, 0);
insert into games
values(1781010, 'Pine Hearts', 'Adventure', 19.99, 2024, 0);
insert into games
values(945680, 'Here Be Dragons', 'Adventure', 9.99, 2020, 0);
insert into games
values(1386870, 'Wraith: The Oblivion - Afterlife', 'Adventure', 19.99, 2021, 0);
insert into games
values(1346400, 'Battle Engine Aquila', 'Action', 9.99, 2020, 0);
insert into games
values(1468380, 'The Sundew', 'Adventure', 14.99, 2021, 0);
insert into games
values(2662630, 'The Elder Scrolls Online: Gold Road', 'MMO', 39.99, 2024, 0);
insert into games
values(1505430, 'Inversion', 'Action', 0.99, 2021, 0);
insert into games
values(1383250, 'Please Fix The Road', 'Casual', 9.99, 2022, 0);
insert into games
values(1400970, 'The Elder Scrolls Online - Blackwood', 'MMO', 0.00, 2021, 1);
insert into games
values(1586880, 'Essays on Empathy', 'Casual', 12.99, 2021, 0);
insert into games
values(2493360, 'Dark and Deep', 'Action', 19.99, 2024, 0);
insert into games
values(2337640, 'Pinball M', 'Simulation', 0.00, 2023, 1);
insert into games
values(1130710, 'Bookbound Brigade', 'Action', 19.99, 2020, 0);
insert into games
values(1060600, 'Lair of the Clockwork God', 'Action', 19.99, 2020, 0);
insert into games
values(1139870, 'The Dark Eye : Book of Heroes', 'RPG', 9.99, 2020, 0);
insert into games
values(975150, 'Resolutiion', 'Action', 19.99, 2020, 0);
insert into games
values(1095040, 'Unexplored 2: The Wayfarer''s Legacy', 'Adventure', 19.99, 2022, 0);
insert into games
values(605800, 'Skelattack', 'Action', 19.99, 2020, 0);
insert into games
values(1592490, 'Bloodless', 'Action', 14.99, 2024, 0);
insert into games
values(975950, 'Effie', 'Action', 19.99, 2020, 0);
insert into games
values(1787810, 'Song in the Smoke', 'Action', 29.99, 2021, 0);
insert into games
values(2099990, 'graveyard keeper', 'Casual', 0.00, 2022, 1);
insert into games
values(1698220, 'Teslagrad 2', 'Action', 19.99, 2023, 0);
insert into games
values(1145290, 'Out There: Oceans of Time', 'Adventure', 24.99, 2022, 0);
insert into games
values(3246160, 'Shelter', 'Casual', 2.69, 2024, 0);
insert into games
values(523770, 'Of Bird and Cage', 'Action', 9.99, 2021, 0);
insert into games
values(1154830, 'Scathe', 'Action', 24.99, 2022, 0);
insert into games
values(1675900, 'Warlander', 'MMO', 0.00, 2023, 1);
insert into games
values(1240060, 'A Highland Song', 'Adventure', 10.79, 2023, 0);
insert into games
values(979310, 'Disjunction', 'Action', 1.59, 2021, 0);
insert into games
values(1620720, 'The Forest Quartet', 'Adventure', 9.99, 2022, 0);
insert into games
values(1585440, 'They Always Run', 'Action', 9.99, 2021, 0);
insert into games
values(536280, 'Disintegration', 'Action', 29.99, 2020, 0);
insert into games
values(1154670, 'Die by the Blade', 'Action', 19.99, 2024, 0);
insert into games
values(1318970, 'This Way Madness Lies', 'RPG', 9.99, 2022, 0);
insert into games
values(1529550, 'The Magnificent Trufflepigs', 'Adventure', 11.99, 2021, 0);
insert into games
values(1966420, 'Harmony: The Fall of Reverie', 'Adventure', 8.74, 2023, 0);
insert into games
values(3270520, 'Limbo', 'Action', 0.99, 2024, 0);
insert into games
values(2211280, 'Roller Champions™', 'Sports', 0.00, 2022, 1);
insert into games
values(1401400, 'Lovecraft''s Untold Stories 2', 'Action', 19.99, 2022, 0);
insert into games
values(1299360, 'Mighty Goose', 'Action', 19.99, 2021, 0);
insert into games
values(1293910, 'Read Only Memories: NEURODIVER', 'Adventure', 14.99, 2024, 0);
insert into games
values(2527580, 'Teenage Mutant Ninja Turtles Arcade: Wrath of the Mutants', 'Action', 29.99, 2024, 0);
insert into games
values(1453790, 'The Serpent Rogue', 'Action', 1.99, 2022, 0);
insert into games
values(1258220, 'Song of Iron', 'Action', 19.99, 2021, 0);
insert into games
values(1727180, 'NeverAwake', 'Action', 19.99, 2022, 0);
insert into games
values(2024390, 'Mato Anomalies', 'RPG', 5.99, 2023, 0);
insert into games
values(945740, 'Buildings Have Feelings Too!', 'Indie', 19.99, 2021, 0);
insert into games
values(2089830, 'Beat Slayer', 'Action', 19.99, 2024, 0);
insert into games
values(1062340, 'KATANA KAMI: A Way of the Samurai Story', 'Action', 29.99, 2020, 0);
insert into games
values(1342620, 'Werewolf: The Apocalypse — Heart of the Forest', 'Adventure', 14.99, 2020, 0);
insert into games
values(1098292, 'DOOM Eternal: The Ancient Gods - Part One', 'Action', 19.99, 2020, 0);
insert into games
values(1249110, 'Skully', 'Adventure', 29.99, 2020, 0);
insert into games
values(3070400, 'Late Shift', 'Action', 5.99, 2024, 0);
insert into games
values(1569220, 'Abermore', 'Action', 1.59, 2022, 0);
insert into games
values(2357570, 'Overwatch® 2', 'Action', 0.00, 2023, 1);
insert into games
values(1436920, 'Tandem: A Tale of Shadows', 'Action', 9.99, 2021, 0);
insert into games
values(1947210, 'SPLIT', 'Casual', 0.99, 2022, 0);
insert into games
values(2933620, 'Call of Duty®: Black Ops 6', 'Action', 69.99, 2024, 0);
insert into games
values(1755030, 'Mothmen 1966', 'Adventure', 8.99, 2022, 0);
insert into games
values(1507790, 'Witch Strandings', 'Adventure', 14.99, 2022, 0);
insert into games
values(1649340, 'Theatre of War', 'Strategy', 6.99, 2021, 0);
insert into games
values(2324650, 'The Murder of Sonic the Hedgehog', 'Casual', 0.00, 2023, 1);
insert into games
values(2074920, 'The First Descendant', 'Action', 0.00, 2024, 1);
insert into games
values(2600140, 'Please, Touch The Artwork 2', 'Adventure', 0.00, 2024, 1);
insert into games
values(1094540, 'Smelter', 'Action', 19.99, 2021, 0);
insert into games
values(962700, 'Chronicle of Innsmouth: Mountains of Madness', 'Adventure', 19.99, 2021, 0);
insert into games
values(1383700, 'Jet Kave Adventure', 'Action', 1.49, 2021, 0);
insert into games
values(1125330, 'Griefhelm', 'Sports', 9.99, 2020, 0);
insert into games
values(1064840, 'Tamarin', 'Action', 29.99, 2020, 0);
insert into games
values(1220370, 'Ever Forward', 'Adventure', 14.99, 2020, 0);
insert into games
values(1321070, 'Death Come True', 'Adventure', 15.99, 2020, 0);
insert into games
values(2073850, 'THE FINALS', 'Action', 0.00, 2023, 1);
insert into games
values(2685090, 'Ufouria: The Saga 2', 'Action', 24.99, 2024, 0);
insert into games
values(2160480, 'Hellboy Web of Wyrd', 'Action', 24.99, 2023, 0);
insert into games
values(2784620, 'ROGUE FLIGHT', 'Action', 19.99, 2024, 0);
insert into games
values(2076820, 'VANQUISH', 'Action', 1.99, 2022, 0);
insert into games
values(2632930, 'Life Eater', 'Indie', 14.99, 2024, 0);
insert into games
values(1239950, 'Astronaut: The Best', 'Adventure', 14.99, 2023, 0);
insert into games
values(874040, 'Ministry of Broadcast', 'Adventure', 14.99, 2020, 0);
insert into games
values(1674920, 'Sovereign Syndicate', 'RPG', 13.99, 2024, 0);
insert into games
values(1311070, 'Greak: Memories of Azur', 'Action', 4.99, 2021, 0);
insert into games
values(1122700, 'Hindsight', 'Adventure', 14.99, 2022, 0);
insert into games
values(1189800, 'Bleeding Edge', 'Action', 29.99, 2020, 0);
insert into games
values(1522140, 'Demon Skin', 'Action', 9.99, 2021, 0);
insert into games
values(2278790, 'Grapple Dogs: Cosmic Canines', 'Action', 17.99, 2024, 0);
insert into games
values(1155460, 'The Academy: The First Riddle', 'Adventure', 7.99, 2020, 0);
insert into games
values(1308880, 'FORECLOSED', 'Action', 16.99, 2021, 0);
insert into games
values(2225070, 'Trackmania', 'Racing', 0.00, 2023, 1);
insert into games
values(1506440, 'Batora: Lost Haven', 'Action', 4.99, 2022, 0);
insert into games
values(1211930, 'Ghost on the Shore', 'Adventure', 19.99, 2022, 0);
insert into games
values(1068600, 'Waking', 'Action', 19.99, 2020, 0);
insert into games
values(894620, 'ATONE: Heart of the Elder Tree', 'Action', 14.99, 2023, 0);
insert into games
values(935570, 'Ary and the Secret of Seasons', 'Action', 39.99, 2020, 0);
insert into games
values(925570, 'The Uncertain: Light At The End', 'Action', 1.49, 2020, 0);
insert into games
values(1022710, 'Conglomerate 451', 'Indie', 19.99, 2020, 0);
insert into games
values(2534370, 'Yars Rising', 'Action', 29.99, 2024, 0);
insert into games
values(831050, 'Dolmen', 'Action', 2.99, 2022, 0);
insert into games
values(1417880, 'Winter Ember', 'Action', 29.99, 2022, 0);
insert into games
values(1451120, 'Sunlight', 'Adventure', 3.99, 2021, 0);
insert into games
values(2519060, 'Call of Duty®: Modern Warfare® III', 'Action', 69.99, 2023, 0);
insert into games
values(957710, 'The Waylanders', 'Action', 34.99, 2022, 0);
insert into games
values(2008420, 'Flashback 2', 'Action', 15.99, 2023, 0);
insert into games
values(1911800, 'Atari Mania', 'Action', 24.99, 2022, 0);
insert into games
values(1337920, 'Serial Cleaners', 'Action', 7.49, 2022, 0);
insert into games
values(1426900, 'Dread Nautical', 'Indie', 19.99, 2020, 0);
insert into games
values(1129920, 'Tales From Off-Peak City Vol. 1', 'Adventure', 9.99, 2020, 0);
insert into games
values(1696220, 'FixFox', 'Adventure', 4.49, 2022, 0);
insert into games
values(1234180, 'Moons Of Darsalon', 'Action', 19.67, 2023, 0);
insert into games
values(589670, 'Double Kick Heroes', 'Action', 19.99, 2020, 0);
insert into games
values(1048740, 'Half Past Fate', 'Adventure', 19.99, 2020, 0);
insert into games
values(1329810, 'Nexagon: Deathmatch', 'Action', 4.99, 2020, 0);
insert into games
values(1295790, 'The Longest Road on Earth', 'Adventure', 9.99, 2021, 0);
insert into games
values(1962663, 'Call of Duty®: Warzone™', 'Action', 0.00, 2022, 1);
insert into games
values(1079830, 'Cris Tales', 'Action', 39.99, 2021, 0);
insert into games
values(2141910, 'Magic: The Gathering Arena', 'Strategy', 0.00, 2023, 1);
insert into games
values(715380, 'Those Who Remain', 'Adventure', 19.99, 2020, 0);
insert into games
values(451310, 'A Fold Apart', 'Adventure', 9.99, 2020, 0);
insert into games
values(2195140, 'Volgarr the Viking II', 'Action', 19.99, 2024, 0);
insert into games
values(1205430, 'The Elder Scrolls Online - Greymoor', 'MMO', 0.00, 2020, 1);
insert into games
values(1188900, 'Fire Tonight', 'Indie', 5.99, 2021, 0);
insert into games
values(1273750, 'Button City', 'Adventure', 19.99, 2021, 0);
insert into games
values(1243890, 'Sword of the Necromancer', 'Action', 14.99, 2021, 0);
insert into games
values(1910600, 'ONE BTN BOSSES', 'Action', 11.99, 2024, 0);
insert into games
values(2424110, 'Demon Slayer -Kimetsu no Yaiba- Sweep the Board!', 'Action', 59.99, 2024, 0);
insert into games
values(2069180, 'The King''s Dilemma: Chronicles', 'RPG', 14.99, 2023, 0);
insert into games
values(1243690, 'Gods Will Fall', 'Action', 14.99, 2021, 0);
insert into games
values(3183850, 'Overlord', 'Casual', 34.99, 2024, 0);
insert into games
values(1941410, 'The Cub', 'Adventure', 14.99, 2024, 0);
insert into games
values(1803840, 'Lucky''s Tale', 'Action', 19.99, 2021, 0);
insert into games
values(1162280, 'Eternal Hope', 'Adventure', 11.99, 2020, 0);
insert into games
values(1122100, 'Giraffe and Annika', 'Action', 19.99, 2020, 0);
insert into games
values(1684400, 'Best Month Ever!', 'Adventure', 19.99, 2022, 0);
insert into games
values(917840, 'Wintermoor Tactics Club', 'Adventure', 14.99, 2020, 0);
insert into games
values(2742010, 'Off-Road: Redneck Racing', 'Racing', 7.99, 2024, 0);
insert into games
values(1163060, 'The Making of Karateka', 'Action', 19.99, 2023, 0);
insert into games
values(1943420, 'I doesn''t exist - a modern text adventure', 'Adventure', 12.99, 2023, 0);
insert into games
values(1287310, 'Juiced!', 'Action', 1.99, 2020, 0);
insert into games
values(1920100, 'Backfirewall_', 'Adventure', 14.99, 2023, 0);
insert into games
values(1271400, 'Adios', 'Adventure', 17.99, 2021, 0);
insert into games
values(2114300, 'Chronique des Silencieux', 'Adventure', 13.99, 2024, 0);
insert into games
values(1296980, 'Forgotten Fields', 'Adventure', 12.99, 2021, 0);
insert into games
values(1452500, 'The Good Life', 'Indie', 14.99, 2021, 0);
insert into games
values(1597580, 'Clid The Snail', 'Action', 19.99, 2021, 0);
insert into games
values(853050, 'El Hijo - A Wild West Tale', 'Adventure', 19.99, 2020, 0);
insert into games
values(975510, 'Panzer Paladin', 'Action', 19.99, 2020, 0);
insert into games
values(1449850, 'Yu-Gi-Oh! Master Duel', 'Simulation', 0.00, 2022, 1);
insert into games
values(1220100, 'Tentacular', 'Action', 24.99, 2022, 0);
insert into games
values(820540, 'Bloodroots', 'Action', 19.99, 2021, 0);
insert into games
values(1717410, 'Prince of Qin', 'Action', 9.99, 2021, 0);
insert into games
values(1453900, 'Curse of the Sea Rats', 'Action', 8.99, 2023, 0);
insert into games
values(1880470, 'The Inquisitor', 'Action', 39.99, 2024, 0);
insert into games
values(1502080, 'ALTDEUS: Beyond Chronos', 'Adventure', 29.99, 2021, 0);
insert into games
values(1039100, 'No Place for Bravery', 'Action', 19.99, 2022, 0);
insert into games
values(1323540, 'Aerial_Knight''s Never Yield', 'Action', 11.99, 2021, 0);
insert into games
values(1294880, 'Blind Fate: Edo no Yami', 'Action', 19.99, 2022, 0);
insert into games
values(1399690, 'Reverie Knights Tactics', 'Adventure', 2.99, 2022, 0);
insert into games
values(1885750, 'Betrayal At Club Low', 'Adventure', 9.99, 2022, 0);
insert into games
values(1452070, 'LONE RUIN', 'Action', 14.99, 2023, 0);
insert into games
values(837460, 'Batbarian: Testament of the Primordials', 'Action', 14.99, 2020, 0);
insert into games
values(1546100, 'A Musical Story', 'Adventure', 14.99, 2022, 0);
insert into games
values(907670, 'Super Crush KO', 'Action', 14.99, 2020, 0);
insert into games
values(1142390, 'Remothered: Broken Porcelain', 'Action', 29.99, 2020, 0);
insert into games
values(1962660, 'Call of Duty®: Modern Warfare® II', 'Action', 69.99, 2022, 0);
insert into games
values(2834910, 'Rocksmith+', 'Casual', 0.00, 2024, 1);
insert into games
values(1320230, 'Curved Space', 'Action', 19.99, 2021, 0);
insert into games
values(1558930, 'Little Orpheus', 'Adventure', 12.99, 2022, 0);
insert into games
values(1247570, 'Expedition Zero', 'Action', 19.99, 2022, 0);
insert into games
values(1760330, 'Noreya: The Gold Project', 'Action', 24.99, 2024, 0);
insert into games
values(600080, 'Unto The End', 'Action', 14.99, 2020, 0);
insert into games
values(1053710, 'The Red Lantern', 'Adventure', 24.99, 2021, 0);
insert into games
values(1547380, 'KINGDOM of the DEAD', 'Action', 14.99, 2022, 0);
insert into games
values(1508400, 'Kaiju Wars', 'Indie', 19.99, 2022, 0);
insert into games
values(2229890, 'Command & Conquer Renegade™', 'Action', 0.00, 2024, 1);
insert into games
values(1851030, 'God of Rock', 'Action', 29.99, 2023, 0);
insert into games
values(1406810, 'After Us', 'Adventure', 29.99, 2023, 0);
insert into games
values(1140100, 'The Persistence', 'Action', 29.99, 2020, 0);
insert into games
values(2680190, 'Rails Across America', 'Simulation', 9.99, 2024, 0);
insert into games
values(2732960, 'Command & Conquer™ Generals Zero Hour', 'Action', 0.00, 2024, 1);
insert into games
values(1431850, 'The Tartarus Key', 'Adventure', 19.99, 2023, 0);
insert into games
values(691790, 'Arcadian Atlas', 'Indie', 19.99, 2023, 0);
insert into games
values(2560250, 'Observer', 'Adventure', 3.99, 2023, 0);
insert into games
values(1030060, 'Seed of Life', 'Action', 24.99, 2021, 0);
insert into games
values(1358840, 'Flat Eye', 'Indie', 18.99, 2022, 0);
insert into games
values(1374970, 'Moonscars', 'Action', 19.99, 2022, 0);
insert into games
values(1913160, 'COPS 2170 The Power of Law', 'Action', 11.99, 2022, 0);
insert into games
values(2172860, 'The Elder Scrolls Online: Necrom', 'MMO', 0.00, 2023, 1);
insert into games
values(651490, 'No Longer Home', 'Adventure', 2.99, 2021, 0);
insert into games
values(1034750, 'The Flower Collectors', 'Adventure', 14.99, 2020, 0);
insert into games
values(1573390, 'Lila’s Sky Ark', 'Action', 14.99, 2022, 0);
insert into games
values(2079180, 'VIDEOVERSE', 'Adventure', 8.70, 2023, 0);
insert into games
values(971030, 'SkateBIRD', 'Racing', 19.99, 2021, 0);
insert into games
values(966400, 'Speaking Simulator', 'Indie', 7.99, 2020, 0);
insert into games
values(2905090, 'UberSoldier', 'Action', 4.99, 2024, 0);
insert into games
values(886060, 'Redout: Space Assault', 'Action', 9.99, 2021, 0);
insert into games
values(1476170, 'Godstrike', 'Action', 14.99, 2021, 0);
insert into games
values(2132540, 'Mr. Run and Jump', 'Action', 24.99, 2023, 0);
insert into games
values(1084990, 'Old Gods Rising', 'Adventure', 4.99, 2020, 0);
insert into games
values(1621990, 'Stray Blade', 'Action', 12.99, 2023, 0);
insert into games
values(1758910, 'Time Commando', 'Action', 5.99, 2021, 0);
insert into games
values(1019310, 'VirtuaVerse', 'Adventure', 14.99, 2020, 0);
insert into games
values(1542110, 'Daydream: Forgotten Sorrow', 'Action', 19.99, 2023, 0);
insert into games
values(1106830, 'Rainbow Billy: The Curse of the Leviathan', 'Adventure', 19.99, 2021, 0);
insert into games
values(1592320, 'Aztech Forgotten Gods', 'Action', 29.99, 2022, 0);
insert into games
values(1973310, 'Phoenix Springs', 'Adventure', 19.99, 2024, 0);
insert into games
values(1072190, 'Crossfire: Legion', 'Action', 19.99, 2022, 0);
insert into games
values(1337100, 'Warhammer Age of Sigmar: Tempestfall', 'Action', 19.99, 2021, 0);
insert into games
values(1198590, 'Stonefly', 'Action', 16.99, 2021, 0);
insert into games
values(1398100, 'Orwell''s Animal Farm', 'Adventure', 9.99, 2020, 0);
insert into games
values(1449320, 'Alfred Hitchcock - Vertigo', 'Adventure', 3.99, 2021, 0);
insert into games
values(1093290, 'The Wild at Heart', 'Adventure', 24.99, 2021, 0);
insert into games
values(1210490, 'YesterMorrow', 'Action', 19.99, 2020, 0);
insert into games
values(2009450, 'Invector: Rhythm Galaxy', 'Action', 24.99, 2023, 0);
insert into games
values(1329790, 'Override 2: Super Mech League', 'Action', 29.99, 2020, 0);
insert into games
values(1490340, 'We Are OFK', 'Adventure', 19.99, 2022, 0);
insert into games
values(1097790, 'The Dark Crystal: Age of Resistance Tactics', 'RPG', 19.99, 2020, 0);
insert into games
values(1172190, 'Chinatown Detective Agency', 'Adventure', 24.99, 2022, 0);
insert into games
values(1419290, 'Out of Line', 'Action', 7.99, 2021, 0);
insert into games
values(1094730, 'Black Legend', 'RPG', 19.99, 2021, 0);
insert into games
values(1150590, 'Samurai Jack: Battle Through Time', 'Action', 39.99, 2020, 0);
insert into games
values(1210150, 'Ageless', 'Adventure', 2.99, 2020, 0);
insert into games
values(2005680, 'Akka Arrh', 'Action', 19.99, 2023, 0);
insert into games
values(2429640, 'THRONE AND LIBERTY', 'MMO', 0.00, 2024, 1);
insert into games
values(1388260, 'P.I.D.', 'Indie', 5.99, 2020, 0);
insert into games
values(1342260, 'SAMURAI SHODOWN', 'Action', 0.00, 2021, 1);
insert into games
values(2376270, 'Lunar Lander Beyond', 'Action', 29.99, 2024, 0);
insert into games
values(1754000, 'The Elder Scrolls Online: High Isle', 'MMO', 0.00, 2022, 1);
insert into games
values(1080450, 'Wayward Strand', 'Adventure', 19.99, 2022, 0);
insert into games
values(1351000, 'Gangs of Sherwood', 'Action', 39.99, 2023, 0);
insert into games
values(1266680, 'Strobophagia | Rave Horror', 'Adventure', 19.99, 2020, 0);
insert into games
values(1098170, 'Dark Nights with Poe and Munro', 'Adventure', 12.99, 2020, 0);
insert into games
values(1136020, 'Cannibal Cuisine', 'Action', 12.99, 2020, 0);
insert into games
values(1228870, 'Bartlow''s Dread Machine', 'Action', 5.99, 2020, 0);
insert into games
values(1297300, 'The Shore', 'Action', 11.99, 2021, 0);
insert into games
values(970840, 'OVERPASS™', 'Racing', 29.99, 2021, 0);
insert into games
values(1205480, 'Monster Jam Steel Titans 2', 'Racing', 29.99, 2021, 0);
insert into games
values(1050880, 'Wavey The Rocket', 'Action', 10.99, 2020, 0);
insert into games
values(1296290, 'What Happened', 'Adventure', 24.99, 2020, 0);
insert into games
values(544920, 'Darwin Project', 'Action', 0.00, 2020, 1);
insert into games
values(2236680, 'Llamasoft: The Jeff Minter Story', 'Action', 29.99, 2024, 0);
insert into games
values(1668190, 'Once Upon a Jester', 'Adventure', 5.99, 2022, 0);
insert into games
values(887450, 'Tunche', 'Action', 19.99, 2021, 0);
insert into games
values(2139460, 'Once Human', 'Action', 0.00, 2024, 1);
insert into games
values(1931240, 'MOTHERGUNSHIP: FORGE', 'Action', 19.99, 2022, 0);
insert into games
values(838110, 'HyperParasite', 'Action', 17.99, 2020, 0);
insert into games
values(944430, 'The Last Friend', 'Action', 14.99, 2021, 0);
insert into games
values(1378070, 'Drawn to Life: Two Realms', 'Adventure', 3.49, 2020, 0);

insert into reviews
values(1172470, 89.0, 66);
insert into reviews
values(1938090, 91.0, 82);
insert into reviews
values(1203220, 71.0, 59);
insert into reviews
values(1086940, 96.0, 92);
insert into reviews
values(553850, 82.0, 75);
insert into reviews
values(2252570, 84.0, 73);
insert into reviews
values(2669320, 76.0, 28);
insert into reviews
values(1245620, 96.0, 84);
insert into reviews
values(2878980, 79.0, 48);
insert into reviews
values(1222670, 70.0, 44);
insert into reviews
values(1091500, 86.0, 73);
insert into reviews
values(1599340, 81.0, 48);
insert into reviews
values(2379780, 90.0, 84);
insert into reviews
values(1142710, 86.0, 58);
insert into reviews
values(427520, 90.0, 89);
insert into reviews
values(2358720, 81.0, 82);
insert into reviews
values(1364780, 92.0, 75);
insert into reviews
values(261550, 77.0, 79);
insert into reviews
values(1158310, 91.0, 83);
insert into reviews
values(526870, 91.0, 88);
insert into reviews
values(1604030, 83.0, 69);
insert into reviews
values(1551360, 92.0, 82);
insert into reviews
values(2221490, 82.0, 63);
insert into reviews
values(1237950, 68.0, 20);
insert into reviews
values(2344520, 86.0, 26);
insert into reviews
values(1151340, 52.0, 28);
insert into reviews
values(1466060, 80.0, 77);
insert into reviews
values(632360, 85.0, 83);
insert into reviews
values(1284190, 81.0, 55);
insert into reviews
values(1361210, 74.0, 55);
insert into reviews
values(1286830, 85.0, 61);
insert into reviews
values(1238810, 81.0, 36);
insert into reviews
values(1238840, 88.0, 75);
insert into reviews
values(899770, 80.0, 61);
insert into reviews
values(990080, 84.0, 81);
insert into reviews
values(1063730, 75.0, 70);
insert into reviews
values(1248130, 75.0, 68);
insert into reviews
values(949230, 74.0, 43);
insert into reviews
values(548430, 85.0, 84);
insert into reviews
values(2707930, 77.0, 65);
insert into reviews
values(2195250, 75.0, 27);
insert into reviews
values(1426210, 88.0, 89);
insert into reviews
values(1687950, 95.0, 87);
insert into reviews
values(239140, 74.0, 80);
insert into reviews
values(1293830, 92.0, 83);
insert into reviews
values(529340, 81.0, 62);
insert into reviews
values(1326470, 86.0, 73);
insert into reviews
values(1778820, 90.0, 75);
insert into reviews
values(1144200, 80.0, 64);
insert into reviews
values(1904540, 80.0, 70);
insert into reviews
values(1888930, 89.0, 80);
insert into reviews
values(1407200, 80.0, 34);
insert into reviews
values(2050650, 93.0, 89);
insert into reviews
values(1304930, 75.0, 77);
insert into reviews
values(1716740, 83.0, 68);
insert into reviews
values(1621690, 85.0, 75);
insert into reviews
values(1446780, 88.0, 84);
insert into reviews
values(1401590, 70.0, 61);
insert into reviews
values(2186680, 78.0, 78);
insert into reviews
values(686810, 79.0, 64);
insert into reviews
values(1868140, 90.0, 82);
insert into reviews
values(1284210, 90.0, 80);
insert into reviews
values(397540, 81.0, 56);
insert into reviews
values(1465360, 81.0, 71);
insert into reviews
values(1260320, 76.0, 77);
insert into reviews
values(933110, 75.0, 67);
insert into reviews
values(1794680, 86.0, 81);
insert into reviews
values(1517290, 68.0, 24);
insert into reviews
values(2071280, 84.0, 69);
insert into reviews
values(1290000, 75.0, 72);
insert into reviews
values(1190970, 79.0, 72);
insert into reviews
values(1384160, 87.0, 79);
insert into reviews
values(1328670, 87.0, 77);
insert into reviews
values(962130, 83.0, 78);
insert into reviews
values(1774580, 85.0, 71);
insert into reviews
values(1222140, 78.0, 87);
insert into reviews
values(1240440, 87.0, 79);
insert into reviews
values(782330, 88.0, 85);
insert into reviews
values(1145360, 93.0, 86);
insert into reviews
values(1677280, 81.0, 59);
insert into reviews
values(304390, 78.0, 61);
insert into reviews
values(2488620, 72.0, 49);
insert into reviews
values(2215430, 87.0, 84);
insert into reviews
values(1167630, 80.0, 81);
insert into reviews
values(1145350, 95.0, 86);
insert into reviews
values(872410, 58.0, 68);
insert into reviews
values(2679460, 94.0, 85);
insert into reviews
values(1569040, 85.0, 74);
insert into reviews
values(2113850, 80.0, 69);
insert into reviews
values(2157560, 81.0, 72);
insert into reviews
values(1669000, 83.0, 75);
insert into reviews
values(2161700, 87.0, 87);
insert into reviews
values(1876890, 80.0, 74);
insert into reviews
values(699130, 67.0, 63);
insert into reviews
values(1527950, 79.0, 76);
insert into reviews
values(1850570, 85.0, 81);
insert into reviews
values(1259420, 71.0, 85);
insert into reviews
values(1282100, 80.0, 71);
insert into reviews
values(1824220, 82.0, 57);
insert into reviews
values(1934680, 83.0, 79);
insert into reviews
values(1029690, 77.0, 65);
insert into reviews
values(1313140, 82.0, 79);
insert into reviews
values(1084600, 80.0, 77);
insert into reviews
values(1149460, 67.0, 55);
insert into reviews
values(427410, 88.0, 83);
insert into reviews
values(1325200, 86.0, 76);
insert into reviews
values(2231380, 56.0, 35);
insert into reviews
values(1244460, 78.0, 73);
insert into reviews
values(1449560, 82.0, 74);
insert into reviews
values(1222680, 72.0, 63);
insert into reviews
values(1593500, 94.0, 90);
insert into reviews
values(2208920, 80.0, 61);
insert into reviews
values(1129580, 73.0, 66);
insert into reviews
values(1627720, 80.0, 83);
insert into reviews
values(1158160, 82.0, 67);
insert into reviews
values(1506830, 78.0, 39);
insert into reviews
values(1092790, 85.0, 85);
insert into reviews
values(2321470, 86.0, 71);
insert into reviews
values(924970, 77.0, 53);
insert into reviews
values(1196590, 84.0, 84);
insert into reviews
values(2591280, 81.0, 73);
insert into reviews
values(2688950, 76.0, 58);
insert into reviews
values(1147560, 80.0, 69);
insert into reviews
values(1817070, 87.0, 84);
insert into reviews
values(2666510, 81.0, 77);
insert into reviews
values(1237970, 89.0, 85);
insert into reviews
values(1238860, 81.0, 64);
insert into reviews
values(1971870, 83.0, 65);
insert into reviews
values(1263850, 85.0, 65);
insert into reviews
values(1940340, 81.0, 61);
insert into reviews
values(934700, 73.0, 72);
insert into reviews
values(1888160, 86.0, 81);
insert into reviews
values(2420110, 89.0, 74);
insert into reviews
values(881020, 80.0, 83);
insert into reviews
values(1044720, 84.0, 75);
insert into reviews
values(1113000, 93.0, 91);
insert into reviews
values(1336490, 91.0, 80);
insert into reviews
values(1790600, 81.0, 83);
insert into reviews
values(1210320, 74.0, 72);
insert into reviews
values(753640, 85.0, 89);
insert into reviews
values(975370, 93.0, 85);
insert into reviews
values(362890, 84.0, 87);
insert into reviews
values(1286680, 78.0, 57);
insert into reviews
values(2000950, 80.0, 38);
insert into reviews
values(1501750, 75.0, 67);
insert into reviews
values(1845910, 82.0, 40);
insert into reviews
values(2835570, 85.0, 77);
insert into reviews
values(2054970, 86.0, 65);
insert into reviews
values(885970, 75.0, 59);
insert into reviews
values(1462040, 89.0, 84);
insert into reviews
values(1718570, 79.0, 72);
insert into reviews
values(2515020, 87.0, 84);
insert into reviews
values(920210, 82.0, 77);
insert into reviews
values(1151640, 84.0, 71);
insert into reviews
values(848450, 82.0, 71);
insert into reviews
values(1057090, 90.0, 89);
insert into reviews
values(1030840, 78.0, 76);
insert into reviews
values(1097150, 81.0, 68);
insert into reviews
values(2072450, 89.0, 85);
insert into reviews
values(870780, 85.0, 78);
insert into reviews
values(1272080, 66.0, 33);
insert into reviews
values(1985810, 76.0, 58);
insert into reviews
values(784080, 73.0, 55);
insert into reviews
values(2369390, 73.0, 54);
insert into reviews
values(1809540, 84.0, 84);
insert into reviews
values(1846380, 77.0, 59);
insert into reviews
values(1651560, 77.0, 69);
insert into reviews
values(1102190, 86.0, 79);
insert into reviews
values(1054490, 78.0, 84);
insert into reviews
values(1213210, 82.0, 87);
insert into reviews
values(1072040, 86.0, 60);
insert into reviews
values(1575940, 76.0, 83);
insert into reviews
values(1030830, 72.0, 67);
insert into reviews
values(1324130, 81.0, 75);
insert into reviews
values(1601580, 85.0, 75);
insert into reviews
values(1562430, 80.0, 79);
insert into reviews
values(2108330, 82.0, 62);
insert into reviews
values(2124490, 86.0, 91);
insert into reviews
values(1244090, 87.0, 80);
insert into reviews
values(2440510, 84.0, 68);
insert into reviews
values(1451190, 70.0, 49);
insert into reviews
values(1332010, 83.0, 83);
insert into reviews
values(850190, 68.0, 77);
insert into reviews
values(597180, 80.0, 73);
insert into reviews
values(1235140, 84.0, 82);
insert into reviews
values(1659420, 87.0, 84);
insert into reviews
values(668580, 70.0, 68);
insert into reviews
values(1272320, 80.0, 78);
insert into reviews
values(1222690, 85.0, 62);
insert into reviews
values(1267540, 81.0, 62);
insert into reviews
values(368260, 83.0, 72);
insert into reviews
values(694280, 72.0, 63);
insert into reviews
values(1588010, 76.0, 49);
insert into reviews
values(780290, 82.0, 66);
insert into reviews
values(756800, 77.0, 77);
insert into reviews
values(1265820, 78.0, 71);
insert into reviews
values(1105670, 82.0, 81);
insert into reviews
values(1629520, 75.0, 70);
insert into reviews
values(1124300, 77.0, 67);
insert into reviews
values(1875830, 87.0, 81);
insert into reviews
values(1488200, 81.0, 74);
insert into reviews
values(1458140, 79.0, 63);
insert into reviews
values(1637320, 76.0, 76);
insert into reviews
values(1971650, 85.0, 83);
insert into reviews
values(1096530, 77.0, 70);
insert into reviews
values(2138710, 81.0, 79);
insert into reviews
values(1295500, 72.0, 78);
insert into reviews
values(1817190, 85.0, 76);
insert into reviews
values(1676840, 76.0, 77);
insert into reviews
values(1611910, 81.0, 70);
insert into reviews
values(2933130, 59.0, 69);
insert into reviews
values(2291060, 73.0, 57);
insert into reviews
values(2231450, 89.0, 88);
insert into reviews
values(1455840, 84.0, 74);
insert into reviews
values(1084160, 81.0, 80);
insert into reviews
values(760160, 77.0, 55);
insert into reviews
values(952060, 79.0, 67);
insert into reviews
values(2218750, 88.0, 77);
insert into reviews
values(1372110, 73.0, 74);
insert into reviews
values(2064650, 65.0, 48);
insert into reviews
values(1282730, 82.0, 76);
insert into reviews
values(1433140, 72.0, 63);
insert into reviews
values(1245560, 82.0, 77);
insert into reviews
values(1128920, 81.0, 75);
insert into reviews
values(1357210, 69.0, 46);
insert into reviews
values(1180660, 78.0, 58);
insert into reviews
values(1127500, 87.0, 75);
insert into reviews
values(418530, 87.0, 79);
insert into reviews
values(1693980, 89.0, 85);
insert into reviews
values(493520, 78.0, 74);
insert into reviews
values(1785650, 76.0, 50);
insert into reviews
values(1071870, 70.0, 73);
insert into reviews
values(1583230, 67.0, 77);
insert into reviews
values(2315690, 81.0, 67);
insert into reviews
values(2198150, 74.0, 73);
insert into reviews
values(986130, 69.0, 71);
insert into reviews
values(1268750, 61.0, 54);
insert into reviews
values(898750, 79.0, 69);
insert into reviews
values(2005010, 75.0, 75);
insert into reviews
values(1549970, 69.0, 56);
insert into reviews
values(1150440, 75.0, 76);
insert into reviews
values(1545560, 85.0, 65);
insert into reviews
values(2840770, 72.0, 71);
insert into reviews
values(763890, 86.0, 76);
insert into reviews
values(1161580, 83.0, 74);
insert into reviews
values(2395210, 89.0, 85);
insert into reviews
values(2561580, 85.0, 71);
insert into reviews
values(851850, 73.0, 80);
insert into reviews
values(1222700, 78.0, 79);
insert into reviews
values(861650, 67.0, 61);
insert into reviews
values(1782120, 81.0, 68);
insert into reviews
values(1135690, 83.0, 75);
insert into reviews
values(1672970, 70.0, 67);
insert into reviews
values(1207650, 81.0, 81);
insert into reviews
values(1577120, 79.0, 65);
insert into reviews
values(633230, 61.0, 58);
insert into reviews
values(2478970, 75.0, 76);
insert into reviews
values(1218210, 73.0, 75);
insert into reviews
values(2187220, 85.0, 79);
insert into reviews
values(2853730, 59.0, 33);
insert into reviews
values(1681430, 72.0, 77);
insert into reviews
values(2140020, 80.0, 81);
insert into reviews
values(1692250, 79.0, 42);
insert into reviews
values(2058190, 82.0, 85);
insert into reviews
values(780310, 83.0, 81);
insert into reviews
values(1157390, 77.0, 75);
insert into reviews
values(860510, 82.0, 83);
insert into reviews
values(1644320, 75.0, 73);
insert into reviews
values(2698940, 76.0, 72);
insert into reviews
values(1337520, 84.0, 80);
insert into reviews
values(1088850, 80.0, 84);
insert into reviews
values(719040, 85.0, 77);
insert into reviews
values(1338770, 73.0, 71);
insert into reviews
values(1641960, 66.0, 73);
insert into reviews
values(979690, 74.0, 75);
insert into reviews
values(960990, 70.0, 80);
insert into reviews
values(1735700, 81.0, 81);
insert into reviews
values(1259980, 74.0, 58);
insert into reviews
values(1113560, 83.0, 83);
insert into reviews
values(1937500, 73.0, 73);
insert into reviews
values(1262580, 61.0, 39);
insert into reviews
values(1496790, 67.0, 53);
insert into reviews
values(2455640, 79.0, 82);
insert into reviews
values(1605220, 73.0, 63);
insert into reviews
values(1321440, 83.0, 84);
insert into reviews
values(2114740, 84.0, 83);
insert into reviews
values(546560, 93.0, 91);
insert into reviews
values(2058180, 80.0, 85);
insert into reviews
values(745920, 73.0, 61);
insert into reviews
values(1382330, 83.0, 78);
insert into reviews
values(960910, 87.0, 84);
insert into reviews
values(1199030, 82.0, 73);
insert into reviews
values(1498570, 79.0, 75);
insert into reviews
values(2239550, 76.0, 59);
insert into reviews
values(2000890, 78.0, 66);
insert into reviews
values(874390, 72.0, 81);
insert into reviews
values(2401970, 85.0, 81);
insert into reviews
values(1089090, 75.0, 79);
insert into reviews
values(1649080, 83.0, 73);
insert into reviews
values(736820, 76.0, 74);
insert into reviews
values(1487210, 79.0, 79);
insert into reviews
values(1451090, 84.0, 76);
insert into reviews
values(1280930, 86.0, 75);
insert into reviews
values(990630, 83.0, 77);
insert into reviews
values(1341290, 76.0, 78);
insert into reviews
values(1016920, 77.0, 72);
insert into reviews
values(740130, 87.0, 82);
insert into reviews
values(1369630, 86.0, 82);
insert into reviews
values(1896700, 82.0, 85);
insert into reviews
values(1351080, 76.0, 46);
insert into reviews
values(680420, 73.0, 60);
insert into reviews
values(1062810, 80.0, 63);
insert into reviews
values(839770, 74.0, 58);
insert into reviews
values(2725260, 84.0, 82);
insert into reviews
values(1426450, 74.0, 73);
insert into reviews
values(1158850, 86.0, 88);
insert into reviews
values(1139900, 81.0, 79);
insert into reviews
values(2290180, 77.0, 68);
insert into reviews
values(1205970, 55.0, 43);
insert into reviews
values(1253920, 88.0, 74);
insert into reviews
values(814370, 74.0, 77);
insert into reviews
values(1121640, 75.0, 0);
insert into reviews
values(1147860, 91.0, 75);
insert into reviews
values(2084000, 88.0, 82);
insert into reviews
values(1202130, 70.0, 72);
insert into reviews
values(3035570, 76.0, 70);
insert into reviews
values(2155180, 85.0, 58);
insert into reviews
values(788100, 74.0, 65);
insert into reviews
values(1522820, 77.0, 70);
insert into reviews
values(1536620, 74.0, 0);
insert into reviews
values(1533420, 89.0, 82);
insert into reviews
values(1562700, 83.0, 84);
insert into reviews
values(2933080, 52.0, 46);
insert into reviews
values(1043810, 87.0, 81);
insert into reviews
values(315210, 60.0, 35);
insert into reviews
values(1448440, 80.0, 67);
insert into reviews
values(700600, 75.0, 55);
insert into reviews
values(578650, 85.0, 78);
insert into reviews
values(1556790, 67.0, 66);
insert into reviews
values(1931770, 86.0, 85);
insert into reviews
values(835960, 88.0, 85);
insert into reviews
values(1887840, 78.0, 75);
insert into reviews
values(1484280, 80.0, 74);
insert into reviews
values(257420, 68.0, 71);
insert into reviews
values(1466640, 79.0, 77);
insert into reviews
values(1237320, 70.0, 81);
insert into reviews
values(2076010, 80.0, 56);
insert into reviews
values(1353230, 75.0, 84);
insert into reviews
values(2996040, 73.0, 76);
insert into reviews
values(1182900, 82.0, 83);
insert into reviews
values(1556100, 69.0, 67);
insert into reviews
values(1574580, 83.0, 69);
insert into reviews
values(1262560, 84.0, 63);
insert into reviews
values(1113120, 72.0, 72);
insert into reviews
values(1337760, 74.0, 66);
insert into reviews
values(1531540, 77.0, 65);
insert into reviews
values(1378990, 85.0, 80);
insert into reviews
values(629820, 70.0, 66);
insert into reviews
values(1262540, 66.0, 61);
insert into reviews
values(867210, 78.0, 72);
insert into reviews
values(2229870, 84.0, 84);
insert into reviews
values(1164940, 79.0, 75);
insert into reviews
values(1249970, 53.0, 40);
insert into reviews
values(793460, 73.0, 70);
insert into reviews
values(1277400, 81.0, 82);
insert into reviews
values(1581770, 77.0, 78);
insert into reviews
values(610370, 86.0, 82);
insert into reviews
values(1643310, 74.0, 78);
insert into reviews
values(1328660, 75.0, 62);
insert into reviews
values(1041720, 72.0, 70);
insert into reviews
values(1458100, 71.0, 68);
insert into reviews
values(553420, 85.0, 79);
insert into reviews
values(1811990, 80.0, 80);
insert into reviews
values(858820, 73.0, 70);
insert into reviews
values(1684350, 74.0, 70);
insert into reviews
values(807120, 78.0, 75);
insert into reviews
values(1658280, 79.0, 71);
insert into reviews
values(1408610, 63.0, 35);
insert into reviews
values(1065310, 73.0, 69);
insert into reviews
values(1262350, 81.0, 84);
insert into reviews
values(1547890, 74.0, 68);
insert into reviews
values(1262240, 77.0, 59);
insert into reviews
values(1658150, 80.0, 75);
insert into reviews
values(757320, 78.0, 71);
insert into reviews
values(1805480, 81.0, 74);
insert into reviews
values(536270, 64.0, 59);
insert into reviews
values(377300, 65.0, 60);
insert into reviews
values(1585180, 78.0, 85);
insert into reviews
values(1229240, 90.0, 84);
insert into reviews
values(1963570, 79.0, 73);
insert into reviews
values(1951410, 73.0, 75);
insert into reviews
values(1649950, 84.0, 63);
insert into reviews
values(837470, 81.0, 78);
insert into reviews
values(2751000, 86.0, 84);
insert into reviews
values(1003590, 88.0, 75);
insert into reviews
values(970830, 72.0, 79);
insert into reviews
values(1593030, 79.0, 66);
insert into reviews
values(933820, 72.0, 69);
insert into reviews
values(656350, 83.0, 68);
insert into reviews
values(1475810, 75.0, 71);
insert into reviews
values(2230110, 75.0, 62);
insert into reviews
values(607080, 87.0, 81);
insert into reviews
values(1211630, 75.0, 76);
insert into reviews
values(674140, 75.0, 76);
insert into reviews
values(1099410, 75.0, 60);
insert into reviews
values(1351240, 51.0, 47);
insert into reviews
values(1895880, 88.0, 85);
insert into reviews
values(1163550, 69.0, 69);
insert into reviews
values(826630, 75.0, 67);
insert into reviews
values(1701520, 79.0, 77);
insert into reviews
values(1740720, 81.0, 74);
insert into reviews
values(1094520, 66.0, 59);
insert into reviews
values(1238820, 89.0, 77);
insert into reviews
values(682990, 59.0, 48);
insert into reviews
values(1574820, 76.0, 87);
insert into reviews
values(1388590, 83.0, 85);
insert into reviews
values(1850510, 83.0, 81);
insert into reviews
values(1817230, 87.0, 88);
insert into reviews
values(1985820, 73.0, 37);
insert into reviews
values(1493640, 78.0, 77);
insert into reviews
values(482400, 78.0, 76);
insert into reviews
values(2172010, 70.0, 67);
insert into reviews
values(1123770, 78.0, 69);
insert into reviews
values(1649240, 86.0, 74);
insert into reviews
values(1413480, 76.0, 77);
insert into reviews
values(1715130, 66.0, 75);
insert into reviews
values(1656780, 82.0, 63);
insert into reviews
values(2138610, 84.0, 78);
insert into reviews
values(1238060, 78.0, 64);
insert into reviews
values(1382070, 84.0, 79);
insert into reviews
values(1295920, 75.0, 75);
insert into reviews
values(1020790, 68.0, 53);
insert into reviews
values(2703850, 67.0, 70);
insert into reviews
values(1222730, 79.0, 57);
insert into reviews
values(2287220, 79.0, 67);
insert into reviews
values(1677350, 76.0, 63);
insert into reviews
values(2375550, 78.0, 83);
insert into reviews
values(1624540, 70.0, 71);
insert into reviews
values(1388880, 85.0, 81);
insert into reviews
values(2221920, 81.0, 76);
insert into reviews
values(1839950, 72.0, 61);
insert into reviews
values(1983260, 80.0, 77);
insert into reviews
values(813230, 90.0, 80);
insert into reviews
values(2052040, 78.0, 77);
insert into reviews
values(601840, 84.0, 73);
insert into reviews
values(1177980, 79.0, 75);
insert into reviews
values(1703340, 90.0, 83);
insert into reviews
values(1260520, 84.0, 87);
insert into reviews
values(2272900, 66.0, 55);
insert into reviews
values(1220140, 68.0, 72);
insert into reviews
values(1252330, 88.0, 68);
insert into reviews
values(973810, 74.0, 70);
insert into reviews
values(2750080, 54.0, 35);
insert into reviews
values(987840, 80.0, 78);
insert into reviews
values(985890, 84.0, 81);
insert into reviews
values(1148760, 91.0, 79);
insert into reviews
values(1179580, 74.0, 45);
insert into reviews
values(742420, 61.0, 33);
insert into reviews
values(1469610, 80.0, 79);
insert into reviews
values(2369900, 89.0, 74);
insert into reviews
values(1902690, 81.0, 80);
insert into reviews
values(1227690, 73.0, 73);
insert into reviews
values(1128860, 72.0, 26);
insert into reviews
values(2475490, 88.0, 79);
insert into reviews
values(882100, 77.0, 48);
insert into reviews
values(803050, 78.0, 73);
insert into reviews
values(1874170, 66.0, 63);
insert into reviews
values(1257290, 81.0, 76);
insert into reviews
values(2477340, 77.0, 54);
insert into reviews
values(1672500, 76.0, 72);
insert into reviews
values(2396240, 81.0, 78);
insert into reviews
values(1049410, 74.0, 77);
insert into reviews
values(1150530, 72.0, 53);
insert into reviews
values(790710, 69.0, 52);
insert into reviews
values(2144740, 80.0, 75);
insert into reviews
values(2109370, 72.0, 78);
insert into reviews
values(2436570, 83.0, 78);
insert into reviews
values(2296990, 82.0, 78);
insert into reviews
values(1702330, 68.0, 62);
insert into reviews
values(1587130, 80.0, 72);
insert into reviews
values(1590910, 74.0, 72);
insert into reviews
values(900040, 64.0, 69);
insert into reviews
values(1944430, 77.0, 76);
insert into reviews
values(774181, 89.0, 83);
insert into reviews
values(1276760, 53.0, 52);
insert into reviews
values(1608070, 78.0, 76);
insert into reviews
values(1580240, 81.0, 83);
insert into reviews
values(1602010, 84.0, 77);
insert into reviews
values(1040230, 76.0, 64);
insert into reviews
values(1374840, 80.0, 58);
insert into reviews
values(775500, 80.0, 75);
insert into reviews
values(758870, 89.0, 76);
insert into reviews
values(978300, 74.0, 69);
insert into reviews
values(2603020, 68.0, 62);
insert into reviews
values(1274600, 72.0, 70);
insert into reviews
values(1939970, 75.0, 73);
insert into reviews
values(2008920, 88.0, 79);
insert into reviews
values(1307710, 76.0, 63);
insert into reviews
values(1237980, 73.0, 51);
insert into reviews
values(1818750, 75.0, 55);
insert into reviews
values(1874490, 80.0, 78);
insert into reviews
values(1024650, 68.0, 52);
insert into reviews
values(918570, 73.0, 64);
insert into reviews
values(894020, 85.0, 81);
insert into reviews
values(969990, 68.0, 88);
insert into reviews
values(1358700, 72.0, 66);
insert into reviews
values(1796220, 83.0, 75);
insert into reviews
values(1677770, 84.0, 78);
insert into reviews
values(874260, 85.0, 81);
insert into reviews
values(1434950, 74.0, 77);
insert into reviews
values(936790, 81.0, 69);
insert into reviews
values(1515210, 68.0, 73);
insert into reviews
values(1202200, 65.0, 43);
insert into reviews
values(1361510, 85.0, 80);
insert into reviews
values(604540, 63.0, 58);
insert into reviews
values(2634890, 87.0, 86);
insert into reviews
values(1712350, 86.0, 80);
insert into reviews
values(907650, 65.0, 63);
insert into reviews
values(1760250, 69.0, 17);
insert into reviews
values(893850, 79.0, 80);
insert into reviews
values(1668510, 80.0, 74);
insert into reviews
values(1227530, 74.0, 71);
insert into reviews
values(981430, 84.0, 78);
insert into reviews
values(897450, 76.0, 67);
insert into reviews
values(2380050, 73.0, 65);
insert into reviews
values(1623070, 75.0, 70);
insert into reviews
values(977880, 82.0, 70);
insert into reviews
values(1422440, 82.0, 63);
insert into reviews
values(1480560, 72.0, 48);
insert into reviews
values(2272250, 83.0, 76);
insert into reviews
values(1276790, 80.0, 75);
insert into reviews
values(1225570, 77.0, 76);
insert into reviews
values(1544020, 69.0, 68);
insert into reviews
values(2067050, 63.0, 63);
insert into reviews
values(1599660, 79.0, 82);
insert into reviews
values(1061910, 79.0, 75);
insert into reviews
values(1069160, 76.0, 84);
insert into reviews
values(2638370, 87.0, 78);
insert into reviews
values(1184050, 80.0, 78);
insert into reviews
values(1178830, 67.0, 70);
insert into reviews
values(550320, 79.0, 69);
insert into reviews
values(1030210, 65.0, 35);
insert into reviews
values(1281590, 72.0, 74);
insert into reviews
values(2021880, 74.0, 64);
insert into reviews
values(2527390, 83.0, 54);
insert into reviews
values(953490, 75.0, 75);
insert into reviews
values(1954200, 81.0, 82);
insert into reviews
values(1076200, 78.0, 69);
insert into reviews
values(1794960, 78.0, 75);
insert into reviews
values(1716120, 70.0, 67);
insert into reviews
values(1268590, 69.0, 58);
insert into reviews
values(2356560, 76.0, 72);
insert into reviews
values(1436700, 78.0, 75);
insert into reviews
values(1262600, 80.0, 63);
insert into reviews
values(1446650, 76.0, 77);
insert into reviews
values(1386780, 67.0, 61);
insert into reviews
values(1755910, 77.0, 72);
insert into reviews
values(1668540, 81.0, 76);
insert into reviews
values(1556200, 56.0, 57);
insert into reviews
values(2637990, 79.0, 77);
insert into reviews
values(1771980, 78.0, 80);
insert into reviews
values(1582650, 73.0, 63);
insert into reviews
values(1136370, 72.0, 60);
insert into reviews
values(1668520, 81.0, 79);
insert into reviews
values(1272160, 82.0, 83);
insert into reviews
values(1340480, 85.0, 69);
insert into reviews
values(1170080, 74.0, 72);
insert into reviews
values(1552350, 75.0, 0);
insert into reviews
values(1233570, 69.0, 59);
insert into reviews
values(988910, 83.0, 70);
insert into reviews
values(1205520, 86.0, 77);
insert into reviews
values(1283410, 81.0, 76);
insert into reviews
values(750130, 71.0, 61);
insert into reviews
values(1567020, 69.0, 60);
insert into reviews
values(2071500, 79.0, 83);
insert into reviews
values(1194630, 71.0, 66);
insert into reviews
values(956030, 82.0, 80);
insert into reviews
values(1937780, 74.0, 59);
insert into reviews
values(1675830, 86.0, 81);
insert into reviews
values(738520, 71.0, 68);
insert into reviews
values(1939160, 82.0, 86);
insert into reviews
values(1356670, 80.0, 83);
insert into reviews
values(1967430, 83.0, 79);
insert into reviews
values(1395030, 87.0, 70);
insert into reviews
values(597820, 66.0, 60);
insert into reviews
values(2741560, 77.0, 84);
insert into reviews
values(895620, 73.0, 80);
insert into reviews
values(1578650, 82.0, 75);
insert into reviews
values(1812090, 79.0, 80);
insert into reviews
values(1140270, 80.0, 79);
insert into reviews
values(466630, 81.0, 74);
insert into reviews
values(2012510, 74.0, 48);
insert into reviews
values(1115690, 75.0, 75);
insert into reviews
values(1355090, 79.0, 80);
insert into reviews
values(1123050, 81.0, 75);
insert into reviews
values(1874000, 73.0, 45);
insert into reviews
values(1282150, 70.0, 77);
insert into reviews
values(2370170, 81.0, 75);
insert into reviews
values(2510710, 80.0, 76);
insert into reviews
values(1240210, 87.0, 79);
insert into reviews
values(1147550, 82.0, 81);
insert into reviews
values(2446550, 58.0, 31);
insert into reviews
values(2111190, 88.0, 82);
insert into reviews
values(2238900, 86.0, 82);
insert into reviews
values(1137300, 69.0, 69);
insert into reviews
values(2445990, 76.0, 73);
insert into reviews
values(1291340, 63.0, 63);
insert into reviews
values(690040, 78.0, 68);
insert into reviews
values(1570010, 73.0, 69);
insert into reviews
values(1354830, 69.0, 0);
insert into reviews
values(1840080, 75.0, 31);
insert into reviews
values(998740, 74.0, 71);
insert into reviews
values(1222370, 62.0, 61);
insert into reviews
values(1004750, 79.0, 59);
insert into reviews
values(1451810, 73.0, 59);
insert into reviews
values(2230650, 83.0, 70);
insert into reviews
values(1622910, 74.0, 75);
insert into reviews
values(1622900, 65.0, 46);
insert into reviews
values(1238880, 73.0, 54);
insert into reviews
values(1766740, 56.0, 68);
insert into reviews
values(1100410, 60.0, 24);
insert into reviews
values(2195410, 81.0, 79);
insert into reviews
values(2111170, 72.0, 71);
insert into reviews
values(1590760, 78.0, 65);
insert into reviews
values(1816300, 73.0, 77);
insert into reviews
values(1072500, 69.0, 62);
insert into reviews
values(1271100, 56.0, 55);
insert into reviews
values(924980, 76.0, 76);
insert into reviews
values(1335790, 71.0, 73);
insert into reviews
values(1540210, 73.0, 71);
insert into reviews
values(1998340, 83.0, 59);
insert into reviews
values(424370, 60.0, 56);
insert into reviews
values(1585220, 77.0, 85);
insert into reviews
values(1644940, 77.0, 83);
insert into reviews
values(1135300, 63.0, 51);
insert into reviews
values(1792250, 70.0, 78);
insert into reviews
values(1283400, 72.0, 79);
insert into reviews
values(1287840, 73.0, 47);
insert into reviews
values(824600, 86.0, 84);
insert into reviews
values(2305840, 80.0, 80);
insert into reviews
values(2878600, 66.0, 55);
insert into reviews
values(921800, 73.0, 68);
insert into reviews
values(1029210, 82.0, 64);
insert into reviews
values(2490990, 75.0, 82);
insert into reviews
values(751630, 76.0, 66);
insert into reviews
values(1266700, 67.0, 72);
insert into reviews
values(1328350, 86.0, 80);
insert into reviews
values(798490, 78.0, 69);
insert into reviews
values(553540, 71.0, 58);
insert into reviews
values(2085000, 76.0, 58);
insert into reviews
values(1432050, 79.0, 74);
insert into reviews
values(1133760, 74.0, 58);
insert into reviews
values(850320, 78.0, 69);
insert into reviews
values(1619520, 87.0, 0);
insert into reviews
values(651670, 77.0, 65);
insert into reviews
values(2379390, 73.0, 52);
insert into reviews
values(2223840, 68.0, 57);
insert into reviews
values(1392960, 71.0, 69);
insert into reviews
values(916840, 81.0, 84);
insert into reviews
values(2021210, 72.0, 73);
insert into reviews
values(2719200, 82.0, 0);
insert into reviews
values(1097200, 76.0, 66);
insert into reviews
values(1167750, 73.0, 63);
insert into reviews
values(958400, 70.0, 40);
insert into reviews
values(1938010, 79.0, 66);
insert into reviews
values(1977170, 85.0, 76);
insert into reviews
values(1898290, 75.0, 56);
insert into reviews
values(1999770, 81.0, 74);
insert into reviews
values(1956040, 81.0, 41);
insert into reviews
values(2366980, 89.0, 76);
insert into reviews
values(1419160, 77.0, 63);
insert into reviews
values(2481020, 81.0, 74);
insert into reviews
values(1522160, 76.0, 75);
insert into reviews
values(1610440, 86.0, 75);
insert into reviews
values(964800, 84.0, 77);
insert into reviews
values(1097130, 82.0, 61);
insert into reviews
values(1903620, 82.0, 74);
insert into reviews
values(1978590, 79.0, 74);
insert into reviews
values(914800, 76.0, 74);
insert into reviews
values(1138660, 75.0, 79);
insert into reviews
values(1634860, 87.0, 85);
insert into reviews
values(1574240, 73.0, 73);
insert into reviews
values(1920480, 78.0, 59);
insert into reviews
values(1196470, 67.0, 69);
insert into reviews
values(465200, 76.0, 74);
insert into reviews
values(594330, 81.0, 62);
insert into reviews
values(1286350, 74.0, 71);
insert into reviews
values(1203710, 82.0, 83);
insert into reviews
values(1289380, 60.0, 24);
insert into reviews
values(2243710, 76.0, 75);
insert into reviews
values(2386310, 81.0, 79);
insert into reviews
values(1038250, 79.0, 55);
insert into reviews
values(1037020, 76.0, 58);
insert into reviews
values(2102450, 69.0, 60);
insert into reviews
values(1449200, 85.0, 84);
insert into reviews
values(1082430, 77.0, 85);
insert into reviews
values(913740, 77.0, 68);
insert into reviews
values(2229560, 82.0, 61);
insert into reviews
values(1580520, 75.0, 79);
insert into reviews
values(1205450, 74.0, 73);
insert into reviews
values(768520, 65.0, 58);
insert into reviews
values(803330, 70.0, 77);
insert into reviews
values(1343240, 69.0, 64);
insert into reviews
values(1981570, 76.0, 0);
insert into reviews
values(1042490, 75.0, 71);
insert into reviews
values(1167450, 69.0, 81);
insert into reviews
values(731040, 72.0, 78);
insert into reviews
values(814000, 73.0, 70);
insert into reviews
values(960690, 82.0, 78);
insert into reviews
values(1876590, 79.0, 71);
insert into reviews
values(1368030, 71.0, 67);
insert into reviews
values(1368870, 75.0, 65);
insert into reviews
values(1082180, 74.0, 51);
insert into reviews
values(1462570, 78.0, 75);
insert into reviews
values(1496590, 77.0, 66);
insert into reviews
values(1271700, 75.0, 69);
insert into reviews
values(707030, 31.0, 41);
insert into reviews
values(1904860, 68.0, 71);
insert into reviews
values(2215260, 79.0, 73);
insert into reviews
values(1519090, 71.0, 68);
insert into reviews
values(2216830, 74.0, 70);
insert into reviews
values(1310410, 63.0, 71);
insert into reviews
values(1517970, 72.0, 76);
insert into reviews
values(2060130, 87.0, 76);
insert into reviews
values(841190, 72.0, 60);
insert into reviews
values(1239520, 63.0, 3);
insert into reviews
values(698670, 70.0, 65);
insert into reviews
values(1179210, 68.0, 68);
insert into reviews
values(811320, 78.0, 77);
insert into reviews
values(2134770, 74.0, 70);
insert into reviews
values(1685750, 79.0, 70);
insert into reviews
values(1282410, 77.0, 73);
insert into reviews
values(2076140, 80.0, 79);
insert into reviews
values(2739830, 72.0, 0);
insert into reviews
values(1158370, 64.0, 60);
insert into reviews
values(1155970, 83.0, 83);
insert into reviews
values(871980, 70.0, 81);
insert into reviews
values(1073910, 72.0, 73);
insert into reviews
values(1138850, 75.0, 70);
insert into reviews
values(628670, 64.0, 65);
insert into reviews
values(1229380, 81.0, 76);
insert into reviews
values(1731070, 71.0, 71);
insert into reviews
values(2233120, 67.0, 69);
insert into reviews
values(1425350, 82.0, 74);
insert into reviews
values(1058450, 68.0, 54);
insert into reviews
values(1357860, 84.0, 75);
insert into reviews
values(1622350, 66.0, 63);
insert into reviews
values(1749750, 68.0, 48);
insert into reviews
values(757310, 76.0, 61);
insert into reviews
values(1885110, 77.0, 82);
insert into reviews
values(2420660, 87.0, 83);
insert into reviews
values(1306630, 59.0, 74);
insert into reviews
values(1621310, 82.0, 79);
insert into reviews
values(1402120, 74.0, 76);
insert into reviews
values(1153640, 73.0, 68);
insert into reviews
values(1213700, 59.0, 64);
insert into reviews
values(1472660, 63.0, 49);
insert into reviews
values(473950, 85.0, 77);
insert into reviews
values(1931010, 76.0, 72);
insert into reviews
values(1859470, 71.0, 76);
insert into reviews
values(1406850, 81.0, 74);
insert into reviews
values(2292260, 78.0, 67);
insert into reviews
values(1844380, 67.0, 68);
insert into reviews
values(2014550, 76.0, 68);
insert into reviews
values(2461850, 81.0, 74);
insert into reviews
values(1195290, 70.0, 72);
insert into reviews
values(1663220, 79.0, 70);
insert into reviews
values(1649010, 69.0, 72);
insert into reviews
values(1367590, 72.0, 80);
insert into reviews
values(957960, 78.0, 67);
insert into reviews
values(1416050, 81.0, 68);
insert into reviews
values(1249040, 77.0, 85);
insert into reviews
values(1347780, 81.0, 78);
insert into reviews
values(1154810, 78.0, 73);
insert into reviews
values(1118240, 70.0, 60);
insert into reviews
values(1087760, 70.0, 68);
insert into reviews
values(1046400, 82.0, 67);
insert into reviews
values(1832040, 70.0, 48);
insert into reviews
values(566440, 59.0, 28);
insert into reviews
values(978520, 76.0, 68);
insert into reviews
values(746850, 73.0, 76);
insert into reviews
values(1777620, 74.0, 69);
insert into reviews
values(1840800, 78.0, 72);
insert into reviews
values(1119980, 75.0, 81);
insert into reviews
values(787810, 78.0, 76);
insert into reviews
values(1608640, 81.0, 77);
insert into reviews
values(1013140, 69.0, 73);
insert into reviews
values(1328840, 84.0, 82);
insert into reviews
values(1730590, 80.0, 73);
insert into reviews
values(1497440, 88.0, 80);
insert into reviews
values(1337010, 79.0, 79);
insert into reviews
values(1286990, 80.0, 80);
insert into reviews
values(1388870, 73.0, 66);
insert into reviews
values(999220, 80.0, 64);
insert into reviews
values(1449280, 66.0, 71);
insert into reviews
values(1849900, 82.0, 67);
insert into reviews
values(2051120, 77.0, 67);
insert into reviews
values(1089830, 70.0, 59);
insert into reviews
values(1295270, 77.0, 65);
insert into reviews
values(2731870, 80.0, 81);
insert into reviews
values(1324340, 64.0, 75);
insert into reviews
values(1979440, 71.0, 75);
insert into reviews
values(785790, 84.0, 82);
insert into reviews
values(1062830, 72.0, 66);
insert into reviews
values(1456760, 83.0, 76);
insert into reviews
values(1641700, 80.0, 68);
insert into reviews
values(1599020, 78.0, 81);
insert into reviews
values(1893810, 85.0, 76);
insert into reviews
values(1341820, 77.0, 77);
insert into reviews
values(1101190, 74.0, 74);
insert into reviews
values(1209490, 68.0, 64);
insert into reviews
values(1201270, 85.0, 77);
insert into reviews
values(996770, 74.0, 72);
insert into reviews
values(1000010, 83.0, 68);
insert into reviews
values(1009290, 58.0, 59);
insert into reviews
values(1155330, 75.0, 79);
insert into reviews
values(1493750, 72.0, 70);
insert into reviews
values(1134100, 67.0, 65);
insert into reviews
values(2803280, 74.0, 0);
insert into reviews
values(2717880, 80.0, 74);
insert into reviews
values(2379910, 79.0, 57);
insert into reviews
values(1013220, 66.0, 0);
insert into reviews
values(2254740, 74.0, 71);
insert into reviews
values(1294810, 56.0, 36);
insert into reviews
values(1574260, 82.0, 76);
insert into reviews
values(1112890, 57.0, 59);
insert into reviews
values(760650, 64.0, 40);
insert into reviews
values(1602080, 68.0, 62);
insert into reviews
values(1898500, 85.0, 74);
insert into reviews
values(1286320, 67.0, 54);
insert into reviews
values(1191630, 79.0, 77);
insert into reviews
values(1812370, 84.0, 80);
insert into reviews
values(1669420, 82.0, 80);
insert into reviews
values(2394650, 82.0, 80);
insert into reviews
values(1931730, 60.0, 64);
insert into reviews
values(1069690, 72.0, 46);
insert into reviews
values(1647550, 80.0, 79);
insert into reviews
values(1627570, 83.0, 73);
insert into reviews
values(2081080, 72.0, 30);
insert into reviews
values(2217580, 81.0, 78);
insert into reviews
values(1182620, 80.0, 79);
insert into reviews
values(1680880, 64.0, 43);
insert into reviews
values(2017080, 77.0, 67);
insert into reviews
values(1532690, 80.0, 71);
insert into reviews
values(1654660, 76.0, 66);
insert into reviews
values(1413870, 67.0, 82);
insert into reviews
values(1904790, 64.0, 81);
insert into reviews
values(1051690, 82.0, 73);
insert into reviews
values(515960, 73.0, 71);
insert into reviews
values(1420290, 83.0, 84);
insert into reviews
values(226620, 82.0, 78);
insert into reviews
values(2694420, 88.0, 75);
insert into reviews
values(1414850, 65.0, 55);
insert into reviews
values(1437400, 72.0, 47);
insert into reviews
values(1996430, 79.0, 73);
insert into reviews
values(1116580, 78.0, 75);
insert into reviews
values(1670870, 75.0, 80);
insert into reviews
values(1410640, 81.0, 84);
insert into reviews
values(1402110, 68.0, 77);
insert into reviews
values(2287330, 77.0, 84);
insert into reviews
values(1272840, 76.0, 70);
insert into reviews
values(1345890, 69.0, 62);
insert into reviews
values(2106840, 85.0, 89);
insert into reviews
values(1040420, 82.0, 67);
insert into reviews
values(1341200, 61.0, 56);
insert into reviews
values(2085370, 75.0, 78);
insert into reviews
values(1330470, 80.0, 76);
insert into reviews
values(2272400, 80.0, 78);
insert into reviews
values(2494780, 63.0, 0);
insert into reviews
values(919360, 79.0, 78);
insert into reviews
values(1928870, 71.0, 56);
insert into reviews
values(1743850, 88.0, 74);
insert into reviews
values(754890, 68.0, 74);
insert into reviews
values(1676130, 81.0, 75);
insert into reviews
values(1380420, 78.0, 82);
insert into reviews
values(1045720, 74.0, 73);
insert into reviews
values(1436590, 72.0, 86);
insert into reviews
values(983970, 73.0, 76);
insert into reviews
values(1371720, 80.0, 74);
insert into reviews
values(1206060, 81.0, 76);
insert into reviews
values(1062140, 73.0, 70);
insert into reviews
values(1552810, 65.0, 59);
insert into reviews
values(1967260, 67.0, 70);
insert into reviews
values(1949030, 75.0, 71);
insert into reviews
values(1196090, 64.0, 66);
insert into reviews
values(2009100, 69.0, 61);
insert into reviews
values(1485590, 75.0, 76);
insert into reviews
values(1225560, 78.0, 80);
insert into reviews
values(2213300, 77.0, 70);
insert into reviews
values(981890, 69.0, 52);
insert into reviews
values(1299510, 66.0, 38);
insert into reviews
values(1766100, 75.0, 65);
insert into reviews
values(1497950, 75.0, 55);
insert into reviews
values(1920780, 76.0, 78);
insert into reviews
values(1996010, 84.0, 80);
insert into reviews
values(1492680, 77.0, 81);
insert into reviews
values(1975440, 70.0, 71);
insert into reviews
values(1889740, 75.0, 88);
insert into reviews
values(1038370, 81.0, 65);
insert into reviews
values(1123450, 90.0, 77);
insert into reviews
values(1429850, 81.0, 82);
insert into reviews
values(1282690, 76.0, 68);
insert into reviews
values(795420, 84.0, 78);
insert into reviews
values(945770, 68.0, 75);
insert into reviews
values(1110910, 76.0, 62);
insert into reviews
values(2653940, 71.0, 69);
insert into reviews
values(1413660, 70.0, 70);
insert into reviews
values(729000, 78.0, 74);
insert into reviews
values(1591530, 75.0, 72);
insert into reviews
values(982290, 76.0, 74);
insert into reviews
values(674930, 72.0, 63);
insert into reviews
values(1242980, 73.0, 68);
insert into reviews
values(1000410, 72.0, 66);
insert into reviews
values(1799930, 78.0, 68);
insert into reviews
values(1311510, 81.0, 66);
insert into reviews
values(1158890, 74.0, 67);
insert into reviews
values(2123640, 74.0, 64);
insert into reviews
values(1190170, 84.0, 71);
insert into reviews
values(1432100, 80.0, 73);
insert into reviews
values(1108590, 76.0, 66);
insert into reviews
values(1314000, 67.0, 71);
insert into reviews
values(1553000, 67.0, 47);
insert into reviews
values(1658290, 71.0, 66);
insert into reviews
values(2059660, 77.0, 80);
insert into reviews
values(2398170, 77.0, 78);
insert into reviews
values(2006140, 76.0, 77);
insert into reviews
values(1924360, 82.0, 68);
insert into reviews
values(1937620, 71.0, 0);
insert into reviews
values(2060590, 77.0, 0);
insert into reviews
values(1157220, 73.0, 72);
insert into reviews
values(2304640, 82.0, 70);
insert into reviews
values(1608230, 80.0, 78);
insert into reviews
values(824550, 74.0, 73);
insert into reviews
values(1390410, 76.0, 74);
insert into reviews
values(1783360, 79.0, 70);
insert into reviews
values(720560, 75.0, 75);
insert into reviews
values(1194810, 73.0, 56);
insert into reviews
values(2001340, 84.0, 79);
insert into reviews
values(1285670, 76.0, 77);
insert into reviews
values(1160220, 81.0, 73);
insert into reviews
values(2014380, 81.0, 75);
insert into reviews
values(826940, 64.0, 57);
insert into reviews
values(1638230, 54.0, 0);
insert into reviews
values(1135910, 54.0, 12);
insert into reviews
values(1182310, 80.0, 79);
insert into reviews
values(1283230, 63.0, 50);
insert into reviews
values(1373960, 80.0, 70);
insert into reviews
values(1108000, 74.0, 72);
insert into reviews
values(1235100, 74.0, 72);
insert into reviews
values(1231990, 74.0, 69);
insert into reviews
values(1244950, 72.0, 65);
insert into reviews
values(1046790, 73.0, 62);
insert into reviews
values(1227780, 70.0, 79);
insert into reviews
values(1137350, 82.0, 61);
insert into reviews
values(1913210, 64.0, 52);
insert into reviews
values(1309950, 81.0, 67);
insert into reviews
values(1279630, 64.0, 61);
insert into reviews
values(1759380, 76.0, 65);
insert into reviews
values(1046300, 79.0, 77);
insert into reviews
values(1037130, 80.0, 71);
insert into reviews
values(1889930, 78.0, 80);
insert into reviews
values(1867510, 69.0, 58);
insert into reviews
values(1776380, 69.0, 73);
insert into reviews
values(2378620, 84.0, 87);
insert into reviews
values(1574310, 73.0, 72);
insert into reviews
values(1607240, 74.0, 67);
insert into reviews
values(269190, 60.0, 60);
insert into reviews
values(1454970, 69.0, 39);
insert into reviews
values(2095340, 70.0, 65);
insert into reviews
values(1660840, 76.0, 68);
insert into reviews
values(1386900, 79.0, 75);
insert into reviews
values(1747760, 84.0, 74);
insert into reviews
values(1298140, 73.0, 79);
insert into reviews
values(962580, 59.0, 73);
insert into reviews
values(593150, 74.0, 71);
insert into reviews
values(1069530, 74.0, 68);
insert into reviews
values(1710540, 72.0, 71);
insert into reviews
values(1866180, 72.0, 63);
insert into reviews
values(1839940, 69.0, 56);
insert into reviews
values(1003090, 71.0, 56);
insert into reviews
values(1221250, 89.0, 74);
insert into reviews
values(1334730, 72.0, 69);
insert into reviews
values(1491670, 79.0, 64);
insert into reviews
values(1186640, 71.0, 69);
insert into reviews
values(1257360, 82.0, 82);
insert into reviews
values(1823930, 76.0, 61);
insert into reviews
values(2366970, 86.0, 82);
insert into reviews
values(1546310, 78.0, 53);
insert into reviews
values(1634150, 73.0, 73);
insert into reviews
values(1446350, 61.0, 43);
insert into reviews
values(1299690, 78.0, 78);
insert into reviews
values(2544110, 84.0, 88);
insert into reviews
values(1233260, 71.0, 73);
insert into reviews
values(1477940, 59.0, 19);
insert into reviews
values(824000, 62.0, 45);
insert into reviews
values(2097230, 82.0, 78);
insert into reviews
values(1373430, 73.0, 68);
insert into reviews
values(1122120, 74.0, 0);
insert into reviews
values(865680, 79.0, 76);
insert into reviews
values(1457080, 78.0, 67);
insert into reviews
values(2737300, 77.0, 82);
insert into reviews
values(598550, 82.0, 79);
insert into reviews
values(2313020, 68.0, 68);
insert into reviews
values(1140290, 79.0, 63);
insert into reviews
values(1296360, 82.0, 74);
insert into reviews
values(1955230, 74.0, 73);
insert into reviews
values(1577250, 68.0, 71);
insert into reviews
values(1421490, 74.0, 73);
insert into reviews
values(910830, 77.0, 54);
insert into reviews
values(2633500, 60.0, 0);
insert into reviews
values(1472930, 75.0, 44);
insert into reviews
values(1229580, 83.0, 70);
insert into reviews
values(1921480, 73.0, 56);
insert into reviews
values(1538970, 66.0, 53);
insert into reviews
values(1173220, 63.0, 63);
insert into reviews
values(1265780, 33.0, 15);
insert into reviews
values(1843310, 54.0, 60);
insert into reviews
values(866140, 80.0, 77);
insert into reviews
values(1232460, 69.0, 70);
insert into reviews
values(1057750, 63.0, 66);
insert into reviews
values(2362090, 76.0, 80);
insert into reviews
values(1658920, 59.0, 50);
insert into reviews
values(2153350, 79.0, 74);
insert into reviews
values(1186040, 70.0, 61);
insert into reviews
values(1659600, 79.0, 76);
insert into reviews
values(1361400, 63.0, 50);
insert into reviews
values(2238040, 82.0, 79);
insert into reviews
values(914750, 58.0, 56);
insert into reviews
values(906100, 75.0, 67);
insert into reviews
values(1331210, 76.0, 63);
insert into reviews
values(1370140, 65.0, 67);
insert into reviews
values(2851150, 74.0, 65);
insert into reviews
values(1324530, 77.0, 67);
insert into reviews
values(1981610, 58.0, 62);
insert into reviews
values(1872680, 79.0, 66);
insert into reviews
values(1426010, 85.0, 81);
insert into reviews
values(2305500, 79.0, 61);
insert into reviews
values(994140, 73.0, 76);
insert into reviews
values(1233590, 64.0, 41);
insert into reviews
values(2235020, 70.0, 66);
insert into reviews
values(1919470, 89.0, 81);
insert into reviews
values(1561340, 83.0, 67);
insert into reviews
values(1036890, 76.0, 69);
insert into reviews
values(363860, 68.0, 71);
insert into reviews
values(1543710, 78.0, 71);
insert into reviews
values(1085220, 76.0, 65);
insert into reviews
values(1962430, 66.0, 73);
insert into reviews
values(1438480, 75.0, 78);
insert into reviews
values(1259380, 69.0, 72);
insert into reviews
values(720350, 72.0, 74);
insert into reviews
values(1101360, 72.0, 61);
insert into reviews
values(1214650, 59.0, 45);
insert into reviews
values(1121420, 81.0, 80);
insert into reviews
values(1296450, 69.0, 0);
insert into reviews
values(1521970, 72.0, 68);
insert into reviews
values(1229460, 70.0, 72);
insert into reviews
values(2076580, 78.0, 63);
insert into reviews
values(541310, 76.0, 73);
insert into reviews
values(854940, 73.0, 77);
insert into reviews
values(1726120, 80.0, 63);
insert into reviews
values(878670, 67.0, 77);
insert into reviews
values(1370050, 71.0, 63);
insert into reviews
values(1730680, 78.0, 80);
insert into reviews
values(1273560, 74.0, 65);
insert into reviews
values(1333200, 75.0, 67);
insert into reviews
values(1095120, 79.0, 0);
insert into reviews
values(829280, 79.0, 80);
insert into reviews
values(1484900, 68.0, 78);
insert into reviews
values(2304440, 72.0, 66);
insert into reviews
values(1167140, 69.0, 65);
insert into reviews
values(2596420, 81.0, 76);
insert into reviews
values(1755100, 83.0, 75);
insert into reviews
values(762840, 70.0, 62);
insert into reviews
values(730430, 68.0, 69);
insert into reviews
values(1269640, 84.0, 76);
insert into reviews
values(1266030, 77.0, 70);
insert into reviews
values(2206210, 72.0, 70);
insert into reviews
values(1430220, 73.0, 72);
insert into reviews
values(1409830, 73.0, 63);
insert into reviews
values(1252830, 69.0, 76);
insert into reviews
values(1921980, 83.0, 59);
insert into reviews
values(924750, 69.0, 67);
insert into reviews
values(609920, 74.0, 68);
insert into reviews
values(1736290, 69.0, 70);
insert into reviews
values(1336180, 73.0, 71);
insert into reviews
values(2652000, 65.0, 50);
insert into reviews
values(1042380, 74.0, 68);
insert into reviews
values(1375400, 74.0, 69);
insert into reviews
values(2139300, 61.0, 73);
insert into reviews
values(1319460, 80.0, 67);
insert into reviews
values(1119700, 70.0, 74);
insert into reviews
values(762940, 66.0, 51);
insert into reviews
values(938560, 78.0, 78);
insert into reviews
values(1144770, 73.0, 72);
insert into reviews
values(721180, 68.0, 12);
insert into reviews
values(1661630, 77.0, 68);
insert into reviews
values(1135260, 65.0, 50);
insert into reviews
values(1519710, 67.0, 60);
insert into reviews
values(890720, 78.0, 65);
insert into reviews
values(1982340, 64.0, 68);
insert into reviews
values(2275150, 71.0, 63);
insert into reviews
values(2138090, 76.0, 76);
insert into reviews
values(898890, 75.0, 77);
insert into reviews
values(1403440, 61.0, 54);
insert into reviews
values(1351210, 59.0, 61);
insert into reviews
values(1393370, 74.0, 77);
insert into reviews
values(1084640, 82.0, 77);
insert into reviews
values(1205900, 80.0, 71);
insert into reviews
values(944920, 68.0, 0);
insert into reviews
values(1580180, 81.0, 77);
insert into reviews
values(1107790, 60.0, 59);
insert into reviews
values(1061880, 72.0, 34);
insert into reviews
values(1191900, 67.0, 61);
insert into reviews
values(1946700, 75.0, 69);
insert into reviews
values(1140890, 71.0, 62);
insert into reviews
values(1011190, 69.0, 79);
insert into reviews
values(861250, 82.0, 71);
insert into reviews
values(1998330, 72.0, 70);
insert into reviews
values(2231190, 82.0, 55);
insert into reviews
values(1225580, 70.0, 62);
insert into reviews
values(612570, 74.0, 78);
insert into reviews
values(1062110, 84.0, 77);
insert into reviews
values(1708010, 75.0, 62);
insert into reviews
values(1164050, 79.0, 63);
insert into reviews
values(2229940, 77.0, 81);
insert into reviews
values(1097110, 71.0, 63);
insert into reviews
values(889910, 78.0, 72);
insert into reviews
values(1523650, 72.0, 38);
insert into reviews
values(1335230, 86.0, 74);
insert into reviews
values(1771360, 84.0, 74);
insert into reviews
values(948640, 57.0, 59);
insert into reviews
values(1608700, 67.0, 0);
insert into reviews
values(1574270, 77.0, 83);
insert into reviews
values(2535440, 70.0, 78);
insert into reviews
values(1333470, 65.0, 62);
insert into reviews
values(1582680, 76.0, 63);
insert into reviews
values(1530470, 65.0, 66);
insert into reviews
values(1610460, 74.0, 56);
insert into reviews
values(2316580, 76.0, 48);
insert into reviews
values(581660, 66.0, 53);
insert into reviews
values(1911360, 75.0, 65);
insert into reviews
values(1959390, 83.0, 79);
insert into reviews
values(2060790, 69.0, 74);
insert into reviews
values(1385100, 74.0, 56);
insert into reviews
values(1782330, 83.0, 65);
insert into reviews
values(1099640, 75.0, 74);
insert into reviews
values(1049710, 73.0, 67);
insert into reviews
values(1345820, 79.0, 56);
insert into reviews
values(773370, 81.0, 70);
insert into reviews
values(1942010, 77.0, 68);
insert into reviews
values(916350, 80.0, 65);
insert into reviews
values(814680, 78.0, 72);
insert into reviews
values(1119600, 67.0, 73);
insert into reviews
values(1137450, 67.0, 55);
insert into reviews
values(1132910, 61.0, 70);
insert into reviews
values(1220150, 71.0, 70);
insert into reviews
values(1341050, 51.0, 51);
insert into reviews
values(1297330, 77.0, 68);
insert into reviews
values(2437040, 68.0, 0);
insert into reviews
values(1393750, 79.0, 62);
insert into reviews
values(1600910, 76.0, 0);
insert into reviews
values(985950, 82.0, 67);
insert into reviews
values(1896880, 80.0, 74);
insert into reviews
values(1932160, 65.0, 56);
insert into reviews
values(598730, 75.0, 71);
insert into reviews
values(2337820, 73.0, 21);
insert into reviews
values(1346010, 71.0, 59);
insert into reviews
values(1147330, 64.0, 0);
insert into reviews
values(1294420, 79.0, 69);
insert into reviews
values(1783680, 77.0, 50);
insert into reviews
values(1867530, 77.0, 73);
insert into reviews
values(702680, 72.0, 66);
insert into reviews
values(374190, 84.0, 76);
insert into reviews
values(1114290, 78.0, 69);
insert into reviews
values(1399700, 64.0, 0);
insert into reviews
values(1016790, 69.0, 61);
insert into reviews
values(1423600, 77.0, 77);
insert into reviews
values(1514930, 69.0, 67);
insert into reviews
values(809060, 70.0, 67);
insert into reviews
values(941570, 74.0, 58);
insert into reviews
values(967390, 68.0, 50);
insert into reviews
values(1678420, 52.0, 58);
insert into reviews
values(1098770, 88.0, 72);
insert into reviews
values(465100, 75.0, 67);
insert into reviews
values(679110, 54.0, 41);
insert into reviews
values(1502560, 66.0, 73);
insert into reviews
values(1263070, 59.0, 51);
insert into reviews
values(1248080, 74.0, 65);
insert into reviews
values(1581480, 86.0, 79);
insert into reviews
values(1575470, 74.0, 67);
insert into reviews
values(1223910, 56.0, 58);
insert into reviews
values(2794770, 68.0, 69);
insert into reviews
values(1041920, 84.0, 68);
insert into reviews
values(733210, 74.0, 73);
insert into reviews
values(1172650, 67.0, 61);
insert into reviews
values(1000760, 70.0, 77);
insert into reviews
values(2738750, 58.0, 62);
insert into reviews
values(1946070, 73.0, 58);
insert into reviews
values(1602560, 72.0, 64);
insert into reviews
values(1345760, 58.0, 67);
insert into reviews
values(1015940, 82.0, 69);
insert into reviews
values(1998450, 90.0, 78);
insert into reviews
values(1307660, 54.0, 43);
insert into reviews
values(1304340, 66.0, 0);
insert into reviews
values(1350200, 87.0, 68);
insert into reviews
values(1178210, 76.0, 72);
insert into reviews
values(995980, 77.0, 75);
insert into reviews
values(1071130, 78.0, 80);
insert into reviews
values(840210, 48.0, 47);
insert into reviews
values(1506510, 82.0, 58);
insert into reviews
values(1184760, 84.0, 66);
insert into reviews
values(1104380, 75.0, 71);
insert into reviews
values(1671360, 69.0, 62);
insert into reviews
values(1612780, 71.0, 70);
insert into reviews
values(2223740, 67.0, 71);
insert into reviews
values(1960110, 74.0, 61);
insert into reviews
values(1125910, 78.0, 82);
insert into reviews
values(730390, 69.0, 75);
insert into reviews
values(1539620, 66.0, 65);
insert into reviews
values(969760, 76.0, 67);
insert into reviews
values(1162130, 64.0, 52);
insert into reviews
values(986310, 68.0, 58);
insert into reviews
values(1924430, 79.0, 76);
insert into reviews
values(1630110, 57.0, 62);
insert into reviews
values(2516170, 65.0, 0);
insert into reviews
values(1012570, 70.0, 0);
insert into reviews
values(1246250, 64.0, 0);
insert into reviews
values(2131010, 80.0, 80);
insert into reviews
values(1150950, 77.0, 74);
insert into reviews
values(1614270, 72.0, 59);
insert into reviews
values(1325890, 71.0, 53);
insert into reviews
values(2769080, 75.0, 72);
insert into reviews
values(1983970, 69.0, 0);
insert into reviews
values(1499120, 83.0, 82);
insert into reviews
values(1668530, 75.0, 71);
insert into reviews
values(1371690, 65.0, 69);
insert into reviews
values(1912380, 55.0, 52);
insert into reviews
values(762220, 75.0, 68);
insert into reviews
values(1110050, 75.0, 67);
insert into reviews
values(725270, 81.0, 63);
insert into reviews
values(865610, 72.0, 67);
insert into reviews
values(946030, 76.0, 70);
insert into reviews
values(254370, 65.0, 75);
insert into reviews
values(1456880, 84.0, 80);
insert into reviews
values(1976950, 81.0, 0);
insert into reviews
values(989440, 72.0, 60);
insert into reviews
values(1733240, 65.0, 59);
insert into reviews
values(1353270, 79.0, 66);
insert into reviews
values(628200, 69.0, 64);
insert into reviews
values(968370, 68.0, 74);
insert into reviews
values(1671410, 71.0, 58);
insert into reviews
values(1430680, 69.0, 68);
insert into reviews
values(2162020, 70.0, 69);
insert into reviews
values(1368130, 66.0, 67);
insert into reviews
values(858030, 47.0, 55);
insert into reviews
values(2602020, 77.0, 80);
insert into reviews
values(1045180, 68.0, 66);
insert into reviews
values(739080, 71.0, 64);
insert into reviews
values(840390, 69.0, 34);
insert into reviews
values(1421790, 75.0, 0);
insert into reviews
values(1399080, 71.0, 74);
insert into reviews
values(1015890, 56.0, 63);
insert into reviews
values(2243670, 78.0, 71);
insert into reviews
values(1139280, 77.0, 58);
insert into reviews
values(2660410, 64.0, 61);
insert into reviews
values(2081400, 76.0, 75);
insert into reviews
values(968870, 66.0, 56);
insert into reviews
values(985900, 81.0, 71);
insert into reviews
values(1405790, 74.0, 47);
insert into reviews
values(1568970, 85.0, 80);
insert into reviews
values(1310330, 81.0, 53);
insert into reviews
values(1422420, 77.0, 83);
insert into reviews
values(1579280, 70.0, 54);
insert into reviews
values(1229420, 66.0, 0);
insert into reviews
values(1402320, 66.0, 67);
insert into reviews
values(690120, 68.0, 67);
insert into reviews
values(1674640, 43.0, 36);
insert into reviews
values(1190400, 72.0, 74);
insert into reviews
values(1154040, 77.0, 82);
insert into reviews
values(2146570, 76.0, 56);
insert into reviews
values(1592540, 75.0, 62);
insert into reviews
values(1497360, 67.0, 63);
insert into reviews
values(982720, 66.0, 58);
insert into reviews
values(2103680, 84.0, 79);
insert into reviews
values(1209410, 68.0, 70);
insert into reviews
values(3061910, 67.0, 0);
insert into reviews
values(1843540, 65.0, 72);
insert into reviews
values(750200, 54.0, 63);
insert into reviews
values(1154790, 74.0, 75);
insert into reviews
values(2015960, 64.0, 0);
insert into reviews
values(1113570, 75.0, 75);
insert into reviews
values(2193050, 78.0, 75);
insert into reviews
values(347800, 79.0, 69);
insert into reviews
values(762180, 64.0, 0);
insert into reviews
values(1284090, 54.0, 0);
insert into reviews
values(1369520, 77.0, 78);
insert into reviews
values(1115780, 67.0, 73);
insert into reviews
values(1662480, 80.0, 48);
insert into reviews
values(1191260, 68.0, 38);
insert into reviews
values(1223500, 81.0, 65);
insert into reviews
values(1050370, 77.0, 71);
insert into reviews
values(1178140, 82.0, 64);
insert into reviews
values(1619230, 75.0, 0);
insert into reviews
values(1831700, 66.0, 71);
insert into reviews
values(1225590, 69.0, 61);
insert into reviews
values(1082680, 61.0, 70);
insert into reviews
values(1302050, 67.0, 83);
insert into reviews
values(1532460, 49.0, 0);
insert into reviews
values(2562900, 74.0, 68);
insert into reviews
values(959860, 73.0, 62);
insert into reviews
values(599610, 74.0, 70);
insert into reviews
values(883360, 72.0, 69);
insert into reviews
values(1640320, 71.0, 0);
insert into reviews
values(1651960, 72.0, 64);
insert into reviews
values(596000, 69.0, 61);
insert into reviews
values(1337530, 75.0, 0);
insert into reviews
values(1121780, 68.0, 51);
insert into reviews
values(623280, 53.0, 31);
insert into reviews
values(1991300, 85.0, 76);
insert into reviews
values(1424980, 70.0, 65);
insert into reviews
values(1001800, 73.0, 80);
insert into reviews
values(1267930, 79.0, 0);
insert into reviews
values(1377920, 50.0, 20);
insert into reviews
values(1540350, 77.0, 72);
insert into reviews
values(768450, 64.0, 71);
insert into reviews
values(735290, 77.0, 63);
insert into reviews
values(593640, 60.0, 88);
insert into reviews
values(1544360, 79.0, 68);
insert into reviews
values(922050, 83.0, 76);
insert into reviews
values(2471130, 85.0, 74);
insert into reviews
values(1309620, 79.0, 68);
insert into reviews
values(931310, 53.0, 0);
insert into reviews
values(1277130, 65.0, 64);
insert into reviews
values(910490, 73.0, 67);
insert into reviews
values(1035560, 65.0, 73);
insert into reviews
values(817020, 52.0, 57);
insert into reviews
values(1164060, 79.0, 73);
insert into reviews
values(1024480, 70.0, 59);
insert into reviews
values(1969440, 72.0, 61);
insert into reviews
values(2556990, 79.0, 77);
insert into reviews
values(695330, 76.0, 76);
insert into reviews
values(1419620, 81.0, 73);
insert into reviews
values(2161620, 74.0, 59);
insert into reviews
values(2104880, 59.0, 0);
insert into reviews
values(2008510, 70.0, 66);
insert into reviews
values(1672310, 70.0, 82);
insert into reviews
values(1903910, 69.0, 78);
insert into reviews
values(2060870, 79.0, 58);
insert into reviews
values(2172180, 70.0, 0);
insert into reviews
values(1640630, 76.0, 70);
insert into reviews
values(1546920, 86.0, 75);
insert into reviews
values(1058690, 77.0, 70);
insert into reviews
values(926580, 76.0, 70);
insert into reviews
values(1075200, 65.0, 0);
insert into reviews
values(1451080, 81.0, 59);
insert into reviews
values(951750, 79.0, 72);
insert into reviews
values(1989320, 61.0, 82);
insert into reviews
values(1170060, 81.0, 68);
insert into reviews
values(794960, 71.0, 65);
insert into reviews
values(1146310, 70.0, 70);
insert into reviews
values(1739900, 81.0, 70);
insert into reviews
values(1293730, 66.0, 72);
insert into reviews
values(1905020, 38.0, 49);
insert into reviews
values(1811040, 75.0, 59);
insert into reviews
values(1037120, 71.0, 77);
insert into reviews
values(1650810, 74.0, 73);
insert into reviews
values(1301950, 79.0, 65);
insert into reviews
values(2543760, 75.0, 73);
insert into reviews
values(1600370, 65.0, 36);
insert into reviews
values(2215540, 53.0, 82);
insert into reviews
values(2450820, 86.0, 82);
insert into reviews
values(1213750, 60.0, 72);
insert into reviews
values(1422410, 67.0, 42);
insert into reviews
values(2082270, 76.0, 22);
insert into reviews
values(1432850, 80.0, 85);
insert into reviews
values(2081470, 84.0, 78);
insert into reviews
values(1183850, 52.0, 44);
insert into reviews
values(899310, 73.0, 76);
insert into reviews
values(1122680, 80.0, 75);
insert into reviews
values(1042670, 57.0, 73);
insert into reviews
values(912570, 76.0, 66);
insert into reviews
values(1195360, 67.0, 75);
insert into reviews
values(989790, 82.0, 73);
insert into reviews
values(1666250, 70.0, 55);
insert into reviews
values(1060210, 51.0, 60);
insert into reviews
values(1647730, 65.0, 61);
insert into reviews
values(1617220, 80.0, 55);
insert into reviews
values(1177030, 47.0, 90);
insert into reviews
values(1280300, 75.0, 81);
insert into reviews
values(1781010, 83.0, 75);
insert into reviews
values(945680, 69.0, 81);
insert into reviews
values(1386870, 76.0, 79);
insert into reviews
values(1346400, 76.0, 0);
insert into reviews
values(1468380, 62.0, 0);
insert into reviews
values(2662630, 77.0, 56);
insert into reviews
values(1505430, 53.0, 63);
insert into reviews
values(1383250, 80.0, 0);
insert into reviews
values(1400970, 75.0, 47);
insert into reviews
values(1586880, 80.0, 0);
insert into reviews
values(2493360, 71.0, 0);
insert into reviews
values(2337640, 78.0, 73);
insert into reviews
values(1130710, 62.0, 0);
insert into reviews
values(1060600, 84.0, 80);
insert into reviews
values(1139870, 48.0, 24);
insert into reviews
values(975150, 74.0, 53);
insert into reviews
values(1095040, 69.0, 16);
insert into reviews
values(605800, 65.0, 65);
insert into reviews
values(1592490, 77.0, 96);
insert into reviews
values(975950, 68.0, 67);
insert into reviews
values(1787810, 78.0, 84);
insert into reviews
values(2099990, 69.0, 72);
insert into reviews
values(1698220, 70.0, 64);
insert into reviews
values(1145290, 57.0, 50);
insert into reviews
values(3246160, 69.0, 71);
insert into reviews
values(523770, 43.0, 67);
insert into reviews
values(1154830, 61.0, 57);
insert into reviews
values(1675900, 64.0, 74);
insert into reviews
values(1240060, 81.0, 54);
insert into reviews
values(979310, 67.0, 70);
insert into reviews
values(1620720, 71.0, 63);
insert into reviews
values(1585440, 73.0, 70);
insert into reviews
values(536280, 62.0, 58);
insert into reviews
values(1154670, 53.0, 30);
insert into reviews
values(1318970, 84.0, 0);
insert into reviews
values(1529550, 66.0, 39);
insert into reviews
values(1966420, 75.0, 60);
insert into reviews
values(3270520, 90.0, 80);
insert into reviews
values(2211280, 69.0, 38);
insert into reviews
values(1401400, 56.0, 0);
insert into reviews
values(1299360, 74.0, 74);
insert into reviews
values(1293910, 77.0, 0);
insert into reviews
values(2527580, 53.0, 55);
insert into reviews
values(1453790, 72.0, 53);
insert into reviews
values(1258220, 71.0, 42);
insert into reviews
values(1727180, 84.0, 73);
insert into reviews
values(2024390, 63.0, 59);
insert into reviews
values(945740, 53.0, 0);
insert into reviews
values(2089830, 75.0, 54);
insert into reviews
values(1062340, 67.0, 65);
insert into reviews
values(1342620, 73.0, 55);
insert into reviews
values(1098292, 76.0, 72);
insert into reviews
values(1249110, 63.0, 65);
insert into reviews
values(3070400, 72.0, 69);
insert into reviews
values(1569220, 39.0, 0);
insert into reviews
values(2357570, 79.0, 19);
insert into reviews
values(1436920, 73.0, 73);
insert into reviews
values(1947210, 83.0, 76);
insert into reviews
values(2933620, 82.0, 62);
insert into reviews
values(1755030, 70.0, 78);
insert into reviews
values(1507790, 59.0, 0);
insert into reviews
values(1649340, 66.0, 66);
insert into reviews
values(2324650, 82.0, 85);
insert into reviews
values(2074920, 57.0, 62);
insert into reviews
values(2600140, 78.0, 0);
insert into reviews
values(1094540, 75.0, 57);
insert into reviews
values(962700, 68.0, 72);
insert into reviews
values(1383700, 65.0, 66);
insert into reviews
values(1125330, 57.0, 66);
insert into reviews
values(1064840, 40.0, 67);
insert into reviews
values(1220370, 65.0, 67);
insert into reviews
values(1321070, 75.0, 38);
insert into reviews
values(2073850, 80.0, 68);
insert into reviews
values(2685090, 77.0, 88);
insert into reviews
values(2160480, 61.0, 67);
insert into reviews
values(2784620, 79.0, 74);
insert into reviews
values(2076820, 84.0, 76);
insert into reviews
values(2632930, 68.0, 0);
insert into reviews
values(1239950, 73.0, 0);
insert into reviews
values(874040, 67.0, 79);
insert into reviews
values(1674920, 77.0, 70);
insert into reviews
values(1311070, 74.0, 71);
insert into reviews
values(1122700, 76.0, 54);
insert into reviews
values(1189800, 66.0, 63);
insert into reviews
values(1522140, 48.0, 68);
insert into reviews
values(2278790, 86.0, 79);
insert into reviews
values(1155460, 59.0, 0);
insert into reviews
values(1308880, 60.0, 49);
insert into reviews
values(2225070, 74.0, 50);
insert into reviews
values(1506440, 69.0, 68);
insert into reviews
values(1211930, 75.0, 74);
insert into reviews
values(1068600, 44.0, 28);
insert into reviews
values(894620, 76.0, 61);
insert into reviews
values(935570, 56.0, 56);
insert into reviews
values(925570, 44.0, 59);
insert into reviews
values(1022710, 60.0, 52);
insert into reviews
values(2534370, 63.0, 66);
insert into reviews
values(831050, 60.0, 63);
insert into reviews
values(1417880, 60.0, 36);
insert into reviews
values(1451120, 83.0, 45);
insert into reviews
values(2519060, 56.0, 24);
insert into reviews
values(957710, 51.0, 20);
insert into reviews
values(2008420, 36.0, 31);
insert into reviews
values(1911800, 66.0, 52);
insert into reviews
values(1337920, 68.0, 64);
insert into reviews
values(1426900, 58.0, 0);
insert into reviews
values(1129920, 83.0, 76);
insert into reviews
values(1696220, 77.0, 76);
insert into reviews
values(1234180, 73.0, 83);
insert into reviews
values(589670, 74.0, 62);
insert into reviews
values(1048740, 69.0, 0);
insert into reviews
values(1329810, 61.0, 0);
insert into reviews
values(1295790, 71.0, 60);
insert into reviews
values(1962663, 79.0, 42);
insert into reviews
values(1079830, 74.0, 76);
insert into reviews
values(2141910, 84.0, 31);
insert into reviews
values(715380, 49.0, 58);
insert into reviews
values(451310, 77.0, 58);
insert into reviews
values(2195140, 73.0, 71);
insert into reviews
values(1205430, 73.0, 51);
insert into reviews
values(1188900, 70.0, 0);
insert into reviews
values(1273750, 66.0, 0);
insert into reviews
values(1243890, 69.0, 66);
insert into reviews
values(1910600, 85.0, 76);
insert into reviews
values(2424110, 71.0, 66);
insert into reviews
values(2069180, 78.0, 0);
insert into reviews
values(1243690, 63.0, 58);
insert into reviews
values(3183850, 76.0, 78);
insert into reviews
values(1941410, 74.0, 65);
insert into reviews
values(1803840, 66.0, 59);
insert into reviews
values(1162280, 69.0, 0);
insert into reviews
values(1122100, 62.0, 60);
insert into reviews
values(1684400, 65.0, 68);
insert into reviews
values(917840, 80.0, 53);
insert into reviews
values(2742010, 65.0, 0);
insert into reviews
values(1163060, 87.0, 70);
insert into reviews
values(1943420, 73.0, 0);
insert into reviews
values(1287310, 68.0, 72);
insert into reviews
values(1920100, 82.0, 82);
insert into reviews
values(1271400, 78.0, 63);
insert into reviews
values(2114300, 64.0, 0);
insert into reviews
values(1296980, 59.0, 60);
insert into reviews
values(1452500, 62.0, 59);
insert into reviews
values(1597580, 59.0, 75);
insert into reviews
values(853050, 74.0, 69);
insert into reviews
values(975510, 77.0, 76);
insert into reviews
values(1449850, 80.0, 60);
insert into reviews
values(1220100, 76.0, 67);
insert into reviews
values(820540, 75.0, 68);
insert into reviews
values(1717410, 61.0, 77);
insert into reviews
values(1453900, 61.0, 42);
insert into reviews
values(1880470, 58.0, 62);
insert into reviews
values(1502080, 78.0, 85);
insert into reviews
values(1039100, 70.0, 0);
insert into reviews
values(1323540, 65.0, 58);
insert into reviews
values(1294880, 54.0, 58);
insert into reviews
values(1399690, 63.0, 55);
insert into reviews
values(1885750, 83.0, 83);
insert into reviews
values(1452070, 69.0, 72);
insert into reviews
values(837460, 82.0, 83);
insert into reviews
values(1546100, 79.0, 74);
insert into reviews
values(907670, 77.0, 78);
insert into reviews
values(1142390, 39.0, 64);
insert into reviews
values(1962660, 75.0, 53);
insert into reviews
values(2834910, 77.0, 82);
insert into reviews
values(1320230, 59.0, 60);
insert into reviews
values(1558930, 65.0, 59);
insert into reviews
values(1247570, 59.0, 0);
insert into reviews
values(1760330, 65.0, 0);
insert into reviews
values(600080, 76.0, 54);
insert into reviews
values(1053710, 65.0, 56);
insert into reviews
values(1547380, 69.0, 54);
insert into reviews
values(1508400, 76.0, 70);
insert into reviews
values(2229890, 75.0, 76);
insert into reviews
values(1851030, 62.0, 0);
insert into reviews
values(1406810, 65.0, 68);
insert into reviews
values(1140100, 75.0, 49);
insert into reviews
values(2680190, 81.0, 80);
insert into reviews
values(2732960, 83.0, 87);
insert into reviews
values(1431850, 64.0, 0);
insert into reviews
values(691790, 63.0, 0);
insert into reviews
values(2560250, 78.0, 75);
insert into reviews
values(1030060, 58.0, 66);
insert into reviews
values(1358840, 74.0, 0);
insert into reviews
values(1374970, 75.0, 72);
insert into reviews
values(1913160, 44.0, 84);
insert into reviews
values(2172860, 82.0, 71);
insert into reviews
values(651490, 73.0, 0);
insert into reviews
values(1034750, 63.0, 66);
insert into reviews
values(1573390, 57.0, 0);
insert into reviews
values(2079180, 90.0, 66);
insert into reviews
values(971030, 54.0, 40);
insert into reviews
values(966400, 68.0, 0);
insert into reviews
values(2905090, 57.0, 53);
insert into reviews
values(886060, 65.0, 37);
insert into reviews
values(1476170, 59.0, 0);
insert into reviews
values(2132540, 75.0, 0);
insert into reviews
values(1084990, 54.0, 42);
insert into reviews
values(1621990, 60.0, 64);
insert into reviews
values(1758910, 80.0, 82);
insert into reviews
values(1019310, 75.0, 73);
insert into reviews
values(1542110, 61.0, 79);
insert into reviews
values(1106830, 81.0, 69);
insert into reviews
values(1592320, 58.0, 36);
insert into reviews
values(1973310, 72.0, 63);
insert into reviews
values(1072190, 62.0, 0);
insert into reviews
values(1337100, 62.0, 0);
insert into reviews
values(1198590, 64.0, 0);
insert into reviews
values(1398100, 65.0, 54);
insert into reviews
values(1449320, 61.0, 72);
insert into reviews
values(1093290, 76.0, 73);
insert into reviews
values(1210490, 49.0, 0);
insert into reviews
values(2009450, 74.0, 0);
insert into reviews
values(1329790, 63.0, 0);
insert into reviews
values(1490340, 76.0, 38);
insert into reviews
values(1097790, 59.0, 69);
insert into reviews
values(1172190, 66.0, 60);
insert into reviews
values(1419290, 69.0, 80);
insert into reviews
values(1094730, 58.0, 0);
insert into reviews
values(1150590, 67.0, 75);
insert into reviews
values(1210150, 68.0, 43);
insert into reviews
values(2005680, 73.0, 0);
insert into reviews
values(2429640, 72.0, 52);
insert into reviews
values(1388260, 72.0, 75);
insert into reviews
values(1342260, 81.0, 76);
insert into reviews
values(2376270, 65.0, 60);
insert into reviews
values(1754000, 79.0, 62);
insert into reviews
values(1080450, 79.0, 60);
insert into reviews
values(1351000, 49.0, 47);
insert into reviews
values(1266680, 52.0, 0);
insert into reviews
values(1098170, 74.0, 62);
insert into reviews
values(1136020, 56.0, 0);
insert into reviews
values(1228870, 73.0, 0);
insert into reviews
values(1297300, 59.0, 56);
insert into reviews
values(970840, 54.0, 30);
insert into reviews
values(1205480, 61.0, 49);
insert into reviews
values(1050880, 62.0, 0);
insert into reviews
values(1296290, 61.0, 87);
insert into reviews
values(544920, 74.0, 68);
insert into reviews
values(2236680, 83.0, 69);
insert into reviews
values(1668190, 78.0, 84);
insert into reviews
values(887450, 68.0, 56);
insert into reviews
values(2139460, 71.0, 59);
insert into reviews
values(1931240, 84.0, 88);
insert into reviews
values(838110, 74.0, 80);
insert into reviews
values(944430, 86.0, 64);
insert into reviews
values(1378070, 50.0, 47);

insert into player_stats
values(1172470, 124262, '100,000,000 .. 200,000,000', 10086, 269941, 624473);
insert into player_stats
values(1938090, 67419, '50,000,000 .. 100,000,000', 5291, 179545, 488897);
insert into player_stats
values(1203220, 66954, '10,000,000 .. 20,000,000', 9926, 140522, 385770);
insert into player_stats
values(1086940, 54771, '20,000,000 .. 50,000,000', 7523, 123814, 875343);
insert into player_stats
values(553850, 53399, '20,000,000 .. 50,000,000', 5491, 88277, 458208);
insert into player_stats
values(2252570, 47931, '1,000,000 .. 2,000,000', 35487, 69348, 88894);
insert into player_stats
values(2669320, 42032, '5,000,000 .. 10,000,000', 8933, 37507, 108534);
insert into player_stats
values(1245620, 29529, '20,000,000 .. 50,000,000', 8089, 71938, 952523);
insert into player_stats
values(2878980, 27486, '1,000,000 .. 2,000,000', 8065, 15265, 56395);
insert into player_stats
values(1222670, 25276, '10,000,000 .. 20,000,000', 1670, 19884, 96185);
insert into player_stats
values(1091500, 22265, '20,000,000 .. 50,000,000', 4976, 28864, 830387);
insert into player_stats
values(1599340, 17355, '50,000,000 .. 100,000,000', 4773, 258184, 1324761);
insert into player_stats
values(2379780, 17123, '2,000,000 .. 5,000,000', 2736, 28534, 43825);
insert into player_stats
values(1142710, 16842, '2,000,000 .. 5,000,000', 10413, 52119, 166519);
insert into player_stats
values(427520, 16426, '5,000,000 .. 10,000,000', 9869, 18174, 118166);
insert into player_stats
values(2358720, 15004, '50,000,000 .. 100,000,000', 3286, 38311, 2406967);
insert into player_stats
values(1364780, 14920, '2,000,000 .. 5,000,000', 6251, 52012, 70540);
insert into player_stats
values(261550, 14477, '10,000,000 .. 20,000,000', 8815, 29981, 248034);
insert into player_stats
values(1158310, 14302, '2,000,000 .. 5,000,000', 8313, 16877, 98474);
insert into player_stats
values(526870, 12596, '10,000,000 .. 20,000,000', 6219, 33403, 185957);
insert into player_stats
values(1604030, 10961, '5,000,000 .. 10,000,000', 3484, 51382, 150645);
insert into player_stats
values(1551360, 10009, '5,000,000 .. 10,000,000', 3786, 16180, 80745);
insert into player_stats
values(2221490, 9481, '1,000,000 .. 2,000,000', 2712, 5841, 27482);
insert into player_stats
values(1237950, 9213, '2,000,000 .. 5,000,000', 1165, 2383, 35321);
insert into player_stats
values(2344520, 8835, '1,000,000 .. 2,000,000', 6517, 39008, 55561);
insert into player_stats
values(1151340, 8796, '2,000,000 .. 5,000,000', 4683, 7842, 72930);
insert into player_stats
values(1466060, 8175, '200,000 .. 500,000', 1491, 175, 25568);
insert into player_stats
values(632360, 7902, '5,000,000 .. 10,000,000', 3574, 9328, 74945);
insert into player_stats
values(1284190, 7330, '1,000,000 .. 2,000,000', 2528, 10171, 28380);
insert into player_stats
values(1361210, 7267, '2,000,000 .. 5,000,000', 4715, 18836, 107450);
insert into player_stats
values(1286830, 6625, '5,000,000 .. 10,000,000', 3479, 11300, 27416);
insert into player_stats
values(1238810, 6327, '10,000,000 .. 20,000,000', 2298, 53370, 114017);
insert into player_stats
values(1238840, 6308, '5,000,000 .. 10,000,000', 2112, 21759, 53107);
insert into player_stats
values(899770, 5831, '20,000,000 .. 50,000,000', 4953, 52463, 258503);
insert into player_stats
values(990080, 5716, '20,000,000 .. 50,000,000', 2151, 28670, 527652);
insert into player_stats
values(1063730, 5583, '50,000,000 .. 100,000,000', 10209, 84368, 913027);
insert into player_stats
values(1248130, 5419, '2,000,000 .. 5,000,000', 11820, 41039, 96402);
insert into player_stats
values(949230, 5392, '2,000,000 .. 5,000,000', 5422, 13645, 76549);
insert into player_stats
values(548430, 5216, '5,000,000 .. 10,000,000', 3409, 11765, 53558);
insert into player_stats
values(2707930, 5140, '0 .. 20,000', 1461, 10831, 18122);
insert into player_stats
values(2195250, 5110, '5,000,000 .. 10,000,000', 9939, 36465, 107109);
insert into player_stats
values(1426210, 5018, '5,000,000 .. 10,000,000', 1050, 21450, 69976);
insert into player_stats
values(1687950, 4994, '2,000,000 .. 5,000,000', 3697, 11793, 35298);
insert into player_stats
values(239140, 4953, '10,000,000 .. 20,000,000', 2117, 13534, 45770);
insert into player_stats
values(1293830, 4864, '5,000,000 .. 10,000,000', 2056, 17716, 75598);
insert into player_stats
values(529340, 4609, '1,000,000 .. 2,000,000', 8980, 17264, 69663);
insert into player_stats
values(1326470, 4450, '10,000,000 .. 20,000,000', 1432, 31648, 411804);
insert into player_stats
values(1778820, 4409, '1,000,000 .. 2,000,000', 5865, 9964, 46139);
insert into player_stats
values(1144200, 4296, '5,000,000 .. 10,000,000', 1359, 16644, 55174);
insert into player_stats
values(1904540, 4178, '2,000,000 .. 5,000,000', 26403, 39355, 83572);
insert into player_stats
values(1888930, 4144, '1,000,000 .. 2,000,000', 1252, 1816, 24521);
insert into player_stats
values(1407200, 3869, '1,000,000 .. 2,000,000', 2696, 5639, 24057);
insert into player_stats
values(2050650, 3748, '5,000,000 .. 10,000,000', 2084, 8588, 111172);
insert into player_stats
values(1304930, 3743, '2,000,000 .. 5,000,000', 1557, 7952, 36332);
insert into player_stats
values(1716740, 3725, '2,000,000 .. 5,000,000', 4097, 18868, 330597);
insert into player_stats
values(1621690, 3688, '1,000,000 .. 2,000,000', 1831, 6930, 46355);
insert into player_stats
values(1446780, 3658, '5,000,000 .. 10,000,000', 5212, 47309, 230942);
insert into player_stats
values(1401590, 3587, '500,000 .. 1,000,000', 5914, 9115, 14314);
insert into player_stats
values(2186680, 3582, '10,000,000 .. 20,000,000', 3167, 9770, 37094);
insert into player_stats
values(686810, 3380, '2,000,000 .. 5,000,000', 3432, 13706, 21086);
insert into player_stats
values(1868140, 3367, '5,000,000 .. 10,000,000', 1564, 16179, 98281);
insert into player_stats
values(1284210, 3277, '2,000,000 .. 5,000,000', 3462, 5835, 10846);
insert into player_stats
values(397540, 3164, '2,000,000 .. 5,000,000', 2578, 12900, 93597);
insert into player_stats
values(1465360, 3132, '1,000,000 .. 2,000,000', 4219, 4199, 11958);
insert into player_stats
values(1260320, 3070, '2,000,000 .. 5,000,000', 1181, 20199, 57806);
insert into player_stats
values(933110, 3016, '1,000,000 .. 2,000,000', 2819, 5228, 18142);
insert into player_stats
values(1794680, 2966, '5,000,000 .. 10,000,000', 2258, 12076, 77061);
insert into player_stats
values(1517290, 2774, '10,000,000 .. 20,000,000', 2670, 23335, 107006);
insert into player_stats
values(2071280, 2578, '200,000 .. 500,000', 1431, 2782, 8899);
insert into player_stats
values(1290000, 2547, '1,000,000 .. 2,000,000', 2226, 5221, 14178);
insert into player_stats
values(1190970, 2543, '200,000 .. 500,000', 1663, 4363, 21829);
insert into player_stats
values(1384160, 2463, '1,000,000 .. 2,000,000', 4184, 4581, 30939);
insert into player_stats
values(1328670, 2420, '1,000,000 .. 2,000,000', 3024, 5070, 59650);
insert into player_stats
values(962130, 2394, '2,000,000 .. 5,000,000', 2143, 10324, 31923);
insert into player_stats
values(1774580, 2353, '1,000,000 .. 2,000,000', 1890, 3856, 67583);
insert into player_stats
values(1222140, 2344, '2,000,000 .. 5,000,000', 765, 2446, 25379);
insert into player_stats
values(1240440, 2275, '10,000,000 .. 20,000,000', 1582, 10355, 256619);
insert into player_stats
values(782330, 2262, '5,000,000 .. 10,000,000', 1516, 8841, 84865);
insert into player_stats
values(1145360, 2253, '5,000,000 .. 10,000,000', 2177, 11527, 54015);
insert into player_stats
values(1677280, 2183, '1,000,000 .. 2,000,000', 2995, 3583, 30243);
insert into player_stats
values(304390, 2146, '5,000,000 .. 10,000,000', 4399, 5141, 216499);
insert into player_stats
values(2488620, 2067, '500,000 .. 1,000,000', 2883, 5720, 13327);
insert into player_stats
values(2215430, 2025, '2,000,000 .. 5,000,000', 2221, 6370, 77154);
insert into player_stats
values(1167630, 1984, '2,000,000 .. 5,000,000', 1405, 4027, 8221);
insert into player_stats
values(1145350, 1838, '2,000,000 .. 5,000,000', 2575, 8475, 112300);
insert into player_stats
values(872410, 1827, '1,000,000 .. 2,000,000', 13123, 5747, 16482);
insert into player_stats
values(2679460, 1753, '1,000,000 .. 2,000,000', 3619, 3139, 85194);
insert into player_stats
values(1569040, 1742, '2,000,000 .. 5,000,000', 26858, 38993, 88706);
insert into player_stats
values(2113850, 1742, '200,000 .. 500,000', 5709, 3399, 4167);
insert into player_stats
values(2157560, 1736, '200,000 .. 500,000', 3241, 985, 7029);
insert into player_stats
values(1669000, 1707, '500,000 .. 1,000,000', 3544, 4614, 42826);
insert into player_stats
values(2161700, 1683, '1,000,000 .. 2,000,000', 3474, 5198, 36703);
insert into player_stats
values(1876890, 1679, '500,000 .. 1,000,000', 3028, 6743, 22618);
insert into player_stats
values(699130, 1663, '1,000,000 .. 2,000,000', 3025, 3003, 7943);
insert into player_stats
values(1527950, 1632, '1,000,000 .. 2,000,000', 3873, 4460, 35769);
insert into player_stats
values(1850570, 1604, '1,000,000 .. 2,000,000', 1692, 2298, 22020);
insert into player_stats
values(1259420, 1600, '2,000,000 .. 5,000,000', 1993, 4023, 27380);
insert into player_stats
values(1282100, 1573, '1,000,000 .. 2,000,000', 2422, 8621, 110756);
insert into player_stats
values(1824220, 1565, '2,000,000 .. 5,000,000', 1898, 3706, 16901);
insert into player_stats
values(1934680, 1559, '500,000 .. 1,000,000', 1798, 8299, 25815);
insert into player_stats
values(1029690, 1538, '2,000,000 .. 5,000,000', 1469, 4256, 14794);
insert into player_stats
values(1313140, 1535, '2,000,000 .. 5,000,000', 1138, 3724, 56262);
insert into player_stats
values(1084600, 1501, '500,000 .. 1,000,000', 2387, 3189, 21620);
insert into player_stats
values(1149460, 1492, '500,000 .. 1,000,000', 3131, 5629, 52305);
insert into player_stats
values(427410, 1458, '500,000 .. 1,000,000', 2253, 6136, 29195);
insert into player_stats
values(1325200, 1441, '1,000,000 .. 2,000,000', 4364, 4453, 41273);
insert into player_stats
values(2231380, 1430, '500,000 .. 1,000,000', 1420, 5770, 14335);
insert into player_stats
values(1244460, 1413, '1,000,000 .. 2,000,000', 1426, 2799, 20921);
insert into player_stats
values(1449560, 1391, '0 .. 20,000', 729, 2, 7176);
insert into player_stats
values(1222680, 1385, '2,000,000 .. 5,000,000', 1580, 8003, 85230);
insert into player_stats
values(1593500, 1380, '5,000,000 .. 10,000,000', 1609, 15447, 73529);
insert into player_stats
values(2208920, 1379, '500,000 .. 1,000,000', 2469, 6329, 18955);
insert into player_stats
values(1129580, 1366, '1,000,000 .. 2,000,000', 2650, 4949, 31057);
insert into player_stats
values(1627720, 1363, '1,000,000 .. 2,000,000', 1913, 2720, 29775);
insert into player_stats
values(1158160, 1328, '500,000 .. 1,000,000', 2978, 4554, 15387);
insert into player_stats
values(1506830, 1319, '2,000,000 .. 5,000,000', 10800, 49251, 108168);
insert into player_stats
values(1092790, 1301, '2,000,000 .. 5,000,000', 1115, 3444, 17044);
insert into player_stats
values(2321470, 1300, '1,000,000 .. 2,000,000', 1923, 3104, 56876);
insert into player_stats
values(924970, 1288, '1,000,000 .. 2,000,000', 1800, 6493, 65873);
insert into player_stats
values(1196590, 1284, '2,000,000 .. 5,000,000', 1230, 2451, 106631);
insert into player_stats
values(2591280, 1262, '100,000 .. 200,000', 2050, 2409, 8092);
insert into player_stats
values(2688950, 1213, '200,000 .. 500,000', 2187, 2123, 13648);
insert into player_stats
values(1147560, 1205, '1,000,000 .. 2,000,000', 1836, 3822, 18876);
insert into player_stats
values(1817070, 1190, '2,000,000 .. 5,000,000', 1624, 6349, 66093);
insert into player_stats
values(2666510, 1185, '200,000 .. 500,000', 3325, 1635, 20876);
insert into player_stats
values(1237970, 1173, '5,000,000 .. 10,000,000', 999, 9360, 27547);
insert into player_stats
values(1238860, 1153, '1,000,000 .. 2,000,000', 1387, 8383, 12342);
insert into player_stats
values(1971870, 1149, '500,000 .. 1,000,000', 1502, 3923, 26576);
insert into player_stats
values(1263850, 1122, '2,000,000 .. 5,000,000', 21268, 26878, 93775);
insert into player_stats
values(1940340, 1054, '1,000,000 .. 2,000,000', 1854, 2119, 23679);
insert into player_stats
values(934700, 1023, '500,000 .. 1,000,000', 994, 2835, 18542);
insert into player_stats
values(1888160, 1011, '2,000,000 .. 5,000,000', 2027, 3234, 156022);
insert into player_stats
values(2420110, 1005, '1,000,000 .. 2,000,000', 2923, 3658, 40427);
insert into player_stats
values(881020, 996, '2,000,000 .. 5,000,000', 3426, 4723, 113179);
insert into player_stats
values(1044720, 995, '1,000,000 .. 2,000,000', 1817, 4465, 24874);
insert into player_stats
values(1113000, 962, '1,000,000 .. 2,000,000', 2749, 3466, 29984);
insert into player_stats
values(1336490, 958, '500,000 .. 1,000,000', 2450, 3677, 12832);
insert into player_stats
values(1790600, 949, '2,000,000 .. 5,000,000', 1504, 2329, 120000);
insert into player_stats
values(1210320, 941, '1,000,000 .. 2,000,000', 662, 1262, 10085);
insert into player_stats
values(753640, 928, '1,000,000 .. 2,000,000', 795, 1218, 7936);
insert into player_stats
values(975370, 915, '2,000,000 .. 5,000,000', 2661, 1966, 28288);
insert into player_stats
values(362890, 907, '2,000,000 .. 5,000,000', 1183, 1653, 7116);
insert into player_stats
values(1286680, 866, '1,000,000 .. 2,000,000', 1347, 2656, 14957);
insert into player_stats
values(2000950, 847, '1,000,000 .. 2,000,000', 996, 2018, 3581);
insert into player_stats
values(1501750, 827, '1,000,000 .. 2,000,000', 1635, 681, 32235);
insert into player_stats
values(1845910, 804, '2,000,000 .. 5,000,000', 2521, 1276, 60656);
insert into player_stats
values(2835570, 793, '2,000,000 .. 5,000,000', 700, 2365, 20135);
insert into player_stats
values(2054970, 768, '2,000,000 .. 5,000,000', 2618, 2626, 228285);
insert into player_stats
values(885970, 764, '500,000 .. 1,000,000', 1681, 1249, 18407);
insert into player_stats
values(1462040, 761, '1,000,000 .. 2,000,000', 1628, 1951, 13803);
insert into player_stats
values(1718570, 742, '1,000,000 .. 2,000,000', 3172, 1747, 7787);
insert into player_stats
values(2515020, 737, '500,000 .. 1,000,000', 2350, 2377, 27313);
insert into player_stats
values(920210, 719, '1,000,000 .. 2,000,000', 1120, 2929, 82446);
insert into player_stats
values(1151640, 700, '1,000,000 .. 2,000,000', 1650, 7280, 49582);
insert into player_stats
values(848450, 698, '2,000,000 .. 5,000,000', 2382, 3149, 42057);
insert into player_stats
values(1057090, 697, '2,000,000 .. 5,000,000', 883, 7920, 31224);
insert into player_stats
values(1030840, 686, '1,000,000 .. 2,000,000', 722, 1603, 36631);
insert into player_stats
values(1097150, 664, '20,000,000 .. 50,000,000', 1370, 21493, 172026);
insert into player_stats
values(2072450, 655, '500,000 .. 1,000,000', 4164, 3609, 46029);
insert into player_stats
values(870780, 648, '1,000,000 .. 2,000,000', 869, 1727, 9078);
insert into player_stats
values(1272080, 644, '2,000,000 .. 5,000,000', 1681, 2956, 69112);
insert into player_stats
values(1985810, 644, '500,000 .. 1,000,000', 1623, 2304, 3637);
insert into player_stats
values(784080, 636, '500,000 .. 1,000,000', 3992, 1812, 6472);
insert into player_stats
values(2369390, 627, '500,000 .. 1,000,000', 1547, 3619, 19996);
insert into player_stats
values(1809540, 625, '1,000,000 .. 2,000,000', 1014, 2606, 6493);
insert into player_stats
values(1846380, 618, '1,000,000 .. 2,000,000', 1716, 4299, 14053);
insert into player_stats
values(1651560, 598, '200,000 .. 500,000', 569, 590, 4228);
insert into player_stats
values(1102190, 595, '500,000 .. 1,000,000', 1871, 1785, 14037);
insert into player_stats
values(1054490, 569, '100,000 .. 200,000', 1836, 535, 1452);
insert into player_stats
values(1213210, 564, '1,000,000 .. 2,000,000', 945, 1708, 29136);
insert into player_stats
values(1072040, 559, '100,000 .. 200,000', 2735, 1147, 3459);
insert into player_stats
values(1575940, 544, '200,000 .. 500,000', 1960, 1664, 13330);
insert into player_stats
values(1030830, 538, '2,000,000 .. 5,000,000', 619, 519, 3818);
insert into player_stats
values(1324130, 538, '200,000 .. 500,000', 2732, 2716, 8778);
insert into player_stats
values(1601580, 525, '500,000 .. 1,000,000', 813, 1105, 14925);
insert into player_stats
values(1562430, 517, '1,000,000 .. 2,000,000', 668, 1077, 12686);
insert into player_stats
values(2108330, 515, '1,000,000 .. 2,000,000', 3162, 4367, 14432);
insert into player_stats
values(2124490, 514, '500,000 .. 1,000,000', 1366, 1690, 21791);
insert into player_stats
values(1244090, 509, '500,000 .. 1,000,000', 1234, 519, 8597);
insert into player_stats
values(2440510, 506, '1,000,000 .. 2,000,000', 2367, 979, 4507);
insert into player_stats
values(1451190, 503, '500,000 .. 1,000,000', 1410, 1066, 6858);
insert into player_stats
values(1332010, 498, '5,000,000 .. 10,000,000', 399, 1310, 51455);
insert into player_stats
values(850190, 474, '200,000 .. 500,000', 645, 1201, 3598);
insert into player_stats
values(597180, 474, '200,000 .. 500,000', 1228, 565, 3565);
insert into player_stats
values(1235140, 470, '500,000 .. 1,000,000', 2462, 1876, 9508);
insert into player_stats
values(1659420, 467, '500,000 .. 1,000,000', 1185, 1552, 10733);
insert into player_stats
values(668580, 466, '1,000,000 .. 2,000,000', 1008, 1607, 37222);
insert into player_stats
values(1272320, 464, '200,000 .. 500,000', 882, 904, 5939);
insert into player_stats
values(1222690, 454, '1,000,000 .. 2,000,000', 1711, 2731, 4937);
insert into player_stats
values(1267540, 448, '200,000 .. 500,000', 197, 44, 2686);
insert into player_stats
values(368260, 436, '2,000,000 .. 5,000,000', 1779, 2568, 15405);
insert into player_stats
values(694280, 431, '500,000 .. 1,000,000', 896, 1003, 3279);
insert into player_stats
values(1588010, 430, '200,000 .. 500,000', 3058, 1991, 3773);
insert into player_stats
values(780290, 430, '500,000 .. 1,000,000', 2645, 2265, 6900);
insert into player_stats
values(756800, 429, '500,000 .. 1,000,000', 747, 2178, 8104);
insert into player_stats
values(1265820, 426, '100,000 .. 200,000', 1123, 115, 1449);
insert into player_stats
values(1105670, 424, '500,000 .. 1,000,000', 2156, 1231, 6723);
insert into player_stats
values(1629520, 422, '200,000 .. 500,000', 457, 1167, 3128);
insert into player_stats
values(1124300, 411, '1,000,000 .. 2,000,000', 1943, 2810, 55232);
insert into player_stats
values(1875830, 410, '200,000 .. 500,000', 2228, 1599, 21749);
insert into player_stats
values(1488200, 409, '500,000 .. 1,000,000', 1190, 1088, 4368);
insert into player_stats
values(1458140, 406, '500,000 .. 1,000,000', 846, 1998, 18428);
insert into player_stats
values(1637320, 402, '2,000,000 .. 5,000,000', 633, 2368, 6487);
insert into player_stats
values(1971650, 398, '200,000 .. 500,000', 2400, 1332, 16994);
insert into player_stats
values(1096530, 396, '1,000,000 .. 2,000,000', 2167, 3215, 8291);
insert into player_stats
values(2138710, 394, '500,000 .. 1,000,000', 572, 1164, 3136);
insert into player_stats
values(1295500, 378, '100,000 .. 200,000', 999, 272, 2589);
insert into player_stats
values(1817190, 377, '1,000,000 .. 2,000,000', 950, 3324, 12641);
insert into player_stats
values(1676840, 374, '500,000 .. 1,000,000', 1532, 2027, 28528);
insert into player_stats
values(1611910, 373, '2,000,000 .. 5,000,000', 1509, 1419, 12395);
insert into player_stats
values(2933130, 370, '200,000 .. 500,000', 1310, 1835, 8735);
insert into player_stats
values(2291060, 369, '200,000 .. 500,000', 3521, 1687, 18497);
insert into player_stats
values(2231450, 367, '1,000,000 .. 2,000,000', 812, 3667, 8744);
insert into player_stats
values(1455840, 365, '1,000,000 .. 2,000,000', 629, 1294, 7063);
insert into player_stats
values(1084160, 363, '200,000 .. 500,000', 1497, 1665, 25332);
insert into player_stats
values(760160, 362, '2,000,000 .. 5,000,000', 451, 1746, 29008);
insert into player_stats
values(952060, 362, '2,000,000 .. 5,000,000', 693, 1263, 32635);
insert into player_stats
values(2218750, 361, '500,000 .. 1,000,000', 1244, 1442, 26005);
insert into player_stats
values(1372110, 357, '200,000 .. 500,000', 691, 261, 5023);
insert into player_stats
values(2064650, 354, '1,000,000 .. 2,000,000', 1972, 2513, 7164);
insert into player_stats
values(1282730, 348, '1,000,000 .. 2,000,000', 1175, 2392, 51078);
insert into player_stats
values(1433140, 336, '200,000 .. 500,000', 2900, 1322, 17141);
insert into player_stats
values(1245560, 334, '200,000 .. 500,000', 1246, 352, 6062);
insert into player_stats
values(1128920, 331, '1,000,000 .. 2,000,000', 1331, 1244, 9735);
insert into player_stats
values(1357210, 330, '200,000 .. 500,000', 4772, 582, 1422);
insert into player_stats
values(1180660, 328, '500,000 .. 1,000,000', 526, 227, 2768);
insert into player_stats
values(1127500, 328, '500,000 .. 1,000,000', 1027, 730, 9914);
insert into player_stats
values(418530, 313, '1,000,000 .. 2,000,000', 1446, 918, 6937);
insert into player_stats
values(1693980, 313, '500,000 .. 1,000,000', 870, 1788, 28842);
insert into player_stats
values(493520, 307, '2,000,000 .. 5,000,000', 921, 2102, 18813);
insert into player_stats
values(1785650, 302, '200,000 .. 500,000', 1624, 560, 3693);
insert into player_stats
values(1071870, 300, '500,000 .. 1,000,000', 319, 400, 4915);
insert into player_stats
values(1583230, 299, '500,000 .. 1,000,000', 530, 928, 11583);
insert into player_stats
values(2315690, 294, '200,000 .. 500,000', 4045, 2306, 8721);
insert into player_stats
values(2198150, 291, '500,000 .. 1,000,000', 207, 643, 8343);
insert into player_stats
values(986130, 286, '500,000 .. 1,000,000', 867, 691, 3562);
insert into player_stats
values(1268750, 283, '1,000,000 .. 2,000,000', 950, 610, 16065);
insert into player_stats
values(898750, 283, '500,000 .. 1,000,000', 3402, 650, 16817);
insert into player_stats
values(2005010, 282, '200,000 .. 500,000', 280, 449, 5255);
insert into player_stats
values(1549970, 281, '1,000,000 .. 2,000,000', 771, 2057, 15550);
insert into player_stats
values(1150440, 276, '500,000 .. 1,000,000', 1150, 721, 8893);
insert into player_stats
values(1545560, 273, '200,000 .. 500,000', 904, 197, 3911);
insert into player_stats
values(2840770, 272, '100,000 .. 200,000', 1065, 1351, 15120);
insert into player_stats
values(763890, 270, '1,000,000 .. 2,000,000', 1169, 2048, 8091);
insert into player_stats
values(1161580, 270, '1,000,000 .. 2,000,000', 1268, 940, 7718);
insert into player_stats
values(2395210, 267, '200,000 .. 500,000', 451, 222, 1791);
insert into player_stats
values(2561580, 265, '50,000 .. 100,000', 1141, 1258, 2523);
insert into player_stats
values(851850, 264, '1,000,000 .. 2,000,000', 1729, 1743, 25715);
insert into player_stats
values(1222700, 262, '2,000,000 .. 5,000,000', 687, 1750, 8548);
insert into player_stats
values(861650, 262, '500,000 .. 1,000,000', 1821, 395, 1743);
insert into player_stats
values(1782120, 261, '500,000 .. 1,000,000', 1156, 648, 6097);
insert into player_stats
values(1135690, 260, '500,000 .. 1,000,000', 316, 765, 2039);
insert into player_stats
values(1672970, 260, '1,000,000 .. 2,000,000', 1486, 667, 4020);
insert into player_stats
values(1207650, 258, '500,000 .. 1,000,000', 1154, 220, 3333);
insert into player_stats
values(1577120, 256, '500,000 .. 1,000,000', 600, 420, 6278);
insert into player_stats
values(633230, 255, '2,000,000 .. 5,000,000', 1029, 765, 6303);
insert into player_stats
values(2478970, 252, '200,000 .. 500,000', 1211, 840, 6759);
insert into player_stats
values(1218210, 250, '500,000 .. 1,000,000', 948, 300, 3987);
insert into player_stats
values(2187220, 249, '100,000 .. 200,000', 3055, 860, 4440);
insert into player_stats
values(2853730, 246, '50,000 .. 100,000', 4334, 1241, 2581);
insert into player_stats
values(1681430, 238, '500,000 .. 1,000,000', 592, 575, 4953);
insert into player_stats
values(2140020, 236, '500,000 .. 1,000,000', 926, 790, 9555);
insert into player_stats
values(1692250, 234, '500,000 .. 1,000,000', 2888, 5095, 23763);
insert into player_stats
values(2058190, 233, '500,000 .. 1,000,000', 2892, 749, 2230);
insert into player_stats
values(780310, 231, '1,000,000 .. 2,000,000', 1482, 1438, 21506);
insert into player_stats
values(1157390, 231, '500,000 .. 1,000,000', 1556, 407, 5364);
insert into player_stats
values(860510, 229, '1,000,000 .. 2,000,000', 451, 424, 10484);
insert into player_stats
values(1644320, 223, '100,000 .. 200,000', 3233, 511, 3095);
insert into player_stats
values(2698940, 222, '200,000 .. 500,000', 3175, 1537, 12746);
insert into player_stats
values(1337520, 220, '1,000,000 .. 2,000,000', 967, 385, 41838);
insert into player_stats
values(1088850, 219, '500,000 .. 1,000,000', 669, 679, 9826);
insert into player_stats
values(719040, 219, '500,000 .. 1,000,000', 1888, 1465, 24545);
insert into player_stats
values(1338770, 217, '1,000,000 .. 2,000,000', 591, 1424, 6961);
insert into player_stats
values(1641960, 215, '200,000 .. 500,000', 1446, 415, 5601);
insert into player_stats
values(979690, 211, '1,000,000 .. 2,000,000', 460, 1168, 13930);
insert into player_stats
values(960990, 210, '1,000,000 .. 2,000,000', 553, 410, 3306);
insert into player_stats
values(1735700, 209, '200,000 .. 500,000', 1667, 319, 9624);
insert into player_stats
values(1259980, 209, '500,000 .. 1,000,000', 1097, 626, 2867);
insert into player_stats
values(1113560, 207, '500,000 .. 1,000,000', 1522, 892, 28509);
insert into player_stats
values(1937500, 205, '200,000 .. 500,000', 1026, 606, 7240);
insert into player_stats
values(1262580, 204, '1,000,000 .. 2,000,000', 812, 1032, 12152);
insert into player_stats
values(1496790, 204, '500,000 .. 1,000,000', 872, 1236, 23923);
insert into player_stats
values(2455640, 204, '100,000 .. 200,000', 2118, 931, 16418);
insert into player_stats
values(1605220, 203, '1,000,000 .. 2,000,000', 1125, 644, 7986);
insert into player_stats
values(1321440, 202, '0 .. 20,000', 768, 623, 2764);
insert into player_stats
values(2114740, 202, '500,000 .. 1,000,000', 1020, 1132, 9011);
insert into player_stats
values(546560, 202, '2,000,000 .. 5,000,000', 633, 1881, 16459);
insert into player_stats
values(2058180, 202, '1,000,000 .. 2,000,000', 1888, 676, 5604);
insert into player_stats
values(745920, 200, '500,000 .. 1,000,000', 2005, 1759, 39501);
insert into player_stats
values(1382330, 199, '1,000,000 .. 2,000,000', 1111, 481, 8654);
insert into player_stats
values(960910, 199, '500,000 .. 1,000,000', 395, 193, 2643);
insert into player_stats
values(1199030, 199, '200,000 .. 500,000', 5753, 179, 3270);
insert into player_stats
values(1498570, 199, '200,000 .. 500,000', 1789, 2035, 8205);
insert into player_stats
values(2239550, 197, '200,000 .. 500,000', 1470, 844, 4997);
insert into player_stats
values(2000890, 197, '100,000 .. 200,000', 2548, 310, 5548);
insert into player_stats
values(874390, 194, '500,000 .. 1,000,000', 559, 164, 535);
insert into player_stats
values(2401970, 194, '100,000 .. 200,000', 2051, 454, 4419);
insert into player_stats
values(1089090, 191, '1,000,000 .. 2,000,000', 3621, 1399, 7222);
insert into player_stats
values(1649080, 191, '500,000 .. 1,000,000', 928, 2941, 7510);
insert into player_stats
values(736820, 189, '100,000 .. 200,000', 1457, 1335, 6034);
insert into player_stats
values(1487210, 184, '50,000 .. 100,000', 1155, 328, 509);
insert into player_stats
values(1451090, 184, '200,000 .. 500,000', 1646, 585, 10671);
insert into player_stats
values(1280930, 184, '200,000 .. 500,000', 917, 799, 2409);
insert into player_stats
values(990630, 183, '500,000 .. 1,000,000', 252, 225, 1381);
insert into player_stats
values(1341290, 183, '500,000 .. 1,000,000', 620, 682, 8369);
insert into player_stats
values(1016920, 182, '1,000,000 .. 2,000,000', 332, 1085, 9651);
insert into player_stats
values(740130, 182, '2,000,000 .. 5,000,000', 1901, 2360, 60274);
insert into player_stats
values(1369630, 181, '1,000,000 .. 2,000,000', 1107, 922, 6332);
insert into player_stats
values(1896700, 181, '50,000 .. 100,000', 2377, 248, 629);
insert into player_stats
values(1351080, 178, '200,000 .. 500,000', 478, 809, 6250);
insert into player_stats
values(680420, 178, '2,000,000 .. 5,000,000', 2430, 1965, 125123);
insert into player_stats
values(1062810, 178, '200,000 .. 500,000', 1603, 200, 3165);
insert into player_stats
values(839770, 177, '200,000 .. 500,000', 1984, 1059, 4969);
insert into player_stats
values(2725260, 176, '200,000 .. 500,000', 1596, 1553, 14134);
insert into player_stats
values(1426450, 176, '200,000 .. 500,000', 1396, 433, 6458);
insert into player_stats
values(1158850, 175, '200,000 .. 500,000', 2427, 621, 2520);
insert into player_stats
values(1139900, 174, '2,000,000 .. 5,000,000', 429, 1329, 5033);
insert into player_stats
values(2290180, 171, '500,000 .. 1,000,000', 358, 1503, 8043);
insert into player_stats
values(1205970, 170, '50,000 .. 100,000', 1242, 135, 694);
insert into player_stats
values(1253920, 167, '1,000,000 .. 2,000,000', 1546, 1097, 22811);
insert into player_stats
values(814370, 166, '500,000 .. 1,000,000', 1767, 584, 1376);
insert into player_stats
values(1121640, 164, '200,000 .. 500,000', 662, 463, 5711);
insert into player_stats
values(1147860, 163, '100,000 .. 200,000', 995, 397, 4034);
insert into player_stats
values(2084000, 162, '200,000 .. 500,000', 698, 645, 1844);
insert into player_stats
values(1202130, 162, '200,000 .. 500,000', 932, 564, 8089);
insert into player_stats
values(3035570, 162, '200,000 .. 500,000', 877, 1488, 7837);
insert into player_stats
values(2155180, 161, '200,000 .. 500,000', 422, 735, 6421);
insert into player_stats
values(788100, 161, '2,000,000 .. 5,000,000', 1165, 3919, 6259);
insert into player_stats
values(1522820, 161, '1,000,000 .. 2,000,000', 775, 1960, 13129);
insert into player_stats
values(1536620, 161, '0 .. 20,000', 437, 130, 468);
insert into player_stats
values(1533420, 160, '200,000 .. 500,000', 977, 404, 3238);
insert into player_stats
values(1562700, 160, '500,000 .. 1,000,000', 911, 472, 7623);
insert into player_stats
values(2933080, 160, '200,000 .. 500,000', 633, 688, 7586);
insert into player_stats
values(1043810, 159, '200,000 .. 500,000', 470, 193, 4741);
insert into player_stats
values(315210, 159, '500,000 .. 1,000,000', 668, 793, 13459);
insert into player_stats
values(1448440, 151, '1,000,000 .. 2,000,000', 2506, 993, 75373);
insert into player_stats
values(700600, 151, '500,000 .. 1,000,000', 1313, 663, 26509);
insert into player_stats
values(578650, 150, '1,000,000 .. 2,000,000', 1223, 2310, 16900);
insert into player_stats
values(1556790, 149, '200,000 .. 500,000', 789, 332, 5408);
insert into player_stats
values(1931770, 149, '200,000 .. 500,000', 462, 519, 1570);
insert into player_stats
values(835960, 149, '200,000 .. 500,000', 1715, 573, 7258);
insert into player_stats
values(1887840, 147, '200,000 .. 500,000', 734, 843, 4692);
insert into player_stats
values(1484280, 147, '0 .. 20,000', 549, 87, 386);
insert into player_stats
values(257420, 145, '1,000,000 .. 2,000,000', 834, 309, 6485);
insert into player_stats
values(1466640, 144, '500,000 .. 1,000,000', 354, 312, 2260);
insert into player_stats
values(1237320, 144, '500,000 .. 1,000,000', 1001, 1911, 19104);
insert into player_stats
values(2076010, 144, '100,000 .. 200,000', 1249, 732, 2165);
insert into player_stats
values(1353230, 140, '200,000 .. 500,000', 755, 368, 6915);
insert into player_stats
values(2996040, 139, '200,000 .. 500,000', 536, 151, 1455);
insert into player_stats
values(1182900, 136, '500,000 .. 1,000,000', 985, 475, 4903);
insert into player_stats
values(1556100, 135, '50,000 .. 100,000', 670, 173, 3335);
insert into player_stats
values(1574580, 134, '500,000 .. 1,000,000', 361, 313, 1343);
insert into player_stats
values(1262560, 133, '1,000,000 .. 2,000,000', 288, 286, 1934);
insert into player_stats
values(1113120, 133, '1,000,000 .. 2,000,000', 2214, 1214, 17143);
insert into player_stats
values(1337760, 129, '200,000 .. 500,000', 959, 284, 4894);
insert into player_stats
values(1531540, 129, '100,000 .. 200,000', 3334, 452, 4974);
insert into player_stats
values(1378990, 127, '200,000 .. 500,000', 780, 166, 454);
insert into player_stats
values(629820, 126, '500,000 .. 1,000,000', 599, 840, 4158);
insert into player_stats
values(1262540, 125, '1,000,000 .. 2,000,000', 686, 639, 1438);
insert into player_stats
values(867210, 121, '1,000,000 .. 2,000,000', 809, 790, 4167);
insert into player_stats
values(2229870, 121, '0 .. 20,000', 263, 455, 1287);
insert into player_stats
values(1164940, 120, '500,000 .. 1,000,000', 366, 719, 1900);
insert into player_stats
values(1249970, 120, '100,000 .. 200,000', 2297, 664, 3881);
insert into player_stats
values(793460, 119, '100,000 .. 200,000', 788, 147, 1646);
insert into player_stats
values(1277400, 118, '2,000,000 .. 5,000,000', 3326, 992, 34947);
insert into player_stats
values(1581770, 117, '100,000 .. 200,000', 760, 305, 3663);
insert into player_stats
values(610370, 116, '500,000 .. 1,000,000', 1056, 838, 5997);
insert into player_stats
values(1643310, 116, '200,000 .. 500,000', 1033, 495, 3122);
insert into player_stats
values(1328660, 116, '1,000,000 .. 2,000,000', 513, 417, 1204);
insert into player_stats
values(1041720, 114, '1,000,000 .. 2,000,000', 1248, 567, 6219);
insert into player_stats
values(1458100, 114, '200,000 .. 500,000', 1890, 460, 801);
insert into player_stats
values(553420, 114, '1,000,000 .. 2,000,000', 980, 370, 2501);
insert into player_stats
values(1811990, 114, '500,000 .. 1,000,000', 1308, 321, 5064);
insert into player_stats
values(858820, 113, '2,000,000 .. 5,000,000', 795, 3477, 30930);
insert into player_stats
values(1684350, 113, '200,000 .. 500,000', 768, 210, 2733);
insert into player_stats
values(807120, 112, '500,000 .. 1,000,000', 5954, 518, 4238);
insert into player_stats
values(1658280, 112, '100,000 .. 200,000', 1205, 364, 8338);
insert into player_stats
values(1408610, 110, '200,000 .. 500,000', 1331, 713, 5838);
insert into player_stats
values(1065310, 109, '1,000,000 .. 2,000,000', 404, 329, 3059);
insert into player_stats
values(1262350, 108, '1,000,000 .. 2,000,000', 444, 522, 862);
insert into player_stats
values(1547890, 108, '200,000 .. 500,000', 736, null, null);
insert into player_stats
values(1262240, 108, '1,000,000 .. 2,000,000', 523, 541, 3966);
insert into player_stats
values(1658150, 107, '0 .. 20,000', 1092, 376, 3436);
insert into player_stats
values(757320, 106, '200,000 .. 500,000', 1176, 227, 767);
insert into player_stats
values(1805480, 104, '100,000 .. 200,000', 1790, 362, 8378);
insert into player_stats
values(536270, 103, '200,000 .. 500,000', 613, 325, 2841);
insert into player_stats
values(377300, 102, '1,000,000 .. 2,000,000', 187, 149, 6382);
insert into player_stats
values(1585180, 102, '200,000 .. 500,000', 1161, 772, 2717);
insert into player_stats
values(1229240, 102, '200,000 .. 500,000', 1469, 532, 2198);
insert into player_stats
values(1963570, 102, '100,000 .. 200,000', 574, 117, 2986);
insert into player_stats
values(1951410, 101, '100,000 .. 200,000', 542, 419, 1408);
insert into player_stats
values(1649950, 100, '100,000 .. 200,000', 978, 333, 3613);
insert into player_stats
values(837470, 100, '1,000,000 .. 2,000,000', 190, 522, 1981);
insert into player_stats
values(2751000, 100, '200,000 .. 500,000', 627, 548, 1446);
insert into player_stats
values(1003590, 99, '500,000 .. 1,000,000', 1172, 263, 1253);
insert into player_stats
values(970830, 99, '500,000 .. 1,000,000', 869, 388, 4622);
insert into player_stats
values(1593030, 99, '200,000 .. 500,000', 449, 230, 4540);
insert into player_stats
values(933820, 99, '500,000 .. 1,000,000', 756, 954, 6374);
insert into player_stats
values(656350, 98, '500,000 .. 1,000,000', 1393, 578, 3234);
insert into player_stats
values(1475810, 97, '1,000,000 .. 2,000,000', 788, 1069, 14082);
insert into player_stats
values(2230110, 97, '100,000 .. 200,000', 1266, 343, 5690);
insert into player_stats
values(607080, 97, '500,000 .. 1,000,000', 789, 184, 7234);
insert into player_stats
values(1211630, 97, '100,000 .. 200,000', 495, 1173, 10435);
insert into player_stats
values(674140, 97, '500,000 .. 1,000,000', 556, 141, 1088);
insert into player_stats
values(1099410, 96, '200,000 .. 500,000', 1770, 420, 4638);
insert into player_stats
values(1351240, 96, '100,000 .. 200,000', 469, 409, 1115);
insert into player_stats
values(1895880, 95, '500,000 .. 1,000,000', 863, 839, 8038);
insert into player_stats
values(1163550, 95, '200,000 .. 500,000', 1265, 162, 3630);
insert into player_stats
values(826630, 93, '1,000,000 .. 2,000,000', 664, 813, 8145);
insert into player_stats
values(1701520, 93, '200,000 .. 500,000', 715, 428, 2056);
insert into player_stats
values(1740720, 91, '200,000 .. 500,000', 650, 230, 2481);
insert into player_stats
values(1094520, 90, '1,000,000 .. 2,000,000', 1444, 1792, 21047);
insert into player_stats
values(1238820, 90, '1,000,000 .. 2,000,000', 544, 265, 1412);
insert into player_stats
values(682990, 89, '1,000,000 .. 2,000,000', 1093, 473, 7520);
insert into player_stats
values(1574820, 88, '100,000 .. 200,000', 748, 300, 626);
insert into player_stats
values(1388590, 88, '200,000 .. 500,000', 1670, 227, 1607);
insert into player_stats
values(1850510, 88, '100,000 .. 200,000', 1255, 271, 1971);
insert into player_stats
values(1817230, 87, '500,000 .. 1,000,000', 575, 661, 6043);
insert into player_stats
values(1985820, 87, '100,000 .. 200,000', 846, 423, 625);
insert into player_stats
values(1493640, 86, '500,000 .. 1,000,000', 1430, 619, 3779);
insert into player_stats
values(482400, 86, '500,000 .. 1,000,000', 612, 390, 7808);
insert into player_stats
values(2172010, 85, '50,000 .. 100,000', 856, 318, 2581);
insert into player_stats
values(1123770, 84, '500,000 .. 1,000,000', 735, 250, 2971);
insert into player_stats
values(1649240, 84, '500,000 .. 1,000,000', 972, 330, 6643);
insert into player_stats
values(1413480, 83, '100,000 .. 200,000', 2160, 178, 1892);
insert into player_stats
values(1715130, 83, '500,000 .. 1,000,000', 293, 498, 1212);
insert into player_stats
values(1656780, 82, '500,000 .. 1,000,000', 756, null, null);
insert into player_stats
values(2138610, 82, '20,000 .. 50,000', 2887, 34, 2073);
insert into player_stats
values(1238060, 81, '500,000 .. 1,000,000', 697, 883, 1083);
insert into player_stats
values(1382070, 81, '200,000 .. 500,000', 202, 174, 607);
insert into player_stats
values(1295920, 80, '200,000 .. 500,000', 304, 207, 1378);
insert into player_stats
values(1020790, 80, '100,000 .. 200,000', 610, 250, 1663);
insert into player_stats
values(2703850, 80, '200,000 .. 500,000', 532, 277, 916);
insert into player_stats
values(1222730, 79, '1,000,000 .. 2,000,000', 418, 375, 35721);
insert into player_stats
values(2287220, 79, '100,000 .. 200,000', 2755, 758, 6352);
insert into player_stats
values(1677350, 77, '200,000 .. 500,000', 1967, 697, 1363);
insert into player_stats
values(2375550, 77, '200,000 .. 500,000', 1548, 626, 13737);
insert into player_stats
values(1624540, 76, '200,000 .. 500,000', 189, 221, 1475);
insert into player_stats
values(1388880, 76, '500,000 .. 1,000,000', 1557, 312, 6912);
insert into player_stats
values(2221920, 75, '200,000 .. 500,000', 694, 939, 2288);
insert into player_stats
values(1839950, 75, '100,000 .. 200,000', 4172, 311, 2382);
insert into player_stats
values(1983260, 75, '100,000 .. 200,000', 547, 136, 486);
insert into player_stats
values(813230, 75, '200,000 .. 500,000', 584, 446, 8107);
insert into player_stats
values(2052040, 74, '0 .. 20,000', 407, 69, 286);
insert into player_stats
values(601840, 74, '500,000 .. 1,000,000', 1049, 581, 7545);
insert into player_stats
values(1177980, 74, '200,000 .. 500,000', 339, 352, 2936);
insert into player_stats
values(1703340, 73, '1,000,000 .. 2,000,000', 293, 636, 6477);
insert into player_stats
values(1260520, 73, '100,000 .. 200,000', 476, 169, 581);
insert into player_stats
values(2272900, 73, '50,000 .. 100,000', 305, 68, 2670);
insert into player_stats
values(1220140, 73, '200,000 .. 500,000', 1033, 424, 2240);
insert into player_stats
values(1252330, 73, '1,000,000 .. 2,000,000', 825, 1074, 20050);
insert into player_stats
values(973810, 72, '200,000 .. 500,000', 372, 100, 2149);
insert into player_stats
values(2750080, 72, '20,000 .. 50,000', 2080, 206, 888);
insert into player_stats
values(987840, 72, '500,000 .. 1,000,000', 1535, 554, 9731);
insert into player_stats
values(985890, 72, '500,000 .. 1,000,000', 1303, 430, 6042);
insert into player_stats
values(1148760, 71, '200,000 .. 500,000', 1959, 215, 682);
insert into player_stats
values(1179580, 71, '500,000 .. 1,000,000', 639, 186, 5001);
insert into player_stats
values(742420, 71, '200,000 .. 500,000', 703, 312, 2975);
insert into player_stats
values(1469610, 71, '100,000 .. 200,000', 1127, 548, 5650);
insert into player_stats
values(2369900, 71, '50,000 .. 100,000', 870, 141, 1781);
insert into player_stats
values(1902690, 70, '100,000 .. 200,000', 1221, 609, 9254);
insert into player_stats
values(1227690, 69, '500,000 .. 1,000,000', 180, 133, 1159);
insert into player_stats
values(1128860, 69, '200,000 .. 500,000', 1575, 280, 3579);
insert into player_stats
values(2475490, 69, '500,000 .. 1,000,000', 178, 280, 1241);
insert into player_stats
values(882100, 68, '1,000,000 .. 2,000,000', 796, 588, 20701);
insert into player_stats
values(803050, 68, '200,000 .. 500,000', 1267, 307, 8256);
insert into player_stats
values(1874170, 68, '200,000 .. 500,000', 1349, 275, 677);
insert into player_stats
values(1257290, 68, '50,000 .. 100,000', 2094, 140, 3941);
insert into player_stats
values(2477340, 68, '200,000 .. 500,000', 535, 1395, 2726);
insert into player_stats
values(1672500, 68, '200,000 .. 500,000', 2074, 182, 27033);
insert into player_stats
values(2396240, 66, '50,000 .. 100,000', 2229, 189, 1276);
insert into player_stats
values(1049410, 65, '1,000,000 .. 2,000,000', 181, 543, 1255);
insert into player_stats
values(1150530, 65, '100,000 .. 200,000', 523, 218, 3844);
insert into player_stats
values(790710, 64, '1,000,000 .. 2,000,000', 7459, 234, 680);
insert into player_stats
values(2144740, 64, '500,000 .. 1,000,000', 322, 466, 1969);
insert into player_stats
values(2109370, 63, '100,000 .. 200,000', 935, 258, 3553);
insert into player_stats
values(2436570, 63, '20,000 .. 50,000', 102, 154, 702);
insert into player_stats
values(2296990, 63, '1,000,000 .. 2,000,000', 154, 500, 22179);
insert into player_stats
values(1702330, 62, '100,000 .. 200,000', 1042, 242, 2680);
insert into player_stats
values(1587130, 61, '200,000 .. 500,000', 841, 258, 1085);
insert into player_stats
values(1590910, 61, '500,000 .. 1,000,000', 283, 74, 319);
insert into player_stats
values(900040, 61, '200,000 .. 500,000', 1574, 546, 8194);
insert into player_stats
values(1944430, 61, '200,000 .. 500,000', 359, 177, 1520);
insert into player_stats
values(774181, 60, '500,000 .. 1,000,000', 457, null, null);
insert into player_stats
values(1276760, 60, '200,000 .. 500,000', 340, 876, 4054);
insert into player_stats
values(1608070, 59, '500,000 .. 1,000,000', 788, 414, 8043);
insert into player_stats
values(1580240, 59, '200,000 .. 500,000', 930, 230, 1261);
insert into player_stats
values(1602010, 59, '200,000 .. 500,000', 774, 142, 5628);
insert into player_stats
values(1040230, 58, '500,000 .. 1,000,000', 1433, 336, 3043);
insert into player_stats
values(1374840, 58, '200,000 .. 500,000', 752, 194, 2037);
insert into player_stats
values(775500, 58, '1,000,000 .. 2,000,000', 825, 824, 14479);
insert into player_stats
values(758870, 57, '100,000 .. 200,000', 894, 140, 2248);
insert into player_stats
values(978300, 57, '50,000 .. 100,000', 612, 199, 1542);
insert into player_stats
values(2603020, 57, '50,000 .. 100,000', 299, 63, 831);
insert into player_stats
values(1274600, 56, '100,000 .. 200,000', 733, 119, 2056);
insert into player_stats
values(1939970, 56, '500,000 .. 1,000,000', 374, 128, 1119);
insert into player_stats
values(2008920, 56, '100,000 .. 200,000', 852, 134, 559);
insert into player_stats
values(1307710, 56, '100,000 .. 200,000', 943, 209, 455);
insert into player_stats
values(1237980, 55, '1,000,000 .. 2,000,000', 232, 115, 594);
insert into player_stats
values(1818750, 55, '5,000,000 .. 10,000,000', 675, 84, 153044);
insert into player_stats
values(1874490, 55, '500,000 .. 1,000,000', 1898, 150, 4570);
insert into player_stats
values(1024650, 54, '20,000 .. 50,000', 1593, 360, 1107);
insert into player_stats
values(918570, 54, '2,000,000 .. 5,000,000', 308, 366, 12222);
insert into player_stats
values(894020, 54, '500,000 .. 1,000,000', 622, 425, 3740);
insert into player_stats
values(969990, 52, '1,000,000 .. 2,000,000', 462, 378, 5058);
insert into player_stats
values(1358700, 52, '100,000 .. 200,000', 959, 359, 2512);
insert into player_stats
values(1796220, 51, '100,000 .. 200,000', 576, 76, 631);
insert into player_stats
values(1677770, 51, '500,000 .. 1,000,000', 591, 236, 587);
insert into player_stats
values(874260, 51, '500,000 .. 1,000,000', 373, 97, 585);
insert into player_stats
values(1434950, 51, '500,000 .. 1,000,000', 1038, 175, 1683);
insert into player_stats
values(936790, 51, '500,000 .. 1,000,000', 895, 197, 7428);
insert into player_stats
values(1515210, 51, '1,000,000 .. 2,000,000', 162, 703, 11533);
insert into player_stats
values(1202200, 50, '100,000 .. 200,000', 443, 266, 1506);
insert into player_stats
values(1361510, 50, '200,000 .. 500,000', 425, 232, 8700);
insert into player_stats
values(604540, 50, '200,000 .. 500,000', 833, 675, 7728);
insert into player_stats
values(2634890, 50, '50,000 .. 100,000', 719, 146, 2019);
insert into player_stats
values(1712350, 50, '100,000 .. 200,000', 538, 75, 1659);
insert into player_stats
values(907650, 49, '200,000 .. 500,000', 1099, 296, 4122);
insert into player_stats
values(1760250, 49, '200,000 .. 500,000', 2709, 1594, 6024);
insert into player_stats
values(893850, 49, '200,000 .. 500,000', 2569, 229, 1051);
insert into player_stats
values(1668510, 49, '20,000 .. 50,000', 2533, 123, 794);
insert into player_stats
values(1227530, 49, '500,000 .. 1,000,000', 569, 710, 3051);
insert into player_stats
values(981430, 48, '200,000 .. 500,000', 1578, 212, 1883);
insert into player_stats
values(897450, 48, '200,000 .. 500,000', 453, 674, 3518);
insert into player_stats
values(2380050, 48, '200,000 .. 500,000', 589, 363, 4009);
insert into player_stats
values(1623070, 48, '50,000 .. 100,000', 471, 135, 732);
insert into player_stats
values(977880, 48, '500,000 .. 1,000,000', 753, 284, 12296);
insert into player_stats
values(1422440, 47, '200,000 .. 500,000', 345, 159, 3129);
insert into player_stats
values(1480560, 47, '100,000 .. 200,000', 634, 222, 2053);
insert into player_stats
values(2272250, 47, '20,000 .. 50,000', 257, 49, 292);
insert into player_stats
values(1276790, 46, '500,000 .. 1,000,000', 884, 490, 16297);
insert into player_stats
values(1225570, 46, '500,000 .. 1,000,000', 224, 190, 933);
insert into player_stats
values(1544020, 46, '1,000,000 .. 2,000,000', 793, 767, 15556);
insert into player_stats
values(2067050, 46, '100,000 .. 200,000', 193, 96, 2114);
insert into player_stats
values(1599660, 46, '100,000 .. 200,000', 457, 229, 729);
insert into player_stats
values(1061910, 45, '1,000,000 .. 2,000,000', 232, 184, 2682);
insert into player_stats
values(1069160, 44, '500,000 .. 1,000,000', 492, 69, 1321);
insert into player_stats
values(2638370, 44, '200,000 .. 500,000', 369, 66, 5690);
insert into player_stats
values(1184050, 44, '200,000 .. 500,000', 869, 410, 6401);
insert into player_stats
values(1178830, 44, '1,000,000 .. 2,000,000', 207, 439, 13637);
insert into player_stats
values(550320, 44, '50,000 .. 100,000', 309, 84, 421);
insert into player_stats
values(1030210, 44, '500,000 .. 1,000,000', 729, 840, 3849);
insert into player_stats
values(1281590, 44, '500,000 .. 1,000,000', 390, 339, 4573);
insert into player_stats
values(2021880, 44, '20,000 .. 50,000', 4415, 395, 3449);
insert into player_stats
values(2527390, 44, '100,000 .. 200,000', 501, 66, 4979);
insert into player_stats
values(953490, 44, '1,000,000 .. 2,000,000', 246, 339, 3730);
insert into player_stats
values(1954200, 43, '1,000,000 .. 2,000,000', 451, 344, 2618);
insert into player_stats
values(1076200, 43, '200,000 .. 500,000', 1135, 204, 2517);
insert into player_stats
values(1794960, 43, '500,000 .. 1,000,000', 682, 262, 2648);
insert into player_stats
values(1716120, 43, '20,000 .. 50,000', 941, 72, 1293);
insert into player_stats
values(1268590, 42, '100,000 .. 200,000', 1215, 158, 5907);
insert into player_stats
values(2356560, 42, '20,000 .. 50,000', 1174, 193, 1977);
insert into player_stats
values(1436700, 42, '200,000 .. 500,000', 900, 275, 1554);
insert into player_stats
values(1262600, 42, '1,000,000 .. 2,000,000', 597, 193, 415);
insert into player_stats
values(1446650, 42, '50,000 .. 100,000', 1851, 207, 2169);
insert into player_stats
values(1386780, 42, '100,000 .. 200,000', 1164, 227, 968);
insert into player_stats
values(1755910, 42, '1,000,000 .. 2,000,000', 312, 37, 458580);
insert into player_stats
values(1668540, 42, '20,000 .. 50,000', 2364, 184, 2257);
insert into player_stats
values(1556200, 42, '200,000 .. 500,000', 1354, 160, 1491);
insert into player_stats
values(2637990, 41, '100,000 .. 200,000', 123, 147, 415);
insert into player_stats
values(1771980, 41, '500,000 .. 1,000,000', 296, 64, 1122);
insert into player_stats
values(1582650, 40, '200,000 .. 500,000', 336, 89, 748);
insert into player_stats
values(1136370, 40, '200,000 .. 500,000', 548, 160, 2983);
insert into player_stats
values(1668520, 40, '20,000 .. 50,000', 2192, 95, 884);
insert into player_stats
values(1272160, 40, '200,000 .. 500,000', 715, 194, 1544);
insert into player_stats
values(1340480, 40, '200,000 .. 500,000', 471, 88, 685);
insert into player_stats
values(1170080, 40, '100,000 .. 200,000', 542, 112, 609);
insert into player_stats
values(1552350, 39, '200,000 .. 500,000', 381, 515, 4635);
insert into player_stats
values(1233570, 39, '500,000 .. 1,000,000', 1554, 322, 1427);
insert into player_stats
values(988910, 39, '100,000 .. 200,000', 1209, 258, 680);
insert into player_stats
values(1205520, 39, '200,000 .. 500,000', 828, 190, 1250);
insert into player_stats
values(1283410, 39, '200,000 .. 500,000', 531, 244, 1537);
insert into player_stats
values(750130, 38, '200,000 .. 500,000', 462, 208, 958);
insert into player_stats
values(1567020, 38, '200,000 .. 500,000', 439, 190, 3596);
insert into player_stats
values(2071500, 38, '100,000 .. 200,000', 1159, 101, 7662);
insert into player_stats
values(1194630, 38, '200,000 .. 500,000', 378, 534, 4978);
insert into player_stats
values(956030, 38, '200,000 .. 500,000', 379, 57, 361);
insert into player_stats
values(1937780, 38, '200,000 .. 500,000', 998, 184, 4858);
insert into player_stats
values(1675830, 37, '200,000 .. 500,000', 353, 153, 278);
insert into player_stats
values(738520, 37, '1,000,000 .. 2,000,000', 654, 147, 6800);
insert into player_stats
values(1939160, 37, '200,000 .. 500,000', 982, 141, 3074);
insert into player_stats
values(1356670, 37, '200,000 .. 500,000', 1273, 389, 6953);
insert into player_stats
values(1967430, 37, '100,000 .. 200,000', 617, 122, 1459);
insert into player_stats
values(1395030, 37, '100,000 .. 200,000', 402, 16, 175);
insert into player_stats
values(597820, 37, '1,000,000 .. 2,000,000', 922, 681, 36397);
insert into player_stats
values(2741560, 37, '100,000 .. 200,000', 35, 108, 516);
insert into player_stats
values(895620, 36, '200,000 .. 500,000', 823, 348, 2179);
insert into player_stats
values(1578650, 36, '500,000 .. 1,000,000', 329, 196, 698);
insert into player_stats
values(1812090, 36, '50,000 .. 100,000', 328, 124, 247);
insert into player_stats
values(1140270, 36, '200,000 .. 500,000', 394, 307, 1153);
insert into player_stats
values(466630, 36, '200,000 .. 500,000', 173, 88, 160);
insert into player_stats
values(2012510, 36, '1,000,000 .. 2,000,000', 158, 412, 4456);
insert into player_stats
values(1115690, 36, '500,000 .. 1,000,000', 314, 194, 2628);
insert into player_stats
values(1355090, 35, '50,000 .. 100,000', 421, 104, 892);
insert into player_stats
values(1123050, 35, '200,000 .. 500,000', 641, 57, 1983);
insert into player_stats
values(1874000, 34, '100,000 .. 200,000', 801, 115, 8505);
insert into player_stats
values(1282150, 34, '200,000 .. 500,000', 312, 75, 1334);
insert into player_stats
values(2370170, 34, '0 .. 20,000', 1809, 87, 190);
insert into player_stats
values(2510710, 34, '100,000 .. 200,000', 1396, 40, 1567);
insert into player_stats
values(1240210, 34, '500,000 .. 1,000,000', 380, 535, 1327);
insert into player_stats
values(1147550, 33, '1,000,000 .. 2,000,000', 513, 303, 848);
insert into player_stats
values(2446550, 33, '500,000 .. 1,000,000', 346, 49, 6772);
insert into player_stats
values(2111190, 33, '200,000 .. 500,000', 252, 94, 784);
insert into player_stats
values(2238900, 33, '100,000 .. 200,000', 1918, 207, 8019);
insert into player_stats
values(1137300, 33, '200,000 .. 500,000', 581, 172, 1271);
insert into player_stats
values(2445990, 33, '20,000 .. 50,000', 991, 82, 673);
insert into player_stats
values(1291340, 33, '1,000,000 .. 2,000,000', 191, 330, 1162);
insert into player_stats
values(690040, 32, '1,000,000 .. 2,000,000', 299, 110, 3718);
insert into player_stats
values(1570010, 32, '200,000 .. 500,000', 299, 153, 706);
insert into player_stats
values(1354830, 32, '100,000 .. 200,000', 420, 95, 570);
insert into player_stats
values(1840080, 32, '500,000 .. 1,000,000', 539, 90, 4315);
insert into player_stats
values(998740, 32, '200,000 .. 500,000', 1296, 235, 1233);
insert into player_stats
values(1222370, 32, '500,000 .. 1,000,000', 408, 262, 5452);
insert into player_stats
values(1004750, 32, '200,000 .. 500,000', 218, 73, 678);
insert into player_stats
values(1451810, 32, '50,000 .. 100,000', 325, 127, 1004);
insert into player_stats
values(2230650, 32, '100,000 .. 200,000', 1326, 223, 5378);
insert into player_stats
values(1622910, 31, '200,000 .. 500,000', 300, 401, 729);
insert into player_stats
values(1622900, 31, '200,000 .. 500,000', 1135, 108, 4752);
insert into player_stats
values(1238880, 31, '200,000 .. 500,000', 521, 89, 282);
insert into player_stats
values(1766740, 31, '500,000 .. 1,000,000', 203, 313, 4033);
insert into player_stats
values(1100410, 31, '200,000 .. 500,000', 977, 97, 810);
insert into player_stats
values(2195410, 31, '100,000 .. 200,000', 552, 247, 1406);
insert into player_stats
values(2111170, 31, '0 .. 20,000', 1075, 118, 1528);
insert into player_stats
values(1590760, 30, '200,000 .. 500,000', 540, 40, 944);
insert into player_stats
values(1816300, 30, '50,000 .. 100,000', 1227, 170, 3354);
insert into player_stats
values(1072500, 30, '100,000 .. 200,000', 301, 86, 427);
insert into player_stats
values(1271100, 30, '0 .. 20,000', 463, 10, 103);
insert into player_stats
values(924980, 30, '200,000 .. 500,000', 1560, 442, 6794);
insert into player_stats
values(1335790, 30, '500,000 .. 1,000,000', 291, 364, 1066);
insert into player_stats
values(1540210, 30, '20,000 .. 50,000', 354, null, null);
insert into player_stats
values(1998340, 30, '20,000 .. 50,000', 5766, 70, 859);
insert into player_stats
values(424370, 30, '1,000,000 .. 2,000,000', 2198, 1658, 127542);
insert into player_stats
values(1585220, 29, '200,000 .. 500,000', 228, 141, 322);
insert into player_stats
values(1644940, 29, '100,000 .. 200,000', 568, 118, 368);
insert into player_stats
values(1135300, 29, '200,000 .. 500,000', 971, 172, 5919);
insert into player_stats
values(1792250, 29, '500,000 .. 1,000,000', 277, 131, 1505);
insert into player_stats
values(1283400, 29, '200,000 .. 500,000', 537, 130, 2799);
insert into player_stats
values(1287840, 29, '200,000 .. 500,000', 651, 307, 2539);
insert into player_stats
values(824600, 28, '200,000 .. 500,000', 318, 37, 438);
insert into player_stats
values(2305840, 28, '100,000 .. 200,000', 420, 299, 2396);
insert into player_stats
values(2878600, 28, '200,000 .. 500,000', 401, 154, 3977);
insert into player_stats
values(921800, 28, '200,000 .. 500,000', 945, 356, 3743);
insert into player_stats
values(1029210, 28, '100,000 .. 200,000', 1278, 132, 749);
insert into player_stats
values(2490990, 28, '100,000 .. 200,000', 2630, 99, 6947);
insert into player_stats
values(751630, 28, '100,000 .. 200,000', 764, 191, 872);
insert into player_stats
values(1266700, 27, '100,000 .. 200,000', 460, 94, 2866);
insert into player_stats
values(1328350, 27, '200,000 .. 500,000', 446, 63, 644);
insert into player_stats
values(798490, 27, '200,000 .. 500,000', 345, 378, 1664);
insert into player_stats
values(553540, 27, '200,000 .. 500,000', 1061, 151, 5607);
insert into player_stats
values(2085000, 27, '0 .. 20,000', 75, 78, 1689);
insert into player_stats
values(1432050, 27, '200,000 .. 500,000', 703, 575, 3489);
insert into player_stats
values(1133760, 27, '100,000 .. 200,000', 441, 159, 2200);
insert into player_stats
values(850320, 27, '20,000 .. 50,000', 109, 27, 483);
insert into player_stats
values(1619520, 26, '100,000 .. 200,000', 1375, 82, 1356);
insert into player_stats
values(651670, 26, '200,000 .. 500,000', 490, 100, 1772);
insert into player_stats
values(2379390, 26, '200,000 .. 500,000', 307, 210, 2338);
insert into player_stats
values(2223840, 26, '100,000 .. 200,000', 235, 85, 1952);
insert into player_stats
values(1392960, 26, '50,000 .. 100,000', 1224, 164, 1110);
insert into player_stats
values(916840, 26, '500,000 .. 1,000,000', 358, 251, 1366);
insert into player_stats
values(2021210, 26, '0 .. 20,000', 2024, 37, 562);
insert into player_stats
values(2719200, 26, '0 .. 20,000', 462, 85, 304);
insert into player_stats
values(1097200, 26, '500,000 .. 1,000,000', 321, 62, 4996);
insert into player_stats
values(1167750, 26, '100,000 .. 200,000', 253, 99, 690);
insert into player_stats
values(958400, 26, '200,000 .. 500,000', 1747, 240, 704);
insert into player_stats
values(1938010, 26, '200,000 .. 500,000', 1700, 226, 28475);
insert into player_stats
values(1977170, 25, '200,000 .. 500,000', 321, 133, 350);
insert into player_stats
values(1898290, 25, '100,000 .. 200,000', 216, 71, 1271);
insert into player_stats
values(1999770, 25, '100,000 .. 200,000', 1995, 272, 7118);
insert into player_stats
values(1956040, 25, '100,000 .. 200,000', 512, 71, 1712);
insert into player_stats
values(2366980, 25, '200,000 .. 500,000', 179, 109, 655);
insert into player_stats
values(1419160, 25, '200,000 .. 500,000', 1188, 51, 1400);
insert into player_stats
values(2481020, 25, '20,000 .. 50,000', 382, 39, 92);
insert into player_stats
values(1522160, 25, '50,000 .. 100,000', 465, 77, 726);
insert into player_stats
values(1610440, 25, '200,000 .. 500,000', 628, 208, 565);
insert into player_stats
values(964800, 25, '200,000 .. 500,000', 322, 81, 716);
insert into player_stats
values(1097130, 25, '200,000 .. 500,000', 428, 64, 381);
insert into player_stats
values(1903620, 25, '500,000 .. 1,000,000', 302, 128, 337);
insert into player_stats
values(1978590, 25, '50,000 .. 100,000', 138, 93, 1072);
insert into player_stats
values(914800, 24, '200,000 .. 500,000', 335, 218, 673);
insert into player_stats
values(1138660, 24, '200,000 .. 500,000', 813, 175, 1817);
insert into player_stats
values(1634860, 24, '200,000 .. 500,000', 583, 206, 1340);
insert into player_stats
values(1574240, 24, '200,000 .. 500,000', 991, 108, 1121);
insert into player_stats
values(1920480, 24, '50,000 .. 100,000', 784, 85, 826);
insert into player_stats
values(1196470, 24, '200,000 .. 500,000', 2044, 418, 3822);
insert into player_stats
values(465200, 24, '20,000 .. 50,000', 178, 98, 497);
insert into player_stats
values(594330, 24, '200,000 .. 500,000', 262, 279, 1164);
insert into player_stats
values(1286350, 24, '500,000 .. 1,000,000', 399, 204, 1540);
insert into player_stats
values(1203710, 24, '200,000 .. 500,000', 340, 50, 432);
insert into player_stats
values(1289380, 24, '200,000 .. 500,000', 1408, 118, 2141);
insert into player_stats
values(2243710, 24, '0 .. 20,000', 1111, 89, 362);
insert into player_stats
values(2386310, 24, '50,000 .. 100,000', 162, 35, 272);
insert into player_stats
values(1038250, 24, '200,000 .. 500,000', 388, 162, 1200);
insert into player_stats
values(1037020, 24, '200,000 .. 500,000', 235, 31, 814);
insert into player_stats
values(2102450, 24, '50,000 .. 100,000', 972, 98, 764);
insert into player_stats
values(1449200, 23, '200,000 .. 500,000', 1187, 103, 2815);
insert into player_stats
values(1082430, 23, '200,000 .. 500,000', 125, 52, 491);
insert into player_stats
values(913740, 23, '200,000 .. 500,000', 412, 124, 2621);
insert into player_stats
values(2229560, 23, '50,000 .. 100,000', 428, 22, 352);
insert into player_stats
values(1580520, 23, '200,000 .. 500,000', 917, 292, 1487);
insert into player_stats
values(1205450, 23, '200,000 .. 500,000', 225, 150, 354);
insert into player_stats
values(768520, 22, '200,000 .. 500,000', 1724, 250, 3812);
insert into player_stats
values(803330, 22, '1,000,000 .. 2,000,000', 433, 790, 6279);
insert into player_stats
values(1343240, 22, '500,000 .. 1,000,000', 370, 124, 3194);
insert into player_stats
values(1981570, 22, '50,000 .. 100,000', 480, 133, 1125);
insert into player_stats
values(1042490, 22, '100,000 .. 200,000', 224, 85, 191);
insert into player_stats
values(1167450, 22, '200,000 .. 500,000', 552, 147, 9186);
insert into player_stats
values(731040, 22, '500,000 .. 1,000,000', 700, 137, 1207);
insert into player_stats
values(814000, 22, '100,000 .. 200,000', 412, 198, 7466);
insert into player_stats
values(960690, 22, '200,000 .. 500,000', 536, 281, 2360);
insert into player_stats
values(1876590, 22, '100,000 .. 200,000', 390, 55, 309);
insert into player_stats
values(1368030, 22, '200,000 .. 500,000', 416, 96, 2752);
insert into player_stats
values(1368870, 22, '20,000 .. 50,000', 753, 82, 537);
insert into player_stats
values(1082180, 22, '100,000 .. 200,000', 389, 83, 250);
insert into player_stats
values(1462570, 22, '200,000 .. 500,000', 527, 141, 505);
insert into player_stats
values(1496590, 21, '50,000 .. 100,000', 369, 29, 104);
insert into player_stats
values(1271700, 21, '200,000 .. 500,000', 465, 363, 2230);
insert into player_stats
values(707030, 21, '500,000 .. 1,000,000', 407, 78, 806);
insert into player_stats
values(1904860, 21, '200,000 .. 500,000', 617, 82, 1492);
insert into player_stats
values(2215260, 21, '200,000 .. 500,000', 286, 219, 486);
insert into player_stats
values(1519090, 21, '100,000 .. 200,000', 1599, 59, 2887);
insert into player_stats
values(2216830, 21, '20,000 .. 50,000', 175, 227, 1283);
insert into player_stats
values(1310410, 21, '100,000 .. 200,000', 415, 124, 1391);
insert into player_stats
values(1517970, 20, '100,000 .. 200,000', 373, 53, 128);
insert into player_stats
values(2060130, 20, '500,000 .. 1,000,000', 532, 207, 10536);
insert into player_stats
values(841190, 20, '100,000 .. 200,000', 266, 80, 1150);
insert into player_stats
values(1239520, 20, '200,000 .. 500,000', 5696, 984, 3221);
insert into player_stats
values(698670, 20, '1,000,000 .. 2,000,000', 278, 97, 5387);
insert into player_stats
values(1179210, 20, '100,000 .. 200,000', 626, 248, 472);
insert into player_stats
values(811320, 20, '50,000 .. 100,000', 291, 74, 655);
insert into player_stats
values(2134770, 20, '100,000 .. 200,000', 555, 186, 2615);
insert into player_stats
values(1685750, 20, '100,000 .. 200,000', 137, 68, 537);
insert into player_stats
values(1282410, 20, '200,000 .. 500,000', 770, 63, 3038);
insert into player_stats
values(2076140, 20, '20,000 .. 50,000', 473, 50, 564);
insert into player_stats
values(2739830, 20, '50,000 .. 100,000', 652, 46, 840);
insert into player_stats
values(1158370, 19, '100,000 .. 200,000', 507, 225, 1785);
insert into player_stats
values(1155970, 19, '100,000 .. 200,000', 260, 171, 599);
insert into player_stats
values(871980, 19, '100,000 .. 200,000', 1099, 110, 6179);
insert into player_stats
values(1073910, 19, '100,000 .. 200,000', 294, 137, 2290);
insert into player_stats
values(1138850, 19, '200,000 .. 500,000', 263, 64, 442);
insert into player_stats
values(628670, 19, '200,000 .. 500,000', 522, 153, 1862);
insert into player_stats
values(1229380, 19, '200,000 .. 500,000', 425, 220, 799);
insert into player_stats
values(1731070, 19, '100,000 .. 200,000', 587, 159, 1665);
insert into player_stats
values(2233120, 18, '50,000 .. 100,000', 300, 70, 1066);
insert into player_stats
values(1425350, 18, '50,000 .. 100,000', 147, 29, 160);
insert into player_stats
values(1058450, 18, '100,000 .. 200,000', 802, 107, 666);
insert into player_stats
values(1357860, 18, '20,000 .. 50,000', 535, 75, 407);
insert into player_stats
values(1622350, 18, '100,000 .. 200,000', 123, 38, 439);
insert into player_stats
values(1749750, 18, '20,000 .. 50,000', 1801, 45, 629);
insert into player_stats
values(757310, 18, '200,000 .. 500,000', 458, 196, 755);
insert into player_stats
values(1885110, 18, '100,000 .. 200,000', 333, 49, 394);
insert into player_stats
values(2420660, 18, '100,000 .. 200,000', 181, 90, 815);
insert into player_stats
values(1306630, 18, '100,000 .. 200,000', 837, 121, 1139);
insert into player_stats
values(1621310, 18, '50,000 .. 100,000', 1987, 271, 3604);
insert into player_stats
values(1402120, 18, '100,000 .. 200,000', 186, 48, 301);
insert into player_stats
values(1153640, 18, '200,000 .. 500,000', 462, 134, 947);
insert into player_stats
values(1213700, 18, '200,000 .. 500,000', 161, 53, 947);
insert into player_stats
values(1472660, 18, '100,000 .. 200,000', 1349, 142, 1329);
insert into player_stats
values(473950, 18, '200,000 .. 500,000', 190, 50, 324);
insert into player_stats
values(1931010, 18, '20,000 .. 50,000', 585, 55, 603);
insert into player_stats
values(1859470, 17, '50,000 .. 100,000', 271, 25, 315);
insert into player_stats
values(1406850, 17, '200,000 .. 500,000', 641, 85, 594);
insert into player_stats
values(2292260, 17, '20,000 .. 50,000', 282, 39, 374);
insert into player_stats
values(1844380, 17, '50,000 .. 100,000', 204, 48, 1556);
insert into player_stats
values(2014550, 17, '20,000 .. 50,000', 362, 37, 253);
insert into player_stats
values(2461850, 17, '100,000 .. 200,000', 455, 76, 3892);
insert into player_stats
values(1195290, 17, '100,000 .. 200,000', 151, 116, 1942);
insert into player_stats
values(1663220, 17, '100,000 .. 200,000', 362, 50, 592);
insert into player_stats
values(1649010, 17, '100,000 .. 200,000', 1081, 159, 1369);
insert into player_stats
values(1367590, 17, '500,000 .. 1,000,000', 242, 55, 550);
insert into player_stats
values(957960, 16, '20,000 .. 50,000', 160, 49, 229);
insert into player_stats
values(1416050, 16, '20,000 .. 50,000', 544, 24, 610);
insert into player_stats
values(1249040, 16, '200,000 .. 500,000', 422, 40, 258);
insert into player_stats
values(1347780, 16, '100,000 .. 200,000', 145, 20, 187);
insert into player_stats
values(1154810, 16, '200,000 .. 500,000', 622, 105, 560);
insert into player_stats
values(1118240, 16, '200,000 .. 500,000', 735, 124, 815);
insert into player_stats
values(1087760, 16, '100,000 .. 200,000', 257, 30, 514);
insert into player_stats
values(1046400, 16, '50,000 .. 100,000', 989, 30, 244);
insert into player_stats
values(1832040, 16, '20,000 .. 50,000', 658, 60, 541);
insert into player_stats
values(566440, 15, '200,000 .. 500,000', 434, 63, 3375);
insert into player_stats
values(978520, 15, '50,000 .. 100,000', 757, 414, 3116);
insert into player_stats
values(746850, 15, '500,000 .. 1,000,000', 311, 355, 914);
insert into player_stats
values(1777620, 15, '100,000 .. 200,000', 918, 64, 5685);
insert into player_stats
values(1840800, 15, '20,000 .. 50,000', 794, 61, 352);
insert into player_stats
values(1119980, 15, '500,000 .. 1,000,000', 446, 101, 399);
insert into player_stats
values(787810, 15, '200,000 .. 500,000', 612, 266, 1616);
insert into player_stats
values(1608640, 15, '200,000 .. 500,000', 575, 83, 245);
insert into player_stats
values(1013140, 15, '20,000 .. 50,000', 764, 71, 1114);
insert into player_stats
values(1328840, 15, '200,000 .. 500,000', 296, 305, 507);
insert into player_stats
values(1730590, 15, '500,000 .. 1,000,000', 368, 61, 594);
insert into player_stats
values(1497440, 15, '200,000 .. 500,000', 212, 58, 392);
insert into player_stats
values(1337010, 15, '100,000 .. 200,000', 172, 37, 216);
insert into player_stats
values(1286990, 15, '200,000 .. 500,000', 402, 87, 398);
insert into player_stats
values(1388870, 15, '50,000 .. 100,000', 601, 167, 508);
insert into player_stats
values(999220, 15, '1,000,000 .. 2,000,000', 471, 174, 2811);
insert into player_stats
values(1449280, 15, '200,000 .. 500,000', 250, 99, 200);
insert into player_stats
values(1849900, 15, '100,000 .. 200,000', 347, 60, 779);
insert into player_stats
values(2051120, 14, '0 .. 20,000', 482, 125, 296);
insert into player_stats
values(1089830, 14, '50,000 .. 100,000', 6734, 185, 392);
insert into player_stats
values(1295270, 14, '20,000 .. 50,000', 19, 74, 2551);
insert into player_stats
values(2731870, 14, '0 .. 20,000', 1730, 36, 1135);
insert into player_stats
values(1324340, 14, '50,000 .. 100,000', 432, 78, 2039);
insert into player_stats
values(1979440, 14, '20,000 .. 50,000', 374, 79, 1350);
insert into player_stats
values(785790, 14, '200,000 .. 500,000', 622, 52, 605);
insert into player_stats
values(1062830, 14, '100,000 .. 200,000', 192, 63, 636);
insert into player_stats
values(1456760, 14, '20,000 .. 50,000', 381, 45, 468);
insert into player_stats
values(1641700, 14, '20,000 .. 50,000', 195, 124, 307);
insert into player_stats
values(1599020, 14, '200,000 .. 500,000', 493, 32, 262);
insert into player_stats
values(1893810, 14, '100,000 .. 200,000', 1078, 123, 1108);
insert into player_stats
values(1341820, 14, '200,000 .. 500,000', 352, 60, 293);
insert into player_stats
values(1101190, 14, '100,000 .. 200,000', 1436, 374, 2839);
insert into player_stats
values(1209490, 14, '200,000 .. 500,000', 319, 56, 674);
insert into player_stats
values(1201270, 14, '200,000 .. 500,000', 505, 77, 334);
insert into player_stats
values(996770, 14, '200,000 .. 500,000', 262, 191, 611);
insert into player_stats
values(1000010, 14, '500,000 .. 1,000,000', 1137, 175, 6590);
insert into player_stats
values(1009290, 14, '200,000 .. 500,000', 1993, 397, 8493);
insert into player_stats
values(1155330, 14, '100,000 .. 200,000', 650, 46, 530);
insert into player_stats
values(1493750, 14, '100,000 .. 200,000', 2420, 38, 568);
insert into player_stats
values(1134100, 14, '200,000 .. 500,000', 265, 142, 1001);
insert into player_stats
values(2803280, 13, '0 .. 20,000', 331, 296, 789);
insert into player_stats
values(2717880, 13, '50,000 .. 100,000', 597, 53, 547);
insert into player_stats
values(2379910, 13, '100,000 .. 200,000', 73, 156, 301);
insert into player_stats
values(1013220, 13, '20,000 .. 50,000', 98, 15, 430);
insert into player_stats
values(2254740, 13, '50,000 .. 100,000', 1339, 62, 2193);
insert into player_stats
values(1294810, 13, '100,000 .. 200,000', 279, 101, 1560);
insert into player_stats
values(1574260, 13, '50,000 .. 100,000', 517, 42, 1009);
insert into player_stats
values(1112890, 13, '100,000 .. 200,000', 589, 64, 399);
insert into player_stats
values(760650, 13, '200,000 .. 500,000', 2001, 98, 1039);
insert into player_stats
values(1602080, 13, '100,000 .. 200,000', 539, 24, 592);
insert into player_stats
values(1898500, 13, '20,000 .. 50,000', 372, 55, 105);
insert into player_stats
values(1286320, 13, '100,000 .. 200,000', 1412, 111, 4975);
insert into player_stats
values(1191630, 13, '100,000 .. 200,000', 465, 52, 752);
insert into player_stats
values(1812370, 13, '100,000 .. 200,000', 474, 97, 332);
insert into player_stats
values(1669420, 13, '100,000 .. 200,000', 583, 21, 149);
insert into player_stats
values(2394650, 12, '50,000 .. 100,000', 663, 99, 351);
insert into player_stats
values(1931730, 12, '200,000 .. 500,000', 223, 33, 174);
insert into player_stats
values(1069690, 12, '100,000 .. 200,000', 1093, 92, 2063);
insert into player_stats
values(1647550, 12, '0 .. 20,000', 644, 47, 251);
insert into player_stats
values(1627570, 12, '100,000 .. 200,000', 323, 152, 1231);
insert into player_stats
values(2081080, 12, '50,000 .. 100,000', 158, 15, 387);
insert into player_stats
values(2217580, 12, '50,000 .. 100,000', 189, 57, 196);
insert into player_stats
values(1182620, 12, '500,000 .. 1,000,000', 215, 58, 1089);
insert into player_stats
values(1680880, 12, '200,000 .. 500,000', 808, 188, 9824);
insert into player_stats
values(2017080, 12, '50,000 .. 100,000', 390, 41, 1578);
insert into player_stats
values(1532690, 12, '500,000 .. 1,000,000', 215, 56, 502);
insert into player_stats
values(1654660, 12, '200,000 .. 500,000', 169, 36, 424);
insert into player_stats
values(1413870, 12, '200,000 .. 500,000', 640, 21, 400);
insert into player_stats
values(1904790, 12, '50,000 .. 100,000', 1087, 111, 255);
insert into player_stats
values(1051690, 12, '200,000 .. 500,000', 810, 104, 1134);
insert into player_stats
values(515960, 12, '100,000 .. 200,000', 355, 30, 742);
insert into player_stats
values(1420290, 12, '200,000 .. 500,000', 779, 24, 352);
insert into player_stats
values(226620, 12, '200,000 .. 500,000', 265, 33, 2998);
insert into player_stats
values(2694420, 12, '100,000 .. 200,000', 253, 59, 458);
insert into player_stats
values(1414850, 12, '500,000 .. 1,000,000', 325, 50, 9120);
insert into player_stats
values(1437400, 12, '50,000 .. 100,000', 887, 95, 569);
insert into player_stats
values(1996430, 12, '50,000 .. 100,000', 910, 46, 1244);
insert into player_stats
values(1116580, 12, '50,000 .. 100,000', 258, 26, 247);
insert into player_stats
values(1670870, 12, '100,000 .. 200,000', 604, 45, 384);
insert into player_stats
values(1410640, 11, '200,000 .. 500,000', 602, 209, 865);
insert into player_stats
values(1402110, 11, '50,000 .. 100,000', 296, 28, 1238);
insert into player_stats
values(2287330, 11, '50,000 .. 100,000', 1037, 31, 1092);
insert into player_stats
values(1272840, 11, '20,000 .. 50,000', 263, 15, 214);
insert into player_stats
values(1345890, 11, '200,000 .. 500,000', 293, 53, 881);
insert into player_stats
values(2106840, 11, '200,000 .. 500,000', 396, 304, 712);
insert into player_stats
values(1040420, 11, '200,000 .. 500,000', 1076, 59, 1111);
insert into player_stats
values(1341200, 11, '50,000 .. 100,000', 1684, 224, 3104);
insert into player_stats
values(2085370, 11, '50,000 .. 100,000', 518, 43, 537);
insert into player_stats
values(1330470, 11, '500,000 .. 1,000,000', 855, 90, 4991);
insert into player_stats
values(2272400, 11, '100,000 .. 200,000', 115, 95, 405);
insert into player_stats
values(2494780, 11, '50,000 .. 100,000', 53, 13, 129);
insert into player_stats
values(919360, 11, '100,000 .. 200,000', 120, 20, 197);
insert into player_stats
values(1928870, 11, '200,000 .. 500,000', 468, 61, 5088);
insert into player_stats
values(1743850, 11, '200,000 .. 500,000', 73, 36, 346);
insert into player_stats
values(754890, 11, '50,000 .. 100,000', 284, 31, 796);
insert into player_stats
values(1676130, 11, '1,000,000 .. 2,000,000', 287, 114, 1907);
insert into player_stats
values(1380420, 11, '100,000 .. 200,000', 710, 94, 954);
insert into player_stats
values(1045720, 11, '50,000 .. 100,000', 358, 65, 241);
insert into player_stats
values(1436590, 11, '20,000 .. 50,000', 648, 75, 312);
insert into player_stats
values(983970, 11, '200,000 .. 500,000', 339, 105, 702);
insert into player_stats
values(1371720, 10, '20,000 .. 50,000', 254, 75, 875);
insert into player_stats
values(1206060, 10, '200,000 .. 500,000', 186, 25, 343);
insert into player_stats
values(1062140, 10, '100,000 .. 200,000', 77, 36, 344);
insert into player_stats
values(1552810, 10, '100,000 .. 200,000', 427, 28, 84);
insert into player_stats
values(1967260, 10, '50,000 .. 100,000', 906, 53, 298);
insert into player_stats
values(1949030, 10, '100,000 .. 200,000', 565, 88, 724);
insert into player_stats
values(1196090, 10, '200,000 .. 500,000', 211, 107, 215);
insert into player_stats
values(2009100, 10, '200,000 .. 500,000', 709, 67, 482);
insert into player_stats
values(1485590, 10, '200,000 .. 500,000', 759, 100, 7935);
insert into player_stats
values(1225560, 10, '200,000 .. 500,000', 237, 95, 327);
insert into player_stats
values(2213300, 10, '20,000 .. 50,000', 688, 84, 306);
insert into player_stats
values(981890, 10, '500,000 .. 1,000,000', 242, 28, 4022);
insert into player_stats
values(1299510, 10, '0 .. 20,000', 230, 44, 141);
insert into player_stats
values(1766100, 10, '50,000 .. 100,000', 920, 45, 567);
insert into player_stats
values(1497950, 9, '50,000 .. 100,000', 500, 43, 858);
insert into player_stats
values(1920780, 9, '200,000 .. 500,000', 251, 105, 763);
insert into player_stats
values(1996010, 9, '200,000 .. 500,000', 315, 81, 832);
insert into player_stats
values(1492680, 9, '50,000 .. 100,000', 304, 30, 114);
insert into player_stats
values(1975440, 9, '50,000 .. 100,000', 306, 31, 281);
insert into player_stats
values(1889740, 9, '0 .. 20,000', 314, 33, 118);
insert into player_stats
values(1038370, 9, '200,000 .. 500,000', 789, 108, 1743);
insert into player_stats
values(1123450, 9, '200,000 .. 500,000', 271, 73, 313);
insert into player_stats
values(1429850, 9, '20,000 .. 50,000', 280, 38, 265);
insert into player_stats
values(1282690, 9, '500,000 .. 1,000,000', 452, 240, 1387);
insert into player_stats
values(795420, 9, '0 .. 20,000', 319, 82, 205);
insert into player_stats
values(945770, 9, '50,000 .. 100,000', 501, 32, 408);
insert into player_stats
values(1110910, 9, '500,000 .. 1,000,000', 333, 377, 1930);
insert into player_stats
values(2653940, 9, '100,000 .. 200,000', 387, 136, 645);
insert into player_stats
values(1413660, 9, '0 .. 20,000', 277, 20, 194);
insert into player_stats
values(729000, 9, '200,000 .. 500,000', 354, 147, 337);
insert into player_stats
values(1591530, 9, '50,000 .. 100,000', 559, 103, 1838);
insert into player_stats
values(982290, 9, '200,000 .. 500,000', 478, 54, 1120);
insert into player_stats
values(674930, 9, '100,000 .. 200,000', 741, 117, 1083);
insert into player_stats
values(1242980, 9, '20,000 .. 50,000', 206, 44, 565);
insert into player_stats
values(1000410, 9, '200,000 .. 500,000', 708, 22, 504);
insert into player_stats
values(1799930, 9, '50,000 .. 100,000', 348, 36, 286);
insert into player_stats
values(1311510, 8, '0 .. 20,000', 182, 3, 10);
insert into player_stats
values(1158890, 8, '50,000 .. 100,000', 114, 4, 225);
insert into player_stats
values(2123640, 8, '50,000 .. 100,000', 332, 16, 386);
insert into player_stats
values(1190170, 8, '50,000 .. 100,000', 190, 108, 391);
insert into player_stats
values(1432100, 8, '200,000 .. 500,000', 380, 31, 307);
insert into player_stats
values(1108590, 8, '200,000 .. 500,000', 322, 83, 719);
insert into player_stats
values(1314000, 8, '100,000 .. 200,000', 377, 46, 453);
insert into player_stats
values(1553000, 8, '100,000 .. 200,000', 1254, 35, 1276);
insert into player_stats
values(1658290, 8, '100,000 .. 200,000', 843, 50, 1038);
insert into player_stats
values(2059660, 8, '20,000 .. 50,000', 96, 15, 128);
insert into player_stats
values(2398170, 8, '50,000 .. 100,000', 147, 77, 512);
insert into player_stats
values(2006140, 8, '20,000 .. 50,000', 107, 31, 296);
insert into player_stats
values(1924360, 8, '20,000 .. 50,000', 335, 45, 352);
insert into player_stats
values(1937620, 8, '0 .. 20,000', 1446, 79, 276);
insert into player_stats
values(2060590, 8, '0 .. 20,000', 484, 81, 201);
insert into player_stats
values(1157220, 8, '100,000 .. 200,000', 350, 148, 908);
insert into player_stats
values(2304640, 8, '0 .. 20,000', 175, 18, 113);
insert into player_stats
values(1608230, 8, '200,000 .. 500,000', 323, 70, 811);
insert into player_stats
values(824550, 8, '500,000 .. 1,000,000', 1334, 132, 21909);
insert into player_stats
values(1390410, 8, '100,000 .. 200,000', 490, 31, 765);
insert into player_stats
values(1783360, 8, '20,000 .. 50,000', 346, 17, 195);
insert into player_stats
values(720560, 8, '200,000 .. 500,000', 684, 173, 1146);
insert into player_stats
values(1194810, 8, '200,000 .. 500,000', 1505, 35, 2996);
insert into player_stats
values(2001340, 8, '0 .. 20,000', 0, 16, 139);
insert into player_stats
values(1285670, 8, '1,000,000 .. 2,000,000', 85, 30, 123);
insert into player_stats
values(1160220, 8, '500,000 .. 1,000,000', 664, 140, 291);
insert into player_stats
values(2014380, 8, '20,000 .. 50,000', 813, 82, 465);
insert into player_stats
values(826940, 8, '50,000 .. 100,000', 187, 68, 161);
insert into player_stats
values(1638230, 8, '50,000 .. 100,000', 864, 131, 762);
insert into player_stats
values(1135910, 7, '20,000 .. 50,000', 1387, 36, 402);
insert into player_stats
values(1182310, 7, '200,000 .. 500,000', 321, 28, 227);
insert into player_stats
values(1283230, 7, '20,000 .. 50,000', 167, 25, 371);
insert into player_stats
values(1373960, 7, '200,000 .. 500,000', 245, 58, 1105);
insert into player_stats
values(1108000, 7, '100,000 .. 200,000', 309, 60, 284);
insert into player_stats
values(1235100, 7, '0 .. 20,000', 223, 7, 65);
insert into player_stats
values(1231990, 7, '50,000 .. 100,000', 390, 30, 365);
insert into player_stats
values(1244950, 7, '100,000 .. 200,000', 291, 24, 551);
insert into player_stats
values(1046790, 7, '50,000 .. 100,000', 66, 25, 74);
insert into player_stats
values(1227780, 7, '100,000 .. 200,000', 851, 48, 629);
insert into player_stats
values(1137350, 7, '50,000 .. 100,000', 438, 19, 278);
insert into player_stats
values(1913210, 7, '20,000 .. 50,000', 349, 22, 1428);
insert into player_stats
values(1309950, 7, '100,000 .. 200,000', 122, 23, 218);
insert into player_stats
values(1279630, 7, '100,000 .. 200,000', 233, 23, 181);
insert into player_stats
values(1759380, 7, '50,000 .. 100,000', 676, 51, 1356);
insert into player_stats
values(1046300, 7, '20,000 .. 50,000', 847, 30, 249);
insert into player_stats
values(1037130, 7, '50,000 .. 100,000', 643, 89, 431);
insert into player_stats
values(1889930, 7, '0 .. 20,000', 314, 41, 623);
insert into player_stats
values(1867510, 7, '20,000 .. 50,000', 177, 34, 208);
insert into player_stats
values(1776380, 7, '100,000 .. 200,000', 1737, 104, 4420);
insert into player_stats
values(2378620, 7, '200,000 .. 500,000', 439, 49, 1110);
insert into player_stats
values(1574310, 6, '200,000 .. 500,000', 475, 22, 724);
insert into player_stats
values(1607240, 6, '50,000 .. 100,000', 119, 22, 270);
insert into player_stats
values(269190, 6, '200,000 .. 500,000', 249, 64, 731);
insert into player_stats
values(1454970, 6, '100,000 .. 200,000', 248, 31, 399);
insert into player_stats
values(2095340, 6, '100,000 .. 200,000', 99, 21, 345);
insert into player_stats
values(1660840, 6, '0 .. 20,000', 588, 35, 239);
insert into player_stats
values(1386900, 6, '200,000 .. 500,000', 246, 28, 181);
insert into player_stats
values(1747760, 6, '100,000 .. 200,000', 389, 65, 867);
insert into player_stats
values(1298140, 6, '100,000 .. 200,000', 532, 34, 289);
insert into player_stats
values(962580, 6, '200,000 .. 500,000', 984, 90, 989);
insert into player_stats
values(593150, 6, '100,000 .. 200,000', 956, 66, 1014);
insert into player_stats
values(1069530, 6, '0 .. 20,000', 1520, 13, 159);
insert into player_stats
values(1710540, 6, '20,000 .. 50,000', 770, 11, 139);
insert into player_stats
values(1866180, 6, '200,000 .. 500,000', 141, 38, 1188);
insert into player_stats
values(1839940, 6, '50,000 .. 100,000', 989, 38, 430);
insert into player_stats
values(1003090, 6, '50,000 .. 100,000', 296, 23, 301);
insert into player_stats
values(1221250, 6, '200,000 .. 500,000', 193, 46, 111);
insert into player_stats
values(1334730, 6, '100,000 .. 200,000', 162, 22, 146);
insert into player_stats
values(1491670, 6, '200,000 .. 500,000', 92, 17, 153);
insert into player_stats
values(1186640, 6, '500,000 .. 1,000,000', 242, 94, 585);
insert into player_stats
values(1257360, 6, '200,000 .. 500,000', 242, 27, 677);
insert into player_stats
values(1823930, 6, '50,000 .. 100,000', 248, 7, 317);
insert into player_stats
values(2366970, 6, '100,000 .. 200,000', 299, 88, 160);
insert into player_stats
values(1546310, 6, '20,000 .. 50,000', 415, 17, 89);
insert into player_stats
values(1634150, 6, '200,000 .. 500,000', 109, 25, 170);
insert into player_stats
values(1446350, 6, '0 .. 20,000', 243, 9, 90);
insert into player_stats
values(1299690, 6, '20,000 .. 50,000', 281, 19, 249);
insert into player_stats
values(2544110, 6, '100,000 .. 200,000', 492, 94, 502);
insert into player_stats
values(1233260, 6, '100,000 .. 200,000', 1120, 42, 1923);
insert into player_stats
values(1477940, 6, '20,000 .. 50,000', 156, 16, 276);
insert into player_stats
values(824000, 6, '100,000 .. 200,000', 511, 76, 560);
insert into player_stats
values(2097230, 6, '100,000 .. 200,000', 346, 27, 534);
insert into player_stats
values(1373430, 6, '0 .. 20,000', 354, 49, 616);
insert into player_stats
values(1122120, 6, '50,000 .. 100,000', 923, 46, 305);
insert into player_stats
values(865680, 6, '50,000 .. 100,000', 111, 41, 268);
insert into player_stats
values(1457080, 6, '200,000 .. 500,000', 680, 38, 2984);
insert into player_stats
values(2737300, 6, '20,000 .. 50,000', 187, 11, 103);
insert into player_stats
values(598550, 6, '20,000 .. 50,000', 258, 47, 319);
insert into player_stats
values(2313020, 6, '20,000 .. 50,000', 143, 80, 1445);
insert into player_stats
values(1140290, 6, '0 .. 20,000', 1579, 104, 651);
insert into player_stats
values(1296360, 5, '200,000 .. 500,000', 629, 52, 648);
insert into player_stats
values(1955230, 5, '50,000 .. 100,000', 266, 21, 228);
insert into player_stats
values(1577250, 5, '50,000 .. 100,000', 100, 20, 119);
insert into player_stats
values(1421490, 5, '20,000 .. 50,000', 70, 13, 156);
insert into player_stats
values(910830, 5, '100,000 .. 200,000', 775, 37, 246);
insert into player_stats
values(2633500, 5, '20,000 .. 50,000', 344, 16, 37);
insert into player_stats
values(1472930, 5, '0 .. 20,000', 342, 7, 80);
insert into player_stats
values(1229580, 5, '0 .. 20,000', 307, 19, 177);
insert into player_stats
values(1921480, 5, '0 .. 20,000', 0, 9, 165);
insert into player_stats
values(1538970, 5, '100,000 .. 200,000', 676, 77, 2915);
insert into player_stats
values(1173220, 5, '100,000 .. 200,000', 289, 26, 926);
insert into player_stats
values(1265780, 5, '100,000 .. 200,000', 205, 13, 502);
insert into player_stats
values(1843310, 5, '20,000 .. 50,000', 289, 22, 536);
insert into player_stats
values(866140, 5, '200,000 .. 500,000', 252, 16, 178);
insert into player_stats
values(1232460, 5, '50,000 .. 100,000', 136, 14, 164);
insert into player_stats
values(1057750, 5, '100,000 .. 200,000', 224, 87, 408);
insert into player_stats
values(2362090, 5, '20,000 .. 50,000', 46, 6, 35);
insert into player_stats
values(1658920, 5, '0 .. 20,000', 918, null, null);
insert into player_stats
values(2153350, 5, '100,000 .. 200,000', 137, 36, 285);
insert into player_stats
values(1186040, 5, '200,000 .. 500,000', 586, 49, 649);
insert into player_stats
values(1659600, 5, '20,000 .. 50,000', 138, 42, 370);
insert into player_stats
values(1361400, 5, '20,000 .. 50,000', 157, 11, 176);
insert into player_stats
values(2238040, 5, '20,000 .. 50,000', 265, 20, 133);
insert into player_stats
values(914750, 5, '100,000 .. 200,000', 2748, 21, 80);
insert into player_stats
values(906100, 5, '200,000 .. 500,000', 306, 78, 1027);
insert into player_stats
values(1331210, 5, '100,000 .. 200,000', 8297, 14, 147);
insert into player_stats
values(1370140, 5, '20,000 .. 50,000', 405, 34, 304);
insert into player_stats
values(2851150, 5, '20,000 .. 50,000', 863, 17, 280);
insert into player_stats
values(1324530, 5, '100,000 .. 200,000', 139, 87, 929);
insert into player_stats
values(1981610, 5, '200,000 .. 500,000', 273, 43, 260);
insert into player_stats
values(1872680, 5, '20,000 .. 50,000', 301, 20, 167);
insert into player_stats
values(1426010, 5, '100,000 .. 200,000', 1203, 41, 238);
insert into player_stats
values(2305500, 5, '20,000 .. 50,000', 417, 24, 1016);
insert into player_stats
values(994140, 5, '200,000 .. 500,000', 216, 34, 208);
insert into player_stats
values(1233590, 5, '100,000 .. 200,000', 200, 21, 1204);
insert into player_stats
values(2235020, 5, '50,000 .. 100,000', 70, 37, 242);
insert into player_stats
values(1919470, 4, '100,000 .. 200,000', 154, 13, 64);
insert into player_stats
values(1561340, 4, '0 .. 20,000', 164, 11, 61);
insert into player_stats
values(1036890, 4, '500,000 .. 1,000,000', 323, 79, 1621);
insert into player_stats
values(363860, 4, '20,000 .. 50,000', 226, 31, 142);
insert into player_stats
values(1543710, 4, '20,000 .. 50,000', 128, null, null);
insert into player_stats
values(1085220, 4, '20,000 .. 50,000', 222, 30, 62);
insert into player_stats
values(1962430, 4, '20,000 .. 50,000', 902, 19, 702);
insert into player_stats
values(1438480, 4, '0 .. 20,000', 0, 3, 29);
insert into player_stats
values(1259380, 4, '0 .. 20,000', 5, 12, 17);
insert into player_stats
values(720350, 4, '0 .. 20,000', 287, 13, 80);
insert into player_stats
values(1101360, 4, '100,000 .. 200,000', 262, 39, 129);
insert into player_stats
values(1214650, 4, '100,000 .. 200,000', 288, 59, 3731);
insert into player_stats
values(1121420, 4, '50,000 .. 100,000', 350, 26, 363);
insert into player_stats
values(1296450, 4, '0 .. 20,000', 611, 14, 181);
insert into player_stats
values(1521970, 4, '100,000 .. 200,000', 600, 18, 955);
insert into player_stats
values(1229460, 4, '100,000 .. 200,000', 369, 117, 940);
insert into player_stats
values(2076580, 4, '20,000 .. 50,000', 118, 14, 152);
insert into player_stats
values(541310, 4, '0 .. 20,000', 32, 6, 46);
insert into player_stats
values(854940, 4, '100,000 .. 200,000', 2807, 25, 232);
insert into player_stats
values(1726120, 4, '100,000 .. 200,000', 91, 10, 310);
insert into player_stats
values(878670, 4, '50,000 .. 100,000', 453, 25, 327);
insert into player_stats
values(1370050, 4, '200,000 .. 500,000', 137, 51, 831);
insert into player_stats
values(1730680, 4, '100,000 .. 200,000', 352, 28, 730);
insert into player_stats
values(1273560, 4, '0 .. 20,000', 167, 13, 130);
insert into player_stats
values(1333200, 4, '200,000 .. 500,000', 280, 75, 992);
insert into player_stats
values(1095120, 4, '0 .. 20,000', 743, 17, 42);
insert into player_stats
values(829280, 4, '20,000 .. 50,000', 98, 15, 128);
insert into player_stats
values(1484900, 4, '100,000 .. 200,000', 129, 11, 322);
insert into player_stats
values(2304440, 4, '0 .. 20,000', 270, 17, 145);
insert into player_stats
values(1167140, 4, '200,000 .. 500,000', 357, 126, 1340);
insert into player_stats
values(2596420, 4, '0 .. 20,000', 0, 9, 86);
insert into player_stats
values(1755100, 4, '0 .. 20,000', 179, 12, 61);
insert into player_stats
values(762840, 4, '100,000 .. 200,000', 86, 9, 164);
insert into player_stats
values(730430, 4, '0 .. 20,000', 330, 19, 121);
insert into player_stats
values(1269640, 4, '100,000 .. 200,000', 299, 33, 175);
insert into player_stats
values(1266030, 4, '50,000 .. 100,000', 289, 85, 500);
insert into player_stats
values(2206210, 4, '50,000 .. 100,000', 458, 23, 95);
insert into player_stats
values(1430220, 4, '20,000 .. 50,000', 221, 37, 302);
insert into player_stats
values(1409830, 4, '50,000 .. 100,000', 195, 23, 472);
insert into player_stats
values(1252830, 4, '0 .. 20,000', 159, 7, 42);
insert into player_stats
values(1921980, 4, '500,000 .. 1,000,000', 0, 9, 52);
insert into player_stats
values(924750, 4, '0 .. 20,000', 688, 22, 236);
insert into player_stats
values(609920, 4, '200,000 .. 500,000', 125, 22, 153);
insert into player_stats
values(1736290, 4, '50,000 .. 100,000', 164, 40, 131);
insert into player_stats
values(1336180, 4, '50,000 .. 100,000', 395, 58, 789);
insert into player_stats
values(2652000, 4, '20,000 .. 50,000', 84, 47, 414);
insert into player_stats
values(1042380, 4, '100,000 .. 200,000', 652, 91, 478);
insert into player_stats
values(1375400, 4, '50,000 .. 100,000', 185, 19, 257);
insert into player_stats
values(2139300, 4, '0 .. 20,000', 0, 12, 298);
insert into player_stats
values(1319460, 4, '20,000 .. 50,000', 195, 12, 123);
insert into player_stats
values(1119700, 4, '50,000 .. 100,000', 330, 117, 1499);
insert into player_stats
values(762940, 4, '0 .. 20,000', 567, 14, 196);
insert into player_stats
values(938560, 4, '200,000 .. 500,000', 184, 68, 421);
insert into player_stats
values(1144770, 4, '200,000 .. 500,000', 199, 16, 2695);
insert into player_stats
values(721180, 4, '0 .. 20,000', 0, 14, 76);
insert into player_stats
values(1661630, 4, '100,000 .. 200,000', 185, 96, 1085);
insert into player_stats
values(1135260, 4, '50,000 .. 100,000', 474, 6, 52);
insert into player_stats
values(1519710, 4, '0 .. 20,000', 71, 4, 46);
insert into player_stats
values(890720, 4, '100,000 .. 200,000', 284, 52, 123);
insert into player_stats
values(1982340, 4, '20,000 .. 50,000', 108, 22, 102);
insert into player_stats
values(2275150, 4, '100,000 .. 200,000', 164, 24, 113);
insert into player_stats
values(2138090, 4, '0 .. 20,000', 129, 33, 588);
insert into player_stats
values(898890, 4, '50,000 .. 100,000', 257, 20, 241);
insert into player_stats
values(1403440, 4, '50,000 .. 100,000', 420, 19, 555);
insert into player_stats
values(1351210, 4, '20,000 .. 50,000', 146, 28, 851);
insert into player_stats
values(1393370, 4, '20,000 .. 50,000', 424, 20, 977);
insert into player_stats
values(1084640, 4, '100,000 .. 200,000', 284, 41, 163);
insert into player_stats
values(1205900, 3, '20,000 .. 50,000', 160, 8, 51);
insert into player_stats
values(944920, 3, '50,000 .. 100,000', 141, 10, 66);
insert into player_stats
values(1580180, 3, '50,000 .. 100,000', 537, 21, 180);
insert into player_stats
values(1107790, 3, '100,000 .. 200,000', 151, 18, 294);
insert into player_stats
values(1061880, 3, '200,000 .. 500,000', 547, 54, 731);
insert into player_stats
values(1191900, 3, '100,000 .. 200,000', 110, 37, 83);
insert into player_stats
values(1946700, 3, '50,000 .. 100,000', 497, 33, 697);
insert into player_stats
values(1140890, 3, '100,000 .. 200,000', 1125, 18, 218);
insert into player_stats
values(1011190, 3, '100,000 .. 200,000', 306, 16, 317);
insert into player_stats
values(861250, 3, '200,000 .. 500,000', 432, 23, 435);
insert into player_stats
values(1998330, 3, '0 .. 20,000', 1319, 27, 106);
insert into player_stats
values(2231190, 3, '0 .. 20,000', 112, 17, 158);
insert into player_stats
values(1225580, 3, '100,000 .. 200,000', 440, 14, 43);
insert into player_stats
values(612570, 3, '200,000 .. 500,000', 3138, 42, 539);
insert into player_stats
values(1062110, 3, '100,000 .. 200,000', 329, 39, 233);
insert into player_stats
values(1708010, 3, '200,000 .. 500,000', 237, 65, 601);
insert into player_stats
values(1164050, 3, '100,000 .. 200,000', 118, 31, 100);
insert into player_stats
values(2229940, 3, '0 .. 20,000', 126, 5, 168);
insert into player_stats
values(1097110, 3, '0 .. 20,000', 226, 10, 67);
insert into player_stats
values(889910, 3, '50,000 .. 100,000', 483, 25, 274);
insert into player_stats
values(1523650, 3, '0 .. 20,000', 55, 9, 120);
insert into player_stats
values(1335230, 3, '50,000 .. 100,000', 347, 8, 406);
insert into player_stats
values(1771360, 3, '50,000 .. 100,000', 248, 8, 56);
insert into player_stats
values(948640, 3, '20,000 .. 50,000', 6765, 51, 285);
insert into player_stats
values(1608700, 3, '20,000 .. 50,000', 227, null, null);
insert into player_stats
values(1574270, 3, '100,000 .. 200,000', 172, 35, 235);
insert into player_stats
values(2535440, 3, '0 .. 20,000', 133, 9, 227);
insert into player_stats
values(1333470, 3, '50,000 .. 100,000', 364, 11, 109);
insert into player_stats
values(1582680, 3, '20,000 .. 50,000', 98, 17, 147);
insert into player_stats
values(1530470, 3, '0 .. 20,000', 276, 23, 193);
insert into player_stats
values(1610460, 3, '20,000 .. 50,000', 634, 70, 335);
insert into player_stats
values(2316580, 3, '20,000 .. 50,000', 514, 25, 232);
insert into player_stats
values(581660, 3, '50,000 .. 100,000', 102, 19, 208);
insert into player_stats
values(1911360, 3, '200,000 .. 500,000', 164, 15, 231);
insert into player_stats
values(1959390, 3, '20,000 .. 50,000', 369, 17, 51);
insert into player_stats
values(2060790, 3, '20,000 .. 50,000', 464, 8, 59);
insert into player_stats
values(1385100, 3, '50,000 .. 100,000', 112, 144, 355);
insert into player_stats
values(1782330, 3, '20,000 .. 50,000', 189, 31, 179);
insert into player_stats
values(1099640, 3, '50,000 .. 100,000', 183, 11, 199);
insert into player_stats
values(1049710, 3, '50,000 .. 100,000', 245, 5, 47);
insert into player_stats
values(1345820, 3, '100,000 .. 200,000', 173, 74, 232);
insert into player_stats
values(773370, 3, '200,000 .. 500,000', 147, 38, 731);
insert into player_stats
values(1942010, 3, '50,000 .. 100,000', 50, 5, 75);
insert into player_stats
values(916350, 3, '100,000 .. 200,000', 96, 3, 6);
insert into player_stats
values(814680, 3, '100,000 .. 200,000', 689, 23, 158);
insert into player_stats
values(1119600, 3, '50,000 .. 100,000', 627, 53, 341);
insert into player_stats
values(1137450, 3, '100,000 .. 200,000', 427, 13, 67);
insert into player_stats
values(1132910, 3, '50,000 .. 100,000', 518, 10, 100);
insert into player_stats
values(1220150, 3, '200,000 .. 500,000', 1936, 50, 286);
insert into player_stats
values(1341050, 3, '0 .. 20,000', 385, 10, 94);
insert into player_stats
values(1297330, 3, '0 .. 20,000', 110, 9, 74);
insert into player_stats
values(2437040, 3, '50,000 .. 100,000', 37, 6, 543);
insert into player_stats
values(1393750, 3, '100,000 .. 200,000', 375, 26, 231);
insert into player_stats
values(1600910, 2, '0 .. 20,000', 0, 4, 90);
insert into player_stats
values(985950, 2, '20,000 .. 50,000', 2435, 35, 277);
insert into player_stats
values(1896880, 2, '20,000 .. 50,000', 16, 5, 14);
insert into player_stats
values(1932160, 2, '50,000 .. 100,000', 204, 22, 335);
insert into player_stats
values(598730, 2, '20,000 .. 50,000', 429, 14, 63);
insert into player_stats
values(2337820, 2, '0 .. 20,000', 311, 26, 316);
insert into player_stats
values(1346010, 2, '20,000 .. 50,000', 73, 17, 680);
insert into player_stats
values(1147330, 2, '50,000 .. 100,000', 110, 5, 54);
insert into player_stats
values(1294420, 2, '200,000 .. 500,000', 165, 25, 419);
insert into player_stats
values(1783680, 2, '0 .. 20,000', 788, 7, 73);
insert into player_stats
values(1867530, 2, '50,000 .. 100,000', 151, 27, 168);
insert into player_stats
values(702680, 2, '20,000 .. 50,000', 165, 9, 56);
insert into player_stats
values(374190, 2, '100,000 .. 200,000', 598, 54, 639);
insert into player_stats
values(1114290, 2, '50,000 .. 100,000', 90, 8, 353);
insert into player_stats
values(1399700, 2, '20,000 .. 50,000', 607, 5, 125);
insert into player_stats
values(1016790, 2, '200,000 .. 500,000', 1376, 15, 168);
insert into player_stats
values(1423600, 2, '20,000 .. 50,000', 19, 77, 670);
insert into player_stats
values(1514930, 2, '200,000 .. 500,000', 166, 9, 125);
insert into player_stats
values(809060, 2, '0 .. 20,000', 171, 16, 81);
insert into player_stats
values(941570, 2, '50,000 .. 100,000', 231, 20, 65);
insert into player_stats
values(967390, 2, '50,000 .. 100,000', 206, 12, 153);
insert into player_stats
values(1678420, 2, '200,000 .. 500,000', 108, null, null);
insert into player_stats
values(1098770, 2, '0 .. 20,000', 6, 16, 105);
insert into player_stats
values(465100, 2, '100,000 .. 200,000', 268, 19, 196);
insert into player_stats
values(679110, 2, '200,000 .. 500,000', 238, 18, 66);
insert into player_stats
values(1502560, 2, '20,000 .. 50,000', 375, 21, 36);
insert into player_stats
values(1263070, 2, '100,000 .. 200,000', 311, 9, 292);
insert into player_stats
values(1248080, 2, '20,000 .. 50,000', 15, 43, 115);
insert into player_stats
values(1581480, 2, '20,000 .. 50,000', 1162, 23, 140);
insert into player_stats
values(1575470, 2, '50,000 .. 100,000', 147, 9, 96);
insert into player_stats
values(1223910, 2, '20,000 .. 50,000', 178, 20, 98);
insert into player_stats
values(2794770, 2, '0 .. 20,000', 78, 14, 115);
insert into player_stats
values(1041920, 2, '100,000 .. 200,000', 137, 15, 38);
insert into player_stats
values(733210, 2, '0 .. 20,000', 24, 12, 103);
insert into player_stats
values(1172650, 2, '500,000 .. 1,000,000', 369, 59, 167);
insert into player_stats
values(1000760, 2, '100,000 .. 200,000', 328, 27, 308);
insert into player_stats
values(2738750, 2, '0 .. 20,000', 99, 4, 57);
insert into player_stats
values(1946070, 2, '20,000 .. 50,000', 52, 13, 155);
insert into player_stats
values(1602560, 2, '20,000 .. 50,000', 119, 5, 84);
insert into player_stats
values(1345760, 2, '0 .. 20,000', 122, 18, 132);
insert into player_stats
values(1015940, 2, '0 .. 20,000', 158, 3, 12);
insert into player_stats
values(1998450, 2, '50,000 .. 100,000', 184, 9, 594);
insert into player_stats
values(1307660, 2, '50,000 .. 100,000', 239, 8, 413);
insert into player_stats
values(1304340, 2, '0 .. 20,000', 112, 91, 561);
insert into player_stats
values(1350200, 2, '100,000 .. 200,000', 355, 46, 385);
insert into player_stats
values(1178210, 2, '0 .. 20,000', 439, 17, 98);
insert into player_stats
values(995980, 2, '100,000 .. 200,000', 1243, 55, 453);
insert into player_stats
values(1071130, 2, '100,000 .. 200,000', 53, 8, 50);
insert into player_stats
values(840210, 2, '50,000 .. 100,000', 169, 9, 319);
insert into player_stats
values(1506510, 2, '50,000 .. 100,000', 22, 6, 110);
insert into player_stats
values(1184760, 2, '100,000 .. 200,000', 438, 14, 329);
insert into player_stats
values(1104380, 2, '100,000 .. 200,000', 160, 37, 137);
insert into player_stats
values(1671360, 2, '100,000 .. 200,000', 18, 3, 63);
insert into player_stats
values(1612780, 2, '50,000 .. 100,000', 860, 28, 823);
insert into player_stats
values(2223740, 2, '0 .. 20,000', 8, 13, 49);
insert into player_stats
values(1960110, 2, '20,000 .. 50,000', 0, 21, 607);
insert into player_stats
values(1125910, 2, '20,000 .. 50,000', 280, 15, 119);
insert into player_stats
values(730390, 2, '0 .. 20,000', 164, 19, 176);
insert into player_stats
values(1539620, 2, '0 .. 20,000', 237, 8, 174);
insert into player_stats
values(969760, 2, '200,000 .. 500,000', 1070, 28, 251);
insert into player_stats
values(1162130, 2, '50,000 .. 100,000', 211, 144, 344);
insert into player_stats
values(986310, 2, '0 .. 20,000', 63, 2, 51);
insert into player_stats
values(1924430, 2, '20,000 .. 50,000', 544, 33, 179);
insert into player_stats
values(1630110, 2, '50,000 .. 100,000', 98, 16, 85);
insert into player_stats
values(2516170, 2, '0 .. 20,000', 34, 5, 14);
insert into player_stats
values(1012570, 2, '20,000 .. 50,000', 104, 6, 307);
insert into player_stats
values(1246250, 2, '0 .. 20,000', 111, 2, 58);
insert into player_stats
values(2131010, 2, '100,000 .. 200,000', 54, 6, 169);
insert into player_stats
values(1150950, 2, '200,000 .. 500,000', 373, 43, 188);
insert into player_stats
values(1614270, 2, '20,000 .. 50,000', 401, 13, 71);
insert into player_stats
values(1325890, 2, '100,000 .. 200,000', 223, 3, 73);
insert into player_stats
values(2769080, 2, '0 .. 20,000', 511, 19, 126);
insert into player_stats
values(1983970, 2, '100,000 .. 200,000', 354, 14, 827);
insert into player_stats
values(1499120, 2, '50,000 .. 100,000', 184, 20, 210);
insert into player_stats
values(1668530, 2, '0 .. 20,000', 0, 2, 133);
insert into player_stats
values(1371690, 2, '50,000 .. 100,000', 170, 14, 305);
insert into player_stats
values(1912380, 2, '0 .. 20,000', 451, 2, 65);
insert into player_stats
values(762220, 2, '100,000 .. 200,000', 461, 20, 83);
insert into player_stats
values(1110050, 2, '200,000 .. 500,000', 101, 5, 52);
insert into player_stats
values(725270, 2, '20,000 .. 50,000', 278, 6, 75);
insert into player_stats
values(865610, 2, '1,000,000 .. 2,000,000', 171, 20, 423);
insert into player_stats
values(946030, 2, '100,000 .. 200,000', 36, 14, 124);
insert into player_stats
values(254370, 2, '50,000 .. 100,000', 75, 15, 1216);
insert into player_stats
values(1456880, 2, '50,000 .. 100,000', 123, 7, 75);
insert into player_stats
values(1976950, 2, '100,000 .. 200,000', 114, 15, 684);
insert into player_stats
values(989440, 2, '200,000 .. 500,000', 1061, 9, 1584);
insert into player_stats
values(1733240, 2, '50,000 .. 100,000', 252, 13, 157);
insert into player_stats
values(1353270, 2, '200,000 .. 500,000', 184, 20, 247);
insert into player_stats
values(628200, 2, '100,000 .. 200,000', 273, 18, 301);
insert into player_stats
values(968370, 2, '20,000 .. 50,000', 161, 5, 31);
insert into player_stats
values(1671410, 2, '100,000 .. 200,000', 224, 16, 220);
insert into player_stats
values(1430680, 2, '20,000 .. 50,000', 377, 37, 144);
insert into player_stats
values(2162020, 2, '0 .. 20,000', 184, 8, 53);
insert into player_stats
values(1368130, 2, '50,000 .. 100,000', 606, 91, 1412);
insert into player_stats
values(858030, 2, '0 .. 20,000', 0, 3, 19);
insert into player_stats
values(2602020, 2, '0 .. 20,000', 1235, 17, 76);
insert into player_stats
values(1045180, 2, '20,000 .. 50,000', 236, 13, 178);
insert into player_stats
values(739080, 2, '100,000 .. 200,000', 372, 20, 158);
insert into player_stats
values(840390, 2, '20,000 .. 50,000', 75, 17, 647);
insert into player_stats
values(1421790, 2, '100,000 .. 200,000', 107, 41, 535);
insert into player_stats
values(1399080, 2, '20,000 .. 50,000', 392, 9, 1253);
insert into player_stats
values(1015890, 2, '20,000 .. 50,000', 16, 13, 103);
insert into player_stats
values(2243670, 1, '0 .. 20,000', 0, 2, 7);
insert into player_stats
values(1139280, 1, '20,000 .. 50,000', 304, 10, 112);
insert into player_stats
values(2660410, 1, '0 .. 20,000', 0, 2, 5);
insert into player_stats
values(2081400, 1, '50,000 .. 100,000', 170, 26, 1321);
insert into player_stats
values(968870, 1, '50,000 .. 100,000', 254, 22, 89);
insert into player_stats
values(985900, 1, '20,000 .. 50,000', 12, 14, 254);
insert into player_stats
values(1405790, 1, '50,000 .. 100,000', 1471, 18, 78);
insert into player_stats
values(1568970, 1, '0 .. 20,000', 165, null, null);
insert into player_stats
values(1310330, 1, '50,000 .. 100,000', 1195, 11, 265);
insert into player_stats
values(1422420, 1, '20,000 .. 50,000', 224, 9, 166);
insert into player_stats
values(1579280, 1, '50,000 .. 100,000', 0, null, null);
insert into player_stats
values(1229420, 1, '0 .. 20,000', 278, 5, 270);
insert into player_stats
values(1402320, 1, '100,000 .. 200,000', 379, 63, 193);
insert into player_stats
values(690120, 1, '50,000 .. 100,000', 0, 2, 27);
insert into player_stats
values(1674640, 1, '20,000 .. 50,000', 12, 4, 46);
insert into player_stats
values(1190400, 1, '0 .. 20,000', 909, 16, 236);
insert into player_stats
values(1154040, 1, '200,000 .. 500,000', 293, 134, 1677);
insert into player_stats
values(2146570, 1, '0 .. 20,000', 377, 4, 74);
insert into player_stats
values(1592540, 1, '50,000 .. 100,000', 4, 6, 46);
insert into player_stats
values(1497360, 1, '20,000 .. 50,000', 181, 4, 62);
insert into player_stats
values(982720, 1, '100,000 .. 200,000', 664, 20, 317);
insert into player_stats
values(2103680, 1, '20,000 .. 50,000', 129, 27, 229);
insert into player_stats
values(1209410, 1, '50,000 .. 100,000', 76, 30, 593);
insert into player_stats
values(3061910, 1, '0 .. 20,000', 0, 1, 3);
insert into player_stats
values(1843540, 1, '20,000 .. 50,000', 164, 14, 52);
insert into player_stats
values(750200, 1, '20,000 .. 50,000', 47, 8, 47);
insert into player_stats
values(1154790, 1, '200,000 .. 500,000', 321, 6, 120);
insert into player_stats
values(2015960, 1, '0 .. 20,000', 0, 4, 31);
insert into player_stats
values(1113570, 1, '50,000 .. 100,000', 285, 33, 1245);
insert into player_stats
values(2193050, 1, '20,000 .. 50,000', 212, 16, 90);
insert into player_stats
values(347800, 1, '200,000 .. 500,000', 900, 20, 670);
insert into player_stats
values(762180, 1, '50,000 .. 100,000', 15, 1, 8);
insert into player_stats
values(1284090, 1, '0 .. 20,000', 6, 5, 9);
insert into player_stats
values(1369520, 1, '20,000 .. 50,000', 365, 7, 80);
insert into player_stats
values(1115780, 1, '200,000 .. 500,000', 180, 31, 146);
insert into player_stats
values(1662480, 1, '0 .. 20,000', 40, 6, 64);
insert into player_stats
values(1191260, 1, '0 .. 20,000', 13, 22, 85);
insert into player_stats
values(1223500, 1, '100,000 .. 200,000', 98, 18, 45);
insert into player_stats
values(1050370, 1, '20,000 .. 50,000', 0, 4, 50);
insert into player_stats
values(1178140, 1, '0 .. 20,000', 38, 3, 15);
insert into player_stats
values(1619230, 1, '20,000 .. 50,000', 370, 9, 82);
insert into player_stats
values(1831700, 1, '0 .. 20,000', 0, 3, 14);
insert into player_stats
values(1225590, 1, '200,000 .. 500,000', 171, 14, 82);
insert into player_stats
values(1082680, 1, '50,000 .. 100,000', 432, 6, 165);
insert into player_stats
values(1302050, 1, '20,000 .. 50,000', 2081, 7, 108);
insert into player_stats
values(1532460, 1, '0 .. 20,000', 0, 0, 50);
insert into player_stats
values(2562900, 1, '0 .. 20,000', 2118, 1, 10);
insert into player_stats
values(959860, 1, '20,000 .. 50,000', 302, 9, 195);
insert into player_stats
values(599610, 1, '50,000 .. 100,000', 309, 9, 41);
insert into player_stats
values(883360, 1, '200,000 .. 500,000', 105, 14, 138);
insert into player_stats
values(1640320, 1, '0 .. 20,000', 345, 4, 26);
insert into player_stats
values(1651960, 1, '200,000 .. 500,000', 137, 52, 1498);
insert into player_stats
values(596000, 1, '0 .. 20,000', 157, 5, 28);
insert into player_stats
values(1337530, 1, '100,000 .. 200,000', 23, 4, 22);
insert into player_stats
values(1121780, 1, '50,000 .. 100,000', 236, 6, 222);
insert into player_stats
values(623280, 1, '200,000 .. 500,000', 809, 40, 9821);
insert into player_stats
values(1991300, 1, '0 .. 20,000', 711, 5, 59);
insert into player_stats
values(1424980, 1, '100,000 .. 200,000', 133, 10, 112);
insert into player_stats
values(1001800, 1, '50,000 .. 100,000', 162, 13, 91);
insert into player_stats
values(1267930, 1, '0 .. 20,000', 0, 2, 5);
insert into player_stats
values(1377920, 1, '0 .. 20,000', 14, 3, 7);
insert into player_stats
values(1540350, 1, '20,000 .. 50,000', 377, null, null);
insert into player_stats
values(768450, 1, '20,000 .. 50,000', 149, 6, 66);
insert into player_stats
values(735290, 1, '50,000 .. 100,000', 78, 17, 85);
insert into player_stats
values(593640, 1, '50,000 .. 100,000', 11, 6, 73);
insert into player_stats
values(1544360, 1, '200,000 .. 500,000', 89, 54, 331);
insert into player_stats
values(922050, 1, '0 .. 20,000', 355, 14, 52);
insert into player_stats
values(2471130, 1, '20,000 .. 50,000', 0, 1, 4);
insert into player_stats
values(1309620, 1, '0 .. 20,000', 51, 10, 99);
insert into player_stats
values(931310, 1, '20,000 .. 50,000', 259, 5, 18);
insert into player_stats
values(1277130, 1, '0 .. 20,000', 398, 7, 74);
insert into player_stats
values(910490, 1, '200,000 .. 500,000', 780, 42, 2769);
insert into player_stats
values(1035560, 1, '0 .. 20,000', 180, 14, 139);
insert into player_stats
values(817020, 1, '50,000 .. 100,000', 0, 2, 40);
insert into player_stats
values(1164060, 1, '0 .. 20,000', 227, 1, 7);
insert into player_stats
values(1024480, 1, '200,000 .. 500,000', 118, 17, 413);
insert into player_stats
values(1969440, 1, '20,000 .. 50,000', 400, 15, 187);
insert into player_stats
values(2556990, 1, '200,000 .. 500,000', 999, 56, 584);
insert into player_stats
values(695330, 1, '100,000 .. 200,000', 216, 32, 438);
insert into player_stats
values(1419620, 1, '0 .. 20,000', 0, 5, 28);
insert into player_stats
values(2161620, 1, '0 .. 20,000', 0, 5, 54);
insert into player_stats
values(2104880, 1, '0 .. 20,000', 0, 3, 66);
insert into player_stats
values(2008510, 1, '50,000 .. 100,000', 78, 5, 37);
insert into player_stats
values(1672310, 1, '0 .. 20,000', 142, 11, 104);
insert into player_stats
values(1903910, 1, '50,000 .. 100,000', 25, 3, 56);
insert into player_stats
values(2060870, 1, '50,000 .. 100,000', 227, 6, 97);
insert into player_stats
values(2172180, 1, '500,000 .. 1,000,000', 0, 2, 7);
insert into player_stats
values(1640630, 1, '100,000 .. 200,000', 407, null, null);
insert into player_stats
values(1546920, 1, '50,000 .. 100,000', 264, 11, 91);
insert into player_stats
values(1058690, 1, '0 .. 20,000', 0, 5, 24);
insert into player_stats
values(926580, 1, '50,000 .. 100,000', 147, 22, 261);
insert into player_stats
values(1075200, 1, '0 .. 20,000', 1550, 24, 55);
insert into player_stats
values(1451080, 1, '50,000 .. 100,000', 764, 15, 931);
insert into player_stats
values(951750, 1, '0 .. 20,000', 265, 8, 42);
insert into player_stats
values(1989320, 1, '0 .. 20,000', 0, 6, 34);
insert into player_stats
values(1170060, 1, '100,000 .. 200,000', 120, 12, 77);
insert into player_stats
values(794960, 1, '0 .. 20,000', 334, 6, 15);
insert into player_stats
values(1146310, 1, '200,000 .. 500,000', 674, 24, 325);
insert into player_stats
values(1739900, 1, '20,000 .. 50,000', 62, 4, 88);
insert into player_stats
values(1293730, 1, '100,000 .. 200,000', 897, 7, 164);
insert into player_stats
values(1905020, 1, '100,000 .. 200,000', 7, 5, 273);
insert into player_stats
values(1811040, 1, '50,000 .. 100,000', 2961, 13, 98);
insert into player_stats
values(1037120, 1, '0 .. 20,000', 170, 7, 28);
insert into player_stats
values(1650810, 1, '50,000 .. 100,000', 340, 4, 372);
insert into player_stats
values(1301950, 1, '0 .. 20,000', 161, 8, 51);
insert into player_stats
values(2543760, 1, '0 .. 20,000', 244, 6, 187);
insert into player_stats
values(1600370, 1, '0 .. 20,000', 389, 12, 170);
insert into player_stats
values(2215540, 1, '0 .. 20,000', 0, 4, 27);
insert into player_stats
values(2450820, 1, '0 .. 20,000', 19, 8, 30);
insert into player_stats
values(1213750, 1, '0 .. 20,000', 105, 20, 257);
insert into player_stats
values(1422410, 1, '20,000 .. 50,000', 133, 3, 103);
insert into player_stats
values(2082270, 1, '0 .. 20,000', 0, 6, 14);
insert into player_stats
values(1432850, 1, '0 .. 20,000', 0, 12, 98);
insert into player_stats
values(2081470, 1, '0 .. 20,000', 406, 10, 75);
insert into player_stats
values(1183850, 1, '20,000 .. 50,000', 0, 3, 15);
insert into player_stats
values(899310, 1, '100,000 .. 200,000', 268, 20, 141);
insert into player_stats
values(1122680, 1, '100,000 .. 200,000', 247, 10, 64);
insert into player_stats
values(1042670, 1, '100,000 .. 200,000', 281, 7, 385);
insert into player_stats
values(912570, 1, '0 .. 20,000', 313, 11, 175);
insert into player_stats
values(1195360, 1, '0 .. 20,000', 155, 2, 27);
insert into player_stats
values(989790, 1, '0 .. 20,000', 113, 4, 28);
insert into player_stats
values(1666250, 1, '20,000 .. 50,000', 382, 6, 259);
insert into player_stats
values(1060210, 1, '50,000 .. 100,000', 261, 16, 148);
insert into player_stats
values(1647730, 0, '0 .. 20,000', 99, 1, 14);
insert into player_stats
values(1617220, 0, '0 .. 20,000', 721, 3, 47);
insert into player_stats
values(1177030, 0, '0 .. 20,000', 28, 1, 14);
insert into player_stats
values(1280300, 0, '20,000 .. 50,000', 42, 3, 20);
insert into player_stats
values(1781010, 0, '0 .. 20,000', 0, 3, 9);
insert into player_stats
values(945680, 0, '20,000 .. 50,000', 17, 3, 14);
insert into player_stats
values(1386870, 0, '0 .. 20,000', 0, 3, 12);
insert into player_stats
values(1346400, 0, '50,000 .. 100,000', 29, 3, 7);
insert into player_stats
values(1468380, 0, '0 .. 20,000', 0, 1, 9);
insert into player_stats
values(2662630, 0, '0 .. 20,000', 0, 0, 0);
insert into player_stats
values(1505430, 0, '0 .. 20,000', 0, 0, 6);
insert into player_stats
values(1383250, 0, '20,000 .. 50,000', 76, 6, 67);
insert into player_stats
values(1400970, 0, '0 .. 20,000', 0, 0, 0);
insert into player_stats
values(1586880, 0, '0 .. 20,000', 0, 7, 27);
insert into player_stats
values(2493360, 0, '20,000 .. 50,000', 0, 0, 2);
insert into player_stats
values(2337640, 0, '0 .. 20,000', 64, 37, 378);
insert into player_stats
values(1130710, 0, '0 .. 20,000', 0, 1, 8);
insert into player_stats
values(1060600, 0, '50,000 .. 100,000', 33, 12, 39);
insert into player_stats
values(1139870, 0, '20,000 .. 50,000', 31, 7, 76);
insert into player_stats
values(975150, 0, '20,000 .. 50,000', 0, 4, 29);
insert into player_stats
values(1095040, 0, '50,000 .. 100,000', 167, 12, 157);
insert into player_stats
values(605800, 0, '0 .. 20,000', 0, 3, 18);
insert into player_stats
values(1592490, 0, '0 .. 20,000', 0, 1, 15);
insert into player_stats
values(975950, 0, '0 .. 20,000', 1383, 3, 33);
insert into player_stats
values(1787810, 0, '0 .. 20,000', 0, 2, 9);
insert into player_stats
values(2099990, 0, '0 .. 20,000', 0, 1, 2);
insert into player_stats
values(1698220, 0, '20,000 .. 50,000', 119, 8, 60);
insert into player_stats
values(1145290, 0, '20,000 .. 50,000', 603, 4, 205);
insert into player_stats
values(3246160, 0, '0 .. 20,000', 0, 0, 0);
insert into player_stats
values(523770, 0, '100,000 .. 200,000', 0, 2, 32);
insert into player_stats
values(1154830, 0, '20,000 .. 50,000', 0, 2, 47);
insert into player_stats
values(1675900, 0, '0 .. 20,000', 374, 259, 23365);
insert into player_stats
values(1240060, 0, '20,000 .. 50,000', 263, 18, 68);
insert into player_stats
values(979310, 0, '50,000 .. 100,000', 0, 2, 31);
insert into player_stats
values(1620720, 0, '20,000 .. 50,000', 119, 3, 22);
insert into player_stats
values(1585440, 0, '20,000 .. 50,000', 708, 10, 68);
insert into player_stats
values(536280, 0, '500,000 .. 1,000,000', 391, 6, 539);
insert into player_stats
values(1154670, 0, '100,000 .. 200,000', 50, 1, 108);
insert into player_stats
values(1318970, 0, '0 .. 20,000', 284, 3, 25);
insert into player_stats
values(1529550, 0, '0 .. 20,000', 163, 1, 47);
insert into player_stats
values(1966420, 0, '0 .. 20,000', 220, 8, 82);
insert into player_stats
values(3270520, 0, '0 .. 20,000', 0, 0, 1);
insert into player_stats
values(2211280, 0, '0 .. 20,000', 180, 66, 134);
insert into player_stats
values(1401400, 0, '0 .. 20,000', 0, 4, 23);
insert into player_stats
values(1299360, 0, '50,000 .. 100,000', 352, 8, 172);
insert into player_stats
values(1293910, 0, '20,000 .. 50,000', 222, 2, 28);
insert into player_stats
values(2527580, 0, '0 .. 20,000', 0, 4, 24);
insert into player_stats
values(1453790, 0, '50,000 .. 100,000', 432, 13, 151);
insert into player_stats
values(1258220, 0, '20,000 .. 50,000', 0, 5, 47);
insert into player_stats
values(1727180, 0, '0 .. 20,000', 196, 3, 54);
insert into player_stats
values(2024390, 0, '0 .. 20,000', 617, 7, 46);
insert into player_stats
values(945740, 0, '20,000 .. 50,000', 120, 1, 27);
insert into player_stats
values(2089830, 0, '0 .. 20,000', 193, 1, 38);
insert into player_stats
values(1062340, 0, '20,000 .. 50,000', 0, 11, 864);
insert into player_stats
values(1342620, 0, '200,000 .. 500,000', 116, 13, 296);
insert into player_stats
values(1098292, 0, '500,000 .. 1,000,000', 0, null, null);
insert into player_stats
values(1249110, 0, '20,000 .. 50,000', 13, 7, 28);
insert into player_stats
values(3070400, 0, '20,000 .. 50,000', 0, 0, 1);
insert into player_stats
values(1569220, 0, '0 .. 20,000', 0, 0, 16);
insert into player_stats
values(2357570, 0, '0 .. 20,000', 4119, 56695, 164636);
insert into player_stats
values(1436920, 0, '0 .. 20,000', 27, 4, 24);
insert into player_stats
values(1947210, 0, '20,000 .. 50,000', 0, 0, 0);
insert into player_stats
values(2933620, 0, '0 .. 20,000', 0, 1, 2);
insert into player_stats
values(1755030, 0, '20,000 .. 50,000', 0, 3, 15);
insert into player_stats
values(1507790, 0, '0 .. 20,000', 0, 0, 15);
insert into player_stats
values(1649340, 0, '0 .. 20,000', 0, 0, 0);
insert into player_stats
values(2324650, 0, '0 .. 20,000', 129, 99, 1916);
insert into player_stats
values(2074920, 0, '0 .. 20,000', 2947, 15047, 264860);
insert into player_stats
values(2600140, 0, '0 .. 20,000', 0, 23, 362);
insert into player_stats
values(1094540, 0, '100,000 .. 200,000', 84, 6, 55);
insert into player_stats
values(962700, 0, '0 .. 20,000', 0, 3, 25);
insert into player_stats
values(1383700, 0, '0 .. 20,000', 0, 3, 8);
insert into player_stats
values(1125330, 0, '20,000 .. 50,000', 224, 4, 76);
insert into player_stats
values(1064840, 0, '20,000 .. 50,000', 0, 2, 27);
insert into player_stats
values(1220370, 0, '20,000 .. 50,000', 53, 1, 24);
insert into player_stats
values(1321070, 0, '50,000 .. 100,000', 208, 11, 125);
insert into player_stats
values(2073850, 0, '0 .. 20,000', 1425, 21094, 242399);
insert into player_stats
values(2685090, 0, '0 .. 20,000', 0, 3, 35);
insert into player_stats
values(2160480, 0, '20,000 .. 50,000', 163, 12, 212);
insert into player_stats
values(2784620, 0, '0 .. 20,000', 136, 5, 48);
insert into player_stats
values(2076820, 0, '0 .. 20,000', 0, 0, 0);
insert into player_stats
values(2632930, 0, '100,000 .. 200,000', 0, 2, 37);
insert into player_stats
values(1239950, 0, '0 .. 20,000', 0, 1, 28);
insert into player_stats
values(874040, 0, '0 .. 20,000', 53, 6, 46);
insert into player_stats
values(1674920, 0, '20,000 .. 50,000', 112, 59, 113);
insert into player_stats
values(1311070, 0, '200,000 .. 500,000', 435, 21, 149);
insert into player_stats
values(1122700, 0, '0 .. 20,000', 34, 1, 8);
insert into player_stats
values(1189800, 0, '100,000 .. 200,000', 1347, 9, 828);
insert into player_stats
values(1522140, 0, '0 .. 20,000', 0, 1, 22);
insert into player_stats
values(2278790, 0, '0 .. 20,000', 242, 4, 28);
insert into player_stats
values(1155460, 0, '0 .. 20,000', 64, 4, 19);
insert into player_stats
values(1308880, 0, '20,000 .. 50,000', 0, 2, 11);
insert into player_stats
values(2225070, 0, '0 .. 20,000', 816, 2161, 21864);
insert into player_stats
values(1506440, 0, '0 .. 20,000', 469, 7, 66);
insert into player_stats
values(1211930, 0, '0 .. 20,000', 288, 3, 22);
insert into player_stats
values(1068600, 0, '0 .. 20,000', 87, 3, 9);
insert into player_stats
values(894620, 0, '0 .. 20,000', 868, 2, 10);
insert into player_stats
values(935570, 0, '0 .. 20,000', 0, 6, 38);
insert into player_stats
values(925570, 0, '200,000 .. 500,000', 278, 22, 178);
insert into player_stats
values(1022710, 0, '0 .. 20,000', 472, 4, 85);
insert into player_stats
values(2534370, 0, '0 .. 20,000', 0, 6, 42);
insert into player_stats
values(831050, 0, '0 .. 20,000', 48, 6, 101);
insert into player_stats
values(1417880, 0, '100,000 .. 200,000', 1406, 1, 68);
insert into player_stats
values(1451120, 0, '20,000 .. 50,000', 41, 0, 9);
insert into player_stats
values(2519060, 0, '0 .. 20,000', 0, 0, 3);
insert into player_stats
values(957710, 0, '50,000 .. 100,000', 270, 3, 143);
insert into player_stats
values(2008420, 0, '0 .. 20,000', 0, 2, 27);
insert into player_stats
values(1911800, 0, '0 .. 20,000', 0, 1, 6);
insert into player_stats
values(1337920, 0, '50,000 .. 100,000', 217, 19, 131);
insert into player_stats
values(1426900, 0, '0 .. 20,000', 0, 1, 5);
insert into player_stats
values(1129920, 0, '20,000 .. 50,000', 0, 4, 15);
insert into player_stats
values(1696220, 0, '20,000 .. 50,000', 582, 6, 27);
insert into player_stats
values(1234180, 0, '0 .. 20,000', 463, 1, 14);
insert into player_stats
values(589670, 0, '20,000 .. 50,000', 31, 5, 40);
insert into player_stats
values(1048740, 0, '0 .. 20,000', 176, 11, 15);
insert into player_stats
values(1329810, 0, '0 .. 20,000', 0, 1, 2);
insert into player_stats
values(1295790, 0, '0 .. 20,000', 59, 2, 15);
insert into player_stats
values(1962663, 0, '0 .. 20,000', 0, null, null);
insert into player_stats
values(1079830, 0, '20,000 .. 50,000', 70, 7, 299);
insert into player_stats
values(2141910, 0, '0 .. 20,000', 3130, 9202, 17989);
insert into player_stats
values(715380, 0, '100,000 .. 200,000', 49, 12, 157);
insert into player_stats
values(451310, 0, '0 .. 20,000', 98, 2, 9);
insert into player_stats
values(2195140, 0, '0 .. 20,000', 0, 2, 16);
insert into player_stats
values(1205430, 0, '0 .. 20,000', 0, 0, 0);
insert into player_stats
values(1188900, 0, '20,000 .. 50,000', 6, 1, 6);
insert into player_stats
values(1273750, 0, '0 .. 20,000', 542, 4, 19);
insert into player_stats
values(1243890, 0, '20,000 .. 50,000', 96, 7, 100);
insert into player_stats
values(1910600, 0, '0 .. 20,000', 61, 5, 58);
insert into player_stats
values(2424110, 0, '0 .. 20,000', 537, 13, 31);
insert into player_stats
values(2069180, 0, '50,000 .. 100,000', 10, 5, 151);
insert into player_stats
values(1243690, 0, '0 .. 20,000', 37, 3, 19);
insert into player_stats
values(3183850, 0, '0 .. 20,000', 0, 0, 0);
insert into player_stats
values(1941410, 0, '20,000 .. 50,000', 103, 4, 35);
insert into player_stats
values(1803840, 0, '0 .. 20,000', 0, 2, 5);
insert into player_stats
values(1162280, 0, '100,000 .. 200,000', 43, 4, 22);
insert into player_stats
values(1122100, 0, '20,000 .. 50,000', 68, 5, 45);
insert into player_stats
values(1684400, 0, '0 .. 20,000', 76, 2, 25);
insert into player_stats
values(917840, 0, '20,000 .. 50,000', 1603, 17, 66);
insert into player_stats
values(2742010, 0, '20,000 .. 50,000', 0, 0, 4);
insert into player_stats
values(1163060, 0, '0 .. 20,000', 926, 3, 14);
insert into player_stats
values(1943420, 0, '0 .. 20,000', 110, 0, 22);
insert into player_stats
values(1287310, 0, '0 .. 20,000', 0, 4, 38);
insert into player_stats
values(1920100, 0, '50,000 .. 100,000', 0, 8, 77);
insert into player_stats
values(1271400, 0, '20,000 .. 50,000', 76, 3, 39);
insert into player_stats
values(2114300, 0, '50,000 .. 100,000', 0, 0, 18);
insert into player_stats
values(1296980, 0, '20,000 .. 50,000', 0, 1, 8);
insert into player_stats
values(1452500, 0, '20,000 .. 50,000', 1488, 8, 128);
insert into player_stats
values(1597580, 0, '0 .. 20,000', 45, 3, 15);
insert into player_stats
values(853050, 0, '20,000 .. 50,000', 328, 6, 24);
insert into player_stats
values(975510, 0, '20,000 .. 50,000', 1247, 26, 66);
insert into player_stats
values(1449850, 0, '0 .. 20,000', 5008, 51018, 262333);
insert into player_stats
values(1220100, 0, '0 .. 20,000', 0, 5, 18);
insert into player_stats
values(820540, 0, '20,000 .. 50,000', 189, 4, 44);
insert into player_stats
values(1717410, 0, '0 .. 20,000', 5, 5, 15);
insert into player_stats
values(1453900, 0, '0 .. 20,000', 515, 3, 65);
insert into player_stats
values(1880470, 0, '200,000 .. 500,000', 804, 4, 147);
insert into player_stats
values(1502080, 0, '50,000 .. 100,000', 29, 7, 43);
insert into player_stats
values(1039100, 0, '20,000 .. 50,000', 91, 2, 35);
insert into player_stats
values(1323540, 0, '20,000 .. 50,000', 0, 0, 9);
insert into player_stats
values(1294880, 0, '20,000 .. 50,000', 60, 2, 19);
insert into player_stats
values(1399690, 0, '20,000 .. 50,000', 0, 2, 50);
insert into player_stats
values(1885750, 0, '50,000 .. 100,000', 148, 4, 44);
insert into player_stats
values(1452070, 0, '20,000 .. 50,000', 24, 4, 40);
insert into player_stats
values(837460, 0, '0 .. 20,000', 553, 12, 26);
insert into player_stats
values(1546100, 0, '0 .. 20,000', 138, 2, 24);
insert into player_stats
values(907670, 0, '0 .. 20,000', 76, 2, 10);
insert into player_stats
values(1142390, 0, '50,000 .. 100,000', 241, 13, 92);
insert into player_stats
values(1962660, 0, '0 .. 20,000', 0, 1, 2);
insert into player_stats
values(2834910, 0, '0 .. 20,000', 613, 57, 90);
insert into player_stats
values(1320230, 0, '20,000 .. 50,000', 0, 1, 8);
insert into player_stats
values(1558930, 0, '20,000 .. 50,000', 183, 5, 42);
insert into player_stats
values(1247570, 0, '0 .. 20,000', 0, 1, 29);
insert into player_stats
values(1760330, 0, '0 .. 20,000', 0, 4, 31);
insert into player_stats
values(600080, 0, '20,000 .. 50,000', 486, 4, 27);
insert into player_stats
values(1053710, 0, '50,000 .. 100,000', 731, 16, 127);
insert into player_stats
values(1547380, 0, '20,000 .. 50,000', 157, 4, 33);
insert into player_stats
values(1508400, 0, '50,000 .. 100,000', 62, 4, 88);
insert into player_stats
values(2229890, 0, '0 .. 20,000', 453, 100, 305);
insert into player_stats
values(1851030, 0, '0 .. 20,000', 28, 0, 32);
insert into player_stats
values(1406810, 0, '0 .. 20,000', 1152, 9, 54);
insert into player_stats
values(1140100, 0, '20,000 .. 50,000', 184, 7, 29);
insert into player_stats
values(2680190, 0, '0 .. 20,000', 203, 3, 5);
insert into player_stats
values(2732960, 0, '0 .. 20,000', 496, 1975, 2332);
insert into player_stats
values(1431850, 0, '50,000 .. 100,000', 1402, 2, 21);
insert into player_stats
values(691790, 0, '50,000 .. 100,000', 0, 3, 83);
insert into player_stats
values(2560250, 0, '0 .. 20,000', 0, 0, 0);
insert into player_stats
values(1030060, 0, '20,000 .. 50,000', 158, 1, 11);
insert into player_stats
values(1358840, 0, '20,000 .. 50,000', 0, 2, 44);
insert into player_stats
values(1374970, 0, '20,000 .. 50,000', 496, 27, 269);
insert into player_stats
values(1913160, 0, '0 .. 20,000', 0, 1, 2);
insert into player_stats
values(2172860, 0, '0 .. 20,000', 0, 0, 0);
insert into player_stats
values(651490, 0, '0 .. 20,000', 391, 6, 22);
insert into player_stats
values(1034750, 0, '0 .. 20,000', 388, 9, 11);
insert into player_stats
values(1573390, 0, '0 .. 20,000', 0, 3, 13);
insert into player_stats
values(2079180, 0, '0 .. 20,000', 0, 4, 26);
insert into player_stats
values(971030, 0, '20,000 .. 50,000', 40, 8, 184);
insert into player_stats
values(966400, 0, '0 .. 20,000', 0, 3, 7);
insert into player_stats
values(2905090, 0, '0 .. 20,000', 11, 6, 14);
insert into player_stats
values(886060, 0, '0 .. 20,000', 21, 1, 16);
insert into player_stats
values(1476170, 0, '0 .. 20,000', 23, 2, 22);
insert into player_stats
values(2132540, 0, '0 .. 20,000', 100, 2, 9);
insert into player_stats
values(1084990, 0, '0 .. 20,000', 0, 2, 12);
insert into player_stats
values(1621990, 0, '0 .. 20,000', 657, 17, 250);
insert into player_stats
values(1758910, 0, '200,000 .. 500,000', 0, 1, 5);
insert into player_stats
values(1019310, 0, '100,000 .. 200,000', 228, 16, 245);
insert into player_stats
values(1542110, 0, '0 .. 20,000', 7, null, null);
insert into player_stats
values(1106830, 0, '0 .. 20,000', 325, 5, 25);
insert into player_stats
values(1592320, 0, '0 .. 20,000', 0, 0, 7);
insert into player_stats
values(1973310, 0, '0 .. 20,000', 319, 2, 25);
insert into player_stats
values(1072190, 0, '100,000 .. 200,000', 178, 20, 268);
insert into player_stats
values(1337100, 0, '0 .. 20,000', 22, 3, 56);
insert into player_stats
values(1198590, 0, '20,000 .. 50,000', 0, 2, 23);
insert into player_stats
values(1398100, 0, '50,000 .. 100,000', 114, 2, 28);
insert into player_stats
values(1449320, 0, '100,000 .. 200,000', 197, 14, 46);
insert into player_stats
values(1093290, 0, '20,000 .. 50,000', 404, 38, 89);
insert into player_stats
values(1210490, 0, '0 .. 20,000', 0, 1, 23);
insert into player_stats
values(2009450, 0, '0 .. 20,000', 79, 4, 38);
insert into player_stats
values(1329790, 0, '0 .. 20,000', 163, 5, 54);
insert into player_stats
values(1490340, 0, '0 .. 20,000', 0, 2, 30);
insert into player_stats
values(1097790, 0, '0 .. 20,000', 2979, 6, 75);
insert into player_stats
values(1172190, 0, '0 .. 20,000', 0, 5, 76);
insert into player_stats
values(1419290, 0, '0 .. 20,000', 11, 2, 11);
insert into player_stats
values(1094730, 0, '20,000 .. 50,000', 61, 6, 173);
insert into player_stats
values(1150590, 0, '100,000 .. 200,000', 514, 11, 657);
insert into player_stats
values(1210150, 0, '50,000 .. 100,000', 150, 13, 132);
insert into player_stats
values(2005680, 0, '0 .. 20,000', 246, 5, 14);
insert into player_stats
values(2429640, 0, '0 .. 20,000', 3344, 24742, 333393);
insert into player_stats
values(1388260, 0, '0 .. 20,000', 0, 0, 0);
insert into player_stats
values(1342260, 0, '0 .. 20,000', 243, 21, 538);
insert into player_stats
values(2376270, 0, '0 .. 20,000', 0, 1, 2);
insert into player_stats
values(1754000, 0, '0 .. 20,000', 0, 0, 0);
insert into player_stats
values(1080450, 0, '0 .. 20,000', 13, 2, 16);
insert into player_stats
values(1351000, 0, '0 .. 20,000', 194, 2, 128);
insert into player_stats
values(1266680, 0, '1,000,000 .. 2,000,000', 80, 2, 13);
insert into player_stats
values(1098170, 0, '100,000 .. 200,000', 157, 4, 46);
insert into player_stats
values(1136020, 0, '0 .. 20,000', 110, 5, 136);
insert into player_stats
values(1228870, 0, '20,000 .. 50,000', 0, 0, 7);
insert into player_stats
values(1297300, 0, '100,000 .. 200,000', 116, 10, 87);
insert into player_stats
values(970840, 0, '20,000 .. 50,000', 25, 7, 16);
insert into player_stats
values(1205480, 0, '20,000 .. 50,000', 234, 29, 102);
insert into player_stats
values(1050880, 0, '0 .. 20,000', 0, 0, 7);
insert into player_stats
values(1296290, 0, '0 .. 20,000', 0, 1, 12);
insert into player_stats
values(544920, 0, '1,000,000 .. 2,000,000', 333, 148, 12513);
insert into player_stats
values(2236680, 0, '0 .. 20,000', 3, 3, 26);
insert into player_stats
values(1668190, 0, '0 .. 20,000', 0, 2, 24);
insert into player_stats
values(887450, 0, '20,000 .. 50,000', 157, 12, 206);
insert into player_stats
values(2139460, 0, '0 .. 20,000', 2294, 45657, 231343);
insert into player_stats
values(1931240, 0, '50,000 .. 100,000', 79, 10, 20);
insert into player_stats
values(838110, 0, '50,000 .. 100,000', 211, 4, 32);
insert into player_stats
values(944430, 0, '0 .. 20,000', 209, 1, 29);
insert into player_stats
values(1378070, 0, '20,000 .. 50,000', 206, 2, 78);

commit;