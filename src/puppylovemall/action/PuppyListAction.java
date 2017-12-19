package puppylovemall.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Action;
import common.ActionForward;
import common.PageInfo;
import puppylovemall.svc.PuppyListService;
import puppylovemall.vo.Puppy;

public class PuppyListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		//쿠키를 통해서 오늘 본 상품
		List<String> todayImageList = new ArrayList<String>();
		Cookie[] cookieArray = request.getCookies();
		
		if(cookieArray != null) {
			for(int i =0; i<cookieArray.length; i++) {
				if(cookieArray[i].getName().startsWith("today")) {
					todayImageList.add(cookieArray[i].getValue());
				}
			}
		}
		// 상품리스트 페이징 처리
//		List<Puppy> puppyList=new ArrayList<Puppy>();
	  	int page=1;
		int limit=12;//페이지당 글 갯수 
		
		if(request.getParameter("page")!=null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		PuppyListService puppyListService = new PuppyListService();
		int listCount = puppyListService.getListCount(); //총 리스트 수를 받아옴.
		System.out.println("입력수 : " + listCount);
		//총 페이지 수.
   		int maxPage=(int)((double)listCount/limit+0.95); //0.95를 더해서 올림 처리.
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
   	    int endPage = startPage+limit-1;

   		if (endPage> maxPage) endPage= maxPage;

   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
			
		
		
		List<Puppy>puppyList = puppyListService.getPuppyList(page,limit); //리스트를 받아옴.
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("puppyList", puppyList);
		request.setAttribute("todayImageList", todayImageList);
		ActionForward forward = new ActionForward("puppymall/puppyList.jsp", false);
		return forward;
	}

}
