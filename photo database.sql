/*DBMS LAB PROJECT TOPIC:PHOTO-SHARING DATABASE)*/
/*Creators- ANUSHA UPADYA(4NM19IS030) && ASHIKA(4NM19IS033)*/

/*Create database*/
create database PHOTO_SHARE

/*Use database created*/
use PHOTO_SHARE

/*Create statements*/

/*USERS TABLE*/
create table USERS(U_id varchar(15) primary key NOT NULL,
                   Username varchar(50) NOT NULL,
				   email_id varchar(50) NOT NULL,
				   u_password varchar(20) NOT NULL,
				   CONSTRAINT u_password CHECK (([u_password] like '%[0-9]%' AND [u_password] like '%[A-Z]%' collate Latin1_General_BIN2 AND [u_password] like '%[!@#$%^&*()-_+=.,;:~]%' AND len([u_password])>=(8)) ),
				   profile_pic varbinary(max) DEFAULT NULL,
				   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
				   DOB date)

/*ADMIN_TABLE*/
create table U_ADMIN(ADMIN_ID varchar(15) primary key NOT NULL,
                   U_id varchar(15),
				   Constraint FK1 Foreign key(U_ID) REFERENCES USERS(U_ID))

/*Follow details table*/
create table FOLLOWS(Followee_user_id varchar(15) ,
					 Follower_user_id varchar(15) ,
                     Followed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
					 primary key(Followee_user_id, Follower_user_id),
				     Constraint FK2 Foreign key(Followee_user_id) REFERENCES USERS(U_ID),
					 Constraint FK3 Foreign key(Follower_user_id) REFERENCES USERS(U_ID))

/*Page details table*/
create table U_PAGE(Page_id int primary key NOT NULL ,
					Page_Title varchar(15) NOT NULL ,
                    Purpose varchar(100),
					U_id varchar(15) NOT NULL,
					Constraint FK4 Foreign key(U_id) REFERENCES USERS(U_ID) ON DELETE CASCADE ON UPDATE CASCADE)


/*Photo details table*/
create table PHOTO(Photo_id int primary key NOT NULL,
                   Image_url varbinary(max) DEFAULT NULL,
				   Caption varchar(200) ,
                   Posted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
				   Photo_tag_text varchar(100),
				   Photo_User_id varchar(15),
				   Constraint FK5 Foreign key(Photo_User_id) REFERENCES USERS(U_ID))

/*Comment details table*/
create table COMMENTS(Comment_id int primary key NOT NULL,
				      Comment_text varchar(200) NOT NULL,
                      Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
				      Comment_User_id varchar(15),
					  Comment_Photo_id int,
				      Constraint FK6 Foreign key(Comment_User_id) REFERENCES USERS(U_ID) ON DELETE CASCADE ON UPDATE CASCADE,
					  Constraint FK7 Foreign key(Comment_Photo_id) REFERENCES PHOTO(Photo_id) ON DELETE CASCADE ON UPDATE CASCADE)

/*Hashtag detail Tables*/
create table HASHTAGS(tag_id int primary key NOT NULL,
				      tag_name varchar(200) NOT NULL,
                      Created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
					  tag_Photo_id int,
					  Constraint FK8 Foreign key(tag_Photo_id) REFERENCES PHOTO(Photo_id) ON DELETE CASCADE ON UPDATE CASCADE)

/*Like detail Tables*/
create table LIKES(like_User_id varchar(15),
				   like_Photo_id int,
				   primary key(like_User_id ,like_Photo_id),
				   Constraint FK9 Foreign key(like_User_id) REFERENCES USERS(U_ID) ON DELETE CASCADE ON UPDATE CASCADE,
				   Constraint FK10 Foreign key(like_Photo_id) REFERENCES PHOTO(Photo_id) ON DELETE CASCADE ON UPDATE CASCADE)

/*Details of constraints*/
sp_help USERS
sp_help U_ADMIN
sp_help FOLLOWS
sp_help U_PAGE
sp_help PHOTO
sp_help COMMENTS
sp_help HASHTAGS
sp_help LIKES

