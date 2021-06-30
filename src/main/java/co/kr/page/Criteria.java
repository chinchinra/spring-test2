package co.kr.page;

public class Criteria {

	// 현재 페이지
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	// rowstart,end 사용하기위한 사전작업으로 예상
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	// page 1 -1 *10 = 0 , 2 -1 *10 = 10
	public int getPerPageNum() {
		return this.perPageNum;
	}

	// 보여지는 열의 스타트 between rowstart and rowend
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}

	// 0 * 10 + 1 = 1 , 2 -1 * 10 + 1 = 11
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}

}
