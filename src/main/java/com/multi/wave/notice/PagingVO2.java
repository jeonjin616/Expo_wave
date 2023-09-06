package com.multi.wave.notice;

public class PagingVO2 {
	private int start;
	private int end;
	private int page;
	private int perPageNum = 10; // 페이지당 게시글 수
	
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	public void setStartEnd(int currentPage) {
        this.start = (currentPage - 1) * perPageNum;
        this.end = this.start + perPageNum - 1;
    }

    public int getPerPageNum() {
        return this.perPageNum;
    }

}
