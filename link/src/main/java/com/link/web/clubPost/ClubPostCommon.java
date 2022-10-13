package com.link.web.clubPost;

import org.springframework.beans.factory.annotation.Value;

import com.link.common.CommonUtil;
import com.link.common.Search;

public class ClubPostCommon {
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	public static Search getSearch(Search search) {
		
		// 모임게시물 탭 클릭했을때 currentPage는 null이다
		int currentPage = 1;
		
		// 모임게시물 탭 클릭시 null, 검색버튼 클릭시 nullString
		if (search.getCurrentPage() != 0) {
			currentPage = search.getCurrentPage();
		}
		
		search.setSearchCondition("1");
		
		// 모임게시물 탭 클릭시 searchKeyword, searchCondition 둘 다 null ==> nullString 으로 변환
		String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
		String searchCondition = CommonUtil.null2str(search.getSearchCondition());
		
		return new Search(currentPage, searchCondition, searchKeyword, 10, search.getOrder());
	}
}
