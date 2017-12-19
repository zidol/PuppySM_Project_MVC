create table member(
id varchar2(30) primary key,
pw varchar2(20) not null,
name varchar2(30) not null,
age number not null,
gender varchar2(10) not null,
email varchar2(30) not null,
tel varchar2(20) not null,
addr varchar2(100) not null
);
desc member
insert into member values(
'aaa',
'1234',
'홍길동',
30,
'M'
);
select * from member;