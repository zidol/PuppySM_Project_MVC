create table buy (
buy_id number not null,
image varchar2(40) not null,
kind varchar2(60) not null,
price number not null,
qty number not null,
buy_date date not null,
buy_state varchar2(30) default '주문완료' not null ,
mid varchar2(30) not null
);

create sequence buy_seq
increment by 1
start with 10000;

commit