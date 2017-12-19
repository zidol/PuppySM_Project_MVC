package puppylovemall.svc;

import static common.JdbcUtil.*;

import java.sql.Connection;

import puppylovemall.dao.PuppyDAO;
import puppylovemall.vo.Puppy;

public class PuppyRegistService {
	public boolean registPuppy(Puppy puppy) {
		PuppyDAO puppyDAO = PuppyDAO.getInstance();
		Connection con = getConnection();
		puppyDAO.setConnection(con);
		boolean isRegistSuccess = false;
		int insertCount = puppyDAO.insertPuppy(puppy);
		
		if(insertCount>0) {
			commit(con);
			isRegistSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		return isRegistSuccess;
 	}
}
