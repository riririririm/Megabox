package com.megabox.page;

public class StoreSearchMakePage {
	private int perPage;
	private int curPage;
	
	public StoreSearchMakePage(int perPage, int curPage) {
		this.perPage = perPage;
		this.curPage = curPage;
	}
	
	public StoreSearchMakePage(int curPage) {
		this(5, curPage);
	}
	
	public SearchRow makeRow() {
		SearchRow searchRow = new SearchRow();
		int startRow = (curPage-1)*perPage+1;
		int lastRow = curPage*perPage;
		searchRow.setStartRow(startRow);
		searchRow.setLastRow(lastRow);
		return searchRow;
	}

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
		
		
		return searchPager;
	}
}
