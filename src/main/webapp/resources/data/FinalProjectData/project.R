install.packages('data.table')
install.packages('forecast')
install.packages('scales')
install.packages('https://cran.rstudio.com/bin/windows/contrib/3.4/forecast_8.0.zip', repos = NULL)
install.packages('fpp')
remove.packages('fpp')
remove.packages('forecast')
remove.packages('scales')

library('fpp', lib.loc='C:/Users/tjdeo/Documents/R/win-library/3.3')

Rserve::Rserve(FALSE,port=6311,args='--RS-encoding utf8 --no-save --slave --encoding utf8  --internet2')

library(forecast)
library(data.table)
library(fpp)

input_style <- 'mult_House'
input_type <- 'sale' # sale, rent
input_rent <- 0
#input_rent <- 'jeonse' # sale : 0 , jeonse, month 
input_address <- 'add2' #강남_강동_양천_강서_마포
input_area <- 1 # 60이하
input_year <- 7 # 10년

data <- read.csv('C:/NCS/Rwork/FinalProjectData/data1_APT.csv')
head(data)
data_table <- as.data.table(data) 
dataTable <- data_table[, list(type, area, price),  by=c('year','month')]

mm <- dataTable[dataTable$type == '매매']
dataSet <- mm[mm$area <= 60]
dataSet <- dataSet[, list(priceMean=mean(price)), by=c('year','month')]
tsdata <- ts(dataSet$priceMean, start=c(2006, 1), frequency=12)

model <- arima(tsdata, c(3, 0, 0), seasonal = list(order = c(2, 1, 0), period = 12))

fore <- forecast(model, h=(12*input_year)) 

result <- as.data.frame(fore)
result$`Point Forecast`[12*input_year]


