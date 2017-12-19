package boardreview.svc;

import static common.JdbcUtil.close;
import static common.JdbcUtil.commit;
import static common.JdbcUtil.getConnection;
import static common.JdbcUtil.rollback;

import java.sql.Connection;

import boardreview.dao.BoardReviewDAO;
import boardreview.vo.BoardReviewBean;

public class BoardReviewModifyProService {

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

	public boolean modifyArticle(BoardReviewBean article) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		BoardReviewDAO boardDAO = BoardReviewDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateArticle(article);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}
