package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import member.svc.MemberInfoViewService;
import member.vo.MemberVO;

public class MemberInfoViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = null;
		if(id==null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("memberLogin.me");
		}else {	//admin(관리자)일떄
			forward = new ActionForward();
			String viewId = request.getParameter("id");
			MemberInfoViewService memberInfoViewService = new MemberInfoViewService();
			MemberVO member = memberInfoViewService.getMember(viewId);
			request.setAttribute("member", member);
			forward.setPath("member/getMember_info.jsp");
		}
		return forward;
	}

}
