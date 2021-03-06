#' @title Precisiones estadísticas, ENOE
#' @name svyINEGI.ENOE
#' @description Pruebas de significancia estadística de los indicadores de la Encuesta Nacional de Ocupación y Empleo (ENOE)
#' @param u Nombre de la variable. 
#' @param data Base de datos.
#' @return Matriz de resultados.
#' @author Julio C. 
#' @note Cualquier sugerencia es bienvenida
#' @details Para cada categoria, la funcion genera: la estimacion del indicador (Estim); error estandar (ErrStd); coeficiente de variación (CV); limite inferior (LInf(90%));limite superior (LSup(90%)); evaluacion significancia (Signif?)
#' @export
#' 

svyINEGI.ENOE<-
  function(u, data = parent.frame()){

    if(!any(names(data) == u[1]))
    stop("[!] La variable ",u," no está en la base")
  
  if(!is.numeric(data[,u]))
    stop("[!] La variable ",u," debe ser numérica")
  
  data$UNO<-1
  options(survey.lonely.psu="adjust")
  mydesign <- svydesign(id = ~UPM,data = data,weight = ~FAC,strata = ~EST_D,nest=TRUE)
  sy1<-round(svyby(~UNO,~data[,u], mydesign, svytotal), digits = 0)
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
#' 

