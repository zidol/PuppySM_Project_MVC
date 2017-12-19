package puppylovemall.svc;

import static common.JdbcUtil.close;
import static common.JdbcUtil.commit;
import static common.JdbcUtil.getConnection;
import static common.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import puppylovemall.dao.CartDAO;
import puppylovemall.vo.Cart;

public class PuppyCartSearchService {
	public List<Cart> getCartSearchList(String mid, int startMoney, int endMoney){
		CartDAO cartDAO = CartDAO.getInstance();
		Connection con = getConnection();
		cartDAO.setConnection(con);
		
		List<Cart> cartList = cartDAO.searchCart(mid, startMoney, endMoney);
		
		/*for(int i=0; i<cartList.size(); i++) {
			if(cartList.get(i).getPrice()>=startMoney && 
					cartList.get(i).getPrice()<=endMoney) {
				cartList.add(cartList.get(i));
			}
		}*/
		
		/*if(count > 0) {
			commit(con);
		} else {
			rollback(con);
		}*/
		close(con);
		return cartList;
	}
}
