package boardreview.svc;

import static common.JdbcUtil.close;
import static common.JdbcUtil.commit;
import static common.JdbcUtil.getConnection;
import static common.JdbcUtil.rollback;

import java.sql.Connection;

import boardreview.dao.BoardReviewDAO;
import boardreview.vo.BoardReviewBean;
public class BoardReviewWriteProService {

	public boolean registArticle(BoardReviewBean boardBean) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		BoardReviewDAO boardDAO = BoardReviewDAO.getInstance();
		boardDAO.setConnection(con);
		int insertCount = boardDAO.insertArticle(boardBean);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
