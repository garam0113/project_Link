package com.link.service.domain;

import java.sql.Date;

public class Feed {

	private int feedNo;
	private String userId;
	private int openCondition;
	private String content;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String video;
	private String hashTag;
	private int likeCount;
	private int commentCount;
	private Date regDate;
	private Date updateDate;
	private int reportCondition;
	private int deleteCondition;
	
	public Feed() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Feed [feedNo : " + feedNo + "] "
				+ "[userId : " + userId + "] "
				+ "[openCondition : " + openCondition + "] "
				+ "[content : " + content + "] "
				+ "[image1 : " + image1 + "] "
				+ "[image2 : " + image2 + "] "
				+ "[image3 : " + image3 + "] "
				+ "[image4 : " + image4 + "] "
				+ "[video : " + video + "] "
				+ "[hashTag : " + hashTag + "] "
				+ "[likeCount : " + likeCount + "] "
				+ "[commentCount : " + commentCount + "] "
				+ "[regDate : " + regDate + "] "
				+ "[updateDate : " + updateDate + "] "
				+ "[reportCondition : " + reportCondition + "] "
				+ "[deleteCondition : " + deleteCondition + "] ";
	}

}
