
	CREATE TABLE users(
id int PRIMARY KEY AUTO_INCREMENT,
name varchar(100) NOT NULL,
email varchar(100)UNIQUE NOT NULL,
password varchar(255) NOT NULL,
user_type int(50) NOT NULL,
status int(20) NOT NULL
);

	CREATE TABLE products(
id int PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NUll,
price DECIMAL(10,2) NOT NULL,
category_id INT(20) NOT NULL,
status int(20) NOT NULL,
stock varchar(100) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(category_id) REFERENCES categories(id)

);
	CREATE TABLE categories(
id int PRIMARY KEY AUTO_INCREMENT,
name varchar(100) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER // --Delimiter is used for multiple lines
CREATE PROCEDURE AddCategories(IN cat_names varchar(100))

BEGIN

INSERT INTO categories(name) VALUES(cat_names);

END//
DELIMITER ;

--calling procedure 
Call procedure_name('Drinks');
Call procedure_name('Breads');


--for multiple VALUES
DELIMITER //
CREATE PROCEDURE AddUser(IN user_name varchar(100),IN user_email varchar(100),
                         IN user_password varchar(255), IN user_type int(50),                                          IN u_user_status int(20))
BEGIN
	INSERT INTO users(name, email, password, user_type, status)
    VALUES(user_name, user_email, user_password, user_type, u_user_status);
END //
DELIMITER ;

CALL AddUser('Kim jong Un', "kijong@342gmail.com", "yu4839435",1,0)