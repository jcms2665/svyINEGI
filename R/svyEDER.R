#' @title Precisiones estadisticas EDER.
#' @name errEDER
#' @param u Nombre de la variable. 
#' @param data Base de datos.
#' @return Matriz de resultados.
#' @export

errEDER<-
  function(u, data = parent.frame()){
    mer<-merge(CAR_EST,data[,c("FOLIO",u)],by=c("FOLIO"),all.x=TRUE)    
    mer$UNO<-1
    options(survey.lonely.psu="adjust")
    mydesign <- svydesign(id = ~UPM,data = mer,weight = ~FAC,strata = ~EST_DIS,nest=TRUE)
    sy1<-round(svyby(~UNO,~mer[,u], mydesign, svytotal), digits = 0)
    #se1<-round(data.frame(SE(sy1)), digits = 0)
    cv1<-round(data.frame(cv(sy1)*100), digits = 3)
    #cf1<-round(data.frame(coef(sy1)), digits = 0)
    li1<-round(data.frame(confint(sy1, level = 0.90)), digits = 0)
    
    cc <- matrix(NA,nrow=nrow(sy1),ncol=1)
    for(j in 1:nrow(sy1)){
      if(cv1[j,1]<15){cc[j,1]<-"Y"}else{cc[j,1]<-"N"}
    }
    r<-data.frame(sy1,cv1,li1,cc)
    names(r) <- c("Categ","Estim","ErrStd","CV","LInf(90%)","LSup(90%)","Signif?")
    return(r)
    
  }


