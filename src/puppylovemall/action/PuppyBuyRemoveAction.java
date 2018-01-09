package puppylovemall.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import puppylovemall.svc.PuppyBuyRemoveService;

public class PuppyBuyRemoveAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("id");
		
		String[] idArray = request.getParameterValues("check");
		PuppyBuyRemoveService puppyBuyRemoveService = new PuppyBuyRemoveService();
		puppyBuyRemoveService.buyRemove(idArray, mid);
		System.out.println(idArray);
		if(idArray == null) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 하실 항목을 선택 하세요.');");
			out.println("history.back()");
			out.println("</script>");
		}
		ActionForward forward =new ActionForward("puppyBuyList.pu", true);
		return forward;
	}

}
