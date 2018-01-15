package puppylovemall.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import puppylovemall.svc.PuppyCartAddService;
import puppylovemall.svc.PuppyViewService;
import puppylovemall.vo.Cart;
import puppylovemall.vo.Puppy;

public class PuppyCartAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("id");
		if(mid == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니에 담으려면 로그인을 해주세요.');");
			out.println("location.href='puppyList.pu?kind=all';");
			out.println("</script>");
			return null;
		} else {
			PuppyViewService puppyViewService = new PuppyViewService();
			int id = Integer.parseInt(request.getParameter("id"));
			Puppy puppy = puppyViewService.getPuppyView(id);
			
			PuppyCartAddService cartService = new PuppyCartAddService();
			
			Cart cart = new Cart(
					puppy.getImage(),
					puppy.getKind(),
					puppy.getPrice(),
					1,
					puppy.getId(),
					mid
					);
			
			int listCount = cartService.addCart(cart);
			ActionForward forward = null;
			
			if(listCount > 0){
				forward = new ActionForward("puppyCartList.pu", true);
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
