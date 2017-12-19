package boardreview.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardreview.action.BoardReviewDeleteProAction;
import boardreview.action.BoardReviewDetailAction;
import boardreview.action.BoardReviewListAction;
import boardreview.action.BoardReviewModifyFormAction;
import boardreview.action.BoardReviewModifyProAction;
import boardreview.action.BoardReviewReplyFormAction;
import boardreview.action.BoardReviewReplyProAction;
import boardreview.action.BoardReviewWriteProAction;
import common.Action;
import common.ActionForward;

@WebServlet("*.bor")
public class BoardReviewFrontController extends javax.servlet.http.HttpServlet 
{

	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
			
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		if(command.equals("/boardWriteForm.bor")){
			forward=new ActionForward();
			forward.setPath("/board_review/qna_board_write.jsp");
		}else if(command.equals("/boardWritePro.bor")){
			action  = new BoardReviewWriteProAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardList.bor")){
			action = new BoardReviewListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardDetail.bor")){
			action = new BoardReviewDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardReplyForm.bor")){
			action = new BoardReviewReplyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardReplyPro.bor")){
			action = new BoardReviewReplyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardModifyForm.bor")){
			action = new BoardReviewModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardModifyPro.bor")){
			action = new BoardReviewModifyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardDeleteForm.bor")){
			String nowPage = request.getParameter("page");
			request.setAttribute("page", nowPage);
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			request.setAttribute("board_num",board_num);
			forward=new ActionForward();
			forward.setPath("/board_review/qna_board_delete.jsp");
		}
		else if(command.equals("/boardDeletePro.bor")){
			action = new BoardReviewDeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
}