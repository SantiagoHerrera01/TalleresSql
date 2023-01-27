create table Profesor(
	doc_prof varchar(11) primary key not null,
	nom_prof varchar(30) not null,
	ape_prof varchar(30) not null,
	cate_prof int not null,
	sal_prof int not null
	)

CREATE TABLE curso(
	cod_curs varchar(11) primary key not null,
	nom_curs varchar(100),
	horas_cur int not null,
	valor_cur int not null
	)

create table Estudiante(
	doc_est varchar(11) primary key not null,
	nom_est varchar(30) not null,
	ape_est varchar(30) not null,
	edad_est int not null,
)

create table Estudiantexcurso(
cod_cur_estcur varchar(11) foreign key (cod_cur_estcur) references curso (cod_curs),
doc_est_estcur varchar (11) foreign key (doc_est_estcur)  references Estudiante (doc_est),
fec_ini_estcur date,
)

insert into Profesor(doc_prof,nom_prof,ape_prof,cate_prof,sal_prof)
values
('63502720','Martha','Rojas','2','690000'),
('91216904','Carlos','Pérez','3','950000'),
('13826789','Maritza','Angarita','1','550000'),
('1098765789','Alejandra','Torres','4','1100000')


insert into curso (cod_curs,nom_curs,horas_cur,valor_cur)
values
('149842','Fundamentos de bases de datos','40','500000'),
('250067','Fundamentos de SQL','20','700000'),
('289011','Manejo de MySQL','45','550000'),
('345671','Fundamentals of oracle','60','3000000')

insert into Estudiante (doc_est,nom_est,ape_est,edad_est)
values
('63502720','María','Pérez','22'),
('91245678','Carlos José','López','18'),
('1098098097','Jonatan','Ardila','31'),
('1098765679','Carlos','Marténez','42')

insert into Estudiantexcurso (cod_cur_estcur,doc_est_estcur,fec_ini_estcur)
values 
('289011','1098765679','01-02-2011'),
('250067','63502720','01-03-2011'),
('289011','1098098097','01-02-2011'),
('345671','63502720','01-04-2011')

select nom_prof,sal_prof,cate_prof from Profesor order by cate_prof

select nom_curs from curso where valor_cur > 500000

select count(*) from Estudiante where edad_est > 22

select nom_est,ape_est,edad_est from Estudiante where edad_est in(select MIN(edad_est) from estudiante)

select avg(valor_cur)from curso where horas_cur > 40

select avg(sal_prof) from Profesor where cate_prof = 1

select cod_curs,nom_curs horas_cur,valor_cur from curso order by valor_cur

select nom_prof from Profesor where sal_prof in(select min(sal_prof) from profesor) 

select doc_est,nom_est,nom_curs from Estudiante,curso,Estudiantexcurso where cod_curs = cod_cur_estcur and doc_est = doc_est_estcur and fec_ini_estcur= '01-02-2011'

select doc_prof,nom_prof,sal_prof from Profesor where sal_prof > 500000 AND sal_prof <700000