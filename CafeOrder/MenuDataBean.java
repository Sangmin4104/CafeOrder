package market.productshop.master;

import java.sql.Timestamp;

public class MenuDataBean {
	private String id;
	private int menu_id; //메뉴의 등록번호
	private String menu_kind; //메뉴의 종류
	private String menu_title; //메뉴이름
	private int menu_price; //메뉴가격
	private short menu_count; //메뉴의 재고수량
	private String menu_image; //메뉴 이미지명
	private String menu_content; //메뉴의 내용
	private byte discount_rate; //메뉴의 할인율
	
	public String getid() {
		return id;
	}
	public void setid(String id) {
		this.id = id;
	}
	public int getmenu_id() {
		return menu_id;
	}
	public void setmenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public String getmenu_kind() {
		return menu_kind;
	}
	public void setmenu_kind(String menu_kind) {
		this.menu_kind = menu_kind;
	}
	public String getmenu_title() {
		return menu_title;
	}
	public void setmenu_title(String menu_title) {
		this.menu_title = menu_title;
	}
	public int getmenu_price() {
		return menu_price;
	}
	public void setmenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public short getmenu_count() {
		return menu_count;
	}
	public void setmenu_count(short menu_count) {
		this.menu_count = menu_count;
	}
	public String getmenu_image() {
		return menu_image;
	}
	public void setmenu_image(String menu_image) {
		this.menu_image = menu_image;
	}
	public String getmenu_content() {
		return menu_content;
	}
	public void setmenu_content(String menu_content) {
		this.menu_content = menu_content;
	}
	public byte getdiscount_rate() {
		return discount_rate;
	}
	public void setdiscount_rate(byte discount_rate) {
		this.discount_rate = discount_rate;
	}

}