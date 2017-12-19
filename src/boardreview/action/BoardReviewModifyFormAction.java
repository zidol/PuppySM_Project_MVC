package boardreview.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardreview.svc.BoardReviewDetailService;
import boardreview.vo.BoardReviewBean;
import common.Action;
import common.ActionForward;

public class BoardReviewModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,
			 HttpServletResponse response) throws Exception {
		 
		 	ActionForward forward = new ActionForward();
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			String nowPage = request.getParameter("page");
			
			BoardReviewDetailService boardDetailService
			= new BoardReviewDetailService();	
		   	BoardReviewBean article =boardDetailService.getArticle(board_num);
		   
		   	request.setAttribute("article", article);
		   	request.setAttribute("page", nowPage);
	   		forward.setPath("/board_review/qna_board_modify.jsp");
	   		return forward;
	 }
}