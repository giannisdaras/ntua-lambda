use ntua_db;


insert into hotel_group (number_of_hotels,name,street,num,postal_code,city) values
	(5,"Omilos Aigaiou","Ierou Lochou",39,14452, "Metamorfosis");

insert into hotel_group (number_of_hotels,name,street,num,postal_code,city) values
	(5,"Omilos Athhnas","Kafkassou",40,14455, "Kupselis");

insert into hotel_group (number_of_hotels,name,street,num,postal_code,city) values
	(5,"Omilos Sparths","Thermopulwn",39,14352, "Vrilissia");

insert into hotel_group (number_of_hotels,name,street,num,postal_code,city) values
	(5,"Omilos Krhths","Skurou",80,14352,"Metamorfosis");

insert into hotel_group (number_of_hotels,name,street,num,postal_code,city) values
	(5,"Omilos Attikhs","Panepistimiou",90,14459, "Patra");


insert into hotel_group_phones (hotel_group_id, phone) values
	(1,6977403147);

insert into hotel_group_phones (hotel_group_id, phone) values
	(2,2102845687);

insert into hotel_group_phones (hotel_group_id, phone) values
	(3,6974834313);

insert into hotel_group_phones (hotel_group_id, phone) values
	(4,6985561552);

insert into hotel_group_phones (hotel_group_id, phone) values
	(5,6970911632);



insert into hotel_group_emails (hotel_group_id,email) values
	(1,"daras.giannhs@gmail.com");

insert into hotel_group_emails (hotel_group_id,email) values
	(2,"el15018@central.ntua.gr");

insert into hotel_group_emails (hotel_group_id,email) values
	(3,"kdedeilia@gmail.com");

insert into hotel_group_emails (hotel_group_id,email) values
	(4,"mariospapachristou@gmail.com");

insert into hotel_group_emails (hotel_group_id,email) values
	(5,"ant.zervas@gmail.com");




insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Blue Aegean",2,5,1,"Sxoinari",1,14418,"Maroussi");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Mple alogo",3,5,1,"Kudwnias",3,15418,"Kupseli");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Titania",4,5,1,"Stathou",1,16418,"Tavros");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Palace",4,5,1,"Rodou",3,14318,"Xalandri");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Resort",5,5,1,"Avras",6,16718,"Tzitzifies");


insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Blue horse",2,5,2,"Mutilinis",34,18918,"Maroussi");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Endless",3,5,2,"Stadiou",78,15918,"Thhva");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("La huerta",4,5,2,"Skiathou",23,14418,"Metamorfosis");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Fuego",4,5,2,"Aloizou",25,14448,"Xalandri");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Intercontinental",5,5,2,"Olumpias",7,14422,"Iraklio");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Thanos rooms",2,5,3,"Tatoiou",13,14433,"Thessaloniki");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Asterias",3,5,3,"Mavilh",12,17418,"Ampelokipoi");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Aphrodite",4,5,3,"Malias",13,16118,"Maroussi");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Endless beach",4,5,3,"Kritiou",24,15123,"Vurwnas");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Fairytale",1,5,3,"Patisiwn",28,14748,"Euvoia");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Ta dwmatia ths marias",5,5,4,"Kodriktonos",32,14998,"Sudagma");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("four seasons",2,5,4,"Tasias",4,14358,"Ampelokipoi");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Palati",3,5,4,"Amenias",8,14348,"Maroussi");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("White sand",4,5,4,"Kratirou",9,15718,"Kupseli");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Golden rooms",4,5,4,"Peisidias",10,11118,"Maroussi");


insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Ruby Red",5,5,5,"Oblivias",20,16918,"OLympia");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Caravel",2,5,5,"Samarias",10,12318,"Kupseli");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Hilton",3,5,5,"Oulwf",1,14518,"Sudagma");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("River hotel",4,5,5,"Meidinias",5,14538,"Vurwnas");

insert into hotel (name,stars, number_of_rooms,hotel_group_id,street,num,postal_code,city) values
	("Punda hotel",1,5,5,"Ludias",11,12418,"Sarwnida");






insert into hotel_phones (hotel_id, phone) values
	(1,6977434147);

insert into hotel_phones (hotel_id, phone) values
	(2,2102890687);

insert into hotel_phones (hotel_id, phone) values
	(3,6974833313);

insert into hotel_phones (hotel_id, phone) values
	(4,6944561552);

insert into hotel_phones (hotel_id, phone) values
	(5,6970967832);
insert into hotel_phones (hotel_id, phone) values
	(6,6970967832);