/*Insert statements*/
/*Insert values to users*/
insert into USERS values('thisisbillgates','Bill Gates','billgates@outlook.com','GATEBILL123@',(SELECT * FROM OPENROWSET(BULK N'C:\Users\Anusha Upadya\OneDrive\Desktop\Docs\DBMS PROJECT\Bill_gates.jpg', SINGLE_BLOB) as T1),'2017-10-10 01:13:49','1955-10-28')
insert into USERS values('zuck','Mark Zuckerberg','markzuckerberg@gmail.com','ZUCK111223@',(SELECT * FROM OPENROWSET(BULK N'C:\Users\Anusha Upadya\OneDrive\Desktop\Docs\DBMS PROJECT\mark zuckerberg.jpg', SINGLE_BLOB) as T1),'2010-10-10 05:13:49','1984-05-14')
insert into USERS values('sundarpichai','Sundar Pichai','sundarpichai@gmail.com','CHENNAI@123',(SELECT * FROM OPENROWSET(BULK N'C:\Users\Anusha Upadya\OneDrive\Desktop\Docs\DBMS PROJECT\sundar pichai.jpg', SINGLE_BLOB) as T1),'2011-10-10 06:13:49','1972-06-10')
insert into USERS values('cristiano','Cristiano Ronaldo','ronaldo@gmail.com','123#RONALDO',(SELECT * FROM OPENROWSET(BULK N'C:\Users\Anusha Upadya\OneDrive\Desktop\Docs\DBMS PROJECT\ronaldo.jpg', SINGLE_BLOB) as T1),'2015-10-10 07:13:49','1985-02-05')
insert into USERS values('virat.kohli','Virat Kohli','kohligmail@.com','VIRAT@100@',(SELECT * FROM OPENROWSET(BULK N'C:\Users\Anusha Upadya\OneDrive\Desktop\Docs\DBMS PROJECT\Virat-Kohli.webp', SINGLE_BLOB) as T1),'2015-11-10 08:13:49','1988-11-05')
insert into USERS values('anushkasharma','AnushkaSharma1588','anushka123@gmail.com','VIRAT123@',(SELECT * FROM OPENROWSET(BULK N'C:\Users\Anusha Upadya\OneDrive\Desktop\Docs\DBMS PROJECT\anushka sharma.jpg', SINGLE_BLOB) as T1),'2017-09-10 09:13:49','1988-05-01')
insert into USERS values('narendramodi','Narendra Modi','modiindia@123.com','GUJURAT1563@',(SELECT * FROM OPENROWSET(BULK N'C:\Users\Anusha Upadya\OneDrive\Desktop\Docs\DBMS PROJECT\Bill_gates.jpg', SINGLE_BLOB) as T1),'2004-10-10 01:13:00','1950-09-17')
insert into USERS values('mahi7781','M S Dhoni','mahi2010@gmail.com','CRICKET3@',(SELECT * FROM OPENROWSET(BULK N'C:\Users\Anusha Upadya\OneDrive\Desktop\Docs\DBMS PROJECT\MS-Dhoni.jpg', SINGLE_BLOB) as T1),'2018-03-10 01:13:09','1981-07-07')
insert into USERS values('jaspritb1','jaspit bumrah','jaspit@gmail.com','123BOWLINGFAST@',(SELECT * FROM OPENROWSET(BULK N'C:\Users\Anusha Upadya\OneDrive\Desktop\Docs\DBMS PROJECT\bumrah.jpg', SINGLE_BLOB) as T1),'2016-11-10 03:23:49','1993-12-06')
insert into USERS values('leomessi','Leo Messi','leomessi@gmailcom','43PARIS@',(SELECT * FROM OPENROWSET(BULK N'C:\Users\Anusha Upadya\OneDrive\Desktop\Docs\DBMS PROJECT\messi.jpg', SINGLE_BLOB) as T1),'2012-12-10 01:43:49','1987-06-24')

/*Insert values to admin*/
insert into U_ADMIN values('Microsoft','thisisbillgates')
insert into U_ADMIN values('Cricket','virat.kohli')
insert into U_ADMIN values('Cinema','anushkasharma')

/*Insert values to follows*/
insert into FOLLOWS values('virat.kohli','anushkasharma','2018-10-10 03:12:49')
insert into FOLLOWS values('anushkasharma','virat.kohli','2018-10-11 03:12:49')
insert into FOLLOWS values('virat.kohli','mahi7781','2019-09-10 03:12:49')
insert into FOLLOWS values('mahi7781','virat.kohli','2019-09-13 03:12:49')
insert into FOLLOWS values('jaspritb1','mahi7781','2018-12-10 03:12:49')
insert into FOLLOWS values('thisisbillgates','sundarpichai','2019-10-10 01:42:49')
insert into FOLLOWS values('thisisbillgates','zuck','2018-07-10 09:42:49')
insert into FOLLOWS values('virat.kohli','narendramodi','2020-09-10 08:12:49')

/*Insert values to user page*/
insert into U_PAGE values(1,'Technology','Tech_Information','thisisbillgates')
insert into U_PAGE values(2,'Facebook','Meta_Things','zuck')
insert into U_PAGE values(3,'Google','Google_Concepts','sundarpichai')
insert into U_PAGE values(4,'Football','Football_life','cristiano')
insert into U_PAGE values(5,'Cricket','World_cup','virat.kohli')
insert into U_PAGE values(6,'Cinema','Beauty_life','anushkasharma')
insert into U_PAGE values(7,'Government','Policies_of_govt','narendramodi')
insert into U_PAGE values(8,'Cricket','Retired_life','mahi7781')
insert into U_PAGE values(9,'Cricket','Bowling_journey','jaspritb1')
insert into U_PAGE values(10,'Sports','Football_life','leomessi')

/*Insert values to PHOTO table*/
/*Insert values to commentse*/
/*Insert values to hashtags*/
/*Insert values to likes*/

/*Display all columns*/
select * from USERS
select * from U_ADMIN
select * from FOLLOWS
select * from U_PAGE
select * from PHOTO
select * from COMMENTS
select * from HASHTAGS
select * from LIKES