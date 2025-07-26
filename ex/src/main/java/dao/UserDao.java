package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.UserDTO;


public class UserDao {

  private UserDao() {
  }
  private static UserDao dao = new UserDao();
    public static UserDao getInstance() {
      return dao;
    }
    // 모든 메소드가 공통으로 사용할 필드
    private Connection con = null;
    private PreparedStatement ps;
    private ResultSet rs;
    private String sql;
    
    // 삽입
    public int insertUser(UserDTO user) {
      int count = 0;
      try {
        con = DBUtils.getConnection();
        sql = "INSERT INTO tbl_user(user_id, pw, user_name, birth_date, gender, email, phone, place) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        ps = con.prepareStatement(sql);
        ps.setString(1, user.getUserId());
        ps.setString(2, user.getPw());
        ps.setString(3, user.getUserName());
        ps.setString(4, user.getbirthDate());
        ps.setString(5, user.getGender());
        ps.setString(6, user.getEmail());
        ps.setString(7, user.getPhone());
        ps.setString(8, user.getPlace());
        count = ps.executeUpdate();
      } catch (Exception e) {
        e.printStackTrace();
      } finally {
        DBUtils.close(con, ps, rs);
      }
      return count;
    }
  
}
