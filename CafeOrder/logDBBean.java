package market.productshop.master;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class logDBBean {
	
    private static logDBBean instance = new logDBBean();
    
    public static logDBBean getInstance() {
       return instance;
    }
    
    private logDBBean() {}
    
    //  커넥션풀로부터 커넥션객체를 얻어내는 메소드
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/market");
        return ds.getConnection();
    }
    
    //  관리자 인증 메소드
    public int marketCheck(String mid, String mpasswd) 
	throws Exception {
		Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs= null;
        String dbpasswd="";
		int x=-1;
        
		try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select mpasswd from manager where mid = ? ");
            pstmt.setString(1, mid);
            
            rs= pstmt.executeQuery();

			if(rs.next()){
				dbpasswd= rs.getString("mpasswd"); 
				if(dbpasswd.equals(mpasswd))
					x= 1; //인증 성공
				else
					x= 0; //비밀번호 틀림
			}else
				x= -1;//해당 아이디 없음
			
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
	}

    public logDataBean getManager(String mid) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        logDataBean managers=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select * from manager where mid = ?");
            pstmt.setString(1, mid);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                managers = new logDataBean();
                managers.setmid(mid);
                managers.setmemail(rs.getString("memail"));
                managers.setmpasswd(rs.getString("mpasswd"));
                managers.setmname(rs.getString("mname"));
         }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
      return managers;
    }
}