
select * from puppy;

create table cart(
image varchar2(40) not null,
kind varchar2(60) not null,
price number not null,
qty number not null,
pid number not null, --puppy 테이블 id
mid varchar2(30) not null -- member 테이블 id
);
commit
drop table cart;

select * from puppy;

select * from cart;
select * from cart where mid='ajh3166' and (price between 100000 and 400000);