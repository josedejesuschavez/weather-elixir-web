# Usa la imagen oficial de Elixir
FROM elixir:1.15-alpine

# Instala dependencias del sistema (incluye Git)
RUN apk add --no-cache git build-base

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

# Instala las dependencias
RUN mix deps.get

# Compila el proyecto
RUN mix compile

# Expone el puerto de Phoenix
EXPOSE 4000

# Comando de inicio
CMD ["mix", "phx.server"]