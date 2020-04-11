package board.parcelOut.domain;

import org.apache.ibatis.type.Alias;

@Alias("Insert")
public class Insert {

	private String id;
	private String title;
	private String zoo;
	private String zoo2;
	private String gender;
	private String size;
	private String netural;
	private String location;
	private String charge;
	private String explain;
	private String registration;
				
	public Insert(){}

	
	

	public Insert(String id, String title, String zoo, String zoo2, String gender, String size,
			String netural, String location,  String charge, String explain, String registration) {
		super();
		this.id = id;
		this.title = title;
		this.zoo = zoo;
		this.zoo2 = zoo2;
		this.gender = gender;
		this.size = size;
		this.netural = netural;
		this.location = location;
		this.charge = charge;
		this.explain = explain;
		this.registration = registration;
	}


	public String getRegistration() {
		return registration;
	}


	public void setRegistration(String registration) {
		this.registration = registration;
	}


	public String getId() {
		return id;
	}




	public void setId(String id) {
		this.id = id;
	}




	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getZoo() {
		return zoo;
	}


	public void setZoo(String zoo) {
		this.zoo = zoo;
	}



	public String getZoo2() {
		return zoo2;
	}



	public void setZoo2(String zoo2) {
		this.zoo2 = zoo2;
	}



	public String getGender() {
		return gender;
	}




	public void setGender(String gender) {
		this.gender = gender;
	}




	public String getSize() {
		return size;
	}




	public void setSize(String size) {
		this.size = size;
	}



	public String getNetural() {
		return netural;
	}



	public void setNetural(String netural) {
		this.netural = netural;
	}



	public String getLocation() {
		return location;
	}




	public void setLocation(String location) {
		this.location = location;
	}




	public String getCharge() {
		return charge;
	}




	public void setCharge(String charge) {
		this.charge = charge;
	}



	public String getExplain() {
		return explain;
	}



	public void setExplain(String explain) {
		this.explain = explain;
	}


	@Override
	public String toString() {
		return "Seach [zoo=" + zoo + ", zoo2=" + zoo2 + ", gender=" + gender + ", size=" + size + ", netural=" + netural
				+ ", location=" + location + ", charge=" + charge + "]";
	}


	
	
	
}
