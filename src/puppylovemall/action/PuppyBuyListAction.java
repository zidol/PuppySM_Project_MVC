package puppylovemall.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import puppylovemall.svc.PuppyCartListService;
import puppylovemall.vo.Cart;

public class PuppyBuyListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("id");
		PuppyCartListService puppyCartListService = new PuppyCartListService();
		List<Cart> cartList = puppyCartListService.getCartList(mid);
		
		///총금액 계산
		int totalMoney = 0;	
		int money = 0;
		
		for(int i = 0; i <cartList.size(); i++) {
			money = cartList.get(i).getPrice()*cartList.get(i).getQty();
			totalMoney +=money;
		}
		
		request.setAttribute("totalMoney", totalMoney);
		request.setAttribute("cartList", cartList);
		ActionForward forward = new ActionForward("puppymall/puppyCartList.jsp", false);
		return forward;
	}

}
