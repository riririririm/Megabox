package com.megabox.page;

public class SearchMakePage {
	private int perPage; //전체 페이지에 몇개 뿌려줄 건가
	private int curPage; //현재페이지
	private Search search;
	
	
	public SearchMakePage(int curPage, int perPage, String kind, String search) {
		this.perPage = perPage;
		this.curPage = curPage;
		this.search = new Search();
		this.search.setKind(kind);
		this.search.setSearch(search);
	}
	
	public SearchMakePage(int curPage, String kind, String search) {
		this(curPage, 10, kind, search); 
	}
	
	//row
	public SearchRow makeRow() {
		int startRow = (curPage-1)*perPage+1;
		int lastRow = curPage*perPage;
		SearchRow searchRow = new SearchRow();
		searchRow.setStartRow(startRow);
		searchRow.setLastRow(lastRow);
		return searchRow;
	}
	
	//page
	public SearchPager makePage(int totalCount) {
		SearchPager searchPager = new SearchPager();
		int totalPage = totalCount/perPage;
		if(totalCount%perPage!=0) {
			totalPage++;
		}
		
		int perBlock = 5;
		int totalBlock = totalPage/perBlock;
		if(totalPage%perBlock!=0) {
			totalBlock++;
		}
		
		int curBlock = curPage/perBlock;
		if(curPage%perBlock !=0) {
			curBlock++;
		}
		
		int startNum = (curBlock-1)*perBlock+1;
		int lastNum = curBlock*perBlock;
		
		if(curBlock==totalBlock) {
			lastNum = totalPage;
		}
		searchPager.setCurPage(curPage);
		searchPager.setCurBlock(curBlock);
		searchPager.setLastNum(lastNum);
		searchPager.setStartNum(startNum);
		searchPager.setTotalBlock(totalBlock);
		searchPager.setSearch(search);
		
		
		return searchPager;
	}
}




















