create table boardqna(
board_num number primary key,
board_name varchar2(50) not null,
board_pass varchar2(15) not null,
board_subject varchar2(150) not null,
board_content varchar2(4000) not null,
board_file varchar2(100) not null,
board_re_ref number not null,
board_re_lev number not null,
board_re_seq number not null,
board_readcount number default 0 not null,
board_date date not null);

insert into boardqna values(
1,
'홍길동',
'1234',
'QNA 게시판입니다.',
'퍼피코리아에 대해 질문사항을 등록해 주세요',
'image.jsp',
0,
0,
0,
0,
sysdate
);

insert into boardreview values(
1,
'홍길동',
'1234',
'Review 게시판입니다.',
'퍼피코리아에 대해 질문사항을 등록해 주세요',
'image.jsp',
0,
0,
0,
0,
sysdate
);
select * from boardqna;
create table boardreview(
board_num number primary key,
board_name varchar2(50) not null,
board_pass varchar2(15) not null,
board_subject varchar2(150) not null,
board_content varchar2(4000) not null,
board_file varchar2(100) not null,
board_re_ref number not null,
board_re_lev number not null,
board_re_seq number not null,
board_readcount number default 0 not null,
board_date date not null);
commit