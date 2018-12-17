/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/12/17 13:15:51                          */
/*==============================================================*/


alter table Book_lend_record 
   drop foreign key FK_BOOK_LEN_REFERENCE_USERPEOP;

alter table Book_lend_record 
   drop foreign key FK_BOOK_LEN_RELATIONS_BOOK;

alter table Book_lend_record 
   drop foreign key FK_BOOK_LEN_RELATIONS_USERPEOP;

alter table Drug 
   drop foreign key FK_DRUG_MANUFACTO_MANUFACT;

alter table Drug 
   drop foreign key "FK_DRUG_RETAILER-_RETAILER";

alter table Drug_procurement_form 
   drop foreign key FK_DRUG_PRO_REFERENCE_USERPEOP;

alter table Drug_procurement_form 
   drop foreign key FK_DRUG_PRO_REFERENCE_USERPEOP;

alter table Drug_procurement_form 
   drop foreign key FK_DRUG_PRO_RELATIONS_USERPEOP;

alter table Drug_procurement_form 
   drop foreign key FK_DRUG_PRO_RELATIONS_DRUG;

alter table Drug_request_form 
   drop foreign key FK_DRUG_REQ_REFERENCE_USERPEOP;

alter table Drug_request_form 
   drop foreign key FK_DRUG_REQ_REFERENCE_USERPEOP;

alter table Drug_request_form 
   drop foreign key FK_DRUG_REQ_RELATIONS_USERPEOP;

alter table Drug_request_form 
   drop foreign key FK_DRUG_REQ_RELATIONS_DRUG;

alter table Primer 
   drop foreign key FK_PRIMER_REFERENCE_USERPEOP;

alter table Primer 
   drop foreign key FK_PRIMER_REFERENCE_USERPEOP;

alter table Primer 
   drop foreign key FK_PRIMER_RELATIONS_RETAILER;

alter table Sequencing_request_form 
   drop foreign key FK_SEQUENCI_RELATIONS_RETAILER;

alter table Vacation_record 
   drop foreign key FK_VACATION_REFERENCE_USERPEOP;

alter table Vacation_record 
   drop foreign key FK_VACATION_RELATIONS_USERPEOP;

alter table Vacation_statement 
   drop foreign key FK_VACATION_RELATIONS_USERPEOP;

alter table conference 
   drop foreign key FK_CONFEREN_RELATIONS_USERPEOP;

drop table if exists Book;


alter table Book_lend_record 
   drop foreign key FK_BOOK_LEN_RELATIONS_BOOK;

alter table Book_lend_record 
   drop foreign key FK_BOOK_LEN_RELATIONS_USERPEOP;

alter table Book_lend_record 
   drop foreign key FK_BOOK_LEN_REFERENCE_USERPEOP;

drop table if exists Book_lend_record;


alter table Drug 
   drop foreign key FK_DRUG_MANUFACTO_MANUFACT;

alter table Drug 
   drop foreign key "FK_DRUG_RETAILER-_RETAILER";

drop table if exists Drug;


alter table Drug_procurement_form 
   drop foreign key FK_DRUG_PRO_RELATIONS_USERPEOP;

alter table Drug_procurement_form 
   drop foreign key FK_DRUG_PRO_RELATIONS_DRUG;

alter table Drug_procurement_form 
   drop foreign key FK_DRUG_PRO_REFERENCE_USERPEOP;

alter table Drug_procurement_form 
   drop foreign key FK_DRUG_PRO_REFERENCE_USERPEOP;

drop table if exists Drug_procurement_form;


alter table Drug_request_form 
   drop foreign key FK_DRUG_REQ_RELATIONS_USERPEOP;

alter table Drug_request_form 
   drop foreign key FK_DRUG_REQ_RELATIONS_DRUG;

alter table Drug_request_form 
   drop foreign key FK_DRUG_REQ_REFERENCE_USERPEOP;

alter table Drug_request_form 
   drop foreign key FK_DRUG_REQ_REFERENCE_USERPEOP;

drop table if exists Drug_request_form;

drop table if exists Manufactor;


