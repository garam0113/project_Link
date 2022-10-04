package com.link.service.domain;

public class ClubPost {
	
	private int clubNo;						// 모임의 고유번호
	private int clubPostNo;					// 모임게시물의 고유번호
	private User user;						// 작성자의 모든 정보
	private String clubPostTitle;			// 제목 (텍스트 1~40자)
	private String clubPostContent;			// 내용 (텍스트 최대500자) 
	private String clubPostVideo1;			// 영상1 선택
	private String clubPostVideo2;			// 영상2 선택
	private String clubPostVideo3;			// 영상3 선택
	private String clubPostRegDate;			// 등록날짜
	private String clubPostUpdateDate;		// 수정날짜
	private int clubPostLikeCount;			// 좋아요 수 (default 0)
	private int clubPostCommentCount;		// 댓글 수  (default 0)
	private String image1;					// 이미지1 필수1개
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	private String image6;
	private String image7;
	private String image8;
	private String image9;
	private String image10;
	
	public ClubPost() {
	}

	public ClubPost(int clubNo, int clubPostNo, User user, String clubPostTitle, String clubPostContent,
			String clubPostVideo1, String clubPostVideo2, String clubPostVideo3, String clubPostRegDate,
			String clubPostUpdateDate, int clubPostLikeCount, int clubPostCommentCount, String image1, String image2,
			String image3, String image4, String image5, String image6, String image7, String image8, String image9,
			String image10) {
		super();
		this.clubNo = clubNo;
		this.clubPostNo = clubPostNo;
		this.user = user;
		this.clubPostTitle = clubPostTitle;
		this.clubPostContent = clubPostContent;
		this.clubPostVideo1 = clubPostVideo1;
		this.clubPostVideo2 = clubPostVideo2;
		this.clubPostVideo3 = clubPostVideo3;
		this.clubPostRegDate = clubPostRegDate;
		this.clubPostUpdateDate = clubPostUpdateDate;
		this.clubPostLikeCount = clubPostLikeCount;
		this.clubPostCommentCount = clubPostCommentCount;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
		this.image6 = image6;
		this.image7 = image7;
		this.image8 = image8;
		this.image9 = image9;
		this.image10 = image10;
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

	public String getClubPostVideo2() {
		return clubPostVideo2;
	}

	public void setClubPostVideo2(String clubPostVideo2) {
		this.clubPostVideo2 = clubPostVideo2;
	}

	public String getClubPostVideo3() {
		return clubPostVideo3;
	}

	public void setClubPostVideo3(String clubPostVideo3) {
		this.clubPostVideo3 = clubPostVideo3;
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

	public int getClubPostLikeCount() {
		return clubPostLikeCount;
	}

	public void setClubPostLikeCount(int clubPostLikeCount) {
		this.clubPostLikeCount = clubPostLikeCount;
	}

	public int getClubPostCommentCount() {
		return clubPostCommentCount;
	}

	public void setClubPostCommentCount(int clubPostCommentCount) {
		this.clubPostCommentCount = clubPostCommentCount;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getImage5() {
		return image5;
	}

	public void setImage5(String image5) {
		this.image5 = image5;
	}

	public String getImage6() {
		return image6;
	}

	public void setImage6(String image6) {
		this.image6 = image6;
	}

	public String getImage7() {
		return image7;
	}

	public void setImage7(String image7) {
		this.image7 = image7;
	}

	public String getImage8() {
		return image8;
	}

	public void setImage8(String image8) {
		this.image8 = image8;
	}

	public String getImage9() {
		return image9;
	}

	public void setImage9(String image9) {
		this.image9 = image9;
	}

	public String getImage10() {
		return image10;
	}

	public void setImage10(String image10) {
		this.image10 = image10;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ClubPost [clubNo=");
		builder.append(clubNo);
		builder.append(", clubPostNo=");
		builder.append(clubPostNo);
		builder.append(", user=");
		builder.append(user);
		builder.append(", clubPostTitle=");
		builder.append(clubPostTitle);
		builder.append(", clubPostContent=");
		builder.append(clubPostContent);
		builder.append(", clubPostVideo1=");
		builder.append(clubPostVideo1);
		builder.append(", clubPostVideo2=");
		builder.append(clubPostVideo2);
		builder.append(", clubPostVideo3=");
		builder.append(clubPostVideo3);
		builder.append(", clubPostRegDate=");
		builder.append(clubPostRegDate);
		builder.append(", clubPostUpdateDate=");
		builder.append(clubPostUpdateDate);
		builder.append(", clubPostLikeCount=");
		builder.append(clubPostLikeCount);
		builder.append(", clubPostCommentCount=");
		builder.append(clubPostCommentCount);
		builder.append(", image1=");
		builder.append(image1);
		builder.append(", image2=");
		builder.append(image2);
		builder.append(", image3=");
		builder.append(image3);
		builder.append(", image4=");
		builder.append(image4);
		builder.append(", image5=");
		builder.append(image5);
		builder.append(", image6=");
		builder.append(image6);
		builder.append(", image7=");
		builder.append(image7);
		builder.append(", image8=");
		builder.append(image8);
		builder.append(", image9=");
		builder.append(image9);
		builder.append(", image10=");
		builder.append(image10);
		builder.append("]");
		return builder.toString();
	}
	
}
