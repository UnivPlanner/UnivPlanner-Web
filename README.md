# UnivPlannerWeb

## SQL Command
create database bbs;  
use bbs;

create table user(  
   userID varchar(20),  
   userPassword varchar(20),  
   userName varchar(20),  
   userSchool varchar(20),    
   primary key(userID)  
)  
charset = utf8;


---


create table bbs(  
   bbsID int,  
   bbsTitle varchar(50),  
   userID varchar(20),  
   bbsDate datetime,  
   bbsContent varchar(2048),  
   bbsAvailable int,  
   primary key(bbsID)  
)  
charset = utf8;
