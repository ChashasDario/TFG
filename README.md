Para ejecutar terraform con la cuenta de servicio:

docker run -it --rm -w /app -v $(pwd):/app --env-file=.env --entrypoint sh hashicorp/terraform:1.3.0

# Trabajo de Fin de Grado Superior en Administración de Sistemas: Uso de Terraform y Google Kubernetes Engine

## Índice

- [Introducción](#introducción)
- [Metodología](#metodología)
- [Implementación](#implementación)
- [Resultados](#resultados)
- [Conclusión](#conclusión)
- [Referencias](#referencias)

## Introducción

Este proyecto consiste en la implementación de una infraestructura usando la herramienta Terraform, la cual permite la creación de redes y subredes, y la implementación de un cluster de Google Kubernetes Engine (GKE) para alojar un servidor WordPress y una base de datos MariaDB. Además, se implementa un balanceador de carga para facilitar el acceso a los Pods y permitir la visualización de la web de WordPress.

## Metodología

El proyecto se desarrolló utilizando la herramienta Terraform para definir y proporcionar la infraestructura de la red. El siguiente paso fue la creación de un cluster GKE para alojar las aplicaciones. Los archivos manifest de .yaml se utilizaron para definir el servidor WordPress y la base de datos MariaDB en el cluster.

## Implementación

A continuación, se muestra un extracto de cómo se implementó la creación de la red y la subred en Terraform:

```hcl
# Código de ejemplo en Terraform
