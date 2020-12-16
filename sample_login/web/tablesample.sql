
---------------------------------------------------------------------------------------------------------------------------------------------------

create table userlist(
userid varchar2(15) primary key,
pwd varchar2(12) not null,
name varchar2(20) not null,
email varchar2(100) not null,
address varchar2(160),
profileimg varchar2(200),
chk varchar2(12));

insert into userlist(userid,pwd,name,email,address,profileimg,chk) values('admin','1111','어드민',' ',' ',' ','master');

---------------------------------------------------------------------------------------------------------------------------------------------------

create table boardlist(
idx number(6) primary key,		--글번호
userid varchar2(15) not null,	--유져이름
imgpath varchar2(80),   -- 이미지 경로
content varchar2(200),		--글내용
logtime DATE DEFAULT SYSDATE);


create sequence board_seq increment by 1 start with 1 nocycle nocache;



insert into boardlist(idx,userid,imgpath,content,logtime)
				values(board_seq.nextval,'admin','1.jpg','testupload',SYSDATE);
insert into boardlist(idx,userid,imgpath,content,logtime)
values(board_seq.nextval,'admin','2.jfif','testupload2',SYSDATE);
insert into boardlist(idx,userid,imgpath,content,logtime)
values(board_seq.nextval,'admin','3.jfif','testupload3',SYSDATE);


---------------------------------------------------------------------------------------------------------------------------------------------------


create table reply(
idx number(6) primary key,	
boardidx number(6) not null ,
writeid varchar2(15) not null,
content varchar2(200),
logtime DATE DEFAULT SYSDATE);

---------------------------------------------------------------------------------------------------------------------------------------------------

create sequence reply_seq increment by 1 start with 1 nocycle nocache;


---------------------------------------------------------------------------------------------------------------------------------------------------

select * from userlist ;
select * from boardlist;
select * from reply;

SELECT * FROM BOARDLIST where userid='ab';
UPDATE boardlist SET IMGPATH= '2.jpg' WHERE idx=4;
UPDATE boardlist SET IMGPATH= '3.jpg' WHERE idx=5;

SELECT USERID FROM USERLIST ORDER BY USERID;
SELECT * FROM REPLY WHERE boardidx=3 ORDER BY IDX DESC;

