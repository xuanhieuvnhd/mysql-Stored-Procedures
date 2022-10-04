create database user;
use user;
create table users(
id int not null auto_increment primary key,
name varchar(50) not null,
email varchar(100) not null unique,
country varchar(200));

create table Permision(
id int(11) primary key,
name varchar(50));

create table User_Permision(
permision_id int(11),
user_id int(11));

insert into users(name,email,country)values
('Hoàng Hiểu','hoanghieuv1nhd@gmail.com','Nga'),
('Hoàng Triều','hoanghieuv2nhd@gmail.com','USA'),
('Trung','hoanghieuvn3hd@gmail.com','Việt Nam'),
('Yến','hoanghieuvn4hd@gmail.com','USA'),
('Giang','hoanghieuv5nhd@gmail.com','Nga');

SELECT * FROM users;

insert into Permision(id, name) values(1, 'add');
insert into Permision(id, name) values(2, 'edit');
insert into Permision(id, name) values(3, 'delete');
insert into Permision(id, name) values(4, 'view');
#Định nghĩa Stored Procedures get_user_by_id và insert_user 
DELIMITER $$
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
    SELECT users.name, users.email, users.country
    FROM users
    where users.id = user_id;
    END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE insert_user(
    IN user_name varchar(50),
    IN user_email varchar(50),
    IN user_country varchar(50)
)
BEGIN
    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);
    END$$
DELIMITER ;

DELIMITER //
CREATE PROCEDURE findAllUsers()
BEGIN
  SELECT * FROM users;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE update_id(in id_user int(11),IN name_user varchar(50),IN email_user varchar(255),in country_user varchar(255) )
BEGIN
  UPDATE users SET name = name_user, email=email_user, country=country_user
WHERE id=id_user;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE delete_id(IN id_users INT(11))
BEGIN
  Delete FROM users WHERE id = id_users;
END //
DELIMITER ;