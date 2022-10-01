select * from users;

INSERT INTO club (club_no, user_id, club_title, club_detail, club_reg_date, current_member, club_max_member, club_category, club_area, club_image)
VALUES (seq_club_no.nextval, 'user01', 'testClub', 'testDetail', null, 1, 10, '봉사활동', '서울시 강남구', 'b.jpg');

INSERT INTO club_user (club_user_no, user_id, club_no, application_reg_date, join_reg_date, member_role, approval_condition, join_greeting)
VALUES (seq_club_user_no.nextval, 'user01', 2, null, null, null, null, '안녕하세요 테스트 가입인사입니다');





select * from club;

select * from club_user;

select * from meeting;

select * from PARTICIPANT;

