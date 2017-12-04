package spring.project.dao;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
import org.springframework.stereotype.Repository;

@Repository
public class RworkDaoImpl implements RworkDao {

	@Override
	public String Recomm_code(int invest_tot, int nowAge, int req_h, int req_m, int req_edu, int req_r, int req_etc) {
		// TODO Auto-generated method stub
		String code = null;
		try {
			RConnection rc = new  RConnection();
			
			rc.eval("setwd('C:/NCS/spring/workspace(spring)/Project_finance/src/main/webapp/resources/data')");
			rc.eval("recomm_w<-read.csv('recomm_w.csv')");
			rc.eval("recomm_w<-recomm_w[c(1:8)]");
			
			String invest_tot1 = Integer.toString(invest_tot);
			String nowAge1 = Integer.toString(nowAge);
			String req_h1 = Integer.toString(req_h);
			String req_m1 = Integer.toString(req_m);
			String req_edu1 = Integer.toString(req_edu);
			String req_r1 = Integer.toString(req_r);
			String req_etc1 = Integer.toString(req_etc);
			
			
			rc.eval("real_data<-c(0, "+invest_tot1+", "+nowAge1+", "+req_h1+", "+req_m1+", "+req_edu1+", "+req_r1+", "+req_etc1+")");
			rc.eval("real_recomm <- rbind(real_data, recomm_w)");
			rc.eval("real_recomm_data <- real_recomm[2:8]");
			rc.eval("real_recomm_dist <- dist(real_recomm_data, method='euclidean')");
			rc.eval("real_recomm_dist_mt <- as.matrix(real_recomm_dist)");
			rc.eval("real_recomm_dist_mt_sort <- sort(real_recomm_dist_mt[,1])");
			rc.eval("real_recomm_dist_mt_index <- names(real_recomm_dist_mt_sort[2])");
			rc.eval("final_real_indext <- as.numeric(real_recomm_dist_mt_index)");
			
			REXP code1 = rc.eval("real_recomm[final_real_indext,]$CODE");
			int code_i = code1.asInteger();
			code = Integer.toString(code_i);
			System.out.println("--------------------");
			System.out.println("code : "+code);
			
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return code;
	}

}
