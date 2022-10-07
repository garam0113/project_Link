CREATE TABLE FOLLOW_BLOCK(
NO                     NUMBER(20) NOT NULL ,
SEND_USER_ID       VARCHAR(20) NOT NULL REFERENCES USERS(user_id), 
RECV_USER_ID       VARCHAR(20) NOT NULL REFERENCES USERS(user_id),
STATE                 CHAR(3) DEFAULT '0',
TYPE                   CHAR(3) DEFAULT '0',
PRIMARY KEY(NO)
);

CREATE SEQUENCE seq_FOLLOW_BLOCK_NO	INCREMENT BY 1 START WITH 1;


insert into follow_block values(seq_follow_block_no.nextval, 'user01', 'user02', '1', '1');
insert into follow_block values(seq_follow_block_no.nextval, 'user01', 'user03', '1', '1');
insert into follow_block values(seq_follow_block_no.nextval, 'user01', 'user04', '1', '1');
insert into follow_block values(seq_follow_block_no.nextval, 'user01', 'user05', '1', '1');


select * from users;
select * from FOLLOW_BLOCK;
select * from users;
select * from feed;