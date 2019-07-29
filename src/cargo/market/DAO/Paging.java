package cargo.market.DAO;


public class Paging {
	
	MarketDAO mdao = new MarketDAO();

	// 현재페이지, 현재블럭 모두 0부터 !!
	
	public int nowPage; 			// 현재페이지
	private int nowGroup; // 현재 그룹
	
	public int recPerPage;		// 한 페이지당 보여질 글의 개수
	public int pagePerGroup;		// 페이지그룹당 묶여질 페이지 개수
	
	private int totalRecord ;		// 게시판에 저장된 전체 글의 개수 - DB에서 검색해서 가져와야 함.

	private int totalPage; // 전체페이지 수
	private int totalGroup; // 총 그룹
	
	// 현재 그룹 끝, 시작 번호
	private int lastPageNum;
	private int startPageNum;
	
	private int lastRecNum; // 현재페이지의 마지막 글 번호
	private int startRecNum; // 현재페이지의 첫 번째 글 번호
	
	boolean isFirstGroup;
	boolean isLastGroup;
	
	
/*
	// 이전,다음 그룹 시작 페이지
	private int prev_startPage;
	private int next_startPage;
	
	private int prev_lastPage; // 이전그룹 마지막페이지
	
	private int lastRecNum; // 현재페이지의 마지막 글 번호
	private int startRecNum; // 현재페이지의 첫 번째 글 번호
 */  
	
	public void setRecPerPage(int recPerPage) {
		this.recPerPage = recPerPage;
	}
	public void setPagePerGroup(int pagePerGroup) {
		this.pagePerGroup = pagePerGroup;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public void setNowGroup() {
		this.nowGroup = this.nowPage / this.pagePerGroup +1;
	}
	public void setLastPageNum() {
		this.lastPageNum = nowGroup * pagePerGroup;
	}
	public void setStartPageNum() {
		this.startPageNum = lastPageNum - (pagePerGroup - 1);
	}
	
public void setTotalRecord(int nowPage) {
	this.totalRecord = mdao.getTotal();
	makePaging(nowPage);
}

	public void setTotalPage() {
		this.totalPage = totalRecord / recPerPage + (totalRecord%recPerPage >0 ? 1 : 0);
	}
	public void setTotalGroup(){
		this.totalGroup = totalPage / pagePerGroup + (totalPage%pagePerGroup >0 ? 1 : 0);
	}
	
	public void setFirstGroup() {
		this.isFirstGroup = nowGroup == 0 ? true : false;
	}
	public void setLastGroup() {
		this.isLastGroup = nowGroup == totalGroup ? true : false;
	}
	
	public void setLastRecNum() {
		this.lastRecNum = nowPage*recPerPage;
	}
	public void setStartRecNum() {
		this.startRecNum = lastRecNum - (recPerPage-1);
	}
	
	private void makePaging(int nowPage){
		
		if(this.totalRecord==0) return;
		
		setNowPage(nowPage);
		setTotalPage();
		
		setNowGroup();
		setLastPageNum();
		setStartPageNum();
		
		
		setFirstGroup();
		setLastGroup();
		setStartRecNum();
		setLastRecNum();
		
		
		if(nowPage < 0) setNowPage(1);
		if(nowPage > totalPage) setNowPage(totalPage);
		if(lastPageNum > totalPage)	lastPageNum = totalPage;
		if(lastRecNum>totalRecord)	lastRecNum = totalRecord;
		
		System.out.println("nowPage "+nowPage);
		System.out.println("nowGroup "+nowGroup);
		System.out.println("totalPage "+ totalPage);
		System.out.println("lastPage "+ lastPageNum);
		
			
		
		/*if (this.totalCount == 0) return; // 게시 글 전체 수가 없는 경우
        if (this.pageNo == 0) this.setPageNo(1); // 기본 값 설정
        if (this.pageSize == 0) this.setPageSize(10); // 기본 값 설정

        int finalPage = (totalCount + (pageSize - 1)) / pageSize; // 마지막 페이지
        if (this.pageNo > finalPage) this.setPageNo(finalPage); // 기본 값 설정

        if (this.pageNo < 0 || this.pageNo > finalPage) this.pageNo = 1; // 현재 페이지 유효성 체크

        boolean isNowFirst = pageNo == 1 ? true : false; // 시작 페이지 (전체)
        boolean isNowFinal = pageNo == finalPage ? true : false; // 마지막 페이지 (전체)

        int startPage = ((pageNo - 1) / 10) * 10 + 1; // 시작 페이지 (페이징 네비 기준)
        int endPage = startPage + 10 - 1; // 끝 페이지 (페이징 네비 기준)

        if (endPage > finalPage) { // [마지막 페이지 (페이징 네비 기준) > 마지막 페이지] 보다 큰 경우
            endPage = finalPage;
        }

        this.setFirstPageNo(1); // 첫 번째 페이지 번호

        if (isNowFirst) {
            this.setPrevPageNo(1); // 이전 페이지 번호
        } else {
            this.setPrevPageNo(((pageNo - 1) < 1 ? 1 : (pageNo - 1))); // 이전 페이지 번호
        }

        this.setStartPageNo(startPage); // 시작 페이지 (페이징 네비 기준)
        this.setEndPageNo(endPage); // 끝 페이지 (페이징 네비 기준)

        if (isNowFinal) {
            this.setNextPageNo(finalPage); // 다음 페이지 번호
        } else {
            this.setNextPageNo(((pageNo + 1) > finalPage ? finalPage : (pageNo + 1))); // 다음 페이지 번호
        }

        this.setFinalPageNo(finalPage); // 마지막 페이지 번호
*/

		
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public int getNowGroup() {
		return nowGroup;
	}
	public int getRecPerPage() {
		return recPerPage;
	}
	public int getPagePerGroup() {
		return pagePerGroup;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getTotalGroup() {
		return totalGroup;
	}
	public int getLastPageNum() {
		return lastPageNum;
	}
	public int getStartPageNum() {
		return startPageNum;
	}
	public boolean isFirstGroup() {
		return isFirstGroup;
	}
	public boolean isLastGroup() {
		return isLastGroup;
	}
	public int getLastRecNum() {
		return lastRecNum;
	}
	public int getStartRecNum() {
		return startRecNum;
	}
	
	

}
