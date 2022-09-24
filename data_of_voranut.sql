-- User Table
INSERT INTO User VALUES (00001, "Nutnut", "Kub", "0971138686");
INSERT INTO User VALUES (00002, "NongNut", "Kung", "0971138686");
INSERT INTO User VALUES (00003, "NongTae", "Naka", "0971138686");
INSERT INTO User VALUES (00004, "NongNine", "Kaa", "0971138686");
INSERT INTO User VALUES (00005, "NongPhu", "Nakub", "0971138686");
INSERT INTO User VALUES (00006, "Pree", "Nut", 0971138686);
INSERT INTO User VALUES (00007, "Nut", "Noone", "0971138686");
INSERT INTO User VALUES (00008, "Hothead", "Nut", "0971138686");
INSERT INTO User VALUES (00009, "Unbeaten", "Nut", "0971138686");
INSERT INTO User VALUES (00010, "Toxic", "Nut", "0971138686");
-- Game Table
INSERT INTO Game VALUES (10000, "Valoranut", "FPS", 5, 2);
INSERT INTO Game VALUES (10001, "DotE", 'Moba', 5, 2);
-- Team Table
INSERT INTO Team VALUES (30000, "XNut", "0696969696", 10000);
INSERT INTO Team VALUES (30001, "CloudNut", "1091091091", 10000);
INSERT INTO Team VALUES (30002, "EnVyNut", "0910910910", 10001);
INSERT INTO Team VALUES (30003, "InvicNut", "9109109109", 10001);
-- TeamMember Table
INSERT INTO TeamMember VALUES (00001, 30000, "NutScary", "Player");
INSERT INTO TeamMember VALUES (00002, 30000, "NutSalmon", "Player");
INSERT INTO TeamMember VALUES (00003, 30000, "NutZ", "Player");
INSERT INTO TeamMember VALUES (00004, 30000, "Nutws", "Player");
INSERT INTO TeamMember VALUES (00005, 30000, "Nutzy", "Player");
INSERT INTO TeamMember VALUES (00006, 30001, "Pree_Nut", "Player");
INSERT INTO TeamMember VALUES (00007, 30001, "Nut_No1", "Player");
INSERT INTO TeamMember VALUES (00008, 30001, "Hot_Head_Nut", "Player");
INSERT INTO TeamMember VALUES (00009, 30001, "Unbeaten_Nut", "Player");
INSERT INTO TeamMember VALUES (00010, 30001, "Toxic_Nut", "Player");
-- Address Table
INSERT INTO Address VALUES (40000, "TH", "Bangkok", "Bangkok", "Phayathai", "10400",
"Desc");
-- Organizer Table
INSERT INTO Organizer VALUES (20000, "Sianut", "0971138686");
INSERT INTO Organizer VALUES (20001, "NutAKM", "0971138686");
-- Tournament Table
INSERT INTO Tournament VALUES (50000, "Nut Rescue", "Offline", "1111111111", Null,
"Rules", "ภารกิจชิงตัวพรี่นัท", 40000, 20000, 10000);
INSERT INTO Tournament VALUES (50001, "The Internationut 2077", "Offline",
"1231231234", NULL, "1.AAAA 2.BBBB", "การแข่งขัน TIn66 ชิงเงินรางวัลรวมมากกว่า 1000
bitcoin",40000, 20001, 10001);
-- Prize Table
INSERT INTO Prize VALUES (50000, 1, 50000, "50000 baht");
INSERT INTO Prize VALUES (50000, 2, 25000, "25000 baht");
INSERT INTO Prize VALUES (50001, 1, 500, "500 bitcoin");
INSERT INTO Prize VALUES (50001, 2, 300, "300 bitcoin");
INSERT INTO Prize VALUES (50001, 3, 100, "100 bitcoin");
INSERT INTO Prize VALUES (50001, 4, 75, "75 bitcoin");
INSERT INTO Prize VALUES (50001, 5, 25, "25 bitcoin");
-- EnrollTeam Table
INSERT INTO EnrollTeam VALUES (60000, 30000, 50000, 1);
INSERT INTO EnrollTeam VALUES (60001, 30001, 50000, 2);
INSERT INTO EnrollTeam VALUES (60002, 30002, 50001, null);
INSERT INTO EnrollTeam VALUES (60003, 30003, 50001, null);
-- MatchCompetition Table
INSERT INTO Matchcompetition VALUES (70000, 50000, "2021-11-11 11:00:00", 60000,
60001, "เลทได้ 15 นาที");
INSERT INTO Matchcompetition VALUES (70001, 50001, "2077-12-05 21:00:00", 60002,
60003, "เลทได้ 15 นาที");
-- MatchHistory Table
INSERT INTO MatchHistory VALUES (70000,
"[p1=[10,2,3],p2=[10,2,3],p3=[10,2,3],p4=[10,2,3],p5=[10,2,3],p6=[10,2,3],p7=[10,2,3],p8=[10,2,3
],p9=[10,2,3],p10=[10,2,3]]", 30000);