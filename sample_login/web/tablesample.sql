
select * from tab;


drop table userstest purge;

select * from userstest;

insert into userstest(id,pwd,name) values('admin','1111','어드민');

create sequence board_seq increment by 1  start with 1 nocycle nocache;

insert into boardtest(idx,userid,title,content) values(board_seq.nextval,'admin','test1','test11');

drop sequence board_seq;
drop table boardtest purge;


select * from boardtest;


---------------------------------------------------------------------------------------------------------------------------------------------------

create table userlist(
userid varchar2(15) primary key,
pwd varchar2(12) not null,
name varchar2(20) not null,
email varchar2(100) not null,
address varchar2(160),
profileimg varchar2(100),
chk varchar2(12));

insert into userlist(userid,pwd,name,email,address,profileimg,chk) values('admin','1111','어드민',' ',' ',' ','master');

create table boardlist(
idx number(6) primary key,		--글번호
userid varchar2(15) not null,	--유져이름
imgpath varchar2(80),   -- 이미지 경로
content varchar2(200),		--글내용
logtime DATE DEFAULT SYSDATE);

insert into boardlist(idx,userid,imgpath,content,logtime)
				values(board_seq.nextval,'admin','1.jpg','testupload',SYSDATE);
insert into boardlist(idx,userid,imgpath,content,logtime)
values(board_seq.nextval,'admin','2.jpg','testupload2',SYSDATE);
insert into boardlist(idx,userid,imgpath,content,logtime)
values(board_seq.nextval,'admin','3.jpg','testupload3',SYSDATE);


create table reply(
idx number(6) primary key,	
boardidx number(6) not null ,
writeid varchar2(15) not null,
content varchar2(200),
logtime DATE DEFAULT SYSDATE);


drop table boardlist purge;


create sequence board_seq increment by 1 start with 1 nocycle nocache;
create sequence reply_seq increment by 1 start with 1 nocycle nocache;

delete

select * from tab;
select * from userlist ;
select * from boardlist;
select * from reply;

drop table userlist purge;


SELECT * FROM REPLY WHERE boardidx=3 ORDER BY IDX DESC;

