package spring.project.vo;

public class XmlVO {
	public String fin_prdt_cd;				// 금융상품코드
	public String kor_co_nm;			// 금융회사
	public String fin_prdt_nm;		// 상품명
	public String sale_strt_day;		// 판매개시일
	public String mntn_cnt;				// 유지건수
	public String prdt_type_nm;		// 금리연동형
	public String avg_prft_rate;		// 판매 후 연평균 수익률
	public String dcls_rate;			// 공시이율
	
	
	public String getFin_prdt_cd() {
		return fin_prdt_cd;
	}
	public void setFin_prdt_cd(String fin_prdt_cd) {
		this.fin_prdt_cd = fin_prdt_cd;
	}
	public String getKor_co_nm() {
		return kor_co_nm;
	}
	public void setKor_co_nm(String kor_co_nm) {
		this.kor_co_nm = kor_co_nm;
	}
	public String getFin_prdt_nm() {
		return fin_prdt_nm;
	}
	public void setFin_prdt_nm(String fin_prdt_nm) {
		this.fin_prdt_nm = fin_prdt_nm;
	}
	public String getSale_strt_day() {
		return sale_strt_day;
	}
	public void setSale_strt_day(String sale_strt_day) {
		this.sale_strt_day = sale_strt_day;
	}
	public String getMntn_cnt() {
		return mntn_cnt;
	}
	public void setMntn_cnt(String mntn_cnt) {
		this.mntn_cnt = mntn_cnt;
	}
	public String getPrdt_type_nm() {
		return prdt_type_nm;
	}
	public void setPrdt_type_nm(String prdt_type_nm) {
		this.prdt_type_nm = prdt_type_nm;
	}
	public String getAvg_prft_rate() {
		return avg_prft_rate;
	}
	public void setAvg_prft_rate(String avg_prft_rate) {
		this.avg_prft_rate = avg_prft_rate;
	}
	public String getDcls_rate() {
		return dcls_rate;
	}
	public void setDcls_rate(String dcls_rate) {
		this.dcls_rate = dcls_rate;
	}
	

}
