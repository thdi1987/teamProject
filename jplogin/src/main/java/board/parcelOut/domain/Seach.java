package board.parcelOut.domain;

import org.apache.ibatis.type.Alias;

@Alias("Seach")
public class Seach {

	private String zoo;
	private String zoo2;
	private String gender;
	private String size;
	private String netural;
	private String location;
	private String charge;
	
	Seach(){}

	

	public Seach(String zoo) {
		this.zoo = zoo;
	}



	public Seach(String zoo, String zoo2, String gender,String size, String netural, String location, String charge) {
		super();
		this.zoo = zoo;
		this.zoo2 = zoo2;
		this.gender = gender;
		this.size = size;
		this.netural = netural;
		this.location = location;
		this.charge = charge;
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
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}



	@Override
	public String toString() {
		return "Seach [zoo=" + zoo + ", zoo2=" + zoo2 + ", gender=" + gender + ", size=" + size + ", netural=" + netural
				+ ", location=" + location + ", charge=" + charge + "]";
	}


	
	
	
}
