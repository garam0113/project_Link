addClubPost()
INSERT INTO CLUB_POST (CLUB_POST_NO, CLUB_NO, USER_ID, CLUB_POST_TITLE, CLUB_POST_CONTENT, CLUB_POST_VIDEO1, CLUB_POST_VIDEO2, 
CLUB_POST_VIDEO3, CLUB_POST_REG_DATE, CLUB_POST_LIKE_COUNT, CLUB_POST_COMMENT_COUNT, IMAGE1, IMAGE2, IMAGE3, IMAGE4, 
IMAGE5, IMAGE6, IMAGE7, IMAGE8, IMAGE9, IMAGE10) VALUES (seq_club_post_no.NEXTVAL, 1, 'USER02', 'clubposttitle1',
null, null, null, null, sysdate, 0, 0, 'a.jpg', null, null, null, null, null, null, null, null, null);



getClubPost() - 모임게시물상세보기 가져오기



getClubPost() - 모임게시물댓글리스트 가져오기



getClubPostList()



updateClubPost() - 모임게시물 수정할 떄



updateClubPost() - 모임게시물 삭제할 때




updateClubPostLike()




addClubPostComment()




updateClubPostComment()




updateClubPostCommentLike()




addClubPostRecomment()




getClubPostRecommentList()




updateClubPostRecomment()




deleteClubPostRecomment()




updateClubPostRecommentLike()














