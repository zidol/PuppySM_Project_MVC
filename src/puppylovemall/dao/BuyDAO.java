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
		//Buy 테이블에 데이터 추가
		public int insertBuy(Buy buy) {
			PreparedStatement pstmt = null;
			int insertCount = 0;
			String sql = "insert into buy values(buy_seq.nextval,?,?,?,?,?,?,?)";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, buy.getImage());
				pstmt.setString(2, buy.getKind());
				pstmt.setInt(3, buy.getPrice());
				pstmt.setInt(4, buy.getQty());
				pstmt.setTimestamp(5, buy.getBuy_date());
				pstmt.setString(6, buy.getBuy_state());
				pstmt.setString(7, buy.getMid());
				insertCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return insertCount;
		}

		//Buy 리스트 보기.	
		public List<Buy> selectBuyList(int buy_id){

			PreparedStatement pstmt = null;
			ResultSet rs = null;
//			Oracle 몇번 부터 몇번까지
			String buy_list_sql="select * from buy where buy_id = ?";
			List<Buy> buyList = new ArrayList<Buy>();
			Buy buy = null;;

			try{
				pstmt = con.prepareStatement(buy_list_sql);
				pstmt.setInt(1, buy_id);
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
	
	// Buy 테이블 데이터 삭제
	public int DeleteBuy(int buy_id) {
		PreparedStatement pstmt = null;
		int deleteCount = 0;
		String sql ="";
		
		try {
			sql = "delete from buy where buy_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, buy_id);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}
}
