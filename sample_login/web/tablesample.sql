
---------------------------------------------------------------------------------------------------------------------------------------------------

create table userlist(
userid varchar2(15) primary key,
pwd varchar2(12) not null,
name varchar2(20) not null,
email varchar2(100) not null,
address varchar2(160),
profileimg varchar2(200),
chk varchar2(12));

insert into userlist(userid,pwd,name,email,address,profileimg,chk) values('ba','1111','어드민',' ',' ','unimg.jpg','master');

delete from userlist where userid='admin'

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
values(board_seq.nextval,'admin','2.jpg','testupload2',SYSDATE);
insert into boardlist(idx,userid,imgpath,content,logtime)
values(board_seq.nextval,'admin','3.jpg','testupload3',SYSDATE);


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


SELECT IDX,USERID,IMGPATH,CONTENT,TO_CHAR(LOGTIME,'YYYY.MM.DD')AS LOGTIME 
         FROM (SELECT ROWNUM RN, AA.* 
               FROM (SELECT * FROM BOARDLIST ORDER BY IDX DESC)AA)
         WHERE RN>=1 AND RN<=21

SELECT USERID FROM USERLIST where userid not in ('hi') ORDER BY USERID;

 SELECT IDX,USERID,IMGPATH,CONTENT,TO_CHAR(LOGTIME,'YYYY.MM.DD')AS LOGTIME 
         FROM (SELECT ROWNUM RN, AA.* 
               FROM (SELECT * FROM BOARDLIST ORDER BY IDX DESC)AA)
         WHERE RN>=1 AND RN<=19;
         
UPDATE userlist SET profileimg= 'dog.jpg' WHERE userid='hi';


SELECT USERID FROM USERLIST ORDER BY USERID;
SELECT * FROM REPLY WHERE boardidx=3 ORDER BY IDX DESC;

