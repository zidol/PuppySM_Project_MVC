package puppylovemall.svc;

import static common.JdbcUtil.close;
import static common.JdbcUtil.commit;
import static common.JdbcUtil.getConnection;
import static common.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.List;

import puppylovemall.dao.BuyDAO;
import puppylovemall.vo.Buy;

public class PuppyBuyRemoveService {
	public void buyRemove(String[]idArray, String mid) {
		BuyDAO buyDAO = BuyDAO.getInstance();
		Connection con = getConnection();
		buyDAO.setConnection(con);
		
		int count = 0;
		List<Buy> buyList = buyDAO.selectBuyList(mid);
		
		for(int i=0; i<idArray.length; i++) {
			for(int j=0; j<buyList.size(); j++) {
				int pid = Integer.parseInt(idArray[i]);
				if(buyList.get(j).getBuy_id() == pid) {
					count = buyDAO.deleteBuy(buyList.get(j).getBuy_id(), mid);
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
