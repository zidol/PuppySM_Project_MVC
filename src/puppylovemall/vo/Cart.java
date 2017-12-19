package puppylovemall.vo;

public class Cart {
	
	private String image;
	private String kind;
	private int price;
	private int qty;
	private int pid;	// puppy 테이블의 id
	private String mid;	// member 테이블의 id
	
	public Cart() {}
	public Cart(String image, String kind, int price, int qty, int pid, String mid) {
		super();
		this.image = image;
		this.kind = kind;
		this.price = price;
		this.qty = qty;
		this.pid = pid;
		this.mid = mid;
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
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	
}