if(input_style == 'APT'){
  if(input_address == 'add1'){ # 강남_강동_양천_강서_마포
    data <- read.csv('C:/NCS/Rwork/FinalProjectData/data1_APT.csv')
    data_table <- as.data.table(data) 
    dataTable <- data_table[, list(type, area, price),  by=c('year','month')]
    
    if(input_type == 'sale' & input_rent == 0){
      mm <- dataTable[dataTable$type == '매매']
      dataSet1 <- mm[mm$area <= 60]
      dataSet2 <- mm[mm$area > 60 & mm$area<=85]
      dataSet3 <- mm[mm$area > 85 & mm$area<=102]
      dataSet4 <- mm[mm$area > 102 & mm$area<=135]
      dataSet5 <- mm[mm$area > 135]
      
      dataSet1 <- dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet2 <- dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet3 <- dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet4 <- dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet5 <- dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
      
      #
      tsdata1 <- ts(dataSet1$priceMean, start=c(2006, 1), frequency=12)
      tsdata2 <- ts(dataSet2$priceMean, start=c(2005, 5), frequency=12)
      tsdata3 <- ts(dataSet3$priceMean, start=c(2005, 10), frequency=12)
      tsdata4 <- ts(dataSet4$priceMean, start=c(2005, 5), frequency=12)
      tsdata5 <- ts(dataSet5$priceMean, start=c(2005, 10), frequency=12)
      
      if(input_area == 1){ # 60이하
        model1 <- arima(tsdata1, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore1 <- forecast(model1, h=(12*input_year)) 
        
        result <- as.data.frame(fore1)
      }else if(input_area == 2){ # 60초과 ~ 85이하
        model2 <- arima(tsdata2, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore2 <- forecast(model2, h=(12*input_year)) 
        
        result <- as.data.frame(fore2)
      }else if(input_area == 3){ # 85초과 ~ 102이하
        model3 <- arima(tsdata3, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore3 <- forecast(model3, h=(12*input_year)) 
        
        result <- as.data.frame(fore3)
      }else if(input_area == 4){ # 102초과 ~ 135이하
        model4 <- arima(tsdata4, c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore4 <- forecast(model4, h=(12*input_year)) 
        
        result <- as.data.frame(fore4)
      }else{ # js_dataSet5 : 135초과 
        model5 <- arima(tsdata5, c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore5 <- forecast(model5, h=(12*input_year)) 
        
        result <- as.data.frame(fore5)
      }
    }
  }
}
result




if(input_style == 'APT'){
  if(input_address == 'add1'){ # 강남_강동_양천_강서_마포
    data <- read.csv('C:/NCS/Rwork/FinalProjectData/data1_APT.csv')
    data_table <- as.data.table(data) 
    dataTable <- data_table[, list(type, area, price),  by=c('year','month')]
    
    if(input_type == 'sale' & input_rent == 0){
      mm <- dataTable[dataTable$type == '매매']
      dataSet1 <- mm[mm$area <= 60]
      dataSet2 <- mm[mm$area > 60 & mm$area<=85]
      dataSet3 <- mm[mm$area > 85 & mm$area<=102]
      dataSet4 <- mm[mm$area > 102 & mm$area<=135]
      dataSet5 <- mm[mm$area > 135]

      dataSet1 <- dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet2 <- dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet3 <- dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet4 <- dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet5 <- dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
      
      tsdata1 <- ts(dataSet1$priceMean, start=c(2006, 1), frequency=12)
      tsdata2 <- ts(dataSet2$priceMean, start=c(2005, 5), frequency=12)
      tsdata3 <- ts(dataSet3$priceMean, start=c(2005, 10), frequency=12)
      tsdata4 <- ts(dataSet4$priceMean, start=c(2005, 5), frequency=12)
      tsdata5 <- ts(dataSet5$priceMean, start=c(2005, 10), frequency=12)
      
      if(input_area == 1){ # 60이하
        model1 <- arima(tsdata1, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))

        fore1 <- forecast(model1, h=(12*input_year)) 
        
        result <- as.data.frame(fore1)
      }else if(input_area == 2){ # 60초과 ~ 85이하
        model2 <- arima(tsdata2, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore2 <- forecast(model2, h=(12*input_year)) 
        
        result <- as.data.frame(fore2)
      }else if(input_area == 3){ # 85초과 ~ 102이하
        model3 <- arima(tsdata3, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore3 <- forecast(model3, h=(12*input_year)) 
        
        result <- as.data.frame(fore3)
      }else if(input_area == 4){ # 102초과 ~ 135이하
        model4 <- arima(tsdata4, c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore4 <- forecast(model4, h=(12*input_year)) 
        
        result <- as.data.frame(fore4)
      }else{ # js_dataSet5 : 135초과 
        model5 <- arima(tsdata5, c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore5 <- forecast(model5, h=(12*input_year)) 
        
        result <- as.data.frame(fore5)
      }
    }else if(input_type == 'rent'){
      if(input_rent == 'jeonse'){
        js <- dataTable[dataTable$type == '전세']
        js_dataSet1 <- js[js$area <= 60]
        js_dataSet2 <- js[js$area > 60 & js$area<=85]
        js_dataSet3 <- js[js$area > 85 & js$area<=102]
        js_dataSet4 <- js[js$area > 102 & js$area<=135]
        js_dataSet5 <- js[js$area > 135]
        
        js_dataSet1 <- js_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet2 <- js_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet3 <- js_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet4 <- js_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet5 <- js_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        js_tsdata1 <- ts(js_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata2 <- ts(js_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata3 <- ts(js_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata4 <- ts(js_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata5 <- ts(js_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        
        if(input_area == 1){ # 60이하
          # ARIMA 분석 모형 설정
          js_model1 <- arima(js_tsdata1, c(1, 0, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          # 예측 
          js_fore1 <- forecast(js_model1, h=(12*input_year)) 
          
          # 예측값 출력
          result <- as.data.frame(js_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          js_model2 <- arima(js_tsdata2, c(2, 1, 1), 
                             seasonal = list(order = c(1, 1, 0), period = 12))
          
          js_fore2 <- forecast(js_model2, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          js_model3 <- arima(js_tsdata3, c(1, 0, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore3 <- forecast(js_model3, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          js_model4 <- arima(js_tsdata4, c(5, 0, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore4 <- forecast(model4, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore4)
        }else{ # js_dataSet5 : 135초과 
          js_model5 <- arima(js_tsdata5, c(0, 1, 1), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore5 <- forecast(js_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else if(input_rent == 'month'){
        rent <- dataTable[dataTable$type == '월세']
        rent_dataSet1 <- rent[rent$area <= 60]
        rent_dataSet2 <- rent[rent$area > 60 & rent$area<=85]
        rent_dataSet3 <- rent[rent$area > 85 & rent$area<=102]
        rent_dataSet4 <- rent[rent$area > 102 & rent$area<=135]
        rent_dataSet5 <- rent[rent$area > 135]
        
        rent_dataSet1 <- rent_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet2 <- rent_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet3 <- rent_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet4 <- rent_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet5 <- rent_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        rent_tsdata1 <- ts(rent_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata2 <- ts(rent_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata3 <- ts(rent_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata4 <- ts(rent_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata5 <- ts(rent_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        if(input_area == 1){ # 60이하
          rent_model1 <- arima(rent_tsdata1, c(1, 0, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore1 <- forecast(rent_model1, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          rent_model2 <- arima(rent_tsdata2, c(1, 1, 0), 
                               seasonal = list(order = c(1, 1, 0), period = 12))
          
          rent_fore2 <- forecast(rent_model2, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          rent_model3 <- arima(rent_tsdata3, c(1, 0, 1), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore3 <- forecast(rent_model3, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          rent_model4 <- arima(rent_tsdata4, c(0, 1, 0), 
                               seasonal = list(order = c(2, 1, 1), period = 12))
          
          rent_fore4 <- forecast(rent_model4, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore4)
        }else{ # js_dataSet5 : 135초과 
          rent_model5 <- arima(rent_tsdata5, c(3, 0, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore5 <- forecast(rent_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else{
        print('APT add1 rent error')
      }
    }
  }else if(input_address == 'add2'){ # 강북_동작_용산_영등포_금천
    data <- read.csv('C:/NCS/Rwork/FinalProjectData/data2_APT.csv')
    data_table <- as.data.table(data) 
    dataTable <- data_table[, list(type, area, price),  by=c('year','month')]
    
    if(input_type == 'sale' & input_rent == 0){
      mm <- dataTable[dataTable$type == '매매']
      dataSet1 <- mm[mm$area <= 60]
      dataSet2 <- mm[mm$area > 60 & mm$area<=85]
      dataSet3 <- mm[mm$area > 85 & mm$area<=102]
      dataSet4 <- mm[mm$area > 102 & mm$area<=135]
      dataSet5 <- mm[mm$area > 135]
      
      dataSet1 <- dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet2 <- dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet3 <- dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet4 <- dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet5 <- dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
      
      tsdata1 <- ts(dataSet1$priceMean, start=c(2006, 1), frequency=12)
      tsdata2 <- ts(dataSet2$priceMean, start=c(2005, 11), frequency=12)
      tsdata3 <- ts(dataSet3$priceMean, start=c(2005, 12), frequency=12)
      tsdata4 <- ts(dataSet4$priceMean, start=c(2005, 5), frequency=12)
      tsdata5 <- ts(dataSet5$priceMean, start=c(2005, 11), frequency=12)
      
      if(input_area == 1){ # 60이하
        model1 <- arima(tsdata1, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore1 <- forecast(model1, h=(12*input_year)) 
        
        result <- as.data.frame(fore1)
      }else if(input_area == 2){ # 60초과 ~ 85이하
        model2 <- arima(tsdata2, c(0, 1, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore2 <- forecast(model2, h=(12*input_year)) 
        
        result <- as.data.frame(fore2)
      }else if(input_area == 3){ # 85초과 ~ 102이하
        model3 <- arima(tsdata3, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore3 <- forecast(model3, h=(12*input_year)) 
        
        result <- as.data.frame(fore3)
      }else if(input_area == 4){ # 102초과 ~ 135이하
        model4 <- arima(tsdata4, c(1, 0, 1), 
                        seasonal = list(order = c(2, 0, 0), period = 12))
        
        fore4 <- forecast(model4, h=(12*input_year)) 
        
        result <- as.data.frame(fore4)
      }else{ # js_dataSet5 : 135초과 
        model5 <- arima(tsdata5, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore5 <- forecast(model5, h=(12*input_year)) 
        
        result <- as.data.frame(fore5)
      }
    }else if(input_type == 'rent'){
      if(input_rent == 'jeonse'){
        js <- dataTable[dataTable$type == '전세']
        js_dataSet1 <- js[js$area <= 60]
        js_dataSet2 <- js[js$area > 60 & js$area<=85]
        js_dataSet3 <- js[js$area > 85 & js$area<=102]
        js_dataSet4 <- js[js$area > 102 & js$area<=135]
        js_dataSet5 <- js[js$area > 135]
        
        js_dataSet1 <- js_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet2 <- js_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet3 <- js_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet4 <- js_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet5 <- js_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        js_tsdata1 <- ts(js_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata2 <- ts(js_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata3 <- ts(js_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata4 <- ts(js_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata5 <- ts(js_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        
        if(input_area == 1){ # 60이하
          # ARIMA 분석 모형 설정
          js_model1 <- arima(js_tsdata1, c(1, 0, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          # 예측 
          js_fore1 <- forecast(js_model1, h=(12*input_year)) 
          
          # 예측값 출력
          result <- as.data.frame(js_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          js_model2 <- arima(js_tsdata2, c(0, 1, 3), 
                             seasonal = list(order = c(1, 1, 1), period = 12))
          
          js_fore2 <- forecast(js_model2, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          js_model3 <- arima(js_tsdata3, c(0, 1, 2), 
                             seasonal = list(order = c(1, 1, 1), period = 12))
          
          js_fore3 <- forecast(js_model3, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          js_model4 <- arima(js_tsdata4, c(0, 1, 2), 
                             seasonal = list(order = c(1, 1, 1), period = 12))
          
          js_fore4 <- forecast(js_model4, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore4)
        }else{ # js_dataSet5 : 135초과 
          js_model5 <- arima(js_tsdata5, c(3, 0, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore5 <- forecast(js_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else if(input_rent == 'month'){
        rent <- dataTable[dataTable$type == '월세']
        rent_dataSet1 <- rent[rent$area <= 60]
        rent_dataSet2 <- rent[rent$area > 60 & rent$area<=85]
        rent_dataSet3 <- rent[rent$area > 85 & rent$area<=102]
        rent_dataSet4 <- rent[rent$area > 102 & rent$area<=135]
        rent_dataSet5 <- rent[rent$area > 135]
        
        rent_dataSet1 <- rent_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet2 <- rent_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet3 <- rent_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet4 <- rent_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet5 <- rent_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        rent_tsdata1 <- ts(rent_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata2 <- ts(rent_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata3 <- ts(rent_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata4 <- ts(rent_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata5 <- ts(rent_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        if(input_area == 1){ # 60이하
          rent_model1 <- arima(rent_tsdata1, c(1, 0, 1), 
                               seasonal = list(order = c(1, 1, 0), period = 12))
          
          rent_fore1 <- forecast(rent_model1, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          rent_model2 <- arima(rent_tsdata2, c(2, 1, 1), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore2 <- forecast(rent_model2, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          rent_model3 <- arima(rent_tsdata3, c(3, 0, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore3 <- forecast(rent_model3, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          rent_model4 <- arima(rent_tsdata4, c(3, 0, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore4 <- forecast(rent_model4, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore4)
        }else{ # js_dataSet5 : 135초과 
          rent_model5 <- arima(rent_tsdata5, c(4, 0, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore5 <- forecast(rent_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else{
        print('APT add2 rent error')
      }
    }
  }else if(input_address == 'add3'){ # 구로_은평_노원_송파_종로
    data <- read.csv('C:/NCS/Rwork/FinalProjectData/data3_APT.csv')
    data_table <- as.data.table(data) 
    dataTable <- data_table[, list(type, area, price),  by=c('year','month')]
    
    if(input_type == 'sale' & input_rent == 0){
      mm <- dataTable[dataTable$type == '매매']
      dataSet1 <- mm[mm$area <= 60]
      dataSet2 <- mm[mm$area > 60 & mm$area<=85]
      dataSet3 <- mm[mm$area > 85 & mm$area<=102]
      dataSet4 <- mm[mm$area > 102 & mm$area<=135]
      dataSet5 <- mm[mm$area > 135]
      
      dataSet1 <- dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet2 <- dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet3 <- dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet4 <- dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet5 <- dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
      
      tsdata1 <- ts(dataSet1$priceMean, start=c(2005, 12), frequency=12)
      tsdata2 <- ts(dataSet2$priceMean, start=c(2005, 7), frequency=12)
      tsdata3 <- ts(dataSet3$priceMean, start=c(2005, 12), frequency=12)
      tsdata4 <- ts(dataSet4$priceMean, start=c(2005, 12), frequency=12)
      tsdata5 <- ts(dataSet5$priceMean, start=c(2005, 12), frequency=12)
      
      if(input_area == 1){ # 60이하
        model1 <- arima(tsdata1, c(4, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore1 <- forecast(model1, h=(12*input_year)) 
        
        result <- as.data.frame(fore1)
      }else if(input_area == 2){ # 60초과 ~ 85이하
        model2 <- arima(tsdata2, c(3, 0, 0), 
                        seasonal = list(order = c(1, 0, 0), period = 12))
        
        fore2 <- forecast(model2, h=(12*input_year)) 
        
        result <- as.data.frame(fore2)
      }else if(input_area == 3){ # 85초과 ~ 102이하
        model3 <- arima(tsdata3, c(4, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore3 <- forecast(model3, h=(12*input_year)) 
        
        result <- as.data.frame(fore3)
      }else if(input_area == 4){ # 102초과 ~ 135이하
        model4 <- arima(tsdata4, c(1, 0, 0), 
                        seasonal = list(order = c(1, 0, 0), period = 12))
        
        fore4 <- forecast(model4, h=(12*input_year)) 
        
        result <- as.data.frame(fore4)
      }else{ # js_dataSet5 : 135초과 
        model5 <- arima(tsdata5, c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore5 <- forecast(model5, h=(12*input_year)) 
        
        result <- as.data.frame(fore5)
      }
    }else if(input_type == 'rent'){
      if(input_rent == 'jeonse'){
        js <- dataTable[dataTable$type == '전세']
        js_dataSet1 <- js[js$area <= 60]
        js_dataSet2 <- js[js$area > 60 & js$area<=85]
        js_dataSet3 <- js[js$area > 85 & js$area<=102]
        js_dataSet4 <- js[js$area > 102 & js$area<=135]
        js_dataSet5 <- js[js$area > 135]
        
        js_dataSet1 <- js_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet2 <- js_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet3 <- js_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet4 <- js_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet5 <- js_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        js_tsdata1 <- ts(js_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata2 <- ts(js_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata3 <- ts(js_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata4 <- ts(js_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata5 <- ts(js_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        
        if(input_area == 1){ # 60이하
          # ARIMA 분석 모형 설정
          js_model1 <- arima(js_tsdata1, c(1, 1, 1), 
                             seasonal = list(order = c(1, 1, 0), period = 12))
          
          # 예측 
          js_fore1 <- forecast(js_model1, h=(12*input_year)) 
          
          # 예측값 출력
          result <- as.data.frame(js_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          js_model2 <- arima(js_tsdata2, c(0, 1, 2), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore2 <- forecast(js_model2, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          js_model3 <- arima(js_tsdata3, c(0, 1, 2), 
                             seasonal = list(order = c(1, 1, 1), period = 12))
          
          js_fore3 <- forecast(js_model3, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          js_model4 <- arima(js_tsdata4, c(3, 0, 0), 
                             seasonal = list(order = c(1, 1, 1), period = 12))
          
          js_fore4 <- forecast(js_model4, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore4)
        }else{ # js_dataSet5 : 135초과 
          js_model5 <- arima(js_tsdata5, c(1, 0, 1), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore5 <- forecast(js_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else if(input_rent == 'month'){
        rent <- dataTable[dataTable$type == '월세']
        rent_dataSet1 <- rent[rent$area <= 60]
        rent_dataSet2 <- rent[rent$area > 60 & rent$area<=85]
        rent_dataSet3 <- rent[rent$area > 85 & rent$area<=102]
        rent_dataSet4 <- rent[rent$area > 102 & rent$area<=135]
        rent_dataSet5 <- rent[rent$area > 135]
        
        rent_dataSet1 <- rent_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet2 <- rent_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet3 <- rent_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet4 <- rent_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet5 <- rent_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        rent_tsdata1 <- ts(rent_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata2 <- ts(rent_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata3 <- ts(rent_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata4 <- ts(rent_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata5 <- ts(rent_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        if(input_area == 1){ # 60이하
          rent_model1 <- arima(rent_tsdata1, c(1, 0, 1), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore1 <- forecast(rent_model1, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          rent_model2 <- arima(rent_tsdata2, c(1, 0, 1), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore2 <- forecast(rent_model2, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          rent_model3 <- arima(rent_tsdata3, c(1, 1, 0), 
                               seasonal = list(order = c(2, 1, 1), period = 12))
          
          rent_fore3 <- forecast(rent_model3, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          rent_model4 <- arima(rent_tsdata4, c(2, 0, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore4 <- forecast(rent_model4, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore4)
        }else{ # js_dataSet5 : 135초과 
          rent_model5 <- arima(rent_tsdata5, c(1, 0, 1), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore5 <- forecast(rent_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else{
        print('APT add3 rent error')
      }
    }
  }else if(input_address == 'add4'){ # 성동_서대문_광진_관악_서초
    data <- read.csv('C:/NCS/Rwork/FinalProjectData/data4_APT.csv')
    data_table <- as.data.table(data) 
    dataTable <- data_table[, list(type, area, price),  by=c('year','month')]
    
    if(input_type == 'sale' & input_rent == 0){
      mm <- dataTable[dataTable$type == '매매']
      dataSet1 <- mm[mm$area <= 60]
      dataSet2 <- mm[mm$area > 60 & mm$area<=85]
      dataSet3 <- mm[mm$area > 85 & mm$area<=102]
      dataSet4 <- mm[mm$area > 102 & mm$area<=135]
      dataSet5 <- mm[mm$area > 135]
      
      dataSet1 <- dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet2 <- dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet3 <- dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet4 <- dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet5 <- dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
      
      tsdata1 <- ts(dataSet1$priceMean, start=c(2005, 12), frequency=12)
      tsdata2 <- ts(dataSet2$priceMean, start=c(2005, 12), frequency=12)
      tsdata3 <- ts(dataSet3$priceMean, start=c(2005, 12), frequency=12)
      tsdata4 <- ts(dataSet4$priceMean, start=c(2005, 12), frequency=12)
      tsdata5 <- ts(dataSet5$priceMean, start=c(2005, 12), frequency=12)
      
      if(input_area == 1){ # 60이하
        model1 <- arima(tsdata1, c(3, 0, 0))
        
        fore1 <- forecast(model1, h=(12*input_year)) 
        
        result <- as.data.frame(fore1)
      }else if(input_area == 2){ # 60초과 ~ 85이하
        model2 <- arima(tsdata2, c(1, 0, 0), 
                        seasonal = list(order = c(1, 0, 0), period = 12))
        
        fore2 <- forecast(model2, h=(12*input_year)) 
        
        result <- as.data.frame(fore2)
      }else if(input_area == 3){ # 85초과 ~ 102이하
        model3 <- arima(tsdata3, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore3 <- forecast(model3, h=(12*input_year)) 
        
        result <- as.data.frame(fore3)
      }else if(input_area == 4){ # 102초과 ~ 135이하
        model4 <- arima(tsdata4, c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore4 <- forecast(model4, h=(12*input_year)) 
        
        result <- as.data.frame(fore4)
      }else{ # js_dataSet5 : 135초과 
        model5 <- arima(tsdata5, c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore5 <- forecast(model5, h=(12*input_year)) 
        
        result <- as.data.frame(fore5)
      }
    }else if(input_type == 'rent'){
      if(input_rent == 'jeonse'){
        js <- dataTable[dataTable$type == '전세']
        js_dataSet1 <- js[js$area <= 60]
        js_dataSet2 <- js[js$area > 60 & js$area<=85]
        js_dataSet3 <- js[js$area > 85 & js$area<=102]
        js_dataSet4 <- js[js$area > 102 & js$area<=135]
        js_dataSet5 <- js[js$area > 135]
        
        js_dataSet1 <- js_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet2 <- js_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet3 <- js_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet4 <- js_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet5 <- js_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        js_tsdata1 <- ts(js_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata2 <- ts(js_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata3 <- ts(js_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata4 <- ts(js_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata5 <- ts(js_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        
        if(input_area == 1){ # 60이하
          # ARIMA 분석 모형 설정
          js_model1 <- arima(js_tsdata1, c(0, 0, 1), 
                             seasonal = list(order = c(1, 1, 0), period = 12))
          
          # 예측 
          js_fore1 <- forecast(js_model1, h=(12*input_year)) 
          
          # 예측값 출력
          result <- as.data.frame(js_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          js_model2 <- arima(js_tsdata2, c(2, 1, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore2 <- forecast(js_model2, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          js_model3 <- arima(js_tsdata3, c(1, 1, 1), 
                             seasonal = list(order = c(1, 1, 0), period = 12))
          
          js_fore3 <- forecast(js_model3, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          js_model4 <- arima(js_tsdata4, c(1, 0, 1), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore4 <- forecast(js_model4, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore4)
        }else{ # js_dataSet5 : 135초과 
          js_model5 <- arima(js_tsdata5, c(0, 1, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore5 <- forecast(js_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else if(input_rent == 'month'){
        rent <- dataTable[dataTable$type == '월세']
        rent_dataSet1 <- rent[rent$area <= 60]
        rent_dataSet2 <- rent[rent$area > 60 & rent$area<=85]
        rent_dataSet3 <- rent[rent$area > 85 & rent$area<=102]
        rent_dataSet4 <- rent[rent$area > 102 & rent$area<=135]
        rent_dataSet5 <- rent[rent$area > 135]
        
        rent_dataSet1 <- rent_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet2 <- rent_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet3 <- rent_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet4 <- rent_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet5 <- rent_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        rent_tsdata1 <- ts(rent_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata2 <- ts(rent_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata3 <- ts(rent_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata4 <- ts(rent_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata5 <- ts(rent_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        if(input_area == 1){ # 60이하
          rent_model1 <- arima(rent_tsdata1, c(1, 0, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
                               
          rent_fore1 <- forecast(rent_model1, h=(12*input_year)) 
                               
          result <- as.data.frame(rent_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          rent_model2 <- arima(rent_tsdata2, c(0, 1, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore2 <- forecast(rent_model2, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          rent_model3 <- arima(rent_tsdata3, c(2, 1, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore3 <- forecast(rent_model3, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          rent_model4 <- arima(rent_tsdata4, c(0, 1, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore4 <- forecast(rent_model4, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore4)
        }else{ # js_dataSet5 : 135초과 
          rent_model5 <- arima(rent_tsdata5, c(0, 1, 1), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore5 <- forecast(rent_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else{
        print('APT add4 rent error')
      }
    }
  }else if(input_address == 'add5'){ # 성북_중랑_동대문_도봉_중구
    data <- read.csv('C:/NCS/Rwork/FinalProjectData/data5_APT.csv')
    data_table <- as.data.table(data) 
    dataTable <- data_table[, list(type, area, price),  by=c('year','month')]
    
    if(input_type == 'sale' & input_rent == 0){
      mm <- dataTable[dataTable$type == '매매']
      dataSet1 <- mm[mm$area <= 60]
      dataSet2 <- mm[mm$area > 60 & mm$area<=85]
      dataSet3 <- mm[mm$area > 85 & mm$area<=102]
      dataSet4 <- mm[mm$area > 102 & mm$area<=135]
      dataSet5 <- mm[mm$area > 135]
      
      dataSet1 <- dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet2 <- dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet3 <- dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet4 <- dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet5 <- dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
      
      tsdata1 <- ts(dataSet1$priceMean, start=c(2006, 1), frequency=12)
      tsdata2 <- ts(dataSet2$priceMean, start=c(2006, 1), frequency=12)
      tsdata3 <- ts(dataSet3$priceMean, start=c(2006, 1), frequency=12)
      tsdata4 <- ts(dataSet4$priceMean, start=c(2006, 1), frequency=12)
      tsdata5 <- ts(dataSet5$priceMean, start=c(2006, 1), frequency=12)
      
      if(input_area == 1){ # 60이하
        model1 <- arima(tsdata1, c(1, 0, 0))
        
        fore1 <- forecast(model1, h=(12*input_year)) 
        
        result <- as.data.frame(fore1)
      }else if(input_area == 2){ # 60초과 ~ 85이하
        model2 <- arima(tsdata2, c(0, 1, 0))
        
        fore2 <- forecast(model2, h=(12*input_year)) 
        
        result <- as.data.frame(fore2)
      }else if(input_area == 3){ # 85초과 ~ 102이하
        model3 <- arima(tsdata3, c(1, 0, 0))
        
        fore3 <- forecast(model3, h=(12*input_year)) 
        
        result <- as.data.frame(fore3)
      }else if(input_area == 4){ # 102초과 ~ 135이하
        model4 <- arima(tsdata4, c(0, 1, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore4 <- forecast(model4, h=(12*input_year)) 
        
        result <- as.data.frame(fore4)
      }else{ # js_dataSet5 : 135초과 
        model5 <- arima(tsdata5, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore5 <- forecast(model5, h=(12*input_year)) 
        
        result <- as.data.frame(fore5)
      }
    }else if(input_type == 'rent'){
      if(input_rent == 'jeonse'){
        js <- dataTable[dataTable$type == '전세']
        js_dataSet1 <- js[js$area <= 60]
        js_dataSet2 <- js[js$area > 60 & js$area<=85]
        js_dataSet3 <- js[js$area > 85 & js$area<=102]
        js_dataSet4 <- js[js$area > 102 & js$area<=135]
        js_dataSet5 <- js[js$area > 135]
        
        js_dataSet1 <- js_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet2 <- js_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet3 <- js_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet4 <- js_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet5 <- js_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        js_tsdata1 <- ts(js_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata2 <- ts(js_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata3 <- ts(js_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata4 <- ts(js_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata5 <- ts(js_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        
        if(input_area == 1){ # 60이하
          # ARIMA 분석 모형 설정
          js_model1 <- arima(js_tsdata1, c(1, 0, 0), 
                             seasonal = list(order = c(1, 1, 1), period = 12))
          
          # 예측 
          js_fore1 <- forecast(js_model1, h=(12*input_year)) 
          
          # 예측값 출력
          result <- as.data.frame(js_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          js_model2 <- arima(js_tsdata2, c(0, 1, 1), 
                             seasonal = list(order = c(1, 1, 0), period = 12))
          
          js_fore2 <- forecast(js_model2, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          js_model3 <- arima(js_tsdata3, c(1, 0, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore3 <- forecast(js_model3, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          js_model4 <- arima(js_tsdata4, c(0, 1, 1), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore4 <- forecast(js_model4, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore4)
        }else{ # js_dataSet5 : 135초과 
          js_model5 <- arima(js_tsdata5, c(2, 0, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore5 <- forecast(js_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else if(input_rent == 'month'){
        rent <- dataTable[dataTable$type == '월세']
        rent_dataSet1 <- rent[rent$area <= 60]
        rent_dataSet2 <- rent[rent$area > 60 & rent$area<=85]
        rent_dataSet3 <- rent[rent$area > 85 & rent$area<=102]
        rent_dataSet4 <- rent[rent$area > 102 & rent$area<=135]
        rent_dataSet5 <- rent[rent$area > 135]
        
        rent_dataSet1 <- rent_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet2 <- rent_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet3 <- rent_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet4 <- rent_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet5 <- rent_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        rent_tsdata1 <- ts(rent_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata2 <- ts(rent_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata3 <- ts(rent_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata4 <- ts(rent_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata5 <- ts(rent_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        if(input_area == 1){ # 60이하
          rent_model1 <- arima(rent_tsdata1, c(1, 0, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore1 <- forecast(rent_model1, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          rent_model2 <- arima(rent_tsdata2, c(0, 1, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore2 <- forecast(rent_model2, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          rent_model3 <- arima(rent_tsdata3, c(2, 1, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore3 <- forecast(rent_model3, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          rent_model4 <- arima(rent_tsdata4, c(0, 1, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore4 <- forecast(rent_model4, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore4)
        }else{ # js_dataSet5 : 135초과 
          rent_model5 <- arima(rent_tsdata5, c(0, 1, 1), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore5 <- forecast(rent_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else{
        print('APT add5 rent error')
      }
    }
  }
}else if(input_style == 'mult_House'){
  ########################################################################################
  if(input_address == 'add1'){ # 강남_강동_양천_강서_마포
    data <- read.csv('C:/NCS/Rwork/FinalProjectData/data1_multiplexHouse.csv')
    data_table <- as.data.table(data) 
    dataTable <- data_table[, list(type, area, price),  by=c('year','month')]
    
    if(input_type == 'sale' & input_rent == 0){
      mm <- dataTable[dataTable$type == '매매']
      dataSet1 <- mm[mm$area <= 60]
      dataSet2 <- mm[mm$area > 60 & mm$area<=85]
      dataSet3 <- mm[mm$area > 85 & mm$area<=102]
      dataSet4 <- mm[mm$area > 102 & mm$area<=135]
      dataSet5 <- mm[mm$area > 135]
      
      dataSet1 <- dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet2 <- dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet3 <- dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet4 <- dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet5 <- dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
      
      tsdata1 <- ts(dataSet1$priceMean, start=c(2005, 10), frequency=12)
      tsdata2 <- ts(dataSet2$priceMean, start=c(2006, 1), frequency=12)
      tsdata3 <- ts(dataSet3$priceMean, start=c(2006, 1), frequency=12)
      tsdata4 <- ts(dataSet4$priceMean, start=c(2006, 1), frequency=12)
      tsdata5 <- ts(dataSet5$priceMean, start=c(2006, 1), frequency=12)
      
      if(input_area == 1){ # 60이하
        model1 <- arima(tsdata1, c(0, 1, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore1 <- forecast(model1, h=(12*input_year)) 
        
        result <- as.data.frame(fore1)
      }else if(input_area == 2){ # 60초과 ~ 85이하
        model2 <- arima(tsdata2, c(5, 1, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore2 <- forecast(model2, h=(12*input_year)) 
        
        result <- as.data.frame(fore2)
      }else if(input_area == 3){ # 85초과 ~ 102이하
        model3 <- arima(tsdata3, c(4, 1, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore3 <- forecast(model3, h=(12*input_year)) 
        
        result <- as.data.frame(fore3)
      }else if(input_area == 4){ # 102초과 ~ 135이하
        model4 <- arima(tsdata4, c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore4 <- forecast(model4, h=(12*input_year)) 
        
        result <- as.data.frame(fore4)
      }else{ # js_dataSet5 : 135초과 
        model5 <- arima(tsdata5, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore5 <- forecast(model5, h=(12*input_year)) 
        
        result <- as.data.frame(fore5)
      }
    }else if(input_type == 'rent'){
      if(input_rent == 'jeonse'){
        js <- dataTable[dataTable$type == '전세']
        js_dataSet1 <- js[js$area <= 60]
        js_dataSet2 <- js[js$area > 60 & js$area<=85]
        js_dataSet3 <- js[js$area > 85 & js$area<=102]
        js_dataSet4 <- js[js$area > 102 & js$area<=135]
        js_dataSet5 <- js[js$area > 135]
        
        js_dataSet1 <- js_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet2 <- js_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet3 <- js_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet4 <- js_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet5 <- js_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        js_tsdata1 <- ts(js_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata2 <- ts(js_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata3 <- ts(js_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata4 <- ts(js_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata5 <- ts(js_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        
        if(input_area == 1){ # 60이하
          # ARIMA 분석 모형 설정
          js_model1 <- arima(js_tsdata1, c(4, 1, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          # 예측 
          js_fore1 <- forecast(js_model1, h=(12*input_year)) 
          
          # 예측값 출력
          result <- as.data.frame(js_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          js_model2 <- arima(js_tsdata2, c(1, 0, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore2 <- forecast(js_model2, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          js_model3 <- arima(js_tsdata3, c(1, 0, 1), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore3 <- forecast(js_model3, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          js_model4 <- arima(js_tsdata4, c(1, 0, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore4 <- forecast(js_model4, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore4)
        }else{ # js_dataSet5 : 135초과 
          js_model5 <- arima(js_tsdata5, c(0, 0, 1), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore5 <- forecast(js_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else if(input_rent == 'month'){
        rent <- dataTable[dataTable$type == '월세']
        rent_dataSet1 <- rent[rent$area <= 60]
        rent_dataSet2 <- rent[rent$area > 60 & rent$area<=85]
        rent_dataSet3 <- rent[rent$area > 85 & rent$area<=102]
        rent_dataSet4 <- rent[rent$area > 102 & rent$area<=135]
        rent_dataSet5 <- rent[rent$area > 135]
        
        rent_dataSet1 <- rent_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet2 <- rent_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet3 <- rent_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet4 <- rent_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet5 <- rent_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        rent_tsdata1 <- ts(rent_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata2 <- ts(rent_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata3 <- ts(rent_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata4 <- ts(rent_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata5 <- ts(rent_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        if(input_area == 1){ # 60이하
          rent_model1 <- arima(rent_tsdata1, c(0, 1, 2), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore1 <- forecast(rent_model1, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          rent_model2 <- arima(rent_tsdata2, c(3, 0, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore2 <- forecast(rent_model2, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          rent_model3 <- arima(rent_tsdata3, c(0, 0, 1), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore3 <- forecast(rent_model3, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          rent_model4 <- arima(rent_tsdata4, c(2, 0, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore4 <- forecast(rent_model4, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore4)
        }else{ # js_dataSet5 : 135초과 
          rent_model5 <- arima(rent_tsdata5, c(3, 0, 0), 
                               seasonal = list(order = c(1, 1, 0), period = 12))
          
          rent_fore5 <- forecast(rent_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else{
        print('APT add1 rent error')
      }
    }
  }else if(input_address == 'add2'){ # 강북_동작_용산_영등포_금천
    data <- read.csv('C:/NCS/Rwork/FinalProjectData/data2_multiplexHouse.csv')
    data_table <- as.data.table(data) 
    dataTable <- data_table[, list(type, area, price),  by=c('year','month')]
    
    if(input_type == 'sale' & input_rent == 0){
      mm <- dataTable[dataTable$type == '매매']
      dataSet1 <- mm[mm$area <= 60]
      dataSet2 <- mm[mm$area > 60 & mm$area<=85]
      dataSet3 <- mm[mm$area > 85 & mm$area<=102]
      dataSet4 <- mm[mm$area > 102 & mm$area<=135]
      dataSet5 <- mm[mm$area > 135]
      
      dataSet1 <- dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet2 <- dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet3 <- dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet4 <- dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet5 <- dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
      
      tsdata1 <- ts(dataSet1$priceMean, start=c(2006, 1), frequency=12)
      tsdata2 <- ts(dataSet2$priceMean, start=c(2006, 1), frequency=12)
      tsdata3 <- ts(dataSet3$priceMean, start=c(2006, 1), frequency=12)
      tsdata4 <- ts(dataSet4$priceMean, start=c(2006, 1), frequency=12)
      tsdata5 <- ts(dataSet5$priceMean, start=c(2006, 1), frequency=12)
      
      if(input_area == 1){ # 60이하
        model1 <- arima(tsdata1, c(1, 1, 1), 
                        seasonal = list(order = c(0, 0, 1), period = 12))
        
        fore1 <- forecast(model1, h=(12*input_year)) 
        
        result <- as.data.frame(fore1)
      }else if(input_area == 2){ # 60초과 ~ 85이하
        model2 <- arima(tsdata2, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore2 <- forecast(model2, h=(12*input_year)) 
        
        result <- as.data.frame(fore2)
      }else if(input_area == 3){ # 85초과 ~ 102이하
        model3 <- arima(tsdata3, c(0, 1, 1))
        
        fore3 <- forecast(model3, h=(12*input_year)) 
        
        result <- as.data.frame(fore3)
      }else if(input_area == 4){ # 102초과 ~ 135이하
        model4 <- arima(tsdata4, c(0, 1, 1), 
                        seasonal = list(order = c(0, 0, 1), period = 12))
        
        fore4 <- forecast(model4, h=(12*input_year)) 
        
        result <- as.data.frame(fore4)
      }else{ # js_dataSet5 : 135초과 
        model5 <- arima(tsdata5, c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore5 <- forecast(model5, h=(12*input_year)) 
        
        result <- as.data.frame(fore5)
      }
    }else if(input_type == 'rent'){
      if(input_rent == 'jeonse'){
        js <- dataTable[dataTable$type == '전세']
        js_dataSet1 <- js[js$area <= 60]
        js_dataSet2 <- js[js$area > 60 & js$area<=85]
        js_dataSet3 <- js[js$area > 85 & js$area<=102]
        js_dataSet4 <- js[js$area > 102 & js$area<=135]
        js_dataSet5 <- js[js$area > 135]
        
        js_dataSet1 <- js_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet2 <- js_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet3 <- js_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet4 <- js_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet5 <- js_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        js_tsdata1 <- ts(js_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata2 <- ts(js_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata3 <- ts(js_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata4 <- ts(js_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata5 <- ts(js_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        
        if(input_area == 1){ # 60이하
          # ARIMA 분석 모형 설정
          js_model1 <- arima(js_tsdata1, c(2, 1, 0), 
                             seasonal = list(order = c(1, 1, 1), period = 12))
          
          # 예측 
          js_fore1 <- forecast(js_model1, h=(12*input_year)) 
          
          # 예측값 출력
          result <- as.data.frame(js_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          js_model2 <- arima(js_tsdata2, c(0, 1, 1), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore2 <- forecast(js_model2, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          js_model3 <- arima(js_tsdata3, c(4, 1, 2), 
                             seasonal = list(order = c(1, 0, 0), period = 12))
          
          js_fore3 <- forecast(js_model3, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          js_model4 <- arima(js_tsdata4, c(2, 0, 0), 
                             seasonal = list(order = c(1, 1, 0), period = 12))
          
          js_fore4 <- forecast(js_model4, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore4)
        }else{ # js_dataSet5 : 135초과 
          js_model5 <- arima(js_tsdata5, c(3, 0, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore5 <- forecast(js_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else if(input_rent == 'month'){
        rent <- dataTable[dataTable$type == '월세']
        rent_dataSet1 <- rent[rent$area <= 60]
        rent_dataSet2 <- rent[rent$area > 60 & rent$area<=85]
        rent_dataSet3 <- rent[rent$area > 85 & rent$area<=102]
        rent_dataSet4 <- rent[rent$area > 102 & rent$area<=135]
        rent_dataSet5 <- rent[rent$area > 135]
        
        rent_dataSet1 <- rent_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet2 <- rent_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet3 <- rent_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet4 <- rent_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet5 <- rent_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        rent_tsdata1 <- ts(rent_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata2 <- ts(rent_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata3 <- ts(rent_dataSet3$priceMean, start=c(2011, 2), frequency=12)
        rent_tsdata4 <- ts(rent_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata5 <- ts(rent_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        if(input_area == 1){ # 60이하
          rent_model1 <- arima(rent_tsdata1, c(1, 0, 0), 
                               seasonal = list(order = c(1, 1, 0), period = 12))
          
          rent_fore1 <- forecast(rent_model1, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          rent_model2 <- arima(rent_tsdata2, c(2, 0, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore2 <- forecast(rent_model2, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          rent_model3 <- arima(rent_tsdata3, c(0, 1, 1), 
                               seasonal = list(order = c(1, 1, 0), period = 12))
          
          rent_fore3 <- forecast(rent_model3, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          rent_model4 <- arima(rent_tsdata4, c(1, 0, 1), 
                               seasonal = list(order = c(1, 1, 0), period = 12))
          
          rent_fore4 <- forecast(rent_model4, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore4)
        }else{ # js_dataSet5 : 135초과 
          rent_model5 <- arima(rent_tsdata5, c(0, 0, 0))
          
          rent_fore5 <- forecast(rent_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else{
        print('APT add2 rent error')
      }
    }
  }else if(input_address == 'add3'){ # 구로_은평_노원_송파_종로
    data <- read.csv('C:/NCS/Rwork/FinalProjectData/data3_multiplexHouse.csv')
    data_table <- as.data.table(data) 
    dataTable <- data_table[, list(type, area, price),  by=c('year','month')]
    
    if(input_type == 'sale' & input_rent == 0){
      mm <- dataTable[dataTable$type == '매매']
      dataSet1 <- mm[mm$area <= 60]
      dataSet2 <- mm[mm$area > 60 & mm$area<=85]
      dataSet3 <- mm[mm$area > 85 & mm$area<=102]
      dataSet4 <- mm[mm$area > 102 & mm$area<=135]
      dataSet5 <- mm[mm$area > 135]
      
      dataSet1 <- dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet2 <- dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet3 <- dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet4 <- dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet5 <- dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
      
      tsdata1 <- ts(dataSet1$priceMean, start=c(2006, 1), frequency=12)
      tsdata2 <- ts(dataSet2$priceMean, start=c(2006, 1), frequency=12)
      tsdata3 <- ts(dataSet3$priceMean, start=c(2006, 1), frequency=12)
      tsdata4 <- ts(dataSet4$priceMean, start=c(2006, 1), frequency=12)
      tsdata5 <- ts(dataSet5$priceMean, start=c(2006, 1), frequency=12)
      
      if(input_area == 1){ # 60이하
        model1 <- arima(tsdata1, c(0, 1, 0), 
                        seasonal = list(order = c(2, 0, 0), period = 12))
        
        fore1 <- forecast(model1, h=(12*input_year)) 
        
        result <- as.data.frame(fore1)
      }else if(input_area == 2){ # 60초과 ~ 85이하
        model2 <- arima(tsdata2, c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore2 <- forecast(model2, h=(12*input_year)) 
        
        result <- as.data.frame(fore2)
      }else if(input_area == 3){ # 85초과 ~ 102이하
        model3 <- arima(tsdata3,  c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore3 <- forecast(model3, h=(12*input_year)) 
        
        result <- as.data.frame(fore3)
      }else if(input_area == 4){ # 102초과 ~ 135이하
        model4 <- arima(tsdata4,  c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore4 <- forecast(model4, h=(12*input_year)) 
        
        result <- as.data.frame(fore4)
      }else{ # js_dataSet5 : 135초과 
        model5 <- arima(tsdata5, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore5 <- forecast(model5, h=(12*input_year)) 
        
        result <- as.data.frame(fore5)
      }
    }else if(input_type == 'rent'){
      if(input_rent == 'jeonse'){
        js <- dataTable[dataTable$type == '전세']
        js_dataSet1 <- js[js$area <= 60]
        js_dataSet2 <- js[js$area > 60 & js$area<=85]
        js_dataSet3 <- js[js$area > 85 & js$area<=102]
        js_dataSet4 <- js[js$area > 102 & js$area<=135]
        js_dataSet5 <- js[js$area > 135]
        
        js_dataSet1 <- js_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet2 <- js_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet3 <- js_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet4 <- js_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet5 <- js_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        js_tsdata1 <- ts(js_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata2 <- ts(js_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata3 <- ts(js_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata4 <- ts(js_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata5 <- ts(js_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        
        if(input_area == 1){ # 60이하
          # ARIMA 분석 모형 설정
          js_model1 <- arima(js_tsdata1, c(2, 1, 1), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          # 예측 
          js_fore1 <- forecast(js_model1, h=(12*input_year)) 
          
          # 예측값 출력
          result <- as.data.frame(js_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          js_model2 <- arima(js_tsdata2, c(0, 1, 1), 
                             seasonal = list(order = c(0, 1, 1), period = 12))
          
          js_fore2 <- forecast(js_model2, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          js_model3 <- arima(js_tsdata3, c(2, 0, 0),
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore3 <- forecast(js_model3, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          js_model4 <- arima(js_tsdata4, c(1, 0, 0), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore4 <- forecast(js_model4, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore4)
        }else{ # js_dataSet5 : 135초과 
          js_model5 <- arima(js_tsdata5, c(0, 1, 1), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore5 <- forecast(js_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else if(input_rent == 'month'){
        rent <- dataTable[dataTable$type == '월세']
        rent_dataSet1 <- rent[rent$area <= 60]
        rent_dataSet2 <- rent[rent$area > 60 & rent$area<=85]
        rent_dataSet3 <- rent[rent$area > 85 & rent$area<=102]
        rent_dataSet4 <- rent[rent$area > 102 & rent$area<=135]
        rent_dataSet5 <- rent[rent$area > 135]
        
        rent_dataSet1 <- rent_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet2 <- rent_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet3 <- rent_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet4 <- rent_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet5 <- rent_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        rent_tsdata1 <- ts(rent_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata2 <- ts(rent_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata3 <- ts(rent_dataSet3$priceMean, start=c(2011, 2), frequency=12)
        rent_tsdata4 <- ts(rent_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata5 <- ts(rent_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        if(input_area == 1){ # 60이하
          rent_model1 <- arima(rent_tsdata1, c(2, 0, 1), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore1 <- forecast(rent_model1, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          rent_model2 <- arima(rent_tsdata2, c(2, 0, 1), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore2 <- forecast(rent_model2, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          rent_model3 <- arima(rent_tsdata3, c(3, 0, 1), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore3 <- forecast(rent_model3, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          rent_model4 <- arima(rent_tsdata4, c(4, 0, 1), 
                               seasonal = list(order = c(1, 1, 0), period = 12))
          
          rent_fore4 <- forecast(rent_model4, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore4)
        }else{ # js_dataSet5 : 135초과 
          rent_model5 <- arima(rent_tsdata5, c(0, 0, 0), 
                               seasonal = list(order = c(1, 0, 0), period = 12))
          
          rent_fore5 <- forecast(rent_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else{
        print('APT add3 rent error')
      }
    }
  }else if(input_address == 'add4'){ # 성동_서대문_광진_관악_서초
    data <- read.csv('C:/NCS/Rwork/FinalProjectData/data4_multiplexHouse.csv')
    data_table <- as.data.table(data) 
    dataTable <- data_table[, list(type, area, price),  by=c('year','month')]
    
    if(input_type == 'sale' & input_rent == 0){
      mm <- dataTable[dataTable$type == '매매']
      dataSet1 <- mm[mm$area <= 60]
      dataSet2 <- mm[mm$area > 60 & mm$area<=85]
      dataSet3 <- mm[mm$area > 85 & mm$area<=102]
      dataSet4 <- mm[mm$area > 102 & mm$area<=135]
      dataSet5 <- mm[mm$area > 135]
      
      dataSet1 <- dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet2 <- dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet3 <- dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet4 <- dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet5 <- dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
      
      tsdata1 <- ts(dataSet1$priceMean, start=c(2006, 1), frequency=12)
      tsdata2 <- ts(dataSet2$priceMean, start=c(2006, 1), frequency=12)
      tsdata3 <- ts(dataSet3$priceMean, start=c(2006, 1), frequency=12)
      tsdata4 <- ts(dataSet4$priceMean, start=c(2006, 1), frequency=12)
      tsdata5 <- ts(dataSet5$priceMean, start=c(2006, 1), frequency=12)
      
      if(input_area == 1){ # 60이하
        model1 <- arima(tsdata1, c(1, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore1 <- forecast(model1, h=(12*input_year)) 
        
        result <- as.data.frame(fore1)
      }else if(input_area == 2){ # 60초과 ~ 85이하
        model2 <- arima(tsdata2, c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore2 <- forecast(model2, h=(12*input_year)) 
        
        result <- as.data.frame(fore2)
      }else if(input_area == 3){ # 85초과 ~ 102이하
        model3 <- arima(tsdata3, c(0, 1, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore3 <- forecast(model3, h=(12*input_year)) 
        
        result <- as.data.frame(fore3)
      }else if(input_area == 4){ # 102초과 ~ 135이하
        model4 <- arima(tsdata4, c(1, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore4 <- forecast(model4, h=(12*input_year)) 
        
        result <- as.data.frame(fore4)
      }else{ # js_dataSet5 : 135초과 
        model5 <- arima(tsdata5, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore5 <- forecast(model5, h=(12*input_year)) 
        
        result <- as.data.frame(fore5)
      }
    }else if(input_type == 'rent'){
      if(input_rent == 'jeonse'){
        js <- dataTable[dataTable$type == '전세']
        js_dataSet1 <- js[js$area <= 60]
        js_dataSet2 <- js[js$area > 60 & js$area<=85]
        js_dataSet3 <- js[js$area > 85 & js$area<=102]
        js_dataSet4 <- js[js$area > 102 & js$area<=135]
        js_dataSet5 <- js[js$area > 135]
        
        js_dataSet1 <- js_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet2 <- js_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet3 <- js_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet4 <- js_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet5 <- js_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        js_tsdata1 <- ts(js_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata2 <- ts(js_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata3 <- ts(js_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata4 <- ts(js_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata5 <- ts(js_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        
        if(input_area == 1){ # 60이하
          # ARIMA 분석 모형 설정
          js_model1 <- arima(js_tsdata1, c(0, 1, 1), 
                             seasonal = list(order = c(0, 0, 1), period = 12))
          
          # 예측 
          js_fore1 <- forecast(js_model1, h=(12*input_year)) 
          
          # 예측값 출력
          result <- as.data.frame(js_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          js_model2 <- arima(js_tsdata2, c(1, 0, 1), 
                             seasonal = list(order = c(1, 1, 1), period = 12))
          
          js_fore2 <- forecast(js_model2, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          js_model3 <- arima(js_tsdata3, c(2, 0, 0),                
                             seasonal = list(order = c(1, 1, 0), period = 12))
          
          js_fore3 <- forecast(js_model3, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          js_model4 <- arima(js_tsdata4, c(0, 0, 1), 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore4 <- forecast(js_model4, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore4)
        }else{ # js_dataSet5 : 135초과 
          js_model5 <- arima(js_tsdata5, c(0, 1, 2))
          
          js_fore5 <- forecast(js_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else if(input_rent == 'month'){
        rent <- dataTable[dataTable$type == '월세']
        rent_dataSet1 <- rent[rent$area <= 60]
        rent_dataSet2 <- rent[rent$area > 60 & rent$area<=85]
        rent_dataSet3 <- rent[rent$area > 85 & rent$area<=102]
        rent_dataSet4 <- rent[rent$area > 102 & rent$area<=135]
        rent_dataSet5 <- rent[rent$area > 135]
        
        rent_dataSet1 <- rent_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet2 <- rent_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet3 <- rent_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet4 <- rent_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet5 <- rent_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        rent_tsdata1 <- ts(rent_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata2 <- ts(rent_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata3 <- ts(rent_dataSet3$priceMean, start=c(2011, 2), frequency=12)
        rent_tsdata4 <- ts(rent_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata5 <- ts(rent_dataSet5$priceMean, start=c(2011, 1), frequency=12)
        if(input_area == 1){ # 60이하
          rent_model1 <- arima(rent_tsdata1, c(2, 0, 0), 
                               seasonal = list(order = c(1, 1, 0), period = 12))
          
          rent_fore1 <- forecast(rent_model1, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          rent_model2 <- arima(rent_tsdata2, c(1, 0, 0), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore2 <- forecast(rent_model2, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          rent_model3 <- arima(rent_tsdata3, c(2, 0, 1), 
                               seasonal = list(order = c(0, 1, 1), period = 12))
          
          rent_fore3 <- forecast(rent_model3, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          rent_model4 <- arima(rent_tsdata4, c(1, 0, 0), 
                               seasonal = list(order = c(1, 1, 1), period = 12))
          
          rent_fore4 <- forecast(rent_model4, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore4)
        }else{ # js_dataSet5 : 135초과 
          rent_model5 <- arima(rent_tsdata5, c(3, 1, 1))
          
          rent_fore5 <- forecast(rent_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else{
        print('APT add4 rent error')
      }
    }
  }else if(input_address == 'add5'){ # 성북_중랑_동대문_도봉_중구
    data <- read.csv('C:/NCS/Rwork/FinalProjectData/data5_multiplexHouse.csv')
    data_table <- as.data.table(data) 
    dataTable <- data_table[, list(type, area, price),  by=c('year','month')]
    
    if(input_type == 'sale' & input_rent == 0){
      mm <- dataTable[dataTable$type == '매매']
      dataSet1 <- mm[mm$area <= 60]
      dataSet2 <- mm[mm$area > 60 & mm$area<=85]
      dataSet3 <- mm[mm$area > 85 & mm$area<=102]
      dataSet4 <- mm[mm$area > 102 & mm$area<=135]
      dataSet5 <- mm[mm$area > 135]
      
      dataSet1 <- dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet2 <- dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet3 <- dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet4 <- dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
      dataSet5 <- dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
      
      tsdata1 <- ts(dataSet1$priceMean, start=c(2006, 1), frequency=12)
      tsdata2 <- ts(dataSet2$priceMean, start=c(2006, 1), frequency=12)
      tsdata3 <- ts(dataSet3$priceMean, start=c(2006, 1), frequency=12)
      tsdata4 <- ts(dataSet4$priceMean, start=c(2006, 1), frequency=12)
      tsdata5 <- ts(dataSet5$priceMean, start=c(2006, 1), frequency=12)
      
      if(input_area == 1){ # 60이하
        model1 <- arima(tsdata1, c(4, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore1 <- forecast(model1, h=(12*input_year)) 
        
        result <- as.data.frame(fore1)
      }else if(input_area == 2){ # 60초과 ~ 85이하
        model2 <- arima(tsdata2, c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore2 <- forecast(model2, h=(12*input_year)) 
        
        result <- as.data.frame(fore2)
      }else if(input_area == 3){ # 85초과 ~ 102이하
        model3 <- arima(tsdata3, c(0, 1, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore3 <- forecast(model3, h=(12*input_year)) 
        
        result <- as.data.frame(fore3)
      }else if(input_area == 4){ # 102초과 ~ 135이하
        model4 <- arima(tsdata4, c(5, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore4 <- forecast(model4, h=(12*input_year)) 
        
        result <- as.data.frame(fore4)
      }else{ # js_dataSet5 : 135초과 
        model5 <- arima(tsdata5, c(3, 0, 0), 
                        seasonal = list(order = c(2, 1, 0), period = 12))
        
        fore5 <- forecast(model5, h=(12*input_year)) 
        
        result <- as.data.frame(fore5)
      }
    }else if(input_type == 'rent'){
      if(input_rent == 'jeonse'){
        js <- dataTable[dataTable$type == '전세']
        js_dataSet1 <- js[js$area <= 60]
        js_dataSet2 <- js[js$area > 60 & js$area<=85]
        js_dataSet3 <- js[js$area > 85 & js$area<=102]
        js_dataSet4 <- js[js$area > 102 & js$area<=135]
        js_dataSet5 <- js[js$area > 135]
        
        js_dataSet1 <- js_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet2 <- js_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet3 <- js_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet4 <- js_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        js_dataSet5 <- js_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        js_tsdata1 <- ts(js_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata2 <- ts(js_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata3 <- ts(js_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata4 <- ts(js_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        js_tsdata5 <- ts(js_dataSet5$priceMean, start=c(2011, 2), frequency=12)
        
        if(input_area == 1){ # 60이하
          # ARIMA 분석 모형 설정
          js_model1 <- arima(js_tsdata1, c(0, 1, 1), 
                             seasonal = list(order = c(0, 0, 1), period = 12))
          
          # 예측 
          js_fore1 <- forecast(js_model1, h=(12*input_year)) 
          
          # 예측값 출력
          result <- as.data.frame(js_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          js_model2 <- arima(js_tsdata2, c(0, 1, 1))
          
          js_fore2 <- forecast(js_model2, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          js_model3 <- arima(js_tsdata3, c(0, 0, 1),                  , 
                             seasonal = list(order = c(2, 1, 0), period = 12))
          
          js_fore3 <- forecast(js_model3, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          js_model4 <- arima(js_tsdata4, c(3, 0, 1), 
                             seasonal = list(order = c(1, 0, 0), period = 12))
          
          js_fore4 <- forecast(js_model4, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore4)
        }else{ # js_dataSet5 : 135초과 
          js_model5 <- arima(js_tsdata5, c(0, 0, 0), 
                             seasonal = list(order = c(0, 0, 1), period = 12))
          
          js_fore5 <- forecast(js_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else if(input_rent == 'month'){
        rent <- dataTable[dataTable$type == '월세']
        rent_dataSet1 <- rent[rent$area <= 60]
        rent_dataSet2 <- rent[rent$area > 60 & rent$area<=85]
        rent_dataSet3 <- rent[rent$area > 85 & rent$area<=102]
        rent_dataSet4 <- rent[rent$area > 102 & rent$area<=135]
        rent_dataSet5 <- rent[rent$area > 135]
        
        rent_dataSet1 <- rent_dataSet1[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet2 <- rent_dataSet2[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet3 <- rent_dataSet3[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet4 <- rent_dataSet4[, list(priceMean=mean(price)), by=c('year','month')]
        rent_dataSet5 <- rent_dataSet5[, list(priceMean=mean(price)), by=c('year','month')]
        
        rent_tsdata1 <- ts(rent_dataSet1$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata2 <- ts(rent_dataSet2$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata3 <- ts(rent_dataSet3$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata4 <- ts(rent_dataSet4$priceMean, start=c(2011, 1), frequency=12)
        rent_tsdata5 <- ts(rent_dataSet5$priceMean, start=c(2011, 2), frequency=12)
        if(input_area == 1){ # 60이하
          rent_model1 <- arima(rent_tsdata1, c(3, 0, 1), 
                               seasonal = list(order = c(2, 1, 0), period = 12))
          
          rent_fore1 <- forecast(rent_model1, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore1)
        }else if(input_area == 2){ # 60초과 ~ 85이하
          rent_model2 <- arima(rent_tsdata2, c(0, 1, 1))
          
          rent_fore2 <- forecast(rent_model2, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore2)
        }else if(input_area == 3){ # 85초과 ~ 102이하
          rent_model3 <- arima(rent_tsdata3, c(0, 0, 0))
          
          rent_fore3 <- forecast(rent_model3, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore3)
        }else if(input_area == 4){ # 102초과 ~ 135이하
          rent_model4 <- arima(rent_tsdata4, c(3, 0, 0), 
                               seasonal = list(order = c(1, 1, 0), period = 12))
          
          rent_fore4 <- forecast(rent_model4, h=(12*input_year)) 
          
          result <- as.data.frame(rent_fore4)
        }else{ # js_dataSet5 : 135초과 
          rent_model5 <- arima(rent_tsdata5, c(0, 0, 0))
          
          rent_fore5 <- forecast(rent_model5, h=(12*input_year)) 
          
          result <- as.data.frame(js_fore5)
        }
      }else{
        print('APT add5 rent error')
      }
    }
  }
  
  #########################################################################################
}else{
  print('input_stype error')
}


result$`Point Forecast`[12*input_year]
result$`Lo 80`[12*input_year]
result$`Hi 80`[12*input_year]
result$`Lo 95`[12*input_year]
result$`Hi 95`[12*input_year]
