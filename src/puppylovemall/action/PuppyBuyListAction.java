package puppylovemall.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import puppylovemall.svc.PuppyBuyListService;
import puppylovemall.vo.Buy;

public class PuppyBuyListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("id");
		PuppyBuyListService puppyBuyListService = new PuppyBuyListService();
		List<Buy> buyList = puppyBuyListService.getBuyList(mid);
		
		///총금액 계산
		int totalMoney = 0;	
		int money = 0;
		
		for(int i = 0; i <buyList.size(); i++) {
			money = buyList.get(i).getPrice()*buyList.get(i).getQty();
			totalMoney +=money;
		}
		
		request.setAttribute("totalMoney", totalMoney);
		request.setAttribute("buyList", buyList);
		ActionForward forward = new ActionForward("puppymall/puppyBuyList.jsp", false);
		return forward;
	}

}
