package puppylovemall.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import puppylovemall.svc.PuppyCartSearchService;
import puppylovemall.vo.Cart;

public class PuppyCartSearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("id");
		int startMoney = Integer.parseInt(request.getParameter("startMoney"));
		int endMoney = Integer.parseInt(request.getParameter("endMoney"));
		
		PuppyCartSearchService puppyCartSearchService = new PuppyCartSearchService();
		
		List<Cart> cartList = puppyCartSearchService.getCartSearchList(mid, startMoney, endMoney);
		request.setAttribute("cartList", cartList);
		request.setAttribute("startMoney", startMoney);
		request.setAttribute("endMoney", endMoney);
		int totalMoney = 0;
		int money = 0;
		
		for(int i=0; i<cartList.size(); i++) {
			money = cartList.get(i).getPrice()*cartList.get(i).getQty();
			totalMoney += money;
		}
		
		request.setAttribute("totalMoney", totalMoney);
		ActionForward forward = new ActionForward("puppymall/puppyCartList.jsp", false);
		return forward;
	}

}
