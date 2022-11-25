package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	//Connection 데이터 베이스 접근하게 해주는 하나의 객체
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		private final String USER_INSERT = "INSERT INTO USER VALUES(?, ?, ?, ?, ?)";
		private final String USER_SELECT = "SELECT userPassword FROM USER WHERE userID= ?";

	
	//실제로 로그인을 시도하는 함수
		public int login(String userID, String userPassword) { // 아이디와 비밀번호를 받아옴
			try {
				conn = JdbcUtil.getConnection();
				pstmt = conn.prepareStatement(USER_SELECT);
				pstmt.setString(1,  userID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					if(rs.getString(1).equals(userPassword)) 
						return 1; // 로그인 성공
					else
						return 0; //비밀번호 불일치
					
				}
				return -1; //아이디가 없음
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -2; // 데이터베이스 오류를 의미합니다.
		}
		// 회원가입 기능 구현
		public void insertMember(UserDTO mem) throws SQLException {
			try {
				conn = JdbcUtil.getConnection();
				pstmt = conn.prepareStatement(USER_INSERT);
				pstmt.setString(1, mem.getUserID());
				pstmt.setString(2, mem.getUserPassword());
				pstmt.setString(3, mem.getUserName());
				pstmt.setString(4, mem.getUserGender());
				pstmt.setString(5, mem.getUserEmail());
				pstmt.executeUpdate();
			}catch(Exception e) {
				
			}finally {
				JdbcUtil.close(pstmt, conn);
			}
			//return -1; //데이터베이스 오류
		}
	}