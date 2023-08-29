package com.multi.wave.show;

public class Page1VO {
	private int start;
	private int end;
	private int page;
	 private String query;
	 
	public void setStartEnd(int page) {
		//page별로 start, end값만 구해주면 됨.
		start = 1 + (page - 1) * 16; 
		//무조건 1부터 시작
		//1page: 1 + 0 * 10 => start 1
		//2page: 1 + 1 * 10 => start 11  
		end = page * 16;
		//1page: 1 * 10 => end 10
		//2page: 2 * 10 => end 20
	}

	   public String getQuery() {
	        return query;
	    }

	    public void setQuery(String query) {
	        this.query = query;
	    }
	    
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

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

	@Override
	public String toString() {
		return "Page1VO [start=" + start + ", end=" + end + ", page=" + page + ", query=" + query + "]";
	}
	

}
