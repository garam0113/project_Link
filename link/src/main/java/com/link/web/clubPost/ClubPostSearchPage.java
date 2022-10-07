package com.link.web.clubPost;

import org.springframework.beans.factory.annotation.Value;

import com.link.common.CommonUtil;
import com.link.common.Search;

public class ClubPostSearchPage {
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	public static Search getSearch(int order) {
		Search search = new Search();
		
		// 모임게시물 탭 클릭했을때 currentPage는 null이다
		int currentPage = 1;
		
		// 모임게시물 탭 클릭시 null, 검색버튼 클릭시 nullString
		if (search.getCurrentPage() != 0) {
			currentPage = search.getCurrentPage();
		}

		// 모임게시물 탭 클릭시 searchKeyword, searchCondition 둘 다 null ==> nullString 으로 변환
		String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
		String searchCondition = CommonUtil.null2str(search.getSearchCondition());		
		
		// 상품명과 상품가격에서 searchKeyword가 문자일때 nullString으로 변환
		//if (!search.getSearchCondition().trim().equals("1") && !CommonUtil.parsingCheck(searchKeyword)) {
			//searchKeyword = "";
		//}
		
		search = new Search(currentPage, searchCondition, searchKeyword, 10, order);
		
		return search;
	}
}
