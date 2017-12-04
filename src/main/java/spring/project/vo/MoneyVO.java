package spring.project.vo;

public class MoneyVO {
	private String id; // id
	private int age;
	private int fixedIncome; //고정수입
	private int flucIncome; //변동수입
	private int sumIncome; //수입합계
	
	private int fixedHome; //주거비용
	private int fixedFood; //식비
	private int fixedCommunication; //통신비
	private int fixedTrans; //교통비
	private int fixedInsurance; //보험료
	private int fixedTax; //세금
	private int fixedExpense; //고정합계
	
	private int flucLife; //생활용품
	private int flucBeauty; //의류미용
	private int flucLeisure; //문화레저
	private int flucMedical; //의료비
	private int flucEvent; //경조사비
	private int flueEtc; //기타비용
	private int flucEdu;  // 교육비
	private int flucExpense; //변동합계
	
	private int sumExpense; //지출 총합계 
	String reg_date;


	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public int getAge(){
		return age;
	}
	
	public void setAge(int age){
		this.age = age;
	}
	
	public int getFixedIncome() {
		return fixedIncome;
	}

	public void setFixedIncome(int fixedIncome) {
		this.fixedIncome = fixedIncome;
	}

	public int getFlucIncome() {
		return flucIncome;
	}

	public void setFlucIncome(int flucIncome) {
		this.flucIncome = flucIncome;
	}

	public int getSumIncome() {
		return sumIncome;
	}

	public void setSumIncome(int sumIncome) {
		this.sumIncome = sumIncome;
	}

	public int getFixedHome() {
		return fixedHome;
	}

	public void setFixedHome(int fixedHome) {
		this.fixedHome = fixedHome;
	}

	public int getFixedFood() {
		return fixedFood;
	}

	public void setFixedFood(int fixedFood) {
		this.fixedFood = fixedFood;
	}

	public int getFixedCommunication() {
		return fixedCommunication;
	}

	public void setFixedCommunication(int fixedCommunication) {
		this.fixedCommunication = fixedCommunication;
	}

	public int getFixedTrans() {
		return fixedTrans;
	}

	public void setFixedTrans(int fixedTrans) {
		this.fixedTrans = fixedTrans;
	}

	public int getFixedInsurance() {
		return fixedInsurance;
	}

	public void setFixedInsurance(int fixedInsurance) {
		this.fixedInsurance = fixedInsurance;
	}

	public int getFixedTax() {
		return fixedTax;
	}

	public void setFixedTax(int fixedTax) {
		this.fixedTax = fixedTax;
	}

	public int getFixedExpense() {
		return fixedExpense;
	}

	public void setFixedExpense(int fixedExpense) {
		this.fixedExpense = fixedExpense;
	}

	public int getFlucLife() {
		return flucLife;
	}

	public void setFlucLife(int flucLife) {
		this.flucLife = flucLife;
	}

	public int getFlucBeauty() {
		return flucBeauty;
	}

	public void setFlucBeauty(int flucBeauty) {
		this.flucBeauty = flucBeauty;
	}

	public int getFlucLeisure() {
		return flucLeisure;
	}

	public void setFlucLeisure(int flucLeisure) {
		this.flucLeisure = flucLeisure;
	}

	public int getFlucMedical() {
		return flucMedical;
	}

	public void setFlucMedical(int flucMedical) {
		this.flucMedical = flucMedical;
	}

	public int getFlucEvent() {
		return flucEvent;
	}

	public void setFlucEvent(int flucEvent) {
		this.flucEvent = flucEvent;
	}

	public int getFlueEtc() {
		return flueEtc;
	}

	public void setFlueEtc(int flueEtc) {
		this.flueEtc = flueEtc;
	}
	
	public int getFlucEdu() {
		return flucEdu;
	}

	public void setFlucEdu(int flucEdu) {
		this.flucEdu = flucEdu;
	}
	
	
	public int getFlucExpense() {
		return flucExpense;
	}

	public void setFlucExpense(int flucExpense) {
		this.flucExpense = flucExpense;
	}

	public int getSumExpense() {
		return sumExpense;
	}

	public void setSumExpense(int sumExpense) {
		this.sumExpense = sumExpense;
	}
	
	

}
