FROM mysql/mysql-server:latest
ENV MYSQL_ROOT_PASSWORD=ongraph
ENV MYSQL_DATABASE=ongraph
ENV MYSQL_USER=ongraph
ENV MYSQL_PASSWORD=ongraph
COPY init.sql /docker-entrypoint-initdb.d/
EXPOSE 3306

