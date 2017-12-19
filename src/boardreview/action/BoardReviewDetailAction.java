package boardreview.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardreview.svc.BoardReviewDetailService;
import boardreview.vo.BoardReviewBean;
import common.Action;
import common.ActionForward;

 public class BoardReviewDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		BoardReviewDetailService boardDetailService = new BoardReviewDetailService();
		BoardReviewBean article = boardDetailService.getArticle(board_num);
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("/board_review/qna_board_view.jsp");
   		return forward;

	 }
	 
}