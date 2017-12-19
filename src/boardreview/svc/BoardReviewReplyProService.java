package boardreview.svc;

import static common.JdbcUtil.close;
import static common.JdbcUtil.commit;
import static common.JdbcUtil.getConnection;
import static common.JdbcUtil.rollback;

import java.sql.Connection;

import boardreview.dao.BoardReviewDAO;
import boardreview.vo.BoardReviewBean;

public class BoardReviewReplyProService {

	public boolean replyArticle(BoardReviewBean article) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isReplySuccess = false;
		int insertCount = 0;
		Connection con = getConnection();
		BoardReviewDAO boardDAO = BoardReviewDAO.getInstance();
		boardDAO.setConnection(con);
		insertCount = boardDAO.insertReplyArticle(article);
		
		if(insertCount > 0){
			commit(con);
			isReplySuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isReplySuccess;
		
	}

}
