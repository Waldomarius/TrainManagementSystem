DROP DATABASE trainmanagement;
CREATE DATABASE IF NOT EXISTS trainmanagement;
USE trainmanagement;

CREATE TABLE roles (
  id INT(11) NOT NULL AUTO_INCREMENT,
  role varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  login VARCHAR(255),
  password VARCHAR(255),
  enabled VARCHAR(255) NOT NULL DEFAULT '1',
  role_id INT(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT role_role_id_fk FOREIGN KEY (role_id) REFERENCES roles (id)

);

INSERT INTO roles (role) VALUES ('admin');
INSERT INTO roles (role) VALUES ('user');

INSERT INTO users ( name, login, password, role_id) VALUES ( 'admin', 'admin', 'admin', '1');
INSERT INTO users ( name, login, password, role_id) VALUES ( 'user', 'user', 'user', '2');
INSERT INTO users ( name, login, password, role_id) VALUES ( 'ivanov', 'ivanov', '12345', '2');
INSERT INTO users ( name, login, password, role_id) VALUES ( 'petrov', 'petrov', 'qwerty', '1');
INSERT INTO users ( name, login, password, role_id) VALUES ( 'sidorov', 'sidorov', '1111', '1');

CREATE TABLE trains (
  id INT(11) NOT NULL AUTO_INCREMENT,
  number VARCHAR(255),
  date VARCHAR(255),
  departure VARCHAR(255),
  arrival VARCHAR(255),
  sell INT(11),

  PRIMARY KEY (id)
);

INSERT INTO trains ( number, date, departure, arrival, sell) VALUES ( '7274', '03.11.2018', 'Borisov', 'Minsk' , 0 );
INSERT INTO trains ( number, date, departure, arrival, sell) VALUES ( '6533', '18.12.2018', 'Borisov', 'Orsha' , 0 );
INSERT INTO trains ( number, date, departure, arrival, sell) VALUES ( '9639', '21.19.2018', 'Minsk', 'Brest' , 0 );
INSERT INTO trains ( number, date, departure, arrival, sell) VALUES ( '1189', '13.12.2018', 'Borisov', 'Brest' , 0 );
INSERT INTO trains ( number, date, departure, arrival, sell) VALUES ( '7633', '02.10.2018', 'Borisov', 'Mogilev' , 0 );

CREATE TABLE freight_trains
(
  id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  number VARCHAR(255),
  date VARCHAR(255),
  departure VARCHAR(255),
  arrival VARCHAR(255),
  volume_limit INT(11),
  weight_limit INT(11),
  volume INT(11),
  weight INT(11)
);

INSERT INTO freight_trains ( number, date, departure, arrival, volume_limit, weight_limit, volume, weight )
VALUES ( '1244', '02.10.2018', 'Borisov', 'Minsk' , 1000 , 2000 , 0 , 0 );
INSERT INTO freight_trains ( number, date, departure, arrival, volume_limit, weight_limit, volume, weight )
VALUES ( '7114', '10.11.2018', 'Minsk', 'Brest' , 500 , 1500 , 0 , 0 );
INSERT INTO freight_trains ( number, date, departure, arrival, volume_limit, weight_limit, volume, weight )
VALUES ( '8274', '16.10.2018', 'Minsk', 'Brest' , 800 , 1000 , 0 , 0 );
INSERT INTO freight_trains ( number, date, departure, arrival, volume_limit, weight_limit, volume, weight )
VALUES ( '4234', '23.12.2018', 'Borisov', 'Brest', 2000 , 500 , 0 , 0 );
INSERT INTO freight_trains ( number, date, departure, arrival, volume_limit, weight_limit, volume, weight )
VALUES ( '9849', '29.09.2018', 'Borisov', 'Mogilev' , 1500 , 400 , 0 , 0 );
