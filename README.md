<h1> MVC 패턴의 강아지분양 사이트 프로젝트</h1>
<ul>
  <li><h3>작업기간 : (15일) </h3></li>
  <li><h3>작업인원 : 단독작업</h3></li>
  <li><h3>작업 툴 : Eclipse, Apache Tomcat, Oracle, sqldeveloper, GitHub</h3></li>
  <li><h3>부트 스트랩 : <a href="https://startbootstrap.com/template-categories/all/">Startbootstrap</a>사용</h3></li>
  <li><h3>작품소개 : Apache Tomcat을 통해 DB에 연동한 MVC 패턴의  프로젝트</h3></li>
</ul>
<h2>DB설계(Oracle)</h2> 
<img src="/img/pyppydb1.jpg" width="90%" height="90%">
강아지 정보DB
<img src="/img/memberdb2.jpg" width="90%" height="90%">
회원DB
<img src="/img/cartdb.jpg" width="90%" height="90%">
강아지찜하기(장바구니기능)DB
<img src="/img/qnadb.jpg" width="90%" height="90%">
게시판 DB(Review게시판 동일)

<h2>쇼핑몰 메인페이지 이미지</h2> 
<img src="/img/puppymall_main2.jpg" width="90%" height="90%">
<img src="/img/puppymall_main3.jpg" width="90%" height="90%">
전체리스트(전체 목록 페이징 처리), 우측 하단 스크롤업 기능(최상단으로 이동)
 <img src="/img/kindlist.jpg" width="90%" height="90%">
종류별 리스트(각각 종류별 페이징 처리)
<h4>적용 파일</h4>
<ul>
	<li><h4>puppyList.jsp</h4></li>
	<li><h4>puppyListAction.java</h4></li>
	<li><h4>puppyListService.java</h4></li>
</ul>
<h2>로그인 페이지</h2>
<img src="/img/login_img.jpg" width="90%" height="90%">

<h4>적용 파일</h4>
<ul>
	<li><h4>loginForm.jsp</h4></li>
	<li><h4>MemberLoginAction.java</h4></li>
	<li><h4>MemberLoginService.java</h4></li>
</ul>
<h2>로그인 전,후 메인 페이지</h2>
<img src="/img/beforelogin.jpg" width="90%" height="90%">
로그인 전
<img src="/img/afterlogin.jpg" width="90%" height="90%">
로그인 후, 로그아웃 버튼 클릭
<h2>회원가입 페이지</h2>
<img src="/img/join.jpg" width="90%" height="90%">
<img src="/img/join_page.jpg" width="90%" height="90%">
<h4>적용 파일</h4>
<ul>
	<li><h4>joinForm.jsp</h4></li>
	<li><h4>MemberJoinAction.java</h4></li>
	<li><h4>MemberJoinService.java</h4></li>
</ul>
<h2>Admin(관리자 로그인)</h2>
<img src="/img/adminlogin.jpg" width="90%" height="90%">
관리자 로그인시 바뀌는 Navi메뉴
<img src="/img/memberlist.jpg" width="90%" height="90%">
회원 리스트 확인 페이지
<h4>적용 파일</h4>
<ul>
	<li><h4>member_list.jsp</h4></li>
	<li><h4>memberListAction.java</h4></li>
	<li><h4>memberListService.java</h4></li>
</ul>
<img src="/img/registpuppy.jpg" width="90%" height="90%">
강아지 등록 페이지
<h4>적용 파일</h4>
<ul>
	<li><h4>puppyRegistForm.jsp</h4></li>
	<li><h4>PuppyRegistAction.java</h4></li>
	<li><h4>PuppyRegistFormAction.java</h4></li>
	<li><h4>PuppyRegistService.java</h4></li>
</ul>
<h2>강아지 상세 페이지</h2>
<img src="/img/puppy_view.jpg" width="90%" height="90%">
<h4>적용 파일</h4>
<ul>
	<li><h4>puppyView.jsp</h4></li>
	<li><h4>puppyViewAction.java</h4></li>
	<li><h4>puppyViewService.java</h4></li>
