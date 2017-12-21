package puppylovemall.svc;

import static common.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import puppylovemall.dao.BuyDAO;
import puppylovemall.vo.Buy;
import puppylovemall.vo.Cart;

public class PuppyBuyListService {
	/*public List<Cart> getCartList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		return cartList;
	}*/
	public List<Buy> getBuyList(String mid) {
		BuyDAO buyDAO = BuyDAO.getInstance();
		Connection con = getConnection();
		buyDAO.setConnection(con);
		ArrayList<Buy> buyList = (ArrayList<Buy>)buyDAO.selectBuyList(mid);
		return buyList;
	}
}
