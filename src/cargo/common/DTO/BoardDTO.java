package cargo.common.DTO;

public class BoardDTO {

	
	String name, email, website, message;

	
	public BoardDTO() {
	}
	
	public BoardDTO(String name, String email, String website, String message) {
		super();
		this.name = name;
		this.email = email;
		this.website = website;
		this.message = message;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
}
