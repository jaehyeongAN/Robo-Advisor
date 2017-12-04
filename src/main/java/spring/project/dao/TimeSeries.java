package spring.project.dao;


import java.util.ArrayList;
import java.util.List;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class TimeSeries {


	public List<Integer> TimeSeriesValue1(String type, String add, String jugeao, int peongsu, int inputyear) throws RserveException, REXPMismatchException{
		
		List<Integer> value = new ArrayList<Integer>();
		//int [] value = new int[26];
		
		System.out.println("type : "+type);
		System.out.println("add : "+add);
		System.out.println("jugeao : "+jugeao);
		System.out.println("peongsu : "+peongsu);
		System.out.println("inputyear : "+inputyear);
		RConnection rc = new  RConnection();
		
		rc.eval("library(data.table)");
		rc.eval("library(forecast)");
		//rc.eval("library('fpp', lib.loc='C:/Users/tjdeo/Documents/R/win-library/3.3')");
		rc.eval("library(fpp)");
		
		
		if(type=="APT"){
			rc.eval("/home/anjh/DEV/Spring/workspace(sts)/Project_finance/src/main/webapp/resources/data/FinalProjectData");
			
			if(add.equals("add1")){
				System.out.println("APT, add1");
				rc.eval("data <- read.csv('data1_APT.csv')");
			}else if(add.equals("add2")){
				System.out.println("APT, add2");
				rc.eval("data <- read.csv('data2_APT.csv')");
			}else if(add.equals("add3")){
				System.out.println("APT, add3");
				rc.eval("data <- read.csv('data3_APT.csv')");
			}else if(add.equals("add4")){
				System.out.println("APT, add4");
				rc.eval("data <- read.csv('data4_APT.csv')");
			}else{
				System.out.println("APT, add5");
				rc.eval("data <- read.csv('data5_APT.csv')");
			}
		}else{
			if(add.equals("add1")){
				System.out.println("mult_House, add1");
				rc.eval("data <- read.csv('data1_multiplexHouse.csv')");
			}else if(add.equals("add2")){
				System.out.println("mult_House, add2");
				rc.eval("data <- read.csv('data2_multiplexHouse.csv')");
			}else if(add.equals("add3")){
				System.out.println("mult_House, add3");
				rc.eval("data <- read.csv('data3_multiplexHouse.csv')");
			}else if(add.equals("add4")){
				System.out.println("mult_House, add4");
				rc.eval("data <- read.csv('data4_multiplexHouse.csv')");
			}else{
				System.out.println("mult_House, add5");
				rc.eval("data <- read.csv('data5_multiplexHouse.csv')");
			}
		}
		System.out.println("data읽어오기성공");
		rc.eval("data_table <- as.data.table(data)");
		rc.eval("dataTable <- data_table[, list(type, area, price),  by=c('year','month')]");
		
		System.out.println("jugeao 실행");
		if(jugeao.equals("mm")){
			System.out.println("매매입니다");
			rc.eval("mm <- dataTable[dataTable$type == '매매']");
		}else if(jugeao.equals("jeonse")){
			System.out.println("전세입니다");
			rc.eval("mm <- dataTable[dataTable$type == '전세']");
		}else if(jugeao.equals("month")){
			System.out.println("월세입니다");
			rc.eval("mm <- dataTable[dataTable$type == '월세']");
		}
		System.out.println("주거 타입에 따라 데이터 다듬기");
		
		if(peongsu <=60){
			System.out.println("평수 60 이하");
			rc.eval("dataSet <- mm[mm$area <= 60]");
		}else if(peongsu <=85){
			System.out.println("평수 85 이하");
			rc.eval("dataSet <- mm[mm$area > 60 & mm$area<=85]");
		}else if(peongsu <=102){
			System.out.println("평수 102 이하");
			rc.eval("dataSet <- mm[mm$area > 85 & mm$area<=102]");
		}else if(peongsu <=135){
			System.out.println("평수 135 이하");
			rc.eval("dataSet <- mm[mm$area > 102 & mm$area<=135]");
		}else{
			System.out.println("평수 135 이상");
			rc.eval("dataSet <- mm[mm$area > 135]");
		}
		System.out.println("평수에 따른 데이터 다음기");
		
		rc.eval("dataSet <- dataSet[, list(priceMean=mean(price)), by=c('year','month')]");
		
		System.out.println("시계열 만들기");
		if(type.equals("APT")){
			System.out.println("APT선택");
			if(add.equals("add1")){
				System.out.println("add1 선택");
				if(jugeao.equals("mm")){
					if(peongsu <=60){
						System.out.println("60이하 선택");
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2006, 1), frequency=12)");
					}else if(peongsu <=85){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 5), frequency=12)");
						System.out.println("85이하 선택");
					}else if(peongsu <=102){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 10), frequency=12)");
						System.out.println("102이하 선택");
					}else if(peongsu <=135){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 5), frequency=12)");
						System.out.println("135이하 선택");
					}else{
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 10), frequency=12)");
						System.out.println("135이상 선택");
					}
				}else if(jugeao.equals("jeonse")){
					System.out.println("전세 선택");
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}else if(jugeao.equals("month")){
					System.out.println("월세 선택");
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}
			}else if(add.equals("add2")){
				if(jugeao.equals("mm")){
					if(peongsu <=60){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2006, 1), frequency=12)");
					}else if(peongsu <=85){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 11), frequency=12)");
					}else if(peongsu <=102){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 12), frequency=12)");
					}else if(peongsu <=135){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 5), frequency=12)");
					}else{
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 11), frequency=12)");
					}
				}else if(jugeao.equals("jeonse")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}else if(jugeao.equals("month")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}
			}else if(add.equals("add3")){
				if(jugeao.equals("mm")){
					if(peongsu <=60){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 12), frequency=12)");
					}else if(peongsu <=85){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 7), frequency=12)");
					}else if(peongsu <=102){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 12), frequency=12)");
					}else if(peongsu <=135){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 12), frequency=12)");
					}else{
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 12), frequency=12)");
					}
				}else if(jugeao.equals("jeonse")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}else if(jugeao.equals("month")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}
			}else if(add.equals("add4")){
				if(jugeao.equals("mm")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 12), frequency=12)");
				}else if(jugeao.equals("jeonse")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}else if(jugeao.equals("month")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}
			}else{
				if(jugeao.equals("mm")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2006, 1), frequency=12)");
				}else if(jugeao.equals("jeonse")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}else if(jugeao.equals("month")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}
			}
		}else if(type.equals("mult_House")){
			if(add.equals("add1")){
				if(jugeao.equals("mm")){
					if(peongsu <=60){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2005, 10), frequency=12)");
					}else{
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2006, 1), frequency=12)");
					}
				}else if(jugeao.equals("jeonse")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}else if(jugeao.equals("month")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}
			}else if(add.equals("add2")){
				if(jugeao.equals("mm")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2006, 1), frequency=12)");
				}else if(jugeao.equals("jeonse")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}else if(jugeao.equals("month")){
					if(peongsu <=102 && peongsu > 85){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 2), frequency=12)");
					}else{
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
					}
				}
			}else if(add.equals("add3")){
				if(jugeao.equals("mm")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2006, 1), frequency=12)");
				}else if(jugeao.equals("jeonse")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}else if(jugeao.equals("month")){
					if(peongsu <=102 && peongsu > 85){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 2), frequency=12)");
					}else{
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
					}
				}
			}else if(add.equals("add4")){
				if(jugeao.equals("mm")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2006, 1), frequency=12)");
				}else if(jugeao.equals("jeonse")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
				}else if(jugeao.equals("month")){
					if(peongsu <=102 && peongsu > 85){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 2), frequency=12)");
					}else{
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
					}
				}
			}else{
				if(jugeao.equals("mm")){
					rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2006, 1), frequency=12)");
				}else if(jugeao.equals("jeonse")){
					if(peongsu <=135){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
					}else{
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 2), frequency=12)");
					}
				}else if(jugeao.equals("month")){
					if(peongsu <=135){
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 1), frequency=12)");
					}else{
						rc.eval("tsdata <- ts(dataSet$priceMean, start=c(2011, 2), frequency=12)");
					}
				}
			}
		}
		System.out.println("시계열 데이터 생성 완료");
			
		

		if(type.equals("APT")){
			if(add.equals("add1")){
				if(jugeao.equals("mm")){
					if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(5, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("jeonse")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(2, 1, 1), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(5, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(0, 1, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("month")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(1, 1, 0), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(1, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(0, 1, 0), seasonal = list(order = c(2, 1, 1), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}
			}else if(add.equals("add2")){
				if(jugeao.equals("mm")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(0, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(1, 0, 1), seasonal = list(order = c(2, 0, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("jeonse")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(0, 1, 3), seasonal = list(order = c(1, 1, 1), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(0, 1, 2), seasonal = list(order = c(1, 1, 1), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(0, 1, 2), seasonal = list(order = c(1, 1, 1), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("month")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(1, 1, 0), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(1, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(0, 1, 0), seasonal = list(order = c(2, 1, 1), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}
			}else if(add.equals("add3")){
				if(jugeao.equals("mm")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(4, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(1, 0, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(4, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(1, 0, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(5, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("jeonse")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(1, 1, 1), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(0, 1, 2), seasonal = list(order = c(2, 1, 1), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(0, 1, 2), seasonal = list(order = c(1, 1, 1), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(1, 1, 1), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(1, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("month")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(1, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(1, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(1, 1, 0), seasonal = list(order = c(2, 1, 1), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(2, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(1, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}
			}else if(add.equals("add4")){
				if(jugeao.equals("mm")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(3, 0, 0))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(1, 0, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(5, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(5, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("jeonse")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(0, 0, 1), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(2, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(1, 1, 1), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(1, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(0, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("month")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(0, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(2, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(0, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(0, 1, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}
			}else{
				if(jugeao.equals("mm")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(1, 0, 0))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(0, 1, 0))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(1, 0, 0))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(0, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("jeonse")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(1, 1, 1), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(0, 1, 1), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(0, 1, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(2, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("month")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(0, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(2, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(0, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(0, 1, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}
			}
		}else if(type.equals("mult_House")){
			if(add.equals("add1")){
				if(jugeao.equals("mm")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(0, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(5, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(4, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(5, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("jeonse")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(4, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(1, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(0, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("month")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(0, 1, 2), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(0, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(2, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(1, 1, 0), period = 12))");
					}
				}
			}else if(add.equals("add2")){
				if(jugeao.equals("mm")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(1, 1, 1), seasonal = list(order = c(0, 0, 1), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(0, 1, 1))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(0, 1, 1), seasonal = list(order = c(0, 0, 1), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(5, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("jeonse")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(2, 1, 0), seasonal = list(order = c(1, 1, 1), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(0, 1, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(4, 1, 2), seasonal = list(order = c(1, 0, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(2, 0, 0), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("month")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(2, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(0, 1, 1), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(1, 0, 1), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(0, 0, 0))");
					}
				}
			}else if(add.equals("add3")){
				if(jugeao.equals("mm")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(0, 1, 0), seasonal = list(order = c(2, 0, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(5, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(5, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(5, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("jeonse")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(2, 1, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(0, 1, 1), seasonal = list(order = c(0, 1, 1), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(2, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(0, 1, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("month")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(2, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(2, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(3, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(4, 0, 1), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(0, 0, 0), seasonal = list(order = c(1, 0, 0), period = 12))");
					}
				}
			}else if(add.equals("add4")){
				if(jugeao.equals("mm")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(5, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(0, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("jeonse")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(0, 1, 1), seasonal = list(order = c(0, 0, 1), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(1, 0, 1), seasonal = list(order = c(1, 1, 1), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(2, 0, 0), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(0, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(0, 1, 2))");
					}
				}else if(jugeao.equals("month")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(2, 0, 0), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(2, 0, 1), seasonal = list(order = c(0, 1, 1), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(1, 0, 0), seasonal = list(order = c(1, 1, 1), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(3, 1, 1))");
					}
				}
			}else{
				if(jugeao.equals("mm")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(4, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(5, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(0, 1, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(5, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))");
					}
				}else if(jugeao.equals("jeonse")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(0, 1, 1), seasonal = list(order = c(0, 0, 1), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(0, 1, 1))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(0, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(3, 0, 1), seasonal = list(order = c(1, 0, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(0, 0, 0), seasonal = list(order = c(0, 0, 1), period = 12))");
					}
				}else if(jugeao.equals("month")){
					if(peongsu <=60){
						rc.eval("model <- arima(tsdata, c(3, 0, 1), seasonal = list(order = c(2, 1, 0), period = 12))");
					}else if(peongsu <=85){
						rc.eval("model <- arima(tsdata, c(0, 1, 1))");
					}else if(peongsu <=102){
						rc.eval("model <- arima(tsdata, c(0, 0, 0))");
					}else if(peongsu <=135){
						rc.eval("model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(1, 1, 0), period = 12))");
					}else{
						rc.eval("model <- arima(tsdata, c(0, 0, 0))");
					}
				}
			}
		}
		System.out.println("아리마 모델 생성 완료");
		
		
		String input_year = Integer.toString(inputyear);
		
		rc.eval("fore <- forecast(model, h=(12*30))");
		rc.eval("result <- as.data.frame(fore)");
		
		
		//REXP result =  rc.eval("result$`Point Forecast`[12*"+input_year+"]");
		/*System.out.println("결과 값 : "+result.asString());
		int value = (int)Math.round(result.asDouble());
		*/

		REXP now = rc.eval("dataSet$price[length(dataSet$price)]");
		REXP later1 = rc.eval("result$`Point Forecast`[12*5 ]");
		REXP later2 = rc.eval("result$`Point Forecast`[12*10 ]");	
		REXP later3 = rc.eval("result$`Point Forecast`[12*15 ]");
		REXP later4 = rc.eval("result$`Point Forecast`[12*20 ]");
		REXP result =  rc.eval("result$`Point Forecast`[12*"+input_year+"]");
		

		
		REXP later1_lo80 = rc.eval("result$`Lo 80`[12*5 ]");
		REXP later2_lo80 = rc.eval("result$`Lo 80`[12*10 ]");	
		REXP later3_lo80 = rc.eval("result$`Lo 80`[12*15 ]");
		REXP later4_lo80 = rc.eval("result$`Lo 80`[12*20 ]");
		REXP result_lo80 =  rc.eval("result$`Lo 80`[12*"+input_year+"]");
		

		REXP later1_hi80 = rc.eval("result$`Hi 80`[12*5 ]");
		REXP later2_hi80 = rc.eval("result$`Hi 80`[12*10 ]");	
		REXP later3_hi80 = rc.eval("result$`Hi 80`[12*15 ]");
		REXP later4_hi80 = rc.eval("result$`Hi 80`[12*20 ]");
		REXP result_hi80 =  rc.eval("result$`Hi 80`[12*"+input_year+"]");
		

		REXP later1_lo95 = rc.eval("result$`Lo 95`[12*5 ]");
		REXP later2_lo95 = rc.eval("result$`Lo 95`[12*10 ]");	
		REXP later3_lo95 = rc.eval("result$`Lo 95`[12*15 ]");
		REXP later4_lo95 = rc.eval("result$`Lo 95`[12*20 ]");
		REXP result_lo95 =  rc.eval("result$`Lo 95`[12*"+input_year+"]");
		

		REXP later1_hi95 = rc.eval("result$`Hi 95`[12*5 ]");
		REXP later2_hi95 = rc.eval("result$`Hi 95`[12*10 ]");	
		REXP later3_hi95 = rc.eval("result$`Hi 95`[12*15 ]");
		REXP later4_hi95 = rc.eval("result$`Hi 95`[12*20 ]");
		REXP result_hi95 =  rc.eval("result$`Hi 95`[12*"+input_year+"]");
		
		value.add((int)Math.round(now.asDouble()+15000));
		
		value.add((int)Math.round(later1.asDouble()+15000));
		value.add((int)Math.round(later1_lo80.asDouble()+15000));
		value.add((int)Math.round(later1_hi80.asDouble()+15000));
		value.add((int) Math.round(later1_lo95.asDouble()+15000));
		value.add((int) Math.round(later1_hi95.asDouble()+15000));
		
		value.add((int)Math.round(later2.asDouble()+15000));
		value.add((int)Math.round(later2_lo80.asDouble()+15000));
		value.add((int)Math.round(later2_hi80.asDouble()+15000));
		value.add((int) Math.round(later2_lo95.asDouble()+15000));
		value.add((int) Math.round(later2_hi95.asDouble()+15000));
		
		
		value.add((int)Math.round(later3.asDouble()+15000));
		value.add((int)Math.round(later3_lo80.asDouble()+15000));
		value.add((int)Math.round(later3_hi80.asDouble()+15000));
		value.add((int) Math.round(later3_lo95.asDouble()+15000));
		value.add((int) Math.round(later3_hi95.asDouble()+15000));
		
		value.add((int)Math.round(later4.asDouble()+15000));
		value.add((int)Math.round(later4_lo80.asDouble()+15000));
		value.add((int)Math.round(later4_hi80.asDouble()+15000));
		value.add((int) Math.round(later4_lo95.asDouble()+15000));
		value.add((int) Math.round(later4_hi95.asDouble()+15000));
		
		value.add((int)Math.round(result.asDouble()+15000));
		value.add((int)Math.round(result_lo80.asDouble()+15000));
		value.add((int)Math.round(result_hi80.asDouble()+15000));
		value.add((int) Math.round(result_lo95.asDouble()+15000));
		value.add((int) Math.round(result_hi95.asDouble()+15000));

		rc.close();
		
		return value;
	}
	
}
