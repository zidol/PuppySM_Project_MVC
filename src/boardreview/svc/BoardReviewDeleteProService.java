package boardreview.svc;

import static common.JdbcUtil.close;
import static common.JdbcUtil.commit;
import static common.JdbcUtil.getConnection;
import static common.JdbcUtil.rollback;

import java.sql.Connection;

import boardreview.dao.BoardReviewDAO;

public class BoardReviewDeleteProService {

	public boolean isArticleWriter(int board_num, String pass) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isArticleWriter = false;
		Connection con = getConnection();
		BoardReviewDAO boardDAO = BoardReviewDAO.getInstance();
		boardDAO.setConnection(con);
		isArticleWriter = boardDAO.isArticleBoardWriter(board_num, pass);
		close(con);
		return isArticleWriter;
		
	}

	public boolean removeArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		BoardReviewDAO boardDAO = BoardReviewDAO.getInstance();
		boardDAO.setConnection(con);
		int deleteCount = boardDAO.deleteArticle(board_num);
		
		if(deleteCount > 0){
			commit(con);
			isRemoveSuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isRemoveSuccess;
	}

}
