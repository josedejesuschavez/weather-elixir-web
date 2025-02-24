# Weather Elixir Web

## Descripción del Proyecto
Weather Elixir Web es una aplicación web desarrollada en Elixir y Phoenix que permite a los usuarios buscar y guardar sus ciudades favoritas para obtener información meteorológica actualizada. La aplicación utiliza una API de clima para obtener datos en tiempo real y presenta la información de manera clara y concisa.

## Problema Principal y Solución

### Problema
El principal problema que resolvimos fue la necesidad de una aplicación web que permita a los usuarios buscar información meteorológica actualizada para diferentes ciudades y guardar sus ciudades favoritas para un acceso rápido en el futuro.

### Solución
Desarrollamos una aplicación web utilizando Elixir y Phoenix que permite a los usuarios:

- Buscar el clima actual de cualquier ciudad.
- Ver la temperatura actual, mínima y máxima, y las condiciones climáticas.
- Ver la temperatura por hora para las próximas 24 horas.
- Ver el clima mínimo y máximo por día para el resto de la semana.
- Guardar ciudades favoritas para un acceso rápido.

## Tecnologías Usadas

El proyecto fue desarrollado utilizando las siguientes tecnologías:

- **Phoenix**: El framework web para Elixir, utilizado para construir la aplicación web en tiempo real.
- **Elixir**: El lenguaje de programación funcional y concurrente sobre el que está basado Phoenix.
- **PostgreSQL**: Base de datos relacional utilizada para almacenar las ciudades favoritas de los usuarios.
- **Docker**: Herramienta utilizada para contenerizar la aplicación, facilitando su despliegue y ejecución en diferentes entornos.

## Arquitectura

### Estructura del Proyecto
El proyecto está estructurado de la siguiente manera:

- **WeatherApp**: El módulo principal de la aplicación.
- **WeatherAppWeb**: Contiene los controladores, vistas y plantillas de Phoenix.
- **Live**: Contiene los módulos LiveView para la funcionalidad en tiempo real.
- **Favorites**: Contiene la lógica para manejar las ciudades favoritas.
- **Favorite**: El esquema y cambios para la tabla de favoritos.
- **Repo**: El repositorio para interactuar con la base de datos.

### Módulos Principales
- **WeatherApp.Favorites**: Maneja la lógica para listar, obtener, crear, actualizar y eliminar ciudades favoritas.
- **WeatherAppWeb.WeatherLive.Search**: Maneja la lógica de búsqueda de clima y la presentación de los resultados en tiempo real utilizando LiveView.

## Trade-offs y Mejoras Futuras

### Trade-offs

- **Simplicidad vs. Funcionalidad Completa**: Optamos por una implementación simple y directa para manejar las ciudades favoritas y la búsqueda de clima. Esto nos permitió desarrollar y desplegar la aplicación rápidamente, pero puede que no cubra todos los casos de uso avanzados.
  
- **Uso de LiveView**: Utilizamos LiveView para la funcionalidad en tiempo real, lo cual simplifica la arquitectura y reduce la necesidad de JavaScript en el frontend. Sin embargo, esto puede tener limitaciones en términos de rendimiento y escalabilidad en aplicaciones con alta concurrencia.

### Mejoras Futuras

- **Autenticación de Usuarios**: Implementar un sistema de autenticación para que los usuarios puedan guardar sus ciudades favoritas de manera personalizada.

- **Pruebas Unitarias**: Implementar pruebas unitarias para asegurar la calidad del código y el funcionamiento correcto de los diferentes módulos de la aplicación.

- **Arquitectura Limpia (Clean Architecture)**: Reestructurar el código para seguir los principios de la arquitectura limpia, lo cual mejorará la mantenibilidad, escalabilidad y separación de preocupaciones en el proyecto.
  
- **Optimización de Consultas**: Mejorar las consultas a la base de datos para manejar mejor grandes volúmenes de datos y usuarios concurrentes.

- **Interfaz de Usuario Mejorada**: Mejorar la interfaz de usuario con más gráficos y visualizaciones para una mejor experiencia de usuario.

## Cómo Ejecutar el Proyecto

1. Clona el repositorio.
2. Ejecutar docker compose up --build o make build
3. Abre tu navegador y navega a [http://localhost:4000](http://localhost:4000) para ver la aplicación en acción.