insert into hotel_phones (hotel_id, phone) values
	(7,6970967832);
insert into hotel_phones (hotel_id, phone) values
	(8,6970967832);
insert into hotel_phones (hotel_id, phone) values
	(9,6970967832);
insert into hotel_phones (hotel_id, phone) values
	(10,6970967832);
insert into hotel_phones (hotel_id, phone) values
	(11,6970967832);
insert into hotel_phones (hotel_id, phone) values
	(12,6970437832);
insert into hotel_phones (hotel_id, phone) values
	(13,6970897839);
insert into hotel_phones (hotel_id, phone) values
	(14,6970267831);
insert into hotel_phones (hotel_id, phone) values
	(15,6978967832);
insert into hotel_phones (hotel_id, phone) values
	(16,6970944832);
insert into hotel_phones (hotel_id, phone) values
	(17,6970967889);
insert into hotel_phones (hotel_id, phone) values
	(18,6970967812);
insert into hotel_phones (hotel_id, phone) values
	(19,6970967878);
insert into hotel_phones (hotel_id, phone) values
	(20,6970897847);
insert into hotel_phones (hotel_id, phone) values
	(21,6970567831);
insert into hotel_phones (hotel_id, phone) values
	(22,6970945830);
insert into hotel_phones (hotel_id, phone) values
	(23,6956767832);
insert into hotel_phones (hotel_id, phone) values
	(24,6970686832);
insert into hotel_phones (hotel_id, phone) values
	(25,6970965623);



