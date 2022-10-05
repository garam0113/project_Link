set linesize 2000
set pagesize 2000

column user_id format a20;
column password format a20;
column name format a20;
column profile_writing format a20;
column rrn format a20;

column feed_no format a20;
column feed_open_condition format a20;
column feed_content format a20;
column feed_image1 format a20;
column feed_image2 format a20;
column feed_image3 format a20;
column feed_image4 format a20;
column feed_video format a20;
column hashtag format a20;

column feed_like_count format a80;
column feed_comment_count format a80;
column feed_reg_date format a20;
column feed_update_date format a20;
column report_condition format a20;
column delete_condition format a20;


CREATE TABLE feed (
	feed_no						NUMBER												NOT NULL,
	user_id						VARCHAR2(20)										NOT NULL	REFERENCES users(user_id),
	feed_open_condition			CHAR(3)												NOT NULL,
	feed_content				VARCHAR2(840),
	feed_image1					VARCHAR2(100),
	feed_image2					VARCHAR2(100),
	feed_image3					VARCHAR2(100),
	feed_image4					VARCHAR2(100),
	feed_video					VARCHAR2(100),
	hashtag						VARCHAR2(840),
	feed_like_count				NUMBER												NOT NULL,
	feed_comment_count			NUMBER												NOT NULL,
	feed_reg_date				DATE												NOT NULL,
	feed_update_date			DATE,
	report_condition			CHAR(3)												NOT NULL,
	delete_condition			CHAR(3)												NOT NULL,
	PRIMARY KEY(feed_no)
);



CREATE TABLE feed_comment (
	feed_comment_no				NUMBER												NOT NULL,
	feed_no						NUMBER												NOT NULL,
	user_id						VARCHAR2(20)										NOT NULL	REFERENCES users(user_id),
	feed_comment_content		VARCHAR2(210)										NOT NULL,
	feed_comment_like_count		NUMBER												NOT NULL,
	feed_recomment_count		NUMBER												NOT NULL,
	feed_comment_reg_date		DATE												NOT NULL,
	feed_comment_update_date	DATE,
	report_condition			CHAR(3)												NOT NULL,
	delete_condition			CHAR(3)												NOT NULL,
	parent						NUMBER												NOT NULL,
	depth						NUMBER												NOT NULL,
	sequence					NUMBER												NOT NULL,
	PRIMARY KEY(feed_comment_no)
);



CREATE TABLE heart(
	heart_no					NUMBER												NOT NULL,
	user_id						VARCHAR2(20)										NOT NULL	REFERENCES users(user_id),
	source						CHAR(3)												NOT NULL,
	source_no					NUMBER												NOT NULL
);




INSERT INTO feed VALUES ( seq_feed_no.nextval, 'user01', '3', '첫글입니다#first', 'a.jpg', 'b.jpg', null, null, null, '#first', '0', '0', SYSDATE, null, '0', '0' );
INSERT INTO feed VALUES ( seq_feed_no.nextval, 'user02', '3', '두번째글입니다#second', 'a.jpg', 'b.jpg', null, null, null, '#second', '0', '0', SYSDATE, null, '0', '0' );
INSERT INTO feed VALUES ( seq_feed_no.nextval, 'user03', '3', '세번째글입니다#third', 'a.jpg', 'b.jpg', null, null, null, '#third', '0', '0', SYSDATE, null, '0', '0' );
INSERT INTO feed VALUES ( seq_feed_no.nextval, 'user04', '3', '네번째글입니다#fourth', 'a.jpg', 'b.jpg', null, null, null, '#fourth', '0', '0', SYSDATE, null, '0', '0' );
INSERT INTO feed VALUES ( seq_feed_no.nextval, 'user05', '3', '다섯번째글입니다#fifth', 'a.jpg', 'b.jpg', null, null, null, '#fifth', '0', '0', SYSDATE, null, '0', '0' );



INSERT INTO feed_comment VALUES ( seq_feed_comment_no.nextval, '5', 'user01', 'first', '0', '0', SYSDATE, null, '0', '0', '0', '0', '0');
INSERT INTO feed_comment VALUES ( seq_feed_comment_no.nextval, '5', 'user02', 'second', '0', '0', SYSDATE, null, '0', '0', '0', '0', '0');
INSERT INTO feed_comment VALUES ( seq_feed_comment_no.nextval, '5', 'user03', 'third', '0', '0', SYSDATE, null, '0', '0', '0', '0', '0');
INSERT INTO feed_comment VALUES ( seq_feed_comment_no.nextval, '5', 'user04', 'fourth', '0', '0', SYSDATE, null, '0', '0', '0', '0', '0');
INSERT INTO feed_comment VALUES ( seq_feed_comment_no.nextval, '5', 'user05', 'fifit', '0', '0', SYSDATE, null, '0', '0', '0', '0', '0');



SELECT * from FEED ORDER BY feed_no DESC;

SELECT * from FEED_COMMENT ORDER BY feed_comment_no DESC;



SELECT f.feed_no, f.user_id, f.feed_open_condition, f.feed_content, f.feed_image1, f.feed_image2, f.feed_image3, f.feed_image4, f.feed_video, f.hashtag, f.feed_like_count, f.feed_comment_count, f.feed_reg_date, f.feed_update_date, f.report_condition, f.delete_condition FROM feed f WHERE feed_content LIKE '%정말%' ORDER BY feed_no DESC; 





SELECT feed_comment_no, feed_no, user_id, feed_comment_content, feed_comment_like_count, feed_recomment_count, feed_comment_reg_date, feed_comment_update_date, report_condition, delete_condition, parent, depth, sequence FROM feed_comment WHERE feed_no = '5' AND report_condition = '0' AND delete_condition = '0' ORDER BY feed_comment_no ASC 




SELECT * FROM HEART;



SELECT feed_comment_no, feed_no, user_id, feed_comment_content, feed_comment_like_count, feed_recomment_count, feed_comment_reg_date, feed_comment_update_date, report_condition, delete_condition, parent, depth, sequence FROM feed_comment WHERE feed_no = '5' AND report_condition = '0' AND delete_condition = '0' ORDER BY feed_comment_no ASC 