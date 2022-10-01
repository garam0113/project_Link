select * from users;

INSERT INTO club (club_no, user_id, club_title, club_detail, club_reg_date, current_member, club_max_member, club_category, club_area)
VALUES (seq_club_no.nextval, 'user01', 'testClub', 'testDetail', null, 1, 10, '봉사활동', '서울시 강남구');

select * from club;

select * from club_user;

select * from meeting;

select * from PARTICIPANT;