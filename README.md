# Estimación de la varianza en encuestas complejas / Variance estimation in complex samples
=================



## Español


El objetivo de este paquete es cálcular la _varianza_, _coeficiente de variación_ e _intervalos de confianza_ de estimaciones hechas con muestras complejas para determinar su nivel de confiabilidad.  Si bien el paquete puede ser usado con cualquier muestra compleja, el paquete esta diseñado para facilitar el manejo de la Encuesta Nacional de Ocupación y Empleo  (ENOE) y la Encuesta Encuesta Demográfica Retrospectiva (EDER) 2011.

**Nota:** En el caso de la EDER, las bases de datos que están disponibles en internet no cuentan con el _estrato de diseño_, este campo se solictió al _INEGI_ vía _atención de usuarios_.





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

**Nota**: Los usuarios de Windows necesitan instalar [Rtools](https://cran.r-project.org/bin/windows/Rtools/) para poder instalar  paquetes de Github.





#### Ejemplo

Supongase que se está trabajando con la base sociodemográfico del segundo trimestre de 2015 (SDEMT215) y se requeire las precisiones estadísticas de la variable posición en la ocupación (POS_OCU). Una vez instalado el paquete, basta con ejecutar el siguiente comando:


```
              svyINEGI.ENOE("POS_OCU",SDEMT215)
```


**Nota:** El nombre de la variable debe estar entre comillas


El resultado es el siguiente:



![alt tag](https://cloud.githubusercontent.com/assets/13545121/14332444/3e3199ae-fc0f-11e5-95fe-64627ccd699a.jpg)



