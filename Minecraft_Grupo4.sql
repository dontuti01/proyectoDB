drop database Minecraft;
Create database Minecraft;
-- Tutiven//
Use minecraft;
CREATE TABLE usuario(
nickname varchar(30) primary key,
danio int,
barraEstamina Double,
velocidad double,
vida double
);
CREATE TABLE herramienta(
id_tools int primary key,
danio int,
descripcion varchar(30)
);
CREATE TABLE usuario_uso_herramienta(
nickname varchar(30),
id_tools int,
restaEstamina double,
foreign key(nickname) references usuario(nickname),
foreign key(id_tools) references herramienta(id_tools)
);
CREATE TABLE duracion_herramienta(
uso_herramienta int,
restarUso int,
herramienta int,
foreign key(herramienta) references herramienta(id_tools)
);
CREATE TABLE mob(
id_mob varchar(6) primary key,
Descripcion varchar(20),
danio int,
velocidad int,
vida int,
estado varchar(30)
);
CREATE TABLE ataca(
restaEstamina int,
nickname varchar(30),
id_mob varchar(6),
foreign key(nickname) references usuario(nickname),
foreign key(id_mob) references mob(id_mob)
);
CREATE TABLE restaura(
id_food varchar(6),
nickname varchar(30),
foreign key(nickname) references usuario(nickname),
foreign key(id_food) references comida(id_food)
);
CREATE TABLE comida(
id_food varchar(6) primary key,
efecto varchar(20),
aumentoEstamina int,
estado int,
descripcion varchar(30)
);
alter table comida modify estado varchar(30);
CREATE TABLE uso_item(
dropea varchar(30),
nickname varchar(30),
id_item varchar(6),
foreign key(nickname) references usuario(nickname),
foreign key(id_item) references item(id_item)
);
CREATE TABLE bloque(
id_bloque varchar(6) primary key,
nombre_bloque varchar(20)
);
CREATE TABLE uso_bloque(
dropea varchar(6),
nickname varchar(30),
id_bloque varchar(6),
foreign key(nickname) references usuario(nickname),
foreign key(id_bloque) references bloque(id_bloque)
);
ALTER TABLE uso_bloque modify dropea varchar(30);
CREATE TABLE item(
id_item varchar(6) primary key,
nombre varchar(20)
);
CREATE TABLE bloque_item(
prob_drop double,
id_bloque varchar(6),
id_item varchar(6),
foreign key(id_bloque) references bloque(id_bloque),
foreign key(id_item) references item(id_item)
);
-- Tutiven//



-- //GARCIA
Create Table mundo(
semilla varchar(12) primary key,
modoJuego varchar (30)
);
create table mundo_usuario(
usuario varchar(8),
semilla varchar(12),
foreign key(usuario) references usuario(nickname),
foreign key(semilla) references mundo(semilla),
descripcion varchar(30)
);
create table pocion(
id_potion varchar(6) primary key,
efecto int,
descripcion varchar(30),
duracion_seg int
);

create table bebe(
id_pocion varchar(6),
nickname varchar(8),
efecto int,
foreign key(id_pocion) references pocion(id_potion),
foreign key(nickname) references usuario(nickname)
);

create table bioma(
nombreBioma varchar(12),
semilla varchar(12),
descripcion varchar(30),
foreign key(semilla) references mundo(semilla)
);

create table armadura(
id_armadura varchar(6) primary key,
proteccion int,
descripcion varchar(30),
usos_limites int(100)
);

create table duracion_armadura(
armadura varchar(6),
Uso_armadura int,
restar_uso int, 
foreign key (armadura) references armadura(id_armadura)
);

-- Garcia//
-- //Tutiven
Use minecraft;
INSERT INTO usuario values('Dontuti',1,10,10,10);
INSERT INTO usuario values('Noloko',1,10,10,10);
INSERT INTO usuario values('Vigarome',1,10,10,10);
INSERT INTO usuario values('idolo123',1,10,10,10);
INSERT INTO usuario values('KM',1,10,10,10);
INSERT INTO usuario values('User',1,10,10,10);
INSERT INTO usuario values('AFK',1,10,10,10);
INSERT INTO usuario values('TryHard',1,10,10,10);
INSERT INTO usuario values('aiub',1,10,10,10);
INSERT INTO usuario values('Nashe',1,10,10,10);
INSERT INTO herramienta values(1,1,'pico de madera');
INSERT INTO herramienta values(2,2,'hacha de madera');
INSERT INTO herramienta values(3,2.5,'pico de piedra');
INSERT INTO herramienta values(4,3,'hacha de piedra');
INSERT INTO herramienta values(5,2,'pico de hierro');
INSERT INTO herramienta values(6,4,'hacha de hierro');
INSERT INTO herramienta values(7,2,'pico de oro');
INSERT INTO herramienta values(8,3,'hacha de oro');
INSERT INTO herramienta values(9,3,'pico de diamante');
INSERT INTO herramienta values(10,7,'hacha de diamante');
INSERT INTO duracion_herramienta values(1,1,5);
INSERT INTO duracion_herramienta values(1,2,7);
INSERT INTO duracion_herramienta values(1,3,7);
INSERT INTO duracion_herramienta values(1,4,8);
INSERT INTO duracion_herramienta values(1,5,8);
INSERT INTO duracion_herramienta values(1,6,6);
INSERT INTO duracion_herramienta values(1,7,6);
INSERT INTO duracion_herramienta values(1,8,7);
INSERT INTO duracion_herramienta values(1,9,7);
INSERT INTO duracion_herramienta values(1,10,7);
INSERT INTO usuario_uso_herramienta values('Dontuti',1,0.5);
INSERT INTO usuario_uso_herramienta values('Noloko',2,1);
INSERT INTO usuario_uso_herramienta values('Vigarome99',4,1);
INSERT INTO usuario_uso_herramienta values('Dontuti',4,1);
INSERT INTO usuario_uso_herramienta values('KM',5,5);
INSERT INTO usuario_uso_herramienta values('AFK',3,1);
INSERT INTO usuario_uso_herramienta values('aiub',5,2);
INSERT INTO usuario_uso_herramienta values('Nahe',5,1);
INSERT INTO usuario_uso_herramienta values('Vigarome',5,1);
INSERT INTO usuario_uso_herramienta values('Dontuti',5,1);
INSERT INTO mob values('Mb0000','creeper',4,1,5,"explosivo");
INSERT INTO mob values('Mb0001','zombie',1,1,3,"peligroso");
INSERT INTO mob values('Mb0002','esqueleto',1,2,4,"peligroso");
INSERT INTO mob values('Mb0003','araña',2,1,5,"peligroso");
INSERT INTO mob values('Mb0004','aldeano',0,3,6,"pasivo");
INSERT INTO mob values('Mb0005','vaca',0,3,4,"pasivo");
INSERT INTO mob values('Mb0006','obeja',0,2,4,"pasivo");
INSERT INTO mob values('Mb0007','cerdo',0,2,4,"pasivo");
INSERT INTO mob values('Mb0008','golem de Hierro',9,1,15,"peligroso");
INSERT INTO mob values('Mb0009','gato',0,4,3,"pasivo");
INSERT INTO ataca values(1,'Dontuti',"Mb0005");
INSERT INTO ataca values(1,'Noloko',"Mb0001");
INSERT INTO ataca values(1,'',"Mb0005");
INSERT INTO ataca values(1,'Vigarome',"Mb0005");
INSERT INTO ataca values(1,'Noloko',"Mb0006");
INSERT INTO ataca values(1,'Dontuti',"Mb0004");
INSERT INTO ataca values(1,'Vigarome',"Mb0005");
INSERT INTO ataca values(1,'Dontuti',"Mb0002");
INSERT INTO ataca values(1,'Noloko',"Mb0001");
INSERT INTO ataca values(1,'Dontuti',"Mb0005");
-- Tutiven//
-- //Dominguez
INSERT INTO comida values('F00000',"recupera estamina",1,"poco",'pan');
INSERT INTO comida values('F00001',"recupera estamina",2,"poco",'papa');
INSERT INTO comida values('F00002',"recupera estamina",4,"medio",'chuleta');
INSERT INTO comida values('F00003',"recupera estamina",2,"poco",'calabaza');
INSERT INTO comida values('F00004',"recupera estamina",5,"medio",'pollo');
INSERT INTO comida values('F00005',"recupera estamina",7,"mucho",'manzana dorada');
INSERT INTO comida values('F00006',"recupera estamina",3,"poco",'zanahoria');
INSERT INTO comida values('F00007',"recupera estamina",2,"poco",'setas');
INSERT INTO comida values('F00008',"recupera estamina",6,"mucho",'sopa de setas');
INSERT INTO comida values('F00009',"recupera estamina",4,"medio",'carne de cordero');
INSERT INTO restaura values('F00002','Dontuti');
INSERT INTO restaura values('F00004','Noloko');
INSERT INTO restaura values('F00007','Dontuti');
INSERT INTO restaura values('F00006','Vigarome');
INSERT INTO restaura values('F00004','Vigarome');
INSERT INTO restaura values('F00005','Noloko');
INSERT INTO restaura values('F00006','Dontuti');
INSERT INTO restaura values('F00002','User');
INSERT INTO restaura values('F00008','Vigarome');
INSERT INTO restaura values('F00004','Noloko');
INSERT INTO item values('I00001','piedra');
INSERT INTO item values('I00002','carbon');
INSERT INTO item values('I00003','tierra');
INSERT INTO item values('I00004','tronco');
INSERT INTO item values('I00005','madera');
INSERT INTO item values('I00006','iron');
INSERT INTO item values('I00007','diamante');
INSERT INTO item values('I00008','oro');
INSERT INTO item values('I00009','semillas');
INSERT INTO item values('I00000','redstone');
INSERT INTO uso_item values('tronco','Dontuti','I00004');
INSERT INTO uso_item values('diamante','Noloko','I00007');
INSERT INTO uso_item values('tierra','Vigarome','I00003');
INSERT INTO uso_item values('redstone','Dontuti','I00000');
INSERT INTO uso_item values('madera','Vigarome','I00005');
INSERT INTO uso_item values('piedra','Dontuti','I00001');
INSERT INTO uso_item values('iron','User','I00006');
INSERT INTO uso_item values('oro','Dontuti','I00008');
INSERT INTO uso_item values('iron','Noloko','I00006');
INSERT INTO uso_item values('tierra','Vigarome','I00003');
INSERT INTO bloque values('B00001','bloque de tronco');
INSERT INTO bloque values('B00002','bloque de piedra');
INSERT INTO bloque values('B00003','bloque de iron');
INSERT INTO bloque values('B00004','bloque de redstone');
INSERT INTO bloque values('B00005','bloque de diamante');
INSERT INTO bloque values('B00006','bloque de carbon');
INSERT INTO bloque values('B00007','bloque de oro');
INSERT INTO bloque values('B00008','bloque de madera');
INSERT INTO bloque values('B00000','bloque de tierra');
INSERT INTO uso_bloque values('bloque de tronco','Dontuti','B00001');
INSERT INTO uso_bloque values('bloque de piedra','Noloko','B00002');
INSERT INTO uso_bloque values('bloque de iron','Vigarome','B00003');
INSERT INTO uso_bloque values('bloque de redstone','Noloko','B00004');
INSERT INTO uso_bloque values('bloque de diamante','User','B00005');
INSERT INTO uso_bloque values('bloque de carbon','Dontuti','B00006');
INSERT INTO uso_bloque values('bloque de oro','Vigarome','B00007');
INSERT INTO uso_bloque values('bloque de madera','User','B00008');
INSERT INTO uso_bloque values('bloque de tierra','Vigarome','B00000');
INSERT INTO bloque_item values(1,'B00001','I00004');
INSERT INTO bloque_item values(1,'B00002','I00001');
INSERT INTO bloque_item values(1,'B00003','I00006');
INSERT INTO bloque_item values(1,'B00004','I00000');
INSERT INTO bloque_item values(1,'B00005','I00007');
INSERT INTO bloque_item values(1,'B00006','I00002');
INSERT INTO bloque_item values(1,'B00007','I00008');
INSERT INTO bloque_item values(1,'B00008','I00005');
INSERT INTO bloque_item values(1,'B00000','I00003');
-- Dominguez//

-- //Garcia

-- Mundo
INSERT INTO mundo values('w_garo','modo supervicencia, > cant mob');
INSERT INTO mundo values('w_asesino','modo supervicencia, > cant mob');
INSERT INTO mundo values('w_relax','modo tranquilo, 0 cant mob');
INSERT INTO mundo values('w_Tutiven','mundo de Tutiven');
INSERT INTO mundo values('w_pasivo','mundo relax con mob');
INSERT INTO mundo values('w_constr','mundo para construir');
-- Usuario_Mundo
INSERT INTO mundo_usuario values('Dontuti','w_garo','Don Tuti up W_garo');
INSERT INTO mundo_usuario values('KM','w_garo','Don KM into W_garo');
INSERT INTO mundo_usuario values('idolo123','w_garo','idolo123 into W_garo');
INSERT INTO mundo_usuario values('Vigarome','w_garo','Vigarome99 into W_garo');
INSERT INTO mundo_usuario values('Noloko','w_garo','Noloko into W_garo');

INSERT INTO mundo_usuario values('Dontuti','w_asesino','Don Tuti into w_asesino');
INSERT INTO mundo_usuario values('KM','w_asesino','Don KM into w_asesino');
INSERT INTO mundo_usuario values('idolo123','w_asesino','idolo123 into w_asesino');
INSERT INTO mundo_usuario values('Vigarome','w_asesino','Vigarome99 into w_asesino');
INSERT INTO mundo_usuario values('Noloko','w_asesino','Noloko into w_asesino');

INSERT INTO mundo_usuario values('Dontuti','w_relax','Don Tuti into w_relax');
INSERT INTO mundo_usuario values('KM','w_relax','Don KM into w_relax');
INSERT INTO mundo_usuario values('idolo123','w_relax','idolo123 into w_relax');
INSERT INTO mundo_usuario values('Vigarome','w_relax','Vigarome99 into w_relax');
INSERT INTO mundo_usuario values('Noloko','w_relax','Noloko into w_relax');
-- Pocion
INSERT INTO pocion values('p00000',15,'debilidad',3);
INSERT INTO pocion values('p00001',18,'debilidad_ext',5);
INSERT INTO pocion values('p00002',19,'fuerza',8);
INSERT INTO pocion values('p00003',14,'fuerza_ext',11);
INSERT INTO pocion values('p00004',17,'fuerza 2',10);
INSERT INTO pocion values('p00005',21,'regeneracion',8);
INSERT INTO pocion values('p00006',32,'regeneracion_ext',11);
INSERT INTO pocion values('p00007',45,'regeneracion 2',10);
INSERT INTO pocion values('p00008',28,'rapidez',4);
INSERT INTO pocion values('p00009',32,'rapidez_ext',8);
-- bebe
INSERT INTO bebe values('p00000','Dontuti',15);
INSERT INTO bebe values('p00000','KM',15);
INSERT INTO bebe values('p00000','idolo123',15);
INSERT INTO bebe values('p00000','Vigarome',15);
INSERT INTO bebe values('p00000','Noloko',15);
INSERT INTO bebe values('p00001','Dontuti',18);
INSERT INTO bebe values('p00002','KM',18);
INSERT INTO bebe values('p00003','idolo123',18);
INSERT INTO bebe values('p00001','Vigarome',18);
INSERT INTO bebe values('p00002','Noloko',18);
-- Bioma 
INSERT INTO bioma values('nevados','w_garo','w_garo en mundo nevado');
INSERT INTO bioma values('frios','w_garo','w_garo en mundo frio');
INSERT INTO bioma values('temperatura','w_garo','w_garo en mundo caliente');
INSERT INTO bioma values('seco','w_garo','w_garo en mundo seco');
INSERT INTO bioma values('oceanico','w_garo','w_garo en mundo oceanico');
INSERT INTO bioma values('nevados','w_asesino','w_asesino en mundo nevado');
INSERT INTO bioma values('frios','w_asesino','w_asesino en mundo frio');
INSERT INTO bioma values('temperatura','w_asesino','w_asesino en mundo caliente');
INSERT INTO bioma values('seco','w_Tutiven','w_Tutiven en mundo seco');
INSERT INTO bioma values('oceanico','w_Tutiven','w_Tutiven en mundo oceanico');
-- Armadura
insert INTO armadura values('T00000',15,'Casco de cuero',32);
INSERT INTO armadura values('T00001',16,'Peto de cuero',30);
INSERT INTO armadura values('T00002',17,'Grebas de cuero',29);
INSERT INTO armadura values('T00003',10,'Botas de cuero',28);
insert INTO armadura values('T00004',25,'Casco de oro',37);
INSERT INTO armadura values('T00005',21,'Peto de oro',35);
INSERT INTO armadura values('T00006',22,'Grebas de oro',34);
INSERT INTO armadura values('T00007',15,'Botas de oro',33);
insert INTO armadura values('T00008',30,'Casco de malla',42);
INSERT INTO armadura values('T00009',26,'Peto de malla',40);
INSERT INTO armadura values('T00010',28,'Grebas de malla',39);
INSERT INTO armadura values('T00011',20,'Botas de malla',38);
-- Duracion Armadura
INSERT INTO duracion_armadura values('T00000',5,3);
INSERT INTO duracion_armadura values('T00002',2,1);
INSERT INTO duracion_armadura values('T00001',5,0);
INSERT INTO duracion_armadura values('T00003',8,3);
INSERT INTO duracion_armadura values('T00004',12,3);
INSERT INTO duracion_armadura values('T00005',15,4);
INSERT INTO duracion_armadura values('T00006',35,2);
INSERT INTO duracion_armadura values('T00008',2,1);
INSERT INTO duracion_armadura values('T00011',1,0);

-- Comprobaciones
create view vista_nicknames as
SELECT nickname
FROM usuario;

create view vista_usuariosConA as
SELECT nickname,count(nickname) asconteoUsuariosA
FROM usuario
where nickname like 'A%'
group by nickname;

create view vista_aumentoEstamina as
SELECT usr.nickname, sum(food.aumentoEstamina)+usr.barraEstamina as Nueva_estamina
FROM usuario as usr, comida as food, restaura as rest
where usr.nickname=rest.nickname and rest.id_food=food.id_food and usr.nickname like 'noloko';

-- Vistas

SELECT *
FROM vista_nicknames;

SELECT *
FROM vista_usuariosConA;

SELECT *
FROM vista_aumentoEstamina;



