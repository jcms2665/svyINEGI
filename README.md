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

Supongase que se está trabajando con la base _sociodemográfico del segundo trimestre de 2015_ (SDEMT215) y se queire obtener las precisiones estadísticas de la variable _posición en la ocupación_ (POS_OCU). Entonces, basta con ejecutar la variable de la siguiente manera:

    ```
              svyINEGI.ENOE("POS_OCU",SDEMT215)
    ```

El resultado es el siguiente:



