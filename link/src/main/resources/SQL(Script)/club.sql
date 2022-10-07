select * from users;

//모임등록
addClub()
INSERT INTO club (club_no, user_id, club_title, club_detail, club_reg_date, current_member, club_max_member, club_category, club_area, club_image)
VALUES (seq_club_no.nextval, 'user01', 'testClub', 'testDetail', sysdate, 1, 10, '봉사활동', '서울시 강남구', 'b.jpg');

//모임가입신청
addApprovalCondition()
INSERT INTO club_user (club_user_no, user_id, club_no, application_reg_date, join_reg_date, member_role, approval_condition, join_greeting)
VALUES (seq_club_user_no.nextval, 'user03',3, sysdate, null, null, null, '안녕하세요 테스트 가입인사입니다44');

//모임일정등록
addMeeting()
INSERT INTO meeting (meeting_no, club_no, add_meeting_user_id, meeting_title, meeting_content, meeting_date, meeting_place, meeting_time, meeting_weather, meeting_reg_date, meeting_member, meeting_maximum_member)
VALUES (seq_meeting_no.nextval, 2, 'user01', '테스트일정제목', '테스트일정내용', '테스트일정날짜', '테스트일정장소', '테스트일정시간', '테스트날씨', sysdate, 1, 10);
INSERT INTO meeting (meeting_no, club_no, add_meeting_user_id, meeting_title, meeting_content, meeting_date, meeting_place, meeting_time, meeting_weather, meeting_reg_date, meeting_member, meeting_maximum_member)
VALUES (seq_meeting_no.nextval, 2, 'user02', '테스트일정제목', '테스트일정내용', '테스트일정날짜', '테스트일정장소2', '테스트일정시간2', '테스트날씨2', sysdate, 1, 10);


//모임일정 참여1
addMeetingMember()
INSERT INTO participant (participant_no, meeting_no, participant_user_id)
VALUES (seq_participant_no.nextval, 2, 'user01');

//모임일정 참여2
addMeetingMember()
INSERT INTO participant (participant_no, meeting_no, participant_user_id)
VALUES (seq_participant_no.nextval, 2, 'user03');


//간단 select 문
//모임
select * from club;
//모임원
select * from club_user;
//모임일정
select * from meeting;
//모임일정참여자
일정 참여자 
select * from PARTICIPANT;

//모임 상세보기
getClub()
select 
		club_no, user_id, club_title, club_detail, club_reg_date, current_member, club_max_member, club_category, club_area, club_image
FROM club
WHERE club_no = 2;

//모임 수정
updateclub()
UPDATE club
	SET
	club_title = '모임이름수정 테스트' ,
	club_detail = '모임설명수정 테스트' ,
	club_category = '카테고리수정' ,
	club_area = '모임활동영역수정 테스트' ,
	club_image = '모임이미지 수정 테스트'
	WHERE club_no = 3;

//모임 삭제
deleteClub()
DELETE FROM club
WHERE club_no=10;


//모임리스트
getClubList()
SELECT 
	club_no, user_id, club_title, club_detail, club_reg_date, club_image, current_member, club_max_member, club_category, club_area
	FROM club
	ORDER BY club_no ASC;

	
//내가 가입한 모임리스트
SELECT
	club_user_no, club_no, user_id, application_reg_date, join_reg_date, logout_date, member_role, approval_condition, join_greeting
	FROM club_user
	WHERE user_id = 'user02';
	

//전체모임 수
getTotalClubCount()
SELECT
		COUNT(*)
		FROM (
				SELECT
				*
				FROM club		)
				
				

//모임원 리스트
getClubMemberList()
SELECT 
	club_user_no, user_id, club_no, application_reg_date, join_reg_date, logout_date, member_role, approval_condition, join_greeting
	FROM club_user
	WHERE club_no = 2;
	

//모임일정 리스트
getMeetingList()
SELECT
	meeting_no, club_no, meeting_title, meeting_date, meeting_time, meeting_place, meeting_weather, meeting_member, meeting_maximum_member
	FROM meeting
	WHERE club_no=2;

//모임일정 참여자 리스트(조인해야함)
getMeetingmemberList()
SELECT
	participant_no, meeting_no, participant_user_id
	FROM participant
	WHERE meeting_no = 2;

//모임일정 상세보기
getMeeting()
SELECT
	meeting_no ,
	club_no ,
	add_meeting_user_id ,
	meeting_title ,
	meeting_content ,
	meeting_date ,
	meeting_place ,
	meeting_time ,
	meeting_weather ,
	meeting_member ,
	meeting_maximum_Member
	FROM meeting
	WHERE meeting_no = 2;
	

//모임일정 수정
updateMeeting()
UPDATE meeting
	SET
		meeting_title = '모임일정제목수정test' ,
		meeting_content = '모임일정내용수정test' ,
		meeting_date = '모임일정날짜수정 test' ,
		meeting_place = '모임일정장소수정 test' ,
		meeting_time = '모임일정시간수정 test',
		meeting_maximum_member = '20'
		WHERE meeting_no = 24;

//모임일정 참여신청 취소
deleteMeetingMember()
DELETE FROM participant WHERE participant_no = 2;

//모임일정 삭제
deleteMeeting()
DELETE FROM meeting WHERE meeting_no = 6;

//모임원 직책 수정
updateMemberRole()
UPDATE club_user
	SET member_role = 1
	WHERE club_user_no = 12;


//모임원 추방
deleteClubMember()
DELETE FROM club_user WHERE club_user_no = 13;


//가입신청현황 삭제
deleteApprovalCondition()
update club_user
	SET approval_condition = 0
	WHERE club_user_no = 2;

	
//가입승인 및 거절
updateApprovalCondition()
UPDATE club_user
	SET approval_condition = 1
	WHERE club_user_no = 12;



