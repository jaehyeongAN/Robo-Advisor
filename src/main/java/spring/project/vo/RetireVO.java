package spring.project.vo;

import java.sql.Date;

public class RetireVO {
	String id;
	Date regDate;
	String name;
	int retireYear, nowAge, deathAge, requireMoney, savedMoney,
		pension,saveMoney;
	double rate, addMoney2, addMoney3;
	int retireAge, accMoney, requireTotal, totalMoney, lackMoney,addMoney; 
	
	public String getName() {
		return name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public void setName(String name) {
		this.name = name;
	}

	public int getRetireAge() {
		return retireAge;
	}

	public double getAddMoney3() {
		return addMoney3;
	}

	public void setAddMoney3(double addMoney3) {
		this.addMoney3 = addMoney3;
	}

	public void setRetireAge(int retireAge) {
		this.retireAge = retireAge;
	}

	public double getAddMoney2() {
		return addMoney2;
	}

	public void setAddMoney2(double addMoney2) {
		this.addMoney2 = addMoney2;
	}

	public int getAddMoney() {
		return addMoney;
	}

	public void setAddMoney(int addMoney) {
		this.addMoney = addMoney;
	}

	public int getAccMoney() {
		return accMoney;
	}

	public void setAccMoney(int accMoney) {
		this.accMoney = accMoney;
	}

	public int getRequireTotal() {
		return requireTotal;
	}

	public void setRequireTotal(int requireTotal) {
		this.requireTotal = requireTotal;
	}

	public int getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}

	public int getLackMoney() {
		return lackMoney;
	}

	public void setLackMoney(int lackMoney) {
		this.lackMoney = lackMoney;
	}

	public int getRetireYear() {
		return retireYear;
	}

	public void setRetireYear(int retireYear) {
		this.retireYear = retireYear;
	}

	public int getNowAge() {
		return nowAge;
	}

	public void setNowAge(int nowAge) {
		this.nowAge = nowAge;
	}

	public int getDeathAge() {
		return deathAge;
	}

	public void setDeathAge(int deathAge) {
		this.deathAge = deathAge;
	}

	public int getRequireMoney() {
		return requireMoney;
	}

	public void setRequireMoney(int requireMoney) {
		this.requireMoney = requireMoney;
	}

	public int getSavedMoney() {
		return savedMoney;
	}

	public void setSavedMoney(int savedMoney) {
		this.savedMoney = savedMoney;
	}

	public int getPension() {
		return pension;
	}

	public void setPension(int pension) {
		this.pension = pension;
	}

	public int getSaveMoney() {
		return saveMoney;
	}

	public void setSaveMoney(int saveMoney) {
		this.saveMoney = saveMoney;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate2) {
		this.rate = rate2;
	}
	
	

}
