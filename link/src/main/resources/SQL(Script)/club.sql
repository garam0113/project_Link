select * from users;

INSERT INTO club (club_no, user_id, club_title, club_detail, club_reg_date, current_member, club_max_member, club_category, club_area, club_image)
VALUES (seq_club_no.nextval, 'user01', 'testClub', 'testDetail', null, 1, 10, '봉사활동', '서울시 강남구', 'b.jpg');

INSERT INTO club_user (club_user_no, user_id, club_no, application_reg_date, join_reg_date, member_role, approval_condition, join_greeting)
VALUES (seq_club_user_no.nextval, 'USER01',2, null, null, null, null, '안녕하세요 테스트 가입인사입니다');

INSERT INTO meeting (meeting_no, club_no, add_meeting_user_id, meeting_title, meeting_content, meeting_date, meeting_place, meeting_time, meeting_weather, meeting_reg_date, meeting_member, meeting_maximum_member)
VALUES (seq_meeting_no.nextval, 2, 'USER01', '테스트일정제목', '테스트일정내용', '테스트일정날짜', '테스트일정장소', '테스트일정시간', '테스트날짜', sysdate, 1, 10);

INSERT INTO participant (participant_no, meeting_no, participant_user_id)
VALUES (seq_participant_no.nextval, 2, 'USER01');



select * from club;

select * from club_user;

select * from meeting;

select * from PARTICIPANT;

