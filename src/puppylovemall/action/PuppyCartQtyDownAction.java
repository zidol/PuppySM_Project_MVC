package puppylovemall.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import puppylovemall.svc.PuppyCartQtyDownService;
import puppylovemall.svc.PuppyCartQtyUpService;

public class PuppyCartQtyDownAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("id");
		
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		PuppyCartQtyDownService puppyCartQtyDownService = new PuppyCartQtyDownService();
		puppyCartQtyDownService.downCartQty(pid, mid);
		
		ActionForward forward = new ActionForward("puppyCartList.pu", true);
		return forward;
	}

}
