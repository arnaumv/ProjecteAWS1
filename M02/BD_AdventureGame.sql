/* 1_Create_DB: Es crearan totes les taules en qüestió amb els diferents
atributs, sense cap mena de restricció. */

create database AdventureGame;

use AdventureGame;

create table HISTORY(
id_history INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name varchar(40) NULL UNIQUE,
data_for_each_item varchar(20) NULL,
decision_making varchar(30) NULL
);

drop table HISTORY;

Create table GAME(
id_game int auto_increment primary key,
save_date varchar(40) not null
);
drop table USER;

create table ADVENTURE(
id_adventure int auto_increment primary key,
name varchar(30)  null unique,
description varchar(40)  null,
get_replayadventures varchar(30) null
);

create table USER(
id_user int auto_increment primary key,
username varchar(30)  null unique,
password varchar(40)  null
);

create table STEPADVENTURE(
id_setp_adventure int auto_increment primary key,
description varchar(40)  null unique,
finalstep varchar(20)  null
); 

create table CHARACTERS(
id_character int auto_increment primary key,
name varchar(30)  null unique,
description varchar(45)  null
);

drop table CHARACTERS;

create table OPTIONS(
id_option int auto_increment primary key,
description varchar(40)  null unique,
nextstep varchar(30)  null,
answer varchar(25) null
);

drop table OPTIONS;

/* 2_Alter_Table: En aquest s'afegiran les diferents restriccions de les taules
i els atributs, mitjançant sintaxis alter sempre que sigui possible.
Especificarem PKs, FKs, Campos Unique, NULL, Default ... */

ALTER TABLE HISTORY add column id_game int;

ALTER TABLE HISTORY
ADD CONSTRAINT FK_HISTORYS_GAME
FOREIGN KEY (id_game) REFERENCES GAME (id_game);

ALTER TABLE HISTORY
DROP FOREIGN KEY FK_HISTORYS_GAME;

/*ALTER TABLE Historys
DROP FOREIGN KEY FK_HISTORYS_GAME;*/

alter table ADVENTURE add column id_game int;

alter table ADVENTURE 
add constraint FK_ADVENTURE_GAME
foreign key (id_game) references GAME (id_game);

/*alter table USER add column id_game int;

alter table USER 
add constraint FK_USER_GAME
foreign key (id_game) references GAME (id_game);*/


alter table CHARACTERS add column id_adventure int;

alter table CHARACTERS 
add constraint FK_CHARACTERS_ADVENTURE
foreign key (id_adventure) references ADVENTURE (id_adventure);


alter table STEPADVENTURE add column id_adventure int;

alter table STEPADVENTURE 
add constraint FK_STEPADVENTURE_ADVENTURE
foreign key (id_adventure) references ADVENTURE (id_adventure);

alter table OPTIONS add column id_step_aventure int;

alter table OPTIONS
add constraint FK_OPTIONS_STEPADVENTURE
foreign key (id_step_aventure) references STEPADVENTURE (id_step_aventure);

ALTER TABLE GAME add column id_user int;

ALTER TABLE GAME
ADD CONSTRAINT FK_GAME_USER
FOREIGN KEY (id_user) REFERENCES USER (id_user);


/* 4_*Insert_data: Inserció de dades d'exemple per a jugar.
Totes les taules han de contenir atributs de control (fechacreacion,
usuariocreacion, fechamodificacion, usuariomodificacion), que s'emplenarà
sempre que es faci alguna modificació o inserció 
Les Primary Keys tindran la següent nomenclatura: id_nombretabla, seran
autoincrementales i no han d'acceptar enters negatius.
Les Foreign Key tindran la següent nomenclatura: fk_tablaorigen_tabladestino
Totes les columnes fechamodificacion i usuariomodificacion, permeten nuls
 */
 
 INSERT INTO ADVENTURE VALUES ();
 
 INSERT INTO ADVENTURE VALUES (1,'El bosque Maldito','%personaje% está en el inicio del Bosque Maldito,
 Donde se encuentra 3 caminos ... ¿por donde irá?','Escoge el camino de la izquierda, a lo lejos se ve un puente colgante.,','Decidido, piensas que es el camino más rapido Para atravesar el bosque.' );
 
 
 
 INSERT INTO ADVENTURE VALUES ('FechaCreacion','UsuarioCreacion','FechaModificacion','UsuarioModificacion' );





INSERT INTO CHARACTERS VALUES ();
INSERT INTO HISTORY VALUES ();
INSERT INTO GAME VALUES ();
INSERT INTO USER VALUES ();
INSERT INTO OPTIONS VALUES ();
INSERT INTO STEPADVENTURE VALUES ();

INSERT INTO fk_history_game VALUES ();
INSERT INTO fk_history_game VALUES ();












 