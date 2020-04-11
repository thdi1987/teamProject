package member.domain;

public class AuthInfo {
	
	private String id;
	private String name;
	private String email;
	private String division;
	private String emailCheck;
	
	public AuthInfo() {
		
	}
	
	public AuthInfo(String id, String name, String email, String division, String emailCheck) {
		
		this.id = id;
		this.name = name;
		this.email = email;
		this.division = division;
		this.emailCheck = emailCheck;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getEmailCheck() {
		return emailCheck;
	}

	public void setEmailCheck(String emailCheck) {
		this.emailCheck = emailCheck;
	}	
}
