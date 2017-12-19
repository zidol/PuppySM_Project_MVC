package puppylovemall.svc;

import static common.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import puppylovemall.dao.CartDAO;
import puppylovemall.vo.Cart;

public class PuppyCartListService {
	/*public List<Cart> getCartList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		return cartList;
	}*/
	public List<Cart> getCartList(String mid) {
		CartDAO cartDAO = CartDAO.getInstance();
		Connection con = getConnection();
		cartDAO.setConnection(con);
		ArrayList<Cart> cartList = (ArrayList<Cart>)cartDAO.selectCartList(mid);
		return cartList;
	}
}
