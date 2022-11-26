package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import JDBC.JdbcUtil;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	private final String BBS_SELECT ="SELECT bbsID FROM BBS ORDER BY bbsID DESC";
	private final String BBS_INSERT = "INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ?)";
	// 특정한 숫자보다 작고 삭제가 되지 않아서 AVAILABLE이 1인 글만 가져오고 위에서 10개의 글까지만 가져오고 글 번호를 내림차순 하는 쿼리문입니다.
	private final String ARRAY_SELECT = "SELECT * FROM BBS WHERE bbsID < ? and bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
	// 특정한 숫자보다 작고 삭제가 되지 않아서 AVAILABLE이 1인 글만 가져오고 위에서 10개의 글까지만 가져오고 글 번호를 내림차순 하는 쿼리문입니다.
	private final String NEXTPAGE_SELECT = "SELECT * FROM BBS WHERE bbsID < ? and bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
	//특정 게시글 번호에 모든 정보를 가져오는 쿼리문입니다.
	private final String ALL_SELECT = "SELECT * FROM BBS WHERE bbsID =?";
	private final String BBS_UPDATE = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
	private final String BBS_AVAILABLE = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
	
	public String getDate() {
		try {
			conn = JdbcUtil.getConnection();
			pstmt = conn.prepareStatement(BBS_SELECT);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터 베이스 오류
		
	}
	
	public int getNext() {
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(BBS_SELECT);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; //첫번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류인 경우
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		try {
			conn = JdbcUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(BBS_INSERT);
			//1번은 게시물 번호여야 하니까 getNext()를 사용합니다.
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1); //available 삭제됬는지 아닌지 확인
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터 베이스 오류
	}
	// 글 목록창 불러오는 함수
		public ArrayList<BbsDTO> getList(int pageNumber) {
			// Bbs클래스에서 나오는 인스턴스를 보관하는 리스트를 하나 만듭니다.
			ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
			
			
			try {
				conn = JdbcUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(ARRAY_SELECT);
				// 글 출력 개수
				pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					BbsDTO bbs = new BbsDTO();
					bbs.setBbsID(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setUserID(rs.getString(3));
					bbs.setBbsDate(rs.getString(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
					list.add(bbs);
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		//10개 밖에 없다면 다음 페이지가 없다는걸 알려주는 거에요. 페이지 처리를 위해서 존재하는 함수에요
		public boolean nextPage(int pageNumber) {
					// Bbs클래스에서 나오는 인스턴스를 보관하는 리스트를 하나 만듭니다.
					ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
					try {
						conn = JdbcUtil.getConnection();
						PreparedStatement pstmt = conn.prepareStatement(NEXTPAGE_SELECT);
						// 글 출력 개수
						pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
						rs = pstmt.executeQuery();
						//결과가 하나라도 존재하면 다음페이지로 넘어갈 수 있다고 알려주고
						if (rs.next()) {
							return true;						
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}
					//아니라면 false
					return false;
		}
		//글 내용을 불러오는 함수
		public BbsDTO getBbs(int bbsID) {
			try {
				conn = JdbcUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(ALL_SELECT);
				pstmt.setInt(1,  bbsID);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					//글에 대한 정보를 담을 객체를 생성하고
					BbsDTO bbs = new BbsDTO();
					bbs.setBbsID(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setUserID(rs.getString(3));
					bbs.setBbsDate(rs.getString(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
					return bbs;
					
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			//정보가 없으면 null값을 반환
			return null;
		}
		//글 수정 하는 함수
		public int update(int bbsID, String bbsTitle, String bbsContent) {
			try {
				conn = JdbcUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(BBS_UPDATE);
				pstmt.setString(1, bbsTitle);
				pstmt.setString(2, bbsContent);
				pstmt.setInt(3, bbsID);
				return pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -1; //database error
		}
		
		//bbsAvailable 을 0으로 바꿈으로 화면에 표시되지 않게 함
		public int delete(int bbsID) {
			try {
				conn = JdbcUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(BBS_AVAILABLE);
				pstmt.setInt(1, bbsID);
				return pstmt.executeUpdate(); 
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return -1; // DB ERROR
		}

	}
	
	



