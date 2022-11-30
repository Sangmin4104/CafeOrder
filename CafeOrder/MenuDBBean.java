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

public class MenuDBBean {
	
    private static MenuDBBean instance = new MenuDBBean();
    
    public static MenuDBBean getInstance() {
       return instance;
    }
    
    private MenuDBBean() {}
    
    //  커넥션풀로부터 커넥션객체를 얻어내는 메소드
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/market");
        return ds.getConnection();
    }
    
    //음식 등록 메소드
    public void insertMenu(MenuDataBean menu) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"insert into menu (menu_kind, menu_title, menu_price, menu_count, menu_image, menu_content, discount_rate) values (?,?,?,?,?,?,?)");
            pstmt.setString(1, menu.getmenu_kind());
            pstmt.setString(2, menu.getmenu_title());
            pstmt.setInt(3, menu.getmenu_price());
            pstmt.setShort(4, menu.getmenu_count());
            pstmt.setString(5, menu.getmenu_image());
			pstmt.setString(6, menu.getmenu_content());
			pstmt.setByte(7, menu.getdiscount_rate());

            pstmt.executeUpdate();
            
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
    }

	// 분류별또는 전체등록된 음식의 정보를 얻어내는 메소드
	public List<MenuDataBean> getmenus(String menu_kind)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<MenuDataBean> menuList=null;
        
        try {
            conn = getConnection();
            
            String sql1 = "select * from menu";
            String sql2 = "select * from menu ";
            sql2 += "where menu_kind = ?";
            
            if(menu_kind.equals("all")){
            	 pstmt = conn.prepareStatement(sql1);
            }else{
                pstmt = conn.prepareStatement(sql2);
                pstmt.setString(1, menu_kind);
            }
        	rs = pstmt.executeQuery();
            
            if (rs.next()) {
                menuList = new ArrayList<MenuDataBean>();
                do{
                     MenuDataBean menu = new MenuDataBean();
                     
                     menu.setmenu_id(rs.getInt("menu_id"));
                     menu.setmenu_kind(rs.getString("menu_kind"));
                     menu.setmenu_title(rs.getString("menu_title"));
                     menu.setmenu_price(rs.getInt("menu_price"));
                     menu.setmenu_count(rs.getShort("menu_count"));
                     menu.setmenu_image(rs.getString("menu_image"));
                     menu.setmenu_content(rs.getString("menu_content"));
                     menu.setdiscount_rate(rs.getByte("discount_rate"));
                     
                     menuList.add(menu);
			    }while(rs.next());
			}
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
		return menuList;
    }
	
	// 쇼핑몰 메인에 표시하기 위해서 사용하는 분류별 신간책목록을 얻어내는 메소드
	public MenuDataBean[] getmenus(String menu_kind, int count)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MenuDataBean menuList[]=null;
        int i=0;
        
        try {
            conn = getConnection();
            
            String sql = "select * from menu where menu_kind = ?";
            sql += "limit ?,?";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, menu_kind);
            pstmt.setInt(2, 0);
            pstmt.setInt(3, count);
        	rs = pstmt.executeQuery();

            if (rs.next()) {
                menuList = new MenuDataBean[count];
                do{
                     MenuDataBean menu= new MenuDataBean();
                     menu.setmenu_id(rs.getInt("menu_id"));
                     menu.setmenu_kind(rs.getString("menu_kind"));
                     menu.setmenu_title(rs.getString("menu_title"));
                     menu.setmenu_price(rs.getInt("menu_price"));
                     menu.setmenu_count(rs.getShort("menu_count"));
                     menu.setmenu_image(rs.getString("menu_image"));
                     menu.setmenu_content(rs.getString("menu_content"));
                     menu.setdiscount_rate(rs.getByte("discount_rate"));
                     
                     menuList[i]=menu;
                     
                     i++;
			    }while(rs.next());
			}
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
		return menuList;
    }
	
	// bookId에 해당하는 책의 정보를 얻어내는 메소드로 
    //등록된 책을 수정하기 위해 수정폼으로 읽어들기이기 위한 메소드
	public MenuDataBean getmenu(int menu_id)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MenuDataBean menu=null;
        
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select * from menu where menu_id = ?");
            pstmt.setInt(1, menu_id);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                menu = new MenuDataBean();
                
                menu.setmenu_id(rs.getInt("menu_id"));
                menu.setmenu_kind(rs.getString("menu_kind"));
                menu.setmenu_title(rs.getString("menu_title"));
                menu.setmenu_price(rs.getInt("menu_price"));
                menu.setmenu_count(rs.getShort("menu_count"));
                menu.setmenu_image(rs.getString("menu_image"));
                menu.setmenu_content(rs.getString("menu_content"));
                menu.setdiscount_rate(rs.getByte("discount_rate"));
			}
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
		return menu;
    }
    
    // 등록된 책의 정보를 수정시 사용하는 메소드
    public void updatemenu(MenuDataBean menu, int menu_id)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql;
        
        try {
            conn = getConnection();
            
            sql = "update menu set menu_kind=?,menu_title=?,menu_price=?";
            sql += ",menu_count=?";
            sql += ",menu_image=?,menu_content=?,discount_rate=?";
            sql += " where menu_id=?";
            
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, menu.getmenu_kind());
            pstmt.setString(2, menu.getmenu_title());
            pstmt.setInt(3, menu.getmenu_price());
            pstmt.setShort(4, menu.getmenu_count());
			pstmt.setString(5, menu.getmenu_image());
			pstmt.setString(6, menu.getmenu_content());
			pstmt.setByte(7, menu.getdiscount_rate());
			pstmt.setInt(8, menu_id);
            
            pstmt.executeUpdate();
            
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) 
            	try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) 
            	try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    // bookId에 해당하는 책의 정보를 삭제시 사용하는 메소드
    public void deletemenu(int menu_id)
    throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        
        try {
			conn = getConnection();

            pstmt = conn.prepareStatement(
            	"delete from menu where menu_id=?");
            pstmt.setInt(1, menu_id);
            
            pstmt.executeUpdate();
            
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
    }

}