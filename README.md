# Trabajo de Fin de Grado Superior en Administración de Sistemas: Uso de Terraform y Google Kubernetes Engine


![Imagen Docker y Terraform](./images/1.png)

- [Introducción](#introducción)
- [Metodología](#metodología)
- [Implementación](#implementación)
- [Resultados](#resultados)
- [Conclusión](#conclusión)
- [Referencias](#referencias)

## Introducción

En la actual era de la digitalización, la administración eficiente de sistemas y recursos informáticos es de suma importancia. Las empresas de todo el mundo dependen cada vez más de infraestructuras sólidas y seguras para sus operaciones diarias, y la demanda de soluciones eficientes y escalables sigue creciendo. Para abordar este reto, este proyecto de Trabajo de Fin de Grado Superior en Administración de Sistemas se enfoca en la investigación y aplicación de Terraform y Google Kubernetes Engine (GKE), dos herramientas prominentes en el ámbito de la administración de sistemas.

Terraform es una herramienta de infraestructura como código (IaC) que permite a los usuarios definir y proporcionar centros de datos utilizando una sintaxis de alto nivel, lo que simplifica la gestión y orquestación de recursos de infraestructura. GKE, por otro lado, es un servicio de administración de Kubernetes que simplifica la implementación, administración y escalado de aplicaciones contenerizadas.

La meta de este proyecto es demostrar el uso de estas herramientas para implementar una infraestructura en la nube que hospeda un servidor de WordPress y una base de datos de MariaDB, ambas desplegadas en un cluster de GKE. A través de este proceso, se exploran las capacidades de estas tecnologías para automatizar y simplificar la administración de sistemas.

Además, para facilitar el acceso a los Pods de Kubernetes y proporcionar una interfaz amigable para el usuario, se implementa un balanceador de carga. Esto permite visualizar el sitio web de WordPress y experimentar el resultado final de la infraestructura creada.

![Imagen Introducción](/images/2.png)
## Metodología

El proyecto se desarrolló utilizando un enfoque sistemático y paso a paso para asegurar un despliegue exitoso y eficiente de la infraestructura.

1. **Planificación e investigación:** El primer paso fue comprender a fondo el funcionamiento de las herramientas a utilizar: Terraform y Google Kubernetes Engine (GKE). Se estudiaron sus documentaciones, se exploraron tutoriales y se investigaron mejores prácticas para su implementación. 

2. **Diseño de la infraestructura:** A continuación, se diseñó la infraestructura de red, teniendo en cuenta los requisitos de las aplicaciones a desplegar (servidor WordPress y base de datos MariaDB). Este diseño incluyó la planificación de la red y las subredes, así como la configuración del cluster de GKE.

3. **Codificación con Terraform:** Con el diseño de la infraestructura listo, se procedió a codificar esta configuración en Terraform. Se crearon varios archivos .tf para cada componente de la infraestructura, cada uno responsabilidad de una parte específica de la creación de la red, la subred o el cluster.

4. **Implementación de las aplicaciones en GKE:** Una vez que la infraestructura de red estaba lista, se utilizaron archivos manifest .yaml para desplegar el servidor WordPress y la base de datos MariaDB en el cluster de GKE. Estos archivos definen el estado deseado de los recursos de Kubernetes, lo que permite un despliegue consistente y reproducible de las aplicaciones.

5. **Creación del balanceador de carga:** Con las aplicaciones funcionando correctamente en el cluster, se creó un balanceador de carga para gestionar el tráfico hacia los Pods de Kubernetes y proporcionar un acceso fácil al sitio web de WordPress.

6. **Pruebas y validación:** Por último, se realizaron pruebas exhaustivas para validar el funcionamiento correcto de todo el sistema. Esto incluyó pruebas de conectividad, pruebas de rendimiento, y pruebas de escalabilidad.

A través de este proceso metodológico, se pudo implementar una infraestructura de red robusta y eficiente que cumple con los objetivos del proyecto.

![Imagen Metodología]((/images/3.png)

## Implementación

### Terraform

La implementación comienza con la creación de la infraestructura necesaria utilizando Terraform. Los archivos de Terraform que definen la red virtual y la subred se pueden encontrar en el repositorio:

- [Archivo de la Red](/modules/vpc/main.tf)
- [Archivo del cluster](/modules/gke/main.tf)
- [Archivos despligue pods](/modules/manifest/)

![Imagen Metodología]((/images/4.png)

Para ejecutar terraform con la cuenta de servicio:

docker run -it --rm -w /app -v $(pwd):/app --env-file=.env --entrypoint sh hashicorp/terraform:1.3.0
