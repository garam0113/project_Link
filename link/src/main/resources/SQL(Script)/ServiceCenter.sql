
DROP SEQUENCE seq_notice_notice_no;

CREATE SEQUENCE seq_notice_notice_no   INCREMENT BY 1 START WITH 1;


select * from notice;

delete from notice where notice_no = '6';



//==================여기까지가 Notice ====//

DROP SEQUENCE seq_qanda_qanda_no;
DROP SEQUENCE seq_qanda_no;

CREATE SEQUENCE SEQ_QANDA_NO					INCREMENT BY 1 START WITH 1;
 

select * from qanda;


//=================여기까지가 QandA



