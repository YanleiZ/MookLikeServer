
if exists (select * from sysobjects where name='t_user')

 drop table t_user 

 go 

CREATE TABLE t_user (
  id int identity(1,1) primary key,
  username varchar(200) not NULL ,
  password varchar(200) not NULL ,
  role int not NULL ,
) 
go
insert  into t_user(username,password,role) values ('admin','admin',1);

if exists (select * from sysobjects where name='t_role')

 drop table t_role 

 go 

CREATE TABLE t_role (
  id int identity(1,1) primary key,
  name varchar(200) not NULL ,
  descp varchar(200) not NULL ,
) 
go
insert  into t_role(name,descp) values ('管理员','管理员');
insert  into t_role(name,descp) values ('用户','用户');

if exists (select * from sysobjects where name='t_member')

 drop table t_member 

 go 

CREATE TABLE t_member (
   id int identity(1,1) primary key,
  name varchar(200) not NULL ,
  sex varchar(200) not NULL ,
  age varchar(200) not NULL ,
  tel varchar(200) not NULL ,
  address varchar(200) not NULL ,
  email varchar(200) not NULL ,
  users int not NULL ,
)
go
insert  into t_role(name,descp) values ('管理员','管理员');

if exists (select * from sysobjects where name='t_admins')

 drop table t_admins 

 go 

CREATE TABLE t_admins (
   id int identity(1,1) primary key,
  name varchar(200) not NULL ,
  sex varchar(200) not NULL ,
  age varchar(200) not NULL ,
  tel varchar(200) not NULL ,
  address varchar(200) not NULL ,
  email varchar(200) not NULL ,
  users int not NULL ,
)
go

if exists (select * from sysobjects where name='t_course')

 drop table t_course 

 go 

CREATE TABLE t_course (
   id int identity(1,1) primary key,
  name varchar(200) not NULL ,
  descp varchar(200) not NULL ,
)
go

if exists (select * from sysobjects where name='t_ppts')

 drop table t_ppts 

 go 

CREATE TABLE t_ppts (
   id int identity(1,1) primary key,
  name varchar(200) not NULL ,
  settime datetime not NULL ,
  course int not NULL ,
  descp varchar(200) not NULL ,
  docts varchar(200) not NULL ,
  content varchar(200) not NULL ,
  img varchar(200) not NULL ,
)
go

if exists (select * from sysobjects where name='t_videos')

 drop table t_videos 

 go 

CREATE TABLE t_videos (
   id int identity(1,1) primary key,
  name varchar(200) not NULL ,
  settime datetime not NULL ,
  course int not NULL ,
  descp varchar(200) not NULL ,
  docts varchar(200) not NULL ,
  content varchar(200) not NULL ,
  img varchar(200) not NULL ,
)
go

if exists (select * from sysobjects where name='t_words')

 drop table t_words 

 go 

CREATE TABLE t_words (
   id int identity(1,1) primary key,
  name varchar(200) not NULL ,
  settime datetime not NULL ,
  course int not NULL ,
  descp varchar(200) not NULL ,
  docts varchar(200) not NULL ,
  content varchar(200) not NULL ,
  img varchar(200) not NULL ,
)
go

if exists (select * from sysobjects where name='t_tests')

 drop table t_tests 

 go 

CREATE TABLE t_tests (
   id int identity(1,1) primary key,
  name varchar(200) not NULL ,
  settime datetime not NULL ,
  course int not NULL ,
  descp varchar(200) not NULL ,
  timucontent varchar(200) not NULL ,
  daancontent varchar(200) not NULL ,
)
go

if exists (select * from sysobjects where name='t_doneTest')

 drop table t_doneTest 

 go 

CREATE TABLE t_doneTest (
   id int identity(1,1) primary key,
  member int not NULL ,
  tests int not NULL ,
  settime datetime not NULL ,
)
go

if exists (select * from sysobjects where name='t_index')

 drop table t_index 

 go 

CREATE TABLE t_index (
   id int identity(1,1) primary key,
  course int not NULL ,
  ppts int not NULL ,
  videos int not NULL ,
  words int not NULL ,
  tests int not NULL ,
)
go
