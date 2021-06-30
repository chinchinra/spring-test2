package co.kr.page;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	private Criteria cri;

	public void setCri(Criteria cri) {
		this.cri = cri;

	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	// 쓰는데 없음 걍 확인용인가봄
	public boolean isPrev() {
		return prev;
	}

	// 쓰는데 없음 걍 확인용인가봄
	public boolean isNext() {
		return next;
	}

	// 현재 보여지는 화면의 페이지 넘버?
	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	// 다음 이전버튼 보여줄지 말지 메서드 , start,end page setting
	private void calcData() {
		// 11 10 ceil = 그것보다 큰값중 가장 작은 정수값 , page = 11 1.1 -> 11 endpage = 11
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		// 10페이지 미만이면 무조건 endpage는 10 , 10-10 +1 = 1
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}

	// url을 이런식으로 준다는 뜻 , 원 url+page=??,perpagenum=?? 이런식
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum()).build();

		return uriComponents.toUriString();
	}

//	public String makeSearch(int page) {
//
//		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
//				.queryParam("perPageNum", cri.getPerPageNum())
//				.queryParam("searchType", ((SearchCriteria) cri).getSearchType())
//				.queryParam("keyword", encoding(((SearchCriteria) cri).getKeyword())).build();
//		return uriComponents.toUriString();
//	}

	private String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) {
			return "";
		}

		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}

}
