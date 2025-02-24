# Usa la imagen oficial de Elixir
FROM elixir:1.15

# Instala dependencias del sistema (incluye Git y curl)
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    curl 

# Configura el directorio de trabajo
WORKDIR /app

# Copia los archivos mix
COPY ./mix.exs ./
COPY ./mix.lock ./

# Instala las dependencias
RUN mix deps.get

# Recompila las dependencias
RUN mix deps.compile

# Copia el resto del código
COPY . .

# Descargar y configurar wait-for-it.sh
RUN curl -o /usr/local/bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
    chmod +x /usr/local/bin/wait-for-it.sh

# Instala las dependencias
RUN mix deps.get

# Compila el proyecto
RUN mix compile

# Ejecutar migraciones
#RUN mix ecto.migrate

# Expone el puerto de Phoenix
EXPOSE 4000

# Comando de inicio
CMD ["sh", "-c", "/usr/local/bin/wait-for-it.sh db:5432 && mix ecto.create && mix ecto.migrate && mix phx.server"]