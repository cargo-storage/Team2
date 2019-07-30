package cargo.common.DTO;

import java.sql.Timestamp;


public class BoardDTO {

	
	String item, title, image, content;
	Timestamp date;
	
	public BoardDTO() {
	}

	

	public BoardDTO(String item, String title, String image, String content, Timestamp date) {
		super();
		this.item = item;
		this.title = title;
		this.image = image;
		this.content = content;
		this.date = date;
	}



	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
	
	
}
