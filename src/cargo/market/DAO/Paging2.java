package cargo.market.DAO;

public class Paging2 {
	
	/*	if(nowPage>totalPage) NowPage = totalPage;
 		if(lastRecNum>totalRecord)	lastRecNum = totalRecord;
  		if(lastPageNum>totalPage)	lastPageNum = totalPage;
		if(prev_startPage<1)	prev_startPage=1;
		if(next_startPage>totalPage)
			next_startPage = totalPage/pagePerGroup * pagePerGroup +1;
	*/	
	
	/* 직접 세팅하는 값 - 먼저 설정하기! */
	public int nowPage; 			// 현재페이지
	public int recPerPage = 9;		// 한 페이지당 보여질 글의 개수
	public int pagePerGroup = 5;		// 페이지그룹당 묶여질 페이지 개수
	
	private int totalRecord ;		// 게시판에 저장된 전체 글의 개수 - DB에서 검색해서 가져와야 함.
	
	private int lastRecNum; // 현재페이지의 마지막 글 번호
	private int startRecNum; // 현재페이지의 첫 번째 글 번호
	private int totalPage; // 전체페이지 수 
	private int nowGroup; // 현재 그룹
	
	
	// 현재 그룹 끝, 시작 번호
	private int lastPageNum;
	private int startPageNum;
	
	// 이전,다음 그룹 시작 번호
	private int prev_startPage;
	private int next_startPage;

	//	private int totalBlock;	전체블럭 -> 피료엄낭?
	MarketDAO mdao = new MarketDAO();
	
	/* 전체 게시글 수 */
	public void setTotalRecord() {
		this.totalRecord = mdao.getTotal();
	}
	
	public void setLastRecNum() {
		// 현재페이지의 마지막 글번호
		this.lastRecNum = nowPage * recPerPage;
	}
	
	public void setStartRecNum() {
		// 현재페이지의 첫 번째 글번호
		this.startRecNum = lastRecNum - (recPerPage-1);
	}
	
	public void setTotalPage() {
		// 전체 글 수 / 페이지당 글 수 : 나눈 나머지가 존재하면 +1
		this.totalPage = totalRecord / recPerPage + ( totalRecord%recPerPage>0 ?1:0);
	}
	
	public void setNowGroup() {
		// 현재페이지 / 페이지 당 글 수  : 나눈 나머지가 존재하면 +1
		this.nowGroup = nowPage / pagePerGroup + ( nowPage%pagePerGroup>0 ? 1:0); 
	}
	
	public void setLastPageNum() {
		this.lastPageNum = nowGroup * pagePerGroup;
	}
	
	public void setStartPageNum() {
		this.startPageNum = lastPageNum - (pagePerGroup - 1);
	}
	
	public void setPrev_startPage() {
		this.prev_startPage = startPageNum - pagePerGroup;
	}
	
	public void setNext_startPage() {
		this.next_startPage = startPageNum + pagePerGroup;
	}


	/* getter */
	
	public int getTotalRecord() {
		return totalRecord;
	}

	public int getLastRecNum() {
		return lastRecNum;
	}

	public int getStartRecNum() {
		return startRecNum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getNowGroup() {
		return nowGroup;
	}

	public int getLastPageNum() {
		return lastPageNum;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public int getPrev_startPage() {
		return prev_startPage;
	}

	public int getNext_startPage() {
		return next_startPage;
	}

	public void makePaging(int nowPage){
		if(nowPage < 1) this.nowPage = 1;
		else this.nowPage = nowPage;
		
		setTotalRecord(); // 검색 시 설정하기
		
		
		
	}

}