alter table Primer 
   drop foreign key FK_PRIMER_RELATIONS_RETAILER;

alter table Primer 
   drop foreign key FK_PRIMER_REFERENCE_USERPEOP;

alter table Primer 
   drop foreign key FK_PRIMER_REFERENCE_USERPEOP;

drop table if exists Primer;

drop table if exists Retailer;


alter table Sequencing_request_form 
   drop foreign key FK_SEQUENCI_RELATIONS_RETAILER;

drop table if exists Sequencing_request_form;

drop table if exists UserPeople;


alter table Vacation_record 
   drop foreign key FK_VACATION_RELATIONS_USERPEOP;

alter table Vacation_record 
   drop foreign key FK_VACATION_REFERENCE_USERPEOP;

drop table if exists Vacation_record;


alter table Vacation_statement 
   drop foreign key FK_VACATION_RELATIONS_USERPEOP;

drop table if exists Vacation_statement;


alter table conference 
   drop foreign key FK_CONFEREN_RELATIONS_USERPEOP;

drop table if exists conference;

/*==============================================================*/
/* Table: Book                                                  */
/*==============================================================*/
create table Book
(
   Book_id              int not null  comment '',
   name                 varchar(20) not null  comment '',
   author               varchar(20) not null  comment '',
   press                varchar(40)  comment '',
   purchase_time        date  comment '',
   purchaser            varchar(20)  comment '',
   primary key (Book_id)
);

alter table Book comment '书籍实体';

/*==============================================================*/
/* Table: Book_lend_record                                      */
/*==============================================================*/
create table Book_lend_record
(
   Book_lend_record_id  int not null  comment '',
   UserPeople_id        int  comment '',
   Book_id              int  comment '',
   approval_people_id   int  comment '',
   lend_date            date not null  comment '',
   anticipate_date_number numeric(8,0) not null  comment '',
   return_date          date not null  comment '',
   comments             varchar(100)  comment '',
   primary key (Book_lend_record_id)
);

alter table Book_lend_record comment '书籍借阅信息表';

/*==============================================================*/
/* Table: Drug                                                  */
/*==============================================================*/
create table Drug
(
   Drug_id              int not null  comment '',
   Retailer_id          int  comment '',
   Manufactor_id        int  comment '',
   name                 varchar(20) not null  comment '',
   brand                varchar(20) not null  comment '',
   specifications       varchar(20) not null  comment '',
   duration             int not null  comment '',
   produced_time        date not null  comment '',
   use_statement        varchar(50) not null  comment '',
   unit                 varchar(10) not null  comment '',
   number               numeric(8,0) not null  comment '',
   inventory_place      varchar(40) not null  comment '',
   inventory_redline    int not null  comment '',
   is_need_scrutiny     bool not null  comment '',
   comments             varchar(100)  comment '',
   anticipate_price     numeric(8,0) not null  comment '',
   price                numeric(8,0) not null  comment '',
   primary key (Drug_id)
);

alter table Drug comment '药品实体';

/*==============================================================*/
/* Table: Drug_procurement_form                                 */
/*==============================================================*/
create table Drug_procurement_form
(
   Drug_procurement_form_id int not null  comment '',
   Drug_id              int not null  comment '',
   number               numeric(8,0) not null  comment '',
   status               tinyint not null  comment '',
   request_people_id    int not null  comment '',
   scrutiny_people_id   int  comment '',
   user_people_id       int  comment '',
   procurement_people   varchar(20)  comment '',
   recieve_people       varchar(10)  comment '',
   request_date         date not null  comment '',
   scrutiny_date        date  comment '',
   procurement_date     date  comment '',
   receive_date         date  comment '',
   use_date             date  comment '',
   comments             varchar(100)  comment '',
   primary key (Drug_procurement_form_id)
);

alter table Drug_procurement_form comment '药品采购申请单';

