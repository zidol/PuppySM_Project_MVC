package puppylovemall.vo;

import java.sql.Timestamp;

public class Buy {
	private int buy_id;
	private String image;
	private String kind;
	private int price;
	private int qty;
	private Timestamp buy_date;
	private String buy_state;
	private String mid;
	public int getBuy_id() {
		return buy_id;
	}
	public void setBuy_id(int buy_id) {
		this.buy_id = buy_id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public Timestamp getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Timestamp buy_date) {
		this.buy_date = buy_date;
	}
	public String getBuy_state() {
		return buy_state;
	}
	public void setBuy_state(String buy_state) {
		this.buy_state = buy_state;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Buy() {}
	public Buy(int buy_id, String image, String kind, int price, int qty, Timestamp buy_date, String buy_state,
			String mid) {
		super();
		this.buy_id = buy_id;
		this.image = image;
		this.kind = kind;
		this.price = price;
		this.qty = qty;
		this.buy_date = buy_date;
		this.buy_state = buy_state;
		this.mid = mid;
	}		
	

}
