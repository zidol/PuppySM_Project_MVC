package puppylovemall.svc;

import static common.JdbcUtil.close;
import static common.JdbcUtil.commit;
import static common.JdbcUtil.getConnection;
import static common.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import puppylovemall.dao.CartDAO;
import puppylovemall.vo.Cart;

public class PuppyCartAddService {
	/*public Puppy getCartPuppy(int id) {
		Connection con = getConnection();
		PuppyDAO puppyDAO = PuppyDAO.getInstance();
		puppyDAO.setConnection(con);
		Puppy puppy = puppyDAO.selectPuppy(id);
		close(con);
		return puppy;
	}
	public void addCart(HttpServletRequest request, Puppy cartPuppy	) {
		HttpSession session = request.getSession();
		List<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		
		if(cartList == null) {
			cartList = new ArrayList<Cart>();
			session.setAttribute("cartList", cartList);			
		}
		
		boolean isNewCart = true;
		//지금 장바구니에 담는 항목이 새로 추가되는 항목인지를 저장할 변수
		for(int i=0; i<cartList.size(); i++) {
			if(cartPuppy.getKind().equals(cartList.get(i).getKind())) {
				isNewCart = false;
				cartList.get(i).setQty(cartList.get(i).getQty()+1);
				break;
			}
		}
		if(isNewCart) {
			Cart cart = new Cart();
			cart.setImage(cartPuppy.getImage());
			cart.setKind(cartPuppy.getKind());
			cart.setPrice(cartPuppy.getPrice());
			cart.setQty(1);
			cartList.add(cart);
		}
	}*/
	
	public int addCart(Cart cart) {
		CartDAO cartDAO = CartDAO.getInstance();
		Connection con = getConnection();
		cartDAO.setConnection(con);
		
		int listCount = 0;
		
		ArrayList<Cart> cartList = (ArrayList<Cart>)cartDAO.selectCartList(cart.getMid());
		
		if(cartList == null) {	// cart가 널일떄
			listCount = cartDAO.insertCart(cart);
					
		} else {				//cart가 널이 아닐때
			boolean isNewCart = true;	//새로운 cart 생성을 위한 변수
			//지금 장바구니에 담는 항목이 새로 추가되는 항목인지를 저장할 변수
			for(int i=0; i<cartList.size(); i++) {
				if(cart.getPid() ==  cartList.get(i).getPid()) {//기존의 pid가 있을때 (qty만 1증가)
					isNewCart = false;
					listCount = cartDAO.updateCartQtyUp(cartList.get(i).getPid(), cartList.get(i).getMid());
					break;
				}
			}
			if(isNewCart) {	//새로운 cart 생성(기존의 pid가 없으므로)
				listCount = cartDAO.insertCart(cart);
			}
		}
		
		
		
		if(listCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return listCount;
	}
}
