package puppylovemall.svc;

import static common.JdbcUtil.close;
import static common.JdbcUtil.commit;
import static common.JdbcUtil.getConnection;
import static common.JdbcUtil.rollback;

import java.sql.Connection;

import puppylovemall.dao.CartDAO;

public class PuppyCartQtyUpService {
	public void upCartQty(int pid, String mid) {
		CartDAO cartDAO = CartDAO.getInstance();
		Connection con = getConnection();
		cartDAO.setConnection(con);
		
		int count = 0;
		
		count = cartDAO.updateCartQtyUp(pid, mid);
		if(count > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
	}
}
