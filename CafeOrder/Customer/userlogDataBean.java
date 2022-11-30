package market.productshop.user;

import java.sql.Timestamp;

public class userlogDataBean {
	private String id;
	private String passwd;
	private String name;
	private String phonenum;
	private String email;
	private int menu_id;

	

	
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public String getpasswd() {
		return passwd;
	}
	public void setpasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}
	public String getphonenum() {
		return phonenum;
	}
	public void setphonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email = email;
	}
	public int getmenu_id() {
		return menu_id;
	}
	public void setmenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
}