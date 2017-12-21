package puppylovemall.dao;

import static common.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import puppylovemall.vo.Cart;
import puppylovemall.vo.Puppy;

public class CartDAO {
	
	Connection con;
	private static CartDAO cartDAO;
	
	private CartDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static CartDAO getInstance() {
		if(cartDAO == null) {
			cartDAO = new CartDAO();
		}
		return cartDAO;
	}
	
	
	//글의 개수 구하기.
		public int selectListCount() {

			int listCount= 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try{


				System.out.println("getConnection");
				pstmt=con.prepareStatement("select count(*) from puppy");
				rs = pstmt.executeQuery();

				if(rs.next()){
					listCount=rs.getInt(1);
				}
			}catch(Exception ex){
				System.out.println("getListCount 에러: " + ex);			
			}finally{
				close(rs);
				close(pstmt);
			}

			return listCount;

		}
		//Cart 추가
		public int insertCart(Cart cart) {
			PreparedStatement pstmt = null;
			int insertCount = 0;
			String sql = "";
			
			try {
				sql = "insert into cart values(?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cart.getImage());
				pstmt.setString(2, cart.getKind());
				pstmt.setInt(3, cart.getPrice());
				pstmt.setInt(4, cart.getQty());
				pstmt.setInt(5, cart.getPid());
				pstmt.setString(6, cart.getMid());
				insertCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return insertCount;
		}
		
		//Cart 리스트 보기.	
		public List<Cart> selectCartList(String mid){

			PreparedStatement pstmt = null;
			ResultSet rs = null;
//			Oracle 몇번 부터 몇번까지
			String cart_list_sql="select * from cart where mid = ?";
			List<Cart> cartList = new ArrayList<Cart>();
			Cart cart = null;;

			try{
				pstmt = con.prepareStatement(cart_list_sql);
				pstmt.setString(1, mid);
				rs = pstmt.executeQuery();

				while(rs.next()){
					cart = new Cart(
							rs.getString("image"),
							rs.getString("kind"),
							rs.getInt("price"),
							rs.getInt("qty"),
							rs.getInt("pid"),
							rs.getString("mid")
							);
					cartList.add(cart);
				}

			}catch(Exception ex){
				System.out.println("selectCartList 에러 : " + ex);
			}finally{
				close(rs);
				close(pstmt);
			}

			return cartList;

		}

	// Cart 테이블 Qty 증가
	public int updateCartQtyUp(int pid, String mid) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql ="";
		
		try {
			sql = "update cart set qty = qty + 1 where pid=? and mid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pid);
			pstmt.setString(2, mid);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return updateCount;
	}
	// Cart 테이블 Qty 감소
	public int updateCartQtyDown(int pid, String mid) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql ="";
		
		try {
			sql = "update cart set qty = qty-1 where pid=? and mid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pid);
			pstmt.setString(2, mid);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return updateCount;
	}
	// Cart 테이블 데이터 삭제
	public int deleteCart(int pid, String mid) {
		PreparedStatement pstmt = null;
		int deleteCount = 0;
		String sql ="";
		
		try {
			sql = "delete from cart where pid=? and mid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pid);
			pstmt.setString(2, mid);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}
	// Cart 테이블의 데이터 검색
	public List<Cart> searchCart(String mid, int startMoney, int endMoney){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from cart where mid=? and (price between ? and ?)";
		List<Cart> cartList = new ArrayList<Cart>();
		Cart cart = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, startMoney);
			pstmt.setInt(3, endMoney);
			rs = pstmt.executeQuery();
			/*while(rs.next()) {
				cart = new Cart(
						rs.getString("image"),
						rs.getString("kind"),
						rs.getInt("price"),
						rs.getInt("qty"),
						rs.getInt("pid"),
						rs.getString("mid")
						);
				cartList.add(cart);
				}*/
			while(rs.next()) {
				cart = new Cart();
				cart.setImage(rs.getString("image"));
				cart.setKind(rs.getString("kind"));
				cart.setPrice(rs.getInt("price"));
				cart.setQty(rs.getInt("qty"));
				cart.setPid(rs.getInt("pid"));
				cart.setMid(rs.getString("mid"));
				cartList.add(cart);
				}
			} catch(Exception ex){
				System.out.println("searchCartList 에러 : " + ex);
			} finally {
				close(rs);
				close(pstmt);
			}
		return cartList;
		}
	}
