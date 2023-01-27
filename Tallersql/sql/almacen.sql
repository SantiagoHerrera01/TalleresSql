Create table Productos(
	codP int primary key not null,
	nombre_producto varchar(50) not null,
	cantidad int not null,
	precio_costo int not null,
	precio_venta int not null,
);

create table categorias(
	codigo_cat int primary key not null,
	categoria varchar not null,
);

create table vendedor(
	codigoV int primary key not null,
	nombre_empleado varchar (50) not null,
	Documentoid int not null,
	salario float not null
	);

create table cliente(
	cod_cliente int primary key not null,
	nom_client varchar(50) not null,
	cc int not null,
	direccion varchar not null,
);

create table zona(
	cod_zona int primary key not null,
	ubicacion varchar not null,
);

create table secundary_table(
Cod_venta int primary key,
cod_vendedor int  foreign key (cod_vendedor) references vendedor (codigoV) not null,
cod_cliente int foreign key (cod_cliente) references cliente (cod_cliente) not null,
cod_producto int foreign key (cod_producto) references productos (codP),
cod_categoria int foreign key (cod_categoria) references categorias (codigo_cat),
cantidadV int foreign key (cantidadV) references productos (codP),
cod_zona int foreign  key (cod_zona) references zona (cod_zona)
);

insert into Productos (nombre_producto,codP,cantidad,precio_costo,precio_venta)
values 
('papas tomate','2020','12','1000','2100'),
('papas sisa','2021','13','1000','2200'),
('papas nonas','2022','14','1000','2300'),
('papas asie','2023','15','1000','2400'),
('papas limon','2024','16','1000','2500'),
('papas cebolla','2025','17','1000','2600'),
('papas bbq','2026','18','1000','2700'),
('papas no','2027','19','1000','2800'),
('papas si','2028','20','1000','2900'),
('papas opa','2029','21','1000','3000')


insert into categorias (codigo_cat,categoria)
values ('1578','igiene personal'),
('0301','Bebes')

insert into vendedor (codigoV,nombre_empleado,Documentoid,salario)
values 
('0106','Santiago Castañeda','1000535139','20000000'),
('1904','Lina marcela socarrás alvarez ','1001032023','15000000'),
('5867','arnoldo federico ñerosongo correa','23435689','1000000'),
('5867','el tino asprilla','23435681','1500000'),
('5867','italico ferrati','23435686','1200000')

insert into zona (cod_zona,ubicacion)
values 
('189865','Chigorodo'),
('25923','Medellín'),
('10902','ansofagasta'),
('290194','bogota')

insert into cliente (cod_cliente,nom_client,cc,direccion)
values
('1','David Jesus mosquera','87679801','Cra 64A #111c-2'),
('23','Jhon Jairo Javier jaranillo','167654322','calle 45c #70-40'),
('25','logan arturo fernandez','910234589','calle66 #50-29')