</ul>
<h2>MyPage</h2>
<img src="/img/mypageList.jpg" width="90%" height="90%">
<h4>Dropdown사용</h4>
<ul>
	<li><h4>강아지 찜하기</h4></li>
	<li><h4>주문배송 조회</h4></li>
	<li><h4>가입정보 확인</h4></li>
</ul>
<h2>강아지 찜하기</h2>
<img src="/img/cartlist.jpg" width="90%" height="90%">
<h4>cart테이블에 강아지 찜 목록 저장</h4>
<h4>적용파일</h4>
<ul>
	<li><h4>puppyCartList.jsp</h4></li>
	<li><h4>PuppyCartListAction.java</h4></li>
	<li><h4>PuppyCartQtyDownService.java</h4></li>
	<li><h4>PuppyCartQtyUpAction.java</h4></li>
	<li><h4>PuppyCartListService.java</h4></li>
	<li><h4>PuppyCartQtyDownService.java</h4></li>
	<li><h4>PuppyCartQtyUpService.java</h4></li>
</ul>
<h4>삭제 버튼 적용 파일</h4>
<ul>
	<li><h4>PuppyCartRemoveAction.java</h4></li>
	<li><h4>PuppyCartRemoveService.java</h4></li>
</ul>

<h2>강아지 주문하기</h2>
<img src="/img/buylist.jpg" width="90%" height="90%">
<h4>cart테이블에 강아지 찜 목록 저장, 구매번호 시퀀스로 자동발생 </h4>
<h4>적용파일</h4>
<ul>
	<li><h4>puppyBuyList.jsp</h4></li>
	<li><h4>PuppyBuyAddAction.java</h4></li>
	<li><h4>PuppyBuyListService.java</h4></li>
	<li><h4>PuppyBuyAddService.java</h4></li>
</ul>
<h4>삭제 버튼 적용 파일</h4>
<ul>
	<li><h4>PuppyBuyRemoveAction.java</h4></li>
	<li><h4>PuppyBuytRemoveService.java</h4></li>
</ul>
<h2>가입정보 보기</h2>
<img src="/img/myinfoadr.jpg">
<img src="/img/myinfo.jpg">
<h4>회원 자신 정보 보기,id값 get방식으로 불러와 정보 뿌려주기 </h4>
<h4>적용파일</h4>
<ul>
	<li><h4>getMember_info.jsp</h4></li>
	<li><h4>MemberInfoViewAction.java</h4></li>
	<li><h4>MemberInfoViewService.java</h4></li>
</ul>
<h2>게시판 리스트</h2>
<img src="/img/boardlist.jpg" width="90%" height="90%">
<h4>Q&A, Review게시판</h4>
<h4>DropDown사용</h4>
<ul>
	<li><h4>puppyBuyList.jsp</h4></li>
	<li><h4>PuppyBuyAddAction.java</h4></li>
	<li><h4>PuppyBuyListService.java</h4></li>
	<li><h4>PuppyBuyAddService.java</h4></li>
</ul>
<h4>삭제 버튼 적용 파일</h4>
<ul>
	<li><h4>PuppyBuyRemoveAction.java</h4></li>
	<li><h4>PuppyBuytRemoveService.java</h4></li>
</ul>

<h2>Q&A, Review 게시판</h2>
<img src="/img/boardlist.jpg" width="90%" height="90%">
<h4>DropDown사용</h4>
<img src="/img/qna.jpg" width="90%" height="90%">
질문게시판
<img src="/img/review.jpg" width="90%" height="90%">
리뷰 게시판
<img src="/img/boardcontent.jpg">
게시글 페이지
<h4>Q&A, Review게시판의 JSP페이지, Action, Service,각각 따로 사용</h4>
<img src="/img/boardproejctlist.jpg" >
<img src="/img/boardjsp.jpg" >
