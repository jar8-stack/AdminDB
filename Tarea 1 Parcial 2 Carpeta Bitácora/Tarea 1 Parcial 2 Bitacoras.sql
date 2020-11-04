create table antojitos (id_Antojito int (20) not null primary key, descripción varchar (20), precio varchar (20))engine=innodb;

create table bitacora_Antojitos (id_bitacora int (30) auto_increment primary key, id_Antojito int (20), nombre_nuevo varchar (20), nombre_viejo varchar (20), 
								precio_nuevo varchar (20), precio_viejo varchar (20), usuario varchar (30), 
								fecha datetime, accion varchar (15))engine=INNODB;

create trigger insertar_Antojito after insert
    on antojitos
    for each row
    insert into bitacora_Antojitos (id_Antojito, nombre_nuevo, precio_nuevo, usuario, fecha, accion) values (new.id_Antojito, new.descripción, new.precio, user(), now(), 'Inserto');


create trigger eliminar_Antojito after delete
    on antojitos
    for each row
    insert into bitacora_Antojitos (id_Antojito, nombre_viejo, precio_viejo, usuario, fecha, accion) values (old.id_Antojito, old.descripción, old.precio, user(), now(), 'Elimino');

create trigger actualizar_Antojitos after update
    on antojitos
    for each row
    insert into bitacora_Antojitos (id_Antojito, nombre_nuevo, nombre_viejo, precio_nuevo, precio_viejo, usuario, fecha, accion) 
	 values (old.id_Antojito, new.descripción, old.descripción, new.precio, old.precio, user(), now(), 'Modifico');