insert into hotel_emails (hotel_id,email) values
	(1,"daras.giannhs@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(2,"el15018@central.ntua.gr");

insert into hotel_emails (hotel_id,email) values
	(3,"kdedeilia@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(4,"mariospapachristou@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(5,"ant.zervas@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(6,"daras.marios@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(7,"el15155@central.ntua.gr");

insert into hotel_emails (hotel_id,email) values
	(8,"ktouba@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(9,"marios123@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(10,"antmanager@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(11,"dinouls@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(12,"el15106@central.ntua.gr");

insert into hotel_emails (hotel_id,email) values
	(13,"kdendrinas@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(14,"mariosveakis@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(15,"antonisdourou@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(16,"daras@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(17,"el15668@central.ntua.gr");

insert into hotel_emails (hotel_id,email) values
	(18,"krodou@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(19,"mariosnikou@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(20,"zervasxrhstos@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(21,"daras.giannhs@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(22,"el15111@central.ntua.gr");

insert into hotel_emails (hotel_id,email) values
	(23,"kfotiou@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(24,"papachristoudimitra@gmail.com");

insert into hotel_emails (hotel_id,email) values
	(25,"iliasvremou@gmail.com");












insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (1,231,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (1,137,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (1,238,0,1,0,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (1,232,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (1,117,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (2,200,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (2,215,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (2,114,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (2,104,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (2,237,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (3,263,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (3,146,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (3,184,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (3,274,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (3,251,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (4,116,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (4,95,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (4,255,0,1,1,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (4,189,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (4,227,0,1,1,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (5,214,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (5,273,0,1,1,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (5,294,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (5,263,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (5,181,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (6,105,0,1,0,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (6,273,0,1,0,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (6,187,0,1,0,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (6,159,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (6,214,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (7,289,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (7,201,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (7,168,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (7,189,0,1,1,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (7,242,0,1,0,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (8,262,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (8,280,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (8,117,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (8,205,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (8,196,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (9,255,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (9,230,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (9,139,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (9,125,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (9,121,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (10,90,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (10,157,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (10,269,0,1,0,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (10,239,0,1,1,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (10,197,0,1,0,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (11,187,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (11,168,0,1,1,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (11,113,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (11,269,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (11,236,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (12,168,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (12,175,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (12,169,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (12,140,0,1,0,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (12,280,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (13,135,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (13,231,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (13,271,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (13,178,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (13,260,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (14,217,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (14,115,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (14,177,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (14,255,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (14,288,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (15,202,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (15,115,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (15,112,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (15,125,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (15,282,0,1,0,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (16,194,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (16,207,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (16,111,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (16,145,0,1,0,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (16,207,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (17,154,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (17,124,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (17,266,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (17,112,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (17,155,0,1,0,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (18,186,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (18,205,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (18,91,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (18,145,0,1,1,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (18,299,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (19,117,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (19,154,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (19,131,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (19,146,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (19,103,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (20,132,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (20,167,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (20,259,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (20,193,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (20,227,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (21,262,0,1,1,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (21,122,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (21,191,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (21,267,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (21,285,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (22,183,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (22,251,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (22,167,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (22,281,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (22,272,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (23,101,0,1,1,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (23,286,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (23,160,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (23,137,0,1,0,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (23,153,0,1,1,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (24,124,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (24,193,0,1,1,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (24,292,0,1,1,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (24,270,0,1,0,2);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (24,92,0,1,1,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (25,179,0,1,0,4);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (25,117,0,1,0,3);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (25,130,0,1,1,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (25,93,0,1,1,1);
insert into hotel_room (hotel_id, price, repairs_needed, expandable, view, capacity) values (25,122,0,1,1,3);


insert into amenities (amenity) values ("Sleepwear");

insert into amenities (amenity) values ("Towel");

insert into amenities (amenity) values ("Slippers");

insert into amenities (amenity) values ("Hairdryer");

insert into amenities (amenity) values ("Bathrobe");

insert into amenities (amenity) values ("Coffee");

insert into amenities (amenity) values ("Television");

insert into amenities (amenity) values ("Fridge");

insert into amenities (amenity) values ("Safe");

insert into amenities (amenity) values ("LAN");



insert into hotel_room_amenities(room_id,amenity_id) values (1,9);
insert into hotel_room_amenities(room_id,amenity_id) values (2,10);
insert into hotel_room_amenities(room_id,amenity_id) values (3,8);
insert into hotel_room_amenities(room_id,amenity_id) values (4,1);
insert into hotel_room_amenities(room_id,amenity_id) values (5,4);
insert into hotel_room_amenities(room_id,amenity_id) values (6,2);
insert into hotel_room_amenities(room_id,amenity_id) values (7,5);
insert into hotel_room_amenities(room_id,amenity_id) values (8,5);
insert into hotel_room_amenities(room_id,amenity_id) values (9,8);
insert into hotel_room_amenities(room_id,amenity_id) values (10,6);
insert into hotel_room_amenities(room_id,amenity_id) values (11,1);
insert into hotel_room_amenities(room_id,amenity_id) values (12,6);
insert into hotel_room_amenities(room_id,amenity_id) values (13,3);
insert into hotel_room_amenities(room_id,amenity_id) values (14,3);
insert into hotel_room_amenities(room_id,amenity_id) values (15,9);
insert into hotel_room_amenities(room_id,amenity_id) values (16,4);
insert into hotel_room_amenities(room_id,amenity_id) values (17,3);
insert into hotel_room_amenities(room_id,amenity_id) values (18,3);
insert into hotel_room_amenities(room_id,amenity_id) values (19,6);
insert into hotel_room_amenities(room_id,amenity_id) values (20,5);
insert into hotel_room_amenities(room_id,amenity_id) values (21,1);
insert into hotel_room_amenities(room_id,amenity_id) values (22,8);
insert into hotel_room_amenities(room_id,amenity_id) values (23,7);
insert into hotel_room_amenities(room_id,amenity_id) values (24,5);
insert into hotel_room_amenities(room_id,amenity_id) values (25,6);
insert into hotel_room_amenities(room_id,amenity_id) values (26,6);
insert into hotel_room_amenities(room_id,amenity_id) values (27,1);
insert into hotel_room_amenities(room_id,amenity_id) values (28,6);
insert into hotel_room_amenities(room_id,amenity_id) values (29,1);
insert into hotel_room_amenities(room_id,amenity_id) values (30,1);
insert into hotel_room_amenities(room_id,amenity_id) values (31,5);
insert into hotel_room_amenities(room_id,amenity_id) values (32,10);
insert into hotel_room_amenities(room_id,amenity_id) values (33,7);
insert into hotel_room_amenities(room_id,amenity_id) values (34,2);
insert into hotel_room_amenities(room_id,amenity_id) values (35,4);
insert into hotel_room_amenities(room_id,amenity_id) values (36,2);
insert into hotel_room_amenities(room_id,amenity_id) values (37,5);
insert into hotel_room_amenities(room_id,amenity_id) values (38,6);
insert into hotel_room_amenities(room_id,amenity_id) values (39,8);
insert into hotel_room_amenities(room_id,amenity_id) values (40,3);
insert into hotel_room_amenities(room_id,amenity_id) values (41,6);
insert into hotel_room_amenities(room_id,amenity_id) values (42,2);
insert into hotel_room_amenities(room_id,amenity_id) values (43,1);
insert into hotel_room_amenities(room_id,amenity_id) values (44,6);
insert into hotel_room_amenities(room_id,amenity_id) values (45,6);
insert into hotel_room_amenities(room_id,amenity_id) values (46,3);
insert into hotel_room_amenities(room_id,amenity_id) values (47,10);
insert into hotel_room_amenities(room_id,amenity_id) values (48,6);
insert into hotel_room_amenities(room_id,amenity_id) values (49,9);
insert into hotel_room_amenities(room_id,amenity_id) values (50,3);
insert into hotel_room_amenities(room_id,amenity_id) values (51,3);
insert into hotel_room_amenities(room_id,amenity_id) values (52,6);
insert into hotel_room_amenities(room_id,amenity_id) values (53,1);
insert into hotel_room_amenities(room_id,amenity_id) values (54,10);
insert into hotel_room_amenities(room_id,amenity_id) values (55,10);
insert into hotel_room_amenities(room_id,amenity_id) values (56,7);
insert into hotel_room_amenities(room_id,amenity_id) values (57,8);
insert into hotel_room_amenities(room_id,amenity_id) values (58,5);
insert into hotel_room_amenities(room_id,amenity_id) values (59,2);
insert into hotel_room_amenities(room_id,amenity_id) values (60,10);
insert into hotel_room_amenities(room_id,amenity_id) values (61,10);
insert into hotel_room_amenities(room_id,amenity_id) values (62,7);
insert into hotel_room_amenities(room_id,amenity_id) values (63,4);
insert into hotel_room_amenities(room_id,amenity_id) values (64,7);
insert into hotel_room_amenities(room_id,amenity_id) values (65,9);
insert into hotel_room_amenities(room_id,amenity_id) values (66,1);
insert into hotel_room_amenities(room_id,amenity_id) values (67,1);
insert into hotel_room_amenities(room_id,amenity_id) values (68,6);
insert into hotel_room_amenities(room_id,amenity_id) values (69,8);
insert into hotel_room_amenities(room_id,amenity_id) values (70,9);
insert into hotel_room_amenities(room_id,amenity_id) values (71,9);
insert into hotel_room_amenities(room_id,amenity_id) values (72,7);
insert into hotel_room_amenities(room_id,amenity_id) values (73,7);
insert into hotel_room_amenities(room_id,amenity_id) values (74,7);
insert into hotel_room_amenities(room_id,amenity_id) values (75,10);
insert into hotel_room_amenities(room_id,amenity_id) values (76,5);
insert into hotel_room_amenities(room_id,amenity_id) values (77,9);
insert into hotel_room_amenities(room_id,amenity_id) values (78,9);
insert into hotel_room_amenities(room_id,amenity_id) values (79,8);
insert into hotel_room_amenities(room_id,amenity_id) values (80,5);
insert into hotel_room_amenities(room_id,amenity_id) values (81,8);
insert into hotel_room_amenities(room_id,amenity_id) values (82,10);
insert into hotel_room_amenities(room_id,amenity_id) values (83,8);
insert into hotel_room_amenities(room_id,amenity_id) values (84,1);
insert into hotel_room_amenities(room_id,amenity_id) values (85,7);
insert into hotel_room_amenities(room_id,amenity_id) values (86,5);
insert into hotel_room_amenities(room_id,amenity_id) values (87,6);
insert into hotel_room_amenities(room_id,amenity_id) values (88,10);
insert into hotel_room_amenities(room_id,amenity_id) values (89,4);
insert into hotel_room_amenities(room_id,amenity_id) values (90,5);
insert into hotel_room_amenities(room_id,amenity_id) values (91,7);
insert into hotel_room_amenities(room_id,amenity_id) values (92,5);
insert into hotel_room_amenities(room_id,amenity_id) values (93,1);
insert into hotel_room_amenities(room_id,amenity_id) values (94,7);
insert into hotel_room_amenities(room_id,amenity_id) values (95,8);
insert into hotel_room_amenities(room_id,amenity_id) values (96,2);
insert into hotel_room_amenities(room_id,amenity_id) values (97,10);
insert into hotel_room_amenities(room_id,amenity_id) values (98,8);
insert into hotel_room_amenities(room_id,amenity_id) values (100,4);
insert into hotel_room_amenities(room_id,amenity_id) values (101,8);
insert into hotel_room_amenities(room_id,amenity_id) values (102,5);
insert into hotel_room_amenities(room_id,amenity_id) values (103,6);
insert into hotel_room_amenities(room_id,amenity_id) values (104,8);
insert into hotel_room_amenities(room_id,amenity_id) values (105,10);
insert into hotel_room_amenities(room_id,amenity_id) values (106,1);
insert into hotel_room_amenities(room_id,amenity_id) values (107,3);
insert into hotel_room_amenities(room_id,amenity_id) values (108,10);
insert into hotel_room_amenities(room_id,amenity_id) values (109,6);
insert into hotel_room_amenities(room_id,amenity_id) values (110,5);
insert into hotel_room_amenities(room_id,amenity_id) values (111,1);
insert into hotel_room_amenities(room_id,amenity_id) values (112,4);
insert into hotel_room_amenities(room_id,amenity_id) values (113,2);
insert into hotel_room_amenities(room_id,amenity_id) values (114,5);
insert into hotel_room_amenities(room_id,amenity_id) values (115,3);
insert into hotel_room_amenities(room_id,amenity_id) values (116,8);
insert into hotel_room_amenities(room_id,amenity_id) values (117,5);
insert into hotel_room_amenities(room_id,amenity_id) values (118,10);
insert into hotel_room_amenities(room_id,amenity_id) values (119,3);
insert into hotel_room_amenities(room_id,amenity_id) values (120,2);
insert into hotel_room_amenities(room_id,amenity_id) values (121,9);
insert into hotel_room_amenities(room_id,amenity_id) values (122,2);
insert into hotel_room_amenities(room_id,amenity_id) values (123,5);
insert into hotel_room_amenities(room_id,amenity_id) values (124,9);


insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1234,"Papadopoulos",8888,"Kostas","Kodrou",4,11520,"Athens");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1235,"Pitsiou",8548,"Elena","Kidwniou",4,11521,"Monastiraki");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1236,"Petrou",8308,"Nikitas","Skurou",3,11522,"Sudagma");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1237,"Papadopoulos",8188,"Lampros","Kaukasou",15,11523,"Athens");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1238,"Sarmas",8288,"Takis","Holly Lane",28,11524,"Thessaloniki");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1239,"Daras",8488,"Giannis","Kodrou",14,11525,"Patra");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1240,"Xrhstou",8588,"Maria","Saint",5,11526,"Olympia");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1241,"Samara",8688,"Maria","Vrilisiwn",10,11527,"Kupseli");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1242,"Iwannou",8788,"Xrhstos","Oulwf",14,11528,"Ampelokipoi");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1243,"Dimitriou",8880,"Kostas","Kupselis",25,11529,"Thhva");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1244,"Panagiotidis",8881,"Panagiotis","Kamarou",44,11530,"Kupseli");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1245,"Parellhs",8882,"Xarhs","Mavilh",4,11531,"Xalandri");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1246,"Perks",8883,"Elena","Monarxou",32,11532,"Ampelokipoi");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1247,"Patikidou",8884,"Mursini","Kastorou",24,11533,"Maroussi");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1248,"Gewrgiou",8885,"Vasiliki","Medinas",7,11534,"Euvoia");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1249,"Nikou",8886,"Petros","Kaparis",10,11535,"Khfissia");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1250,"Takidou",8887,"Xrush","Kodrou",5,11536,"Kupseli");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1251,"Mpompou",8889,"Anna","Patisiwn",9,11588,"Tzitzifies");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1252,"Siniotis",8844,"Dimitris","Gardenias",10,11589,"Maroussi");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1253,"Clooney",8833,"George","Varenas",8,11590,"Ampelokipoi");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1254,"Berg",8832,"Fotini","Misilou",9,11591,"Hraklio");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1255,"Krithou",8834,"Nikos","Kritias",10,11592,"Agios Nikolas");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1256,"Stone",8768,"Emma","Kamarou",11,11593,"Xania");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1257,"Markle",8908,"Meghan","Xaritinis",12,11594,"Rodos");
insert into employee(irs,lastname,ssn,firstname,street,num,postal_code,city) values (1258,"Witherspoon",8458,"Reese","Sardias",13,11595,"Skiathos");

insert into works(irs,hotel_id,start_date,position,finish_date) values (1234,1,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1235,2,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1236,3,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1237,4,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1238,5,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1239,6,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1240,7,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1241,8,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1242,9,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1243,10,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1244,11,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1245,12,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1246,13,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1247,14,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1248,15,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1249,16,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1250,17,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1251,18,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1252,19,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1253,20,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1254,21,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1255,22,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1256,23,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1257,24,'2017-06-17',"manager",'2019-06-27');
insert into works(irs,hotel_id,start_date,position,finish_date) values (1258,25,'2017-06-17',"manager",'2019-06-27');


