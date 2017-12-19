package boardreview.svc;

import static common.JdbcUtil.close;
import static common.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import boardreview.dao.BoardReviewDAO;
import boardreview.vo.BoardReviewBean;

public class BoardReviewListService {

	public int getListCount() throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection con = getConnection();
		BoardReviewDAO boardDAO = BoardReviewDAO.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<BoardReviewBean> getArticleList(int page, int limit) throws Exception{
		
		ArrayList<BoardReviewBean> articleList = null;
		Connection con = getConnection();
		BoardReviewDAO boardDAO = BoardReviewDAO.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectArticleList(page,limit);
		close(con);
		return articleList;
		
	}

}
