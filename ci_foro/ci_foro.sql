create database ci_foro default character set latin1 collate latin1_bin;
use ci_foro;

create table if not exists forum_cat (
  id int(11) not null auto_increment,
  nombre varchar(100) not null,
  padre int(11) not null,
  primary key (id)
) engine=myisam default charset=utf8 auto_increment=1 ;

create table if not exists forum_posts (
  id int(11) not null auto_increment,
  titulo varchar(100) not null,
  cuerpo text not null,
  fecha datetime not null,
  usuario_id int(11) not null,
  padre int(11) not null,
  primary key (id)
) engine=myisam default charset=utf8 auto_increment=1 ;