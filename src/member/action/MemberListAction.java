package member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Action;
import common.ActionForward;
import member.svc.MemberListService;
import member.vo.MemberVO;

public class MemberListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = null;
		
		if(id == null) {	//아이디가 없을때
			forward= new ActionForward();
			forward.setRedirect(true);
			forward.setPath("memberLogin.me");
		} else if(!id.equals("admin")){ // 아이디가 관리자가 아닐떄
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("puppyList.pu?kind=all");
		} else {	//아이디가 관리자일때
			forward = new ActionForward();
			MemberListService memberListService = new MemberListService();
			List<MemberVO> memberList = memberListService.getMemberList();
			request.setAttribute("memberList", memberList);
			forward.setPath("member/member_list.jsp");
		}
		/*else if(!id.equals("admin")) {	//아이디가 관리자가 아닐때
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아닙니다');");
			out.println("location.href='memberLogin.me';");
			out.println("</script>");
		} else {	//아이디가 관리자일때
			forward = new ActionForward();
			MemberListService memberListService = new MemberListService();
			List<MemberVO> memberList = memberListService.getMemberList();
			request.setAttribute("memberList", memberList);
			forward.setPath("member/member_list.jsp");
		}*/
			
		return forward;
	}

}
