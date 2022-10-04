package com.link.common;


public class Search {
	
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageUnit;
	private int pageSize;
	private int order;
	private int startRowNum;
	private int endRowNum;
	
	public Search(){
		
	}
	
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public int getStartRowNum() {
		return ((getCurrentPage() - 1) * getPageSize() + 1);
	}

	public int getEndRowNum() {
		return getCurrentPage() * getPageSize();
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Search : [currentPage] = " + currentPage + ", [order] = " + order +", [SearchCondition] = " + searchCondition 
				+ ", [SearchKeyword] = " + searchKeyword + ", [pageSize] = " + pageSize
				+ ", [startRowNum] = " + startRowNum + ", [endRowNum] = " + endRowNum;
	}
}