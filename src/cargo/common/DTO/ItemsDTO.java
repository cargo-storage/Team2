package cargo.common.DTO;

import java.sql.Timestamp;

public class ItemsDTO {
	private String item, email, house;
	private int payment, item_price;
	private Timestamp start_day, end_day;
	
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHouse() {
		return house;
	}
	public void setHouse(String house) {
		this.house = house;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public Timestamp getStart_day() {
		return start_day;
	}
	public void setStart_day(Timestamp start_day) {
		this.start_day = start_day;
	}
	public Timestamp getEnd_day() {
		return end_day;
	}
	public void setEnd_day(Timestamp end_day) {
		this.end_day = end_day;
	}
	
}
