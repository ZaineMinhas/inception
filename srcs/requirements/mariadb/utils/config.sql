UPDATE mysql.user SET Password=PASSWORD('$MARIADB_ROOT_PASSOWRD') WHERE User='root';

CREATE DATABASE $MARIADB_DATABASE;
CREATE USER '$MARIADB_USER'@'%' identified by '$MARIADB_USER_PASSWORD';
GRANT ALL PRIVILEGES on $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';

FLUSH PRIVILEGES;