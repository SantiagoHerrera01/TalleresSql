SET DATEFORMAT ymd;
GO

create table compañia(
comnit varchar(11) primary key not null,
comnombre varchar(30) not null,
comañofun int not null,
comreplegal varchar (100)
)
create table TiposAutomotores(
auttipo int primary key not null,
autnombre varchar(20) not null
)


create table Automotores(
autoplaca varchar(6) primary key not null,
automarca varchar(30) not null,
autotipo int foreign key (autotipo) references TiposAutomotores (auttipo),
automodelo int not null,
autopasajeros int not null,
autocilindraje int not null,
autonumchasis varchar (20) not null
)

create table aseguramientos(
asecodigo int primary key not null,
asefechainicio date not null,
asefechaexpiracion date not null,
asevalorasegurado int not null,
aseestado varchar(20) not null,
asecosto int not null,
aseplaca varchar(6) foreign key (aseplaca) references Automotores (autoplaca)
)


create table incidentes(
incicodigo int primary key not null,
incifecha date not null,
inciplaca varchar(6) foreign key (inciplaca) references Automotores (autoplaca), 
incilugar varchar(40) not null,
incicantheridos int not null,
incicanfatalidades int not null,
incicanautosinvloucrados int not null
)
SET DATEFORMAT ymd;
GO

insert into compañia(comnit,comnombre,comañofun,comreplegal)
values 
('800890890-2','Seguros Atlantida','1998','Carlos López'),
('899999999-1','AseguradoraRojas','1991','Luis Fernando Rojas'),
('899999999-5','Seguros del Estado','2001','María Margarita Pérez')

insert into TiposAutomotores (auttipo,autnombre)
values 
('1','Automóviles'),
('2','Camperos'),
('3','Camiones')

insert into Automotores (autoplaca,automarca,autotipo,automodelo,autopasajeros,autocilindraje,autonumchasis)
values 
('FLL420','chevrolet corsa','1','2003','5','1400','wywzzz167 kk009d25'),
('DKZ820','renault stepway','1','2008','5','1600','wywwzz157 kk009d45'),
('KJQ920','kia sportage','2','2009','7','2000','wywzzz157 kk009d25')

insert into aseguramientos (asecodigo,asefechainicio,asefechaexpiracion,asevalorasegurado,aseestado,asecosto,aseplaca)
values
('1','2012-09-30','2013-09-30','30000000','Vigente','500000','FLL420'),
('2','2012-09-27','2013-09-27','35000000','Vigente','600000','DKZ820'),
('3','2011-09-28','2012-09-28','50000000','Vigente','800000','KJQ920')

insert into incidentes(incicodigo,incifecha,inciplaca,incilugar,incicantheridos,incicanfatalidades,incicanautosinvloucrados)
values 
('1','2012-09-30','DKZ820','Bucaramanga','0','0','2'),
('2','2012-09-27','FLL420','Girón','1','0','1'),
('3','2011-09-28','FLL420','Bucaramanga','1','0','2')



select * from compañia where comañofun >= 1991 and comañofun <= 1998

select autoplaca,automodelo,automarca,autopasajeros,autocilindraje,asecosto,asevalorasegurado  from Automotores,aseguramientos,TiposAutomotores where autoplaca=aseplaca and auttipo=autotipo and asefechaexpiracion <= '2013-09-01' and asefechaexpiracion >= '2013-10-31'

select incifecha,inciplaca,incilugar,asecodigo,asefechainicio,asevalorasegurado from incidentes,aseguramientos where inciplaca=aseplaca and incifecha ='2012-09-30'

select incicantheridos,autoplaca,incilugar,incifecha,asefechainicio,asecosto,aseestado,asevalorasegurado from incidentes,aseguramientos,Automotores where inciplaca=aseplaca and autoplaca = inciplaca and incicantheridos= 1

select * from aseguramientos where asecosto in(select max(asecosto) from aseguramientos)

select incicanautosinvloucrados,inciplaca,incifecha,asevalorasegurado,aseestado from incidentes,aseguramientos where inciplaca= aseplaca and incicanautosinvloucrados in(select MIN(incicanautosinvloucrados)from incidentes)

select inciplaca,incifecha,incilugar,incicantheridos,asefechainicio, asefechaexpiracion,asevalorasegurado from incidentes,aseguramientos where inciplaca=aseplaca and inciplaca= 'fll420'

select * from compañia where comnit= '899999999-5'

select * from aseguramientos,Automotores where aseplaca= autoplaca and asevalorasegurado in(select max(asevalorasegurado)from aseguramientos)

select autoplaca,automarca,automodelo,autocilindraje,asefechainicio,asefechaexpiracion from Automotores,aseguramientos where autoplaca=aseplaca and asecodigo=1