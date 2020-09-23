DROP TABLE role;
DROP TABLE users;
DROP TABLE department;

CREATE TABLE department(
		id INT PRIMARY KEY AUTO_INCREMENT,
		department_name VARCHAR(100),
		created_date TIMESTAMP DEFAULT NOW(),
		status VARCHAR(1)
);

CREATE TABLE users(
		id INT PRIMARY KEY AUTO_INCREMENT,
		username VARCHAR(100),
		email VARCHAR(100),
		password VARCHAR(100),
		address VARCHAR(100),
		created_date TIMESTAMP DEFAULT NOW(),
		status VARCHAR(1),
		department_id INT,
		CONSTRAINT FK_department_id FOREIGN KEY (department_id) REFERENCES department(id)
);


CREATE TABLE role(
		id INT PRIMARY KEY AUTO_INCREMENT,
		role_name VARCHAR(100),
		created_date TIMESTAMP DEFAULT NOW(),
		status VARCHAR(1),
		user_id INT,
		CONSTRAINT FK_user_id FOREIGN KEY (user_id) REFERENCES users(id)
);


insert into department(department_name, status) VALUES ('IT' , '1'), ('HR','1');

insert into users(username, email, password, address, status, department_id) VALUES(
	'Tola' , 'tola@gmail.com', '123456', 'phnom penh', '1', 1
),
( 'Romdoul', 'romdoul@gmail.com', '123456', 'Kampot', '1', 2)
;


insert into role ( role_name, status, user_id) VALUES
('ROLE_IT','1',1),
('ROLE_HR','1', 2),
('ROLE_ADMIN','1',1),
('ROLE_ADMIN','1',2);


SELECT u.id ,u.username, u.email, u.password, u.address, u.created_date, u.status, d.id as department_id, d.department_name FROM users u INNER JOIN department d ON u.department_id = d.id;
SELECT role_name FROM role where user_id=2;



