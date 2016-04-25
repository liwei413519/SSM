/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/4/6 17:31:36                            */
/*==============================================================*/

use ssm;
drop table if exists T_JOB;

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
   T_Mdate              varchar(64),
   T_Mtype              int,     /* 1:投递岗位消息     */
   T_Mread              int,
   T_Mstate             int,
   T_Mfrom				int,           
   T_Mto                int,		   
   Column_11            varchar(0),
   Column_12            varchar(0),
   Column_13            varchar(0),
   primary key (T_Mid)
);

create table T_JOB
(
   T_Jid				int not null AUTO_INCREMENT,
   T_Jname              varchar(64),
   T_Jmarjor			varchar(64),
   T_Jplace			    varchar(64),
   T_Jsalary			varchar(64),
   T_Jcount			    varchar(64),
   T_Jcet			    varchar(64),
   T_Jbody			    varchar(2048),
   Uid                  int,          /* 表示岗位的发布者 */
   Column_11            varchar(0),
   Column_12            varchar(0),
   Column_13            varchar(0),
   primary key (T_Jid)
);

/*==============================================================*/
/* Table: T_USER                                                */
/*==============================================================*/
create table T_USER
(
   Uid                  int not null AUTO_INCREMENT,
   Uname                varchar(64) unique,
   Upassword            varchar(64),
   Ulastlogintime       varchar(64),
   Ubirthday           	varchar(64) default '2015-01-01',
   Ulogintimes          int default 0,
   Uloginstate          int default 0,
   Utype                varchar(1),
   Urealname            varchar(64),
   Ukey                 varchar(128),
   Uschool              varchar(128),
   Uemail               varchar(128),
   Usex                 int default 0,
   Uheight              int default 170,
   Uphone               varchar(128),
   Useldescribe         varchar(1024),
   Uaddress             varchar(512),
   Upicture             varchar(512) default '/SSM/upload/default/default.gif',
   Uidcard              varchar(256),
   Uresume              varchar(2048) default '/SSM/upload/default/default.doc',
   Column_21            varchar(0),
   Column_22            varchar(0),
   Column_23            varchar(0),
   primary key (Uid)
);

alter table T_MSG add constraint FK_Reference_1 foreign key (T_Mfrom)
      references T_USER (Uid) on delete restrict on update restrict;
alter table T_MSG add constraint FK_Reference_0 foreign key (T_Mto)
      references T_USER (Uid) on delete restrict on update restrict;
alter table T_JOB add constraint FK_Reference_2 foreign key (Uid)
      references T_USER (Uid) on delete restrict on update restrict;

select * from T_MSG;
select * from T_USER;
select * from T_JOB;
