package puppylovemall.dao;

import static common.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import puppylovemall.vo.Buy;
import puppylovemall.vo.Cart;

public class BuyDAO {
	
	Connection con;
	private static BuyDAO buyDAO;
	
	private BuyDAO() {
		
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static BuyDAO getInstance() {
		if(buyDAO == null) {
			buyDAO = new BuyDAO();
		}
		return buyDAO;
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
		
		//Cart 1개 항목보기 (Cart --> Buy)
		public Cart selectCart(int pid, String mid) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Cart cart = null;
			
			try {
				pstmt = con.prepareStatement("select * from cart where pid=? and mid=?");
				pstmt.setInt(1, pid);
				pstmt.setString(2, mid);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					cart = new Cart(
							rs.getString("image"),
							rs.getString("kind"),
							rs.getInt("price"),
							rs.getInt("qty"),
							rs.getInt("pid"),
							rs.getString("mid")
						);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rs);
			}
			return cart;
		}
		
		//Buy 테이블에 데이터 추가
		public int insertBuy(Cart cart) {
			PreparedStatement pstmt = null;
			int insertCount = 0;
			String sql = "insert into buy values(buy_seq.nextval,?,?,?,?,sysdate,'주문완료',?)";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, cart.getImage());
				pstmt.setString(2, cart.getKind());
				pstmt.setInt(3, cart.getPrice());
				pstmt.setInt(4, cart.getQty());
				pstmt.setString(5, cart.getMid());
				insertCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return insertCount;
		}

		//Buy 리스트 보기.	
		public List<Buy> selectBuyList(String mid){

			PreparedStatement pstmt = null;
			ResultSet rs = null;
//			Oracle 몇번 부터 몇번까지
			String buy_list_sql="select * from buy where mid = ?";
			List<Buy> buyList = new ArrayList<Buy>();
			Buy buy = null;;

			try{
				pstmt = con.prepareStatement(buy_list_sql);
				pstmt.setString(1, mid);
				rs = pstmt.executeQuery();

				while(rs.next()){
					buy = new Buy(
							rs.getInt("buy_id"),
							rs.getString("image"),
							rs.getString("kind"),
							rs.getInt("price"),
							rs.getInt("qty"),
							rs.getTimestamp("buy_date"),
							rs.getString("buy_state"),
							rs.getString("mid")
							);
					buyList.add(buy);
				}

			}catch(Exception ex){
				System.out.println("selectCartList 에러 : " + ex);
			}finally{
				close(rs);
				close(pstmt);
			}

			return buyList;

		}
	
	// Cart 테이블 주문된 데이터 삭제
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
	
}