/*==============================================================*/
/* Table: Drug_request_form                                     */
/*==============================================================*/
create table Drug_request_form
(
   Drug_request_form_id int not null  comment '',
   request_people_id    int  comment '',
   Drug_id              int  comment '',
   scrutiny_people_id   int  comment '',
   user_people_id       int  comment '',
   status               smallint not null  comment '',
   request_date         date not null  comment '',
   receive_date         date  comment '',
   number               numeric(8,0)  comment '',
   out_inventory_people varchar(10)  comment '',
   comments             varchar(100)  comment '',
   primary key (Drug_request_form_id)
);

alter table Drug_request_form comment '药品领用申请单';

/*==============================================================*/
/* Table: Manufactor                                            */
/*==============================================================*/
create table Manufactor
(
   Manufactor_id        int not null  comment '',
   name                 varchar(20) not null  comment '',
   address              varchar(40) not null  comment '',
   contact_name         varchar(10) not null  comment '',
   phone_number         numeric(11,0) not null  comment '',
   fax                  numeric(20,0)  comment '',
   email                varchar(20)  comment '',
   comments             varchar(100)  comment '',
   primary key (Manufactor_id)
);

alter table Manufactor comment '生产厂家信息';

/*==============================================================*/
/* Table: Primer                                                */
/*==============================================================*/
create table Primer
(
   Primer_id            int not null  comment '',
   name                 varchar(20) not null  comment '',
   sequence             varchar(100) not null  comment '',
   Retailer_id          int  comment '',
   request_people_id    int  comment '',
   approval_people_id   int  comment '',
   price                float(8,2) not null  comment '',
   basic_group_number   numeric(8,0) not null  comment '',
   OD_value             numeric(8,0) not null  comment '',
   request_date         date not null  comment '',
   approval_date        date  comment '',
   procurement_date     date  comment '',
   recieve_date         date  comment '',
   use_date             date  comment '',
   restore_people       varchar(10)  comment '',
   primary key (Primer_id)
);

alter table Primer comment '引物实体';

/*==============================================================*/
/* Table: Retailer                                              */
/*==============================================================*/
create table Retailer
(
   Retailer_id          int not null  comment '',
   name                 varchar(20) not null  comment '',
   address              varchar(40) not null  comment '',
   contact_name         varchar(10) not null  comment '',
   phone_number         numeric(11,0) not null  comment '',
   fax                  numeric(20,0)  comment '',
   email                varchar(20)  comment '',
   comments             varchar(100)  comment '',
   primary key (Retailer_id)
);

alter table Retailer comment '经销商信息';

/*==============================================================*/
/* Table: Sequencing_request_form                               */
/*==============================================================*/
create table Sequencing_request_form
(
   Sequencing_request_form_id int not null  comment '',
   name                 varchar(20) not null  comment '',
   reaction_number      numeric(8,0) not null  comment '',
   sequent_times        numeric(8,0) not null  comment '',
   price                numeric(8,0) not null  comment '',
   is_bothway_sequent   bool not null  comment '',
   Retailer_id          int  comment '',
   company_name         varchar(10) not null  comment '',
   request_date         date not null  comment '',
   is_append            bool not null  comment '',
   is_success           bool  comment '',
   fail_reason          text  comment '',
   is_cost              bool  comment '',
   primary key (Sequencing_request_form_id)
);

alter table Sequencing_request_form comment '测序申请单';

/*==============================================================*/
/* Table: UserPeople                                            */
/*==============================================================*/
create table UserPeople
(
   UserPeople_id        int not null  comment '',
   case                 tinyint not null  comment '',
   name                 varchar(20)  comment '',
   sex                  numeric(2,0)  comment '',
   email                varchar(20) not null  comment '',
   phone_number         numeric(11,0) not null  comment '',
   password             varchar(50) not null  comment '',
   account_number       numeric(11,0)  comment '',
   primary key (UserPeople_id)
);

alter table UserPeople comment '该系统用户';

/*==============================================================*/
/* Table: Vacation_record                                       */
/*==============================================================*/
create table Vacation_record
(
   Vacation_record_id   int not null  comment '',
   UserPeople_id        int  comment '',
   approval_people_id   int  comment '',
   request_date         date not null  comment '',
   end_date             date not null  comment '',
   start_date           date not null  comment '',
   comments             varchar(100)  comment '',
   primary key (Vacation_record_id)
);

