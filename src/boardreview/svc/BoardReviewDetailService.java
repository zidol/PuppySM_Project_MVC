package boardreview.svc;

import static common.JdbcUtil.close;
import static common.JdbcUtil.commit;
import static common.JdbcUtil.getConnection;
import static common.JdbcUtil.rollback;

import java.sql.Connection;

import boardreview.dao.BoardReviewDAO;
import boardreview.vo.BoardReviewBean;

public class BoardReviewDetailService {

	public BoardReviewBean getArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		
		BoardReviewBean article = null;
		Connection con = getConnection();
		BoardReviewDAO boardDAO = BoardReviewDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateReadCount(board_num);
		
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		article = boardDAO.selectArticle(board_num);
		close(con);
		return article;
		
	}

}
