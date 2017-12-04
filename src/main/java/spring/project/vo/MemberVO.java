package spring.project.vo;

public class MemberVO {
	private String id; // 아이디
	private String pwd; // 비밀번호
	private String name; // 이름
	private int gender; // 성별 남 : 1, 여 : 2 
	private String address; // 주소
	private String birthDate; // 생년월일
	private String phone; // 핸드폰 번호
	private int marriageCheck; // 기혼 : 1 미혼 : 2
	private int income; // 수입
	private int pay; // 지출
	private int myStyle; // 위험 : 3 중간 : 2 안전: 1
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getMarriageCheck() {
		return marriageCheck;
	}
	public void setMarriageCheck(int marriageCheck) {
		this.marriageCheck = marriageCheck;
	}
	public int getIncome() {
		return income;
	}
	public void setIncome(int income) {
		this.income = income;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getMyStyle() {
		return myStyle;
	}
	public void setMyStyle(int myStyle) {
		this.myStyle = myStyle;
	}
	
	
}
