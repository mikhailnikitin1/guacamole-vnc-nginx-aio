CREATE DATABASE guacamole_db;
CREATE USER 'guacamole_user'@'127.0.0.1' IDENTIFIED BY '{{ guacdb_guacamole_pass.stdout }}';
GRANT SELECT,INSERT,UPDATE,DELETE ON guacamole_db.* TO 'guacamole_user'@'127.0.0.1';
GRANT ALL PRIVILEGES ON mysql.* TO 'guacamole_user'@'127.0.0.1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