alter table Vacation_record comment '请假记录';

/*==============================================================*/
/* Table: Vacation_statement                                    */
/*==============================================================*/
create table Vacation_statement
(
   UserPeople_id        int not null  comment '',
   year                 numeric(4,0) not null  comment '',
   total_vacation_days  numeric(8,0) not null  comment '',
   done_days            numeric(8,0) not null  comment '',
   donot_days           numeric(8,0) not null  comment '',
   primary key (UserPeople_id, year)
);

alter table Vacation_statement comment '学生休假信息';

/*==============================================================*/
/* Table: conference                                            */
/*==============================================================*/
create table conference
(
   conference_id        int not null  comment '',
   perform_people_id    int  comment '',
   conference_date      date not null  comment '',
   subject              varchar(20) not null  comment '',
   remark               varchar(100)  comment '',
   comment              varchar(100)  comment '',
   record_people        varchar(10)  comment '',
   primary key (conference_id)
);

alter table conference comment '组会日程表';

alter table Book_lend_record add constraint FK_BOOK_LEN_REFERENCE_USERPEOP foreign key (approval_people_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

alter table Book_lend_record add constraint FK_BOOK_LEN_RELATIONS_BOOK foreign key (Book_id)
      references Book (Book_id) on delete restrict on update restrict;

alter table Book_lend_record add constraint FK_BOOK_LEN_RELATIONS_USERPEOP foreign key (UserPeople_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

alter table Drug add constraint FK_DRUG_MANUFACTO_MANUFACT foreign key (Manufactor_id)
      references Manufactor (Manufactor_id) on delete restrict on update restrict;

alter table Drug add constraint "FK_DRUG_RETAILER-_RETAILER" foreign key (Retailer_id)
      references Retailer (Retailer_id) on delete restrict on update restrict;

alter table Drug_procurement_form add constraint FK_DRUG_PRO_REFERENCE_USERPEOP foreign key (scrutiny_people_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

alter table Drug_procurement_form add constraint FK_DRUG_PRO_REFERENCE_USERPEOP foreign key (user_people_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

alter table Drug_procurement_form add constraint FK_DRUG_PRO_RELATIONS_USERPEOP foreign key (request_people_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

alter table Drug_procurement_form add constraint FK_DRUG_PRO_RELATIONS_DRUG foreign key (Drug_id)
      references Drug (Drug_id) on delete restrict on update restrict;

alter table Drug_request_form add constraint FK_DRUG_REQ_REFERENCE_USERPEOP foreign key (scrutiny_people_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

alter table Drug_request_form add constraint FK_DRUG_REQ_REFERENCE_USERPEOP foreign key (user_people_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

alter table Drug_request_form add constraint FK_DRUG_REQ_RELATIONS_USERPEOP foreign key (request_people_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

alter table Drug_request_form add constraint FK_DRUG_REQ_RELATIONS_DRUG foreign key (Drug_id)
      references Drug (Drug_id) on delete restrict on update restrict;

alter table Primer add constraint FK_PRIMER_REFERENCE_USERPEOP foreign key (request_people_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

alter table Primer add constraint FK_PRIMER_REFERENCE_USERPEOP foreign key (approval_people_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

alter table Primer add constraint FK_PRIMER_RELATIONS_RETAILER foreign key (Retailer_id)
      references Retailer (Retailer_id) on delete restrict on update restrict;

alter table Sequencing_request_form add constraint FK_SEQUENCI_RELATIONS_RETAILER foreign key (Retailer_id)
      references Retailer (Retailer_id) on delete restrict on update restrict;

alter table Vacation_record add constraint FK_VACATION_REFERENCE_USERPEOP foreign key (approval_people_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

alter table Vacation_record add constraint FK_VACATION_RELATIONS_USERPEOP foreign key (UserPeople_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

alter table Vacation_statement add constraint FK_VACATION_RELATIONS_USERPEOP foreign key (UserPeople_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

alter table conference add constraint FK_CONFEREN_RELATIONS_USERPEOP foreign key (perform_people_id)
      references UserPeople (UserPeople_id) on delete restrict on update restrict;

