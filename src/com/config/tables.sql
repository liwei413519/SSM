/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/4/6 17:31:36                            */
/*==============================================================*/

use ssm;
drop table if exists T_MSG;

drop table if exists T_USER;

/*==============================================================*/
/* Table: T_MSG                                                 */
/*==============================================================*/
create table T_MSG
(
   T_Mid                int not null AUTO_INCREMENT,
   T_Mhead              varchar(128),
   T_Mpicture           varchar(512),
   T_Mbody              varchar(2048),
   T_Mremark            varchar(1024),
   T_Mdate              date,
   T_Mtype              int,
   T_Mread              int,
   T_Mstate             int,
   Uid                  int,
   Column_11            varchar(0),
   Column_12            varchar(0),
   Column_13            varchar(0),
   primary key (T_Mid)
);

/*==============================================================*/
/* Table: T_USER                                                */
/*==============================================================*/
create table T_USER
(
   Uid                  int not null AUTO_INCREMENT,
   Uname                varchar(64) unique,
   Upassword            varchar(64),
   Ulastlogintime       date,
   Ulogintimes          int,
   Uloginstate          int,
   Utype                int,
   Urealname            varchar(64),
   Ukey                 varchar(128),
   Uschool              varchar(128),
   Uemail               varchar(128),
   Usex                 int,
   Uheight              int,
   Uphone               varchar(128),
   Useldescribe         varchar(1024),
   Uaddress             varchar(512),
   Upicture             varchar(512),
   Uidcard              varchar(256),
   Ubirthday            date,
   Uresume              varchar(2048),
   Column_21            varchar(0),
   Column_22            varchar(0),
   Column_23            varchar(0),
   primary key (Uid)
);

alter table T_MSG add constraint FK_Reference_1 foreign key (Uid)
      references T_USER (Uid) on delete restrict on update restrict;

select * from T_MSG;
select * from T_USER;
