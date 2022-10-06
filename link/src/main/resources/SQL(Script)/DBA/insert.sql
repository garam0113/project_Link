SELECT * FROM USERS;
SELECT * FROM CLUB;
SELECT * FROM CLUB_USER;
SELECT * FROM MEETING;
SELECT * FROM PARTICIPANT;
SELECT * FROM CLUB_POST;
SELECT * FROM CLUB_POST_COMMENT;
SELECT * FROM CHAT;
SELECT * FROM CLUB_CHAT;
SELECT * FROM FEED;
SELECT * FROM FEED_COMMENT;
SELECT * FROM HEART;
SELECT * FROM PAY;
SELECT * FROM NOTICE;
SELECT * FROM QANDA;
SELECT * FROM REPORT_PUSH;
SELECT * FROM FOLLOW_BLOCK;
SELECT * FROM LIVE;
SELECT * FROM LIVE_CHAT;
SELECT * FROM VIEWER;





ALTER TABLE REPORT_PUSH ADD PARENT CAHR(3) DEFAULT '0' NOT NULL;
ALTER TABLE REPORT_PUSH DROP COLUMN REPORT_REASON;





















INSERT INTO USERS (user_id, password, name, rrn, gender, phone_no, email, role, nickname, profile_image, profile_writing, 
	area1, area2, area3, category1, category2, category3, add_user_date)
VALUES	('admin1', '1234', '박경수', '1111110000000', '남자', '01011113333', 'admin@hotmail.com', '1', '관리자', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, SYSDATE);

INSERT INTO USERS (user_id, password, name, rrn, gender, phone_no, email, role, nickname, profile_image, profile_writing, 
	area1, area2, area3, category1, category2, category3, add_user_date)
VALUES	('user01', '1234', '홍길동', '1111110000000', '남자', '01011113333', 'USER01@hotmail.com', '0', '회원', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, SYSDATE);

INSERT INTO USERS (user_id, password, name, rrn, gender, phone_no, email, role, nickname, profile_image, profile_writing, 
	area1, area2, area3, category1, category2, category3, add_user_date)
VALUES	('user02', '1234', '홍길순', '1111110000000', '남자', '01011113333', 'USER02@hotmail.com', '0', '회원', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, SYSDATE);

INSERT INTO USERS (user_id, password, name, rrn, gender, phone_no, email, role, nickname, profile_image, profile_writing, 
	area1, area2, area3, category1, category2, category3, add_user_date)
VALUES	('user03', '1234', '박보영', '1111110000000', '남자', '01011113333', 'USER03@hotmail.com', '0', '회원', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, SYSDATE);

INSERT INTO USERS (user_id, password, name, rrn, gender, phone_no, email, role, nickname, profile_image, profile_writing, 
	area1, area2, area3, category1, category2, category3, add_user_date)
VALUES	('user04', '1234', '박수현', '1111110000000', '남자', '01011113333', 'USER04@hotmail.com', '0', '회원', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, SYSDATE);

INSERT INTO USERS (user_id, password, name, rrn, gender, phone_no, email, role, nickname, profile_image, profile_writing, 
	area1, area2, area3, category1, category2, category3, add_user_date)
VALUES	('user05', '1234', '박상기', '1111110000000', '남자', '01011113333', 'USER05@hotmail.com', '0', '회원', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, SYSDATE);

















INSERT INTO CLUB (CLUB_NO, USER_ID, CLUB_TITLE, CLUB_DETAIL, CLUB_REG_DATE, CURRENT_MEMBER, CLUB_MAX_MEMBER, 
CLUB_CATEGORY, CLUB_AREA, CLUB_IMAGE) VALUES (seq_club_no.NEXTVAL, 'user02', 'CLUB1TITLE', 'CLUB1DETAIL', sysdate, 1, 10, '운동', '서울시 동작구', 'a.jpg');

INSERT INTO club (club_no, user_id, club_title, club_detail, club_reg_date, current_member, club_max_member, club_category, club_area, club_image)
VALUES (seq_club_no.nextval, 'user01', 'testClub', 'testDetail', sysdate, 1, 10, '봉사활동', '서울시 강남구', 'b.jpg');




















INSERT INTO CLUB_POST (CLUB_POST_NO, CLUB_NO, USER_ID, CLUB_POST_TITLE, CLUB_POST_CONTENT, CLUB_POST_VIDEO1, CLUB_POST_VIDEO2, 
CLUB_POST_VIDEO3, CLUB_POST_REG_DATE, CLUB_POST_LIKE_COUNT, CLUB_POST_COMMENT_COUNT, IMAGE1, IMAGE2, IMAGE3, IMAGE4, 
IMAGE5, IMAGE6, IMAGE7, IMAGE8, IMAGE9, IMAGE10) VALUES (seq_club_post_no.NEXTVAL, 2, 'USER02', 'clubposttitle1',
null, null, null, null, sysdate, 0, 0, 'a.jpg', null, null, null, null, null, null, null, null, null);

INSERT INTO CLUB_POST (CLUB_POST_NO, CLUB_NO, USER_ID, CLUB_POST_TITLE, CLUB_POST_CONTENT, CLUB_POST_VIDEO1, CLUB_POST_VIDEO2, 
CLUB_POST_VIDEO3, CLUB_POST_REG_DATE, CLUB_POST_LIKE_COUNT, CLUB_POST_COMMENT_COUNT, IMAGE1, IMAGE2, IMAGE3, IMAGE4, 
IMAGE5, IMAGE6, IMAGE7, IMAGE8, IMAGE9, IMAGE10) VALUES (seq_club_post_no.NEXTVAL, 2, 'USER03', 'clubposttitle2',
null, null, null, null, sysdate, 0, 0, 'a.jpg', null, null, null, null, null, null, null, null, null);

