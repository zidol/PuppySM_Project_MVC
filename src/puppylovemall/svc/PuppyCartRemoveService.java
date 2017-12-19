package puppylovemall.svc;

import static common.JdbcUtil.*;

import java.sql.Connection;
import java.util.List;

import puppylovemall.dao.CartDAO;
import puppylovemall.vo.Cart;

public class PuppyCartRemoveService {
	public void cartRemove(String[]idArray, String mid) {
		CartDAO cartDAO = CartDAO.getInstance();
		Connection con = getConnection();
		cartDAO.setConnection(con);
		
		int count = 0;
		List<Cart> cartList = cartDAO.selectCartList(mid);
		
		for(int i=0; i<idArray.length; i++) {
			for(int j=0; j<cartList.size(); j++) {
				int pid = Integer.parseInt(idArray[i]);
				if(cartList.get(j).getPid() == pid) {
					count = cartDAO.DeleteCart(cartList.get(j).getPid(), mid);
				}
			}
		}
		if(count > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
	}
}
