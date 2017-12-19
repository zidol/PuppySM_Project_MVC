package member.svc;

import static common.JdbcUtil.*;
import java.sql.Connection;

import member.dao.MemberDAO;
import member.vo.MemberVO;

public class MemberJoinService {
	public boolean joinMember(MemberVO member) {
		boolean joinSuccess = false;
		MemberDAO memberDAO = MemberDAO.getInstance();
		Connection con = getConnection();
		memberDAO.setConnection(con);
		int insertCount = memberDAO.insertMember(member);
		if(insertCount>0) {
			joinSuccess = true;
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return joinSuccess;
	}
}