INSERT INTO CLUB_POST (CLUB_POST_NO, CLUB_NO, USER_ID, CLUB_POST_TITLE, CLUB_POST_CONTENT, CLUB_POST_VIDEO1, CLUB_POST_VIDEO2, 
CLUB_POST_VIDEO3, CLUB_POST_REG_DATE, CLUB_POST_LIKE_COUNT, CLUB_POST_COMMENT_COUNT, IMAGE1, IMAGE2, IMAGE3, IMAGE4, 
IMAGE5, IMAGE6, IMAGE7, IMAGE8, IMAGE9, IMAGE10) VALUES (seq_club_post_no.NEXTVAL, 2, 'USER04', 'clubposttitle3',
null, null, null, null, sysdate, 0, 0, 'a.jpg', null, null, null, null, null, null, null, null, null);

INSERT INTO CLUB_POST (CLUB_POST_NO, CLUB_NO, USER_ID, CLUB_POST_TITLE, CLUB_POST_CONTENT, CLUB_POST_VIDEO1, CLUB_POST_VIDEO2, 
CLUB_POST_VIDEO3, CLUB_POST_REG_DATE, CLUB_POST_LIKE_COUNT, CLUB_POST_COMMENT_COUNT, IMAGE1, IMAGE2, IMAGE3, IMAGE4, 
IMAGE5, IMAGE6, IMAGE7, IMAGE8, IMAGE9, IMAGE10) VALUES (seq_club_post_no.NEXTVAL, 2, 'USER05', 'clubposttitle4',
null, null, null, null, sysdate, 0, 0, 'a.jpg', null, null, null, null, null, null, null, null, null);

INSERT INTO CLUB_POST (CLUB_POST_NO, CLUB_NO, USER_ID, CLUB_POST_TITLE, CLUB_POST_CONTENT, CLUB_POST_VIDEO1, CLUB_POST_VIDEO2, 
CLUB_POST_VIDEO3, CLUB_POST_REG_DATE, CLUB_POST_LIKE_COUNT, CLUB_POST_COMMENT_COUNT, IMAGE1, IMAGE2, IMAGE3, IMAGE4, 
IMAGE5, IMAGE6, IMAGE7, IMAGE8, IMAGE9, IMAGE10) VALUES (seq_club_post_no.NEXTVAL, 2, 'USER05', 'clubposttitle5',
null, null, null, null, sysdate, 0, 0, 'a.jpg', null, null, null, null, null, null, null, null, null);

INSERT INTO CLUB_POST (CLUB_POST_NO, CLUB_NO, USER_ID, CLUB_POST_TITLE, CLUB_POST_CONTENT, CLUB_POST_VIDEO1, CLUB_POST_VIDEO2, 
CLUB_POST_VIDEO3, CLUB_POST_REG_DATE, CLUB_POST_LIKE_COUNT, CLUB_POST_COMMENT_COUNT, IMAGE1, IMAGE2, IMAGE3, IMAGE4, 
IMAGE5, IMAGE6, IMAGE7, IMAGE8, IMAGE9, IMAGE10) VALUES (seq_club_post_no.NEXTVAL, 2, 'USER03', 'clubposttitle6',
null, null, null, null, sysdate, 0, 0, 'a.jpg', null, null, null, null, null, null, null, null, null);

INSERT INTO CLUB_POST (CLUB_POST_NO, CLUB_NO, USER_ID, CLUB_POST_TITLE, CLUB_POST_CONTENT, CLUB_POST_VIDEO1, CLUB_POST_VIDEO2, 
CLUB_POST_VIDEO3, CLUB_POST_REG_DATE, CLUB_POST_LIKE_COUNT, CLUB_POST_COMMENT_COUNT, IMAGE1, IMAGE2, IMAGE3, IMAGE4, 
IMAGE5, IMAGE6, IMAGE7, IMAGE8, IMAGE9, IMAGE10) VALUES (seq_club_post_no.NEXTVAL, 2, 'USER02', 'clubposttitle7',
null, null, null, null, sysdate, 0, 0, 'a.jpg', null, null, null, null, null, null, null, null, null);

INSERT INTO CLUB_POST (CLUB_POST_NO, CLUB_NO, USER_ID, CLUB_POST_TITLE, CLUB_POST_CONTENT, CLUB_POST_VIDEO1, CLUB_POST_VIDEO2, 
CLUB_POST_VIDEO3, CLUB_POST_REG_DATE, CLUB_POST_LIKE_COUNT, CLUB_POST_COMMENT_COUNT, IMAGE1, IMAGE2, IMAGE3, IMAGE4, 
IMAGE5, IMAGE6, IMAGE7, IMAGE8, IMAGE9, IMAGE10) VALUES (seq_club_post_no.NEXTVAL, 2, 'USER02', 'clubposttitle8',
null, null, null, null, sysdate, 0, 0, 'a.jpg', null, null, null, null, null, null, null, null, null);

INSERT INTO CLUB_POST (CLUB_POST_NO, CLUB_NO, USER_ID, CLUB_POST_TITLE, CLUB_POST_CONTENT, CLUB_POST_VIDEO1, CLUB_POST_VIDEO2, 
CLUB_POST_VIDEO3, CLUB_POST_REG_DATE, CLUB_POST_LIKE_COUNT, CLUB_POST_COMMENT_COUNT, IMAGE1, IMAGE2, IMAGE3, IMAGE4, 
IMAGE5, IMAGE6, IMAGE7, IMAGE8, IMAGE9, IMAGE10) VALUES (seq_club_post_no.NEXTVAL, 2, 'USER02', 'clubposttitle9',
null, null, null, null, sysdate, 0, 0, 'a.jpg', null, null, null, null, null, null, null, null, null);
















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









commit;

