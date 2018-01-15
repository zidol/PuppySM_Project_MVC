package puppylovemall.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import puppylovemall.svc.PuppyBuyAddService;
import puppylovemall.svc.PuppyCartAddService;
import puppylovemall.svc.PuppyCartRemoveService;
import puppylovemall.vo.Buy;
import puppylovemall.vo.Cart;

public class PuppyBuyAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("id");
		if(mid == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('구매정보를 보려면 로그인을 해주세요.');");
			out.println("location.href='puppyList.pu?kind=all';");
			out.println("</script>");
			return null;
		} else {			
			//
			String[] idArray = request.getParameterValues("check");
			PuppyBuyAddService puppyBuyAddService = new PuppyBuyAddService();
			//buy테이블에 추가
			int listCount = puppyBuyAddService.addBuy(idArray, mid);
			ActionForward forward = null;
			
			if(listCount > 0){
				forward = new ActionForward("puppyBuyList.pu", true);
			}else{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('등록실패');");
				out.println("history.back();");
				out.println("</script>");
			}
			return forward;
		}
		
	}

}
