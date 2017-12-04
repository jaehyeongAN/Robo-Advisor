package spring.project.vo;

public class MoneyVO2 {
	private String id;
	//--현금성자산
	private int money;
	private int mmf;  
	private int ordinaryDeposits;
	private int savingsDeposits;

	//--투자자산
	private int fixedDeposit; //
	private int bondFund;// int,      --채권형       

	//--펀드
	private int stockFund;//  int, --주식형펀드
	private int realEstate;// int, --부동산(집)
	private int realEstateFund; //   int, --부동산펀드(집)       
	private int apartmentApplication; //   int, --주택청약(집)
	
	//--------은퇴자산
	private int personalAnnuitySavings; //  int, --개인연금저축    
	private int insurance; //  int, --보험    
	private int variableAnnuities; //  int, --변액연금보험
	private int variableUniversalInsurance; //   int, --변액유니버셜보험
	private String reg_date; // DATE
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getMmf() {
		return mmf;
	}
	public void setMmf(int mmf) {
		this.mmf = mmf;
	}
	public int getOrdinaryDeposits() {
		return ordinaryDeposits;
	}
	public void setOrdinaryDeposits(int ordinaryDeposits) {
		this.ordinaryDeposits = ordinaryDeposits;
	}
	public int getSavingsDeposits() {
		return savingsDeposits;
	}
	public void setSavingsDeposits(int savingsDeposits) {
		this.savingsDeposits = savingsDeposits;
	}
	public int getFixedDeposit() {
		return fixedDeposit;
	}
	public void setFixedDeposit(int fixedDeposit) {
		this.fixedDeposit = fixedDeposit;
	}
	public int getBondFund() {
		return bondFund;
	}
	public void setBondFund(int bondFund) {
		this.bondFund = bondFund;
	}
	public int getStockFund() {
		return stockFund;
	}
	public void setStockFund(int stockFund) {
		this.stockFund = stockFund;
	}
	public int getRealEstate() {
		return realEstate;
	}
	public void setRealEstate(int realEstate) {
		this.realEstate = realEstate;
	}
	public int getRealEstateFund() {
		return realEstateFund;
	}
	public void setRealEstateFund(int realEstateFund) {
		this.realEstateFund = realEstateFund;
	}
	public int getApartmentApplication() {
		return apartmentApplication;
	}
	public void setApartmentApplication(int apartmentApplication) {
		this.apartmentApplication = apartmentApplication;
	}
	public int getPersonalAnnuitySavings() {
		return personalAnnuitySavings;
	}
	public void setPersonalAnnuitySavings(int personalAnnuitySavings) {
		this.personalAnnuitySavings = personalAnnuitySavings;
	}
	public int getInsurance() {
		return insurance;
	}
	public void setInsurance(int insurance) {
		this.insurance = insurance;
	}
	public int getVariableAnnuities() {
		return variableAnnuities;
	}
	public void setVariableAnnuities(int variableAnnuities) {
		this.variableAnnuities = variableAnnuities;
	}
	public int getVariableUniversalInsurance() {
		return variableUniversalInsurance;
	}
	public void setVariableUniversalInsurance(int variableUniversalInsurance) {
		this.variableUniversalInsurance = variableUniversalInsurance;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	

}
