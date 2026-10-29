# Usa la imagen base oficial y vulnerable que ya tiene instalado el web server apache
FROM php:8.4.26-apache

# Crear y establecer el directorio de trabajo
WORKDIR /app

# Copia el código de la app
COPY . .

# copia el archivo index.php en el directorio de apache
RUN cp app/index.php /var/www/html/index.php && \
# Ejecutar app como un usuario que no sea root por seguridad
useradd -m usrProduccivo && chown -R usrProduccivo:usrProduccivo /app

USER usrProduccivo

# Expone la aplicacón en el puerto 8000
EXPOSE 8000

