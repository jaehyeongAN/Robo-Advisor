package spring.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.project.vo.SFVO;

@Repository
public class SF_DaoImpl implements SF_Dao {
	
	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;
	
	@Override
	public List<SFVO> sf_selectAll() {
		// TODO Auto-generated method stub
		return this.SqlSessionTemplate.selectList("sf_selectTestAll");
	}
	
	@Override
	public List<SFVO> sf_select_result(String code) {
		// TODO Auto-generated method stub
		return this.SqlSessionTemplate.selectList("sf_select_Result", code);
	}

	@Override
	public SFVO sf_selectOne(String id) {
		// TODO Auto-generated method stub
		return this.SqlSessionTemplate.selectOne("selectTest", id);
	}

	@Override
	public void sf_insert(SFVO vo) {
		// TODO Auto-generated method stub
		this.SqlSessionTemplate.insert("sf_insert", vo);
	}

	@Override
	public void sf_update(SFVO vo) {
		// TODO Auto-generated method stub
		this.SqlSessionTemplate.update("sf_update", vo);
	}

	@Override
	public void sf_delete(String id) {
		// TODO Auto-generated method stub
		this.SqlSessionTemplate.delete("deleteTest", id);
	}

	@Override
	public double FV_a(int n, double Rate) {
		// TODO Auto-generated method stub
		double fv = 0;
		for(int i=1; i<n; i++){
			double fv1 = Math.pow((1+Rate), i);
			fv+=fv1;
		}
		return fv;
	}

	@Override
	public double PV_a(int n, double Rate) {
		// TODO Auto-generated method stub
		double PV=(1-Math.pow((1/(1+Rate)), n))/Rate;
		
		return PV;
	}
	
	@Override
	public double FV(int n, double Rate) {
		// TODO Auto-generated method stub
		double FV = Math.pow((1+Rate), n);
		return FV;
	}

	@Override
	public double PV(int n, double Rate) {
		// TODO Auto-generated method stub
		double PV = Math.pow((1/(1+Rate)), n);
		return PV;
	}

	@Override
	public int FV_my_year(int p, int goalMoney, double Rate) {
		// TODO Auto-generated method stub
		int n=0;
		double n1 = Math.log(((goalMoney*Rate)/(p*12))+1)/Math.log(1+Rate);
		n=(int)Math.round((float)n1);
		return n;
	}

	@Override
	public double[] finn(int nowAge) {
		// TODO Auto-generated method stub
		double [] w = new double[5];
		if(nowAge<25){
			w[0]=0.3/0.9; w[1]=0.4/0.9; w[2]=0.05/0.9;w[3]=0.05/0.9;w[4]=0.1/0.9;
		}else if(nowAge>=25){
			w[0]=0.35/0.9; w[1]=0.25/0.9; w[2]=0.1/0.9;w[3]=0.1/0.9;w[4]=0.1/0.9;
		}else if(nowAge>=35){
			w[0]=0.4/0.9; w[1]=0.15/0.9; w[2]=0.15/0.9;w[3]=0.1/0.9;w[4]=0.1/0.9;
		}else if(nowAge>=45){
			w[0]=0.4/0.9; w[1]=0.1/0.9; w[2]=0/0.9;w[3]=0.3/0.9;w[4]=0.1/0.9;
		}else if(nowAge>=55){
			w[0]=0.4/0.9; w[1]=0.1/0.9; w[2]=0/0.9;w[3]=0.2/0.9;w[4]=0.2/0.9;
		}
		
		
		return w;
	}

	@Override
	public SFVO sf_selectResult(String id) {
		// TODO Auto-generated method stub
		return this.SqlSessionTemplate.selectOne("sfvoResult", id);
	}


	@Override
	public List<SFVO> sfvoResultList(String id) {
		// TODO Auto-generated method stub
		return this.SqlSessionTemplate.selectList("sfvoResultList",id);
	}

}
