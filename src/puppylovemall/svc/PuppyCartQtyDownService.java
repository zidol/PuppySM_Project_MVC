package puppylovemall.svc;

import static common.JdbcUtil.close;
import static common.JdbcUtil.commit;
import static common.JdbcUtil.getConnection;
import static common.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import puppylovemall.dao.CartDAO;
import puppylovemall.vo.Cart;

public class PuppyCartQtyDownService {
	public void downCartQty(int pid, String mid) {
		CartDAO cartDAO = CartDAO.getInstance();
		Connection con = getConnection();
		cartDAO.setConnection(con);
		
		int count = 0;
		
		count = cartDAO.updateCartQtyDown(pid, mid);
		if(count > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
	}
}
