package com.link.service.domain;

public class ClubPost {
	
	// search에 oreder 0 : 최신순, 1 : 역최신순, 2 : 좋아요 많은순/최신순, 3 : 특정 모임에서 내가 작성한 게시물
	
	private int clubNo;						// 모임의 고유번호
	private int clubPostNo;					// 모임게시물의 고유번호
	private int clubPostCommentNo;			// 모임게시물댓글의 고유번호
	private User user;						// 작성자의 모든 정보
	private String clubPostTitle;			// 제목 (텍스트 1~40자)
	private String clubPostContent;			// 내용 (텍스트 최대500자) 
	private String clubPostVideo1;			// 영상1 선택
	//private String clubPostVideo2;			// 영상2 선택
	//private String clubPostVideo3;			// 영상3 선택
	private String clubPostRegDate;			// 등록날짜
	private String clubPostUpdateDate;		// 수정날짜
	private int clubPostHeartCount;			// 좋아요 수 (default 0)
	private int clubPostCommentCount;		// 댓글 수  (default 0)
	private int reportCondition;			// 신고여부
	private int deleteCondition;			// 삭제여부
	private int heartCondition;				// 좋아요하다/좋아요취소하다
	private String clubRole;				// 모임직책
	private String userId;					// 삭제한 회원 아이디
	private String nickName;				// 삭제한 회원 닉네임
	private String image1;					// 이미지1 필수1개
	//private String image2;
	//private String image3;
	//private String image4;
	//private String image5;
	//private String image6;
	//private String image7;
	//private String image8;
	//private String image9;
	//private String image10;
	
	public ClubPost() {
	}

	public ClubPost(int clubPostNo, int clubPostCommentNo) {
		super();
		this.clubPostNo = clubPostNo;
		this.clubPostCommentNo = clubPostCommentNo;
	}

	public ClubPost(int clubPostNo, int clubPostCommentNo, User user) {
		super();
		this.clubPostNo = clubPostNo;
		this.clubPostCommentNo = clubPostCommentNo;
		this.user = user;
	}

	public ClubPost(int clubNo, int clubPostNo, int clubPostCommentNo, User user, String clubPostTitle,
			String clubPostContent, String clubPostVideo1, String clubPostRegDate, String clubPostUpdateDate,
			int clubPostHeartCount, int clubPostCommentCount, int reportCondition, int deleteCondition,
			int heartCondition, String clubRole, String userId, String nickName, String image1) {
		super();
		this.clubNo = clubNo;
		this.clubPostNo = clubPostNo;
		this.clubPostCommentNo = clubPostCommentNo;
		this.user = user;
		this.clubPostTitle = clubPostTitle;
		this.clubPostContent = clubPostContent;
		this.clubPostVideo1 = clubPostVideo1;
		this.clubPostRegDate = clubPostRegDate;
		this.clubPostUpdateDate = clubPostUpdateDate;
		this.clubPostHeartCount = clubPostHeartCount;
		this.clubPostCommentCount = clubPostCommentCount;
		this.reportCondition = reportCondition;
		this.deleteCondition = deleteCondition;
		this.heartCondition = heartCondition;
		this.clubRole = clubRole;
		this.userId = userId;
		this.nickName = nickName;
		this.image1 = image1;
	}

	public int getClubNo() {
		return clubNo;
	}

	public void setClubNo(int clubNo) {
		this.clubNo = clubNo;
	}

	public int getClubPostNo() {
		return clubPostNo;
	}

	public void setClubPostNo(int clubPostNo) {
		this.clubPostNo = clubPostNo;
	}

	public int getClubPostCommentNo() {
		return clubPostCommentNo;
	}

	public void setClubPostCommentNo(int clubPostCommentNo) {
		this.clubPostCommentNo = clubPostCommentNo;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getClubPostTitle() {
		return clubPostTitle;
	}

	public void setClubPostTitle(String clubPostTitle) {
		this.clubPostTitle = clubPostTitle;
	}

	public String getClubPostContent() {
		return clubPostContent;
	}

	public void setClubPostContent(String clubPostContent) {
		this.clubPostContent = clubPostContent;
	}

	public String getClubPostVideo1() {
		return clubPostVideo1;
	}

	public void setClubPostVideo1(String clubPostVideo1) {
		this.clubPostVideo1 = clubPostVideo1;
	}

	public String getClubPostRegDate() {
		return clubPostRegDate;
	}

	public void setClubPostRegDate(String clubPostRegDate) {
		this.clubPostRegDate = clubPostRegDate;
	}

	public String getClubPostUpdateDate() {
		return clubPostUpdateDate;
	}

	public void setClubPostUpdateDate(String clubPostUpdateDate) {
		this.clubPostUpdateDate = clubPostUpdateDate;
	}

	public int getClubPostHeartCount() {
		return clubPostHeartCount;
	}

	public void setClubPostHeartCount(int clubPostHeartCount) {
		this.clubPostHeartCount = clubPostHeartCount;
	}

	public int getClubPostCommentCount() {
		return clubPostCommentCount;
	}

	public void setClubPostCommentCount(int clubPostCommentCount) {
		this.clubPostCommentCount = clubPostCommentCount;
	}

	public int getReportCondition() {
		return reportCondition;
	}

	public void setReportCondition(int reportCondition) {
		this.reportCondition = reportCondition;
	}

	public int getDeleteCondition() {
		return deleteCondition;
	}

	public void setDeleteCondition(int deleteCondition) {
		this.deleteCondition = deleteCondition;
	}

	public int getHeartCondition() {
		return heartCondition;
	}

	public void setHeartCondition(int heartCondition) {
		this.heartCondition = heartCondition;
	}

	public String getClubRole() {
		return clubRole;
	}

	public void setClubRole(String clubRole) {
		this.clubRole = clubRole;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ClubPost [clubNo=");
		builder.append(clubNo);
		builder.append(", clubPostNo=");
		builder.append(clubPostNo);
		builder.append(", clubPostCommentNo=");
		builder.append(clubPostCommentNo);
		builder.append(", user=");
		builder.append(user);
		builder.append(", clubPostTitle=");
		builder.append(clubPostTitle);
		builder.append(", clubPostContent=");
		builder.append(clubPostContent);
		builder.append(", clubPostVideo1=");
		builder.append(clubPostVideo1);
		builder.append(", clubPostRegDate=");
		builder.append(clubPostRegDate);
		builder.append(", clubPostUpdateDate=");
		builder.append(clubPostUpdateDate);
		builder.append(", clubPostHeartCount=");
		builder.append(clubPostHeartCount);
		builder.append(", clubPostCommentCount=");
		builder.append(clubPostCommentCount);
		builder.append(", reportCondition=");
		builder.append(reportCondition);
		builder.append(", deleteCondition=");
		builder.append(deleteCondition);
		builder.append(", heartCondition=");
		builder.append(heartCondition);
		builder.append(", clubRole=");
		builder.append(clubRole);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", nickName=");
		builder.append(nickName);
		builder.append(", image1=");
		builder.append(image1);
		builder.append("]");
		return builder.toString();
	}
	
}
