#' @title Precisiones estadisticas.
#' @name svyINEGI.ENOE
#' @param u Nombre de la variable. 
#' @param data Base de datos.
#' @return Matriz de resultados.
#' @examples
#' \dontrun{
#' library(LifeTable)
#' data(SDEMT115)
#' svyINEGI.ENOE("CLASE2",SDEMT115)
#' }
#' @export
#' 

svyINEGI.ENOE<-
  function(u, data = parent.frame()){
    library(survey)
    if(!any(names(data) == u[1]))
    stop("[!] La variable no está en la base")
  
  if(!is.numeric(data[,u]))
    stop("[!] La variable debe ser numérica")
  
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
  names(r) <- c("Categ","Estimacion","ErrStd","CV","LInf(90%)","LSup(90%)","¿Signif?")
  return(r)
  }
#' 
NULL

#' @name SDEMT115
#' 
#' @title Cuestionario Sociodemografico 1-15, INEGI.
#' 
#' @description Ejemplo de una base de datos del INEGI.
#' 
#' @details Algunas variables son numericas y otras cadena.
#' 
#' @source Cuestionario sociodemografico ENOE. \url{http://www3.inegi.org.mx/sistemas/microdatos/encuestas.aspx?c=34523&s=est}.
#' 
#' @references  FD ENOE \url{http://www.inegi.org.mx/est/contenidos/proyectos/encuestas/hogares/regulares/enoe/doc/con_basedatos_proy2010.pdf}. 
#' 
#' @docType data
#' 
NULL
