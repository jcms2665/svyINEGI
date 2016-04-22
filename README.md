# Estimación de la varianza en encuestas complejas / Variance estimation in complex samples
=================



## Objetvivo


El objetivo de este paquete es cálcular la _varianza_, _coeficiente de variación_ e _intervalos de confianza_ de estimaciones hechas con muestras complejas para determinar su nivel de confiabilidad.  Si bien el paquete puede ser usado con cualquier muestra compleja, el paquete esta diseñado para facilitar el manejo de la **Encuesta Nacional de Ocupación y Empleo**  (ENOE) y la **Encuesta Demográfica Retrospectiva (EDER) 2011**.

**Nota:** En el caso de la **EDER**, las bases de datos que están en el sitio de internet no cuentan con el campo _estrato de diseño_, sin embargo, éste se solicitó al INEGI vía _atención de usuarios_ para poder generar las precisiones estadísticas de las estimaciones. En la carperta [Base](https://github.com/jcms2665/svyINEGI/tree/master/Base) se encuentra la base de datos de la Encuesta Demográfica Retrospectiva (EDER) 2011 con el campo "_est_dis_" que corresponde al estrato diseño.

 





#### Instalación

Para poder ejecutar este programa se requiere seguir los siguientes pasos:

+ Paso 1. Instalar la versión más reciente del paquete _devtools_

    ```
              install.packages("devtools")
    ```

+ Paso 2. Cargar el paquete _devtools_

    ```
              library(devtools)
    ```

+ Paso 3. Instalar el paquete **joinENOE**

    ```
              install_github("jcms2665/svyINEGI")
    ```

**Nota 1**: Los usuarios de Windows necesitan instalar [Rtools](https://cran.r-project.org/bin/windows/Rtools/) para poder instalar  paquetes de Github.

**Nota 2**: Las variables deben ser numéricas




#### Ejemplo

Supongase que se está trabajando con la base sociodemográfico del segundo trimestre de 2015 (SDEMT215) y se requeire las precisiones estadísticas de la variable posición en la ocupación (POS_OCU). Una vez instalado el paquete, basta con ejecutar el siguiente comando:


```
              svyINEGI.ENOE("POS_OCU",SDEMT215)
```



**Nota 3:** El nombre de la variable debe estar entre comillas


**Nota 4:** Para el caso de la **EDER** es el mismo procedimiento



El resultado es el siguiente:



![alt tag](https://cloud.githubusercontent.com/assets/13545121/14332444/3e3199ae-fc0f-11e5-95fe-64627ccd699a.jpg)



