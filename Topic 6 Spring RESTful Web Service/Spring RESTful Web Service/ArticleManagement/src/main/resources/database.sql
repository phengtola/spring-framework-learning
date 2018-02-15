

CREATE TABLE Roles(
		-- Based Field
		id SERIAL PRIMARY KEY,
		name VARCHAR(100),
		remark VARCHAR(200),
		status VARCHAR(1) DEFAULT 0,
		created_date TIMESTAMP DEFAULT NOW(),
		index SERIAL,
		uuid VARCHAR(100) UNIQUE  
);

CREATE TABLE Permissions(
		-- Based Field
		id SERIAL PRIMARY KEY,
		name VARCHAR(100),
		remark VARCHAR(200),
		status VARCHAR(1) DEFAULT 0,
		created_date TIMESTAMP DEFAULT NOW(),
		index SERIAL,
		uuid VARCHAR(100) UNIQUE  
);

CREATE TABLE Role_permissions(
		role_id INTEGER REFERENCES Roles(id),
		permission_id INTEGER REFERENCES Permissions(id)
);


CREATE TABLE Files(
		owner_id INTEGER, -- Users, Articles, or Comments
		path VARCHAR(200),
		size INTEGER,
		extension VARCHAR(100),
		type VARCHAR(100), -- user_profile, user_cover, user_files | article_files, commnet_files
		original_name VARCHAR(100),

		-- Based Field
		id SERIAL PRIMARY KEY,
		remark VARCHAR(200),
		status VARCHAR(1) DEFAULT 0,
		created_date TIMESTAMP DEFAULT NOW(),
		index SERIAL,
		uuid VARCHAR(100) UNIQUE  
);

CREATE TABLE Users(
		username VARCHAR(100),
		email VARCHAR(100),
		password VARCHAR(100),
		dob TIMESTAMP,
		gender VARCHAR(1),
		socail_id VARCHAR(100), 
		socail_type VARCHAR(1), -- facebook, google, twitter
		device VARCHAR(1), -- web, aos, ios
		-- Based Field
		id SERIAL PRIMARY KEY,
		created_date TIMESTAMP DEFAULT NOW(),
		remark VARCHAR(200),
		status VARCHAR(1) DEFAULT 0,
		index SERIAL,
		uuid VARCHAR(100) UNIQUE  
);

CREATE TABLE User_roles(
		user_id INTEGER REFERENCES Users(id),
		role_id INTEGER REFERENCES Roles(id)
);

CREATE TABLE Categories(
		-- Based Field
		id SERIAL PRIMARY KEY,
		name VARCHAR(100),
		remark VARCHAR(200),
		status VARCHAR(1) DEFAULT 0,
		created_date TIMESTAMP DEFAULT NOW(),
		index SERIAL,
		uuid VARCHAR(100) UNIQUE  
);

CREATE TABLE Articles(
		title VARCHAR(250),
		content TEXT,
		viewed INTEGER DEFAULT 0,
		shared INTEGER DEFAULT 0,
		user_id INTEGER REFERENCES Users(id),
		category_id INTEGER REFERENCES Categories(id),
		-- Based Field
		id SERIAL PRIMARY KEY,
		remark VARCHAR(200),
		status VARCHAR(1) DEFAULT 0,
		created_date TIMESTAMP DEFAULT NOW(),
		index SERIAL,
		uuid VARCHAR(100) UNIQUE  
);

CREATE TABLE Tags(
		-- Based Field
		id SERIAL PRIMARY KEY,
		name VARCHAR(100),
		remark VARCHAR(200),
		status VARCHAR(1) DEFAULT 0,
		created_date TIMESTAMP DEFAULT NOW(),
		index SERIAL,
		uuid VARCHAR(100) UNIQUE  
);

CREATE TABLE Article_tags(
		article_id INTEGER REFERENCES Articles(id),
		tag_id INTEGER REFERENCES Tags(id)  
);

CREATE TABLE Comments(		
		user_id INTEGER REFERENCES Users(id),
		article_id INTEGER REFERENCES Articles(id),
		comment VARCHAR(500),
		reply_id INTEGER REFERENCES Comments(id) DEFAULT 0,
		-- Based Field
		id SERIAL PRIMARY KEY,
		remark VARCHAR(200),
		status VARCHAR(1) DEFAULT 0,
		created_date TIMESTAMP DEFAULT NOW(),
		index SERIAL,
		uuid VARCHAR(100) UNIQUE  
);



-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO "public"."tags" VALUES ('1', 'JavaScript', null, '1', '2017-07-01 10:14:07.692406', '1', 'fb568575-7ca7-4649-8374-61b1de5b68a5');
INSERT INTO "public"."tags" VALUES ('2', 'jQuery', null, '1', '2017-07-01 10:14:13.409447', '2', 'fe6a8183-52e7-4bf2-bf07-f44ae059ce6f');
INSERT INTO "public"."tags" VALUES ('3', 'JQueryMobile', null, '1', '2017-07-01 10:14:32.077462', '3', '396725d2-0a69-4f60-86c5-d77abe6da966');
INSERT INTO "public"."tags" VALUES ('4', 'JSON', null, '1', '2017-07-01 10:14:50.071739', '4', '08e32d4e-1a8c-4850-acf8-c4e6b425085c');
INSERT INTO "public"."tags" VALUES ('5', 'AJAX', null, '1', '2017-07-01 10:14:55.741716', '5', 'bca9debf-bccf-455e-b4c7-a93cdb7e652c');
INSERT INTO "public"."tags" VALUES ('6', 'CSS', null, '1', '2017-07-01 10:15:00.867647', '6', '97f6bb76-a318-442d-85e6-c7d6b9061dfe');
INSERT INTO "public"."tags" VALUES ('7', 'HTML', null, '1', '2017-07-01 10:15:05.75562', '7', '98b1b610-40e9-407b-97c8-fb09123baf1b');
INSERT INTO "public"."tags" VALUES ('8', 'Bootstrap', null, '1', '2017-07-01 10:15:24.131774', '8', '5ab04223-1966-4a3e-a978-65f4ca846fdf');
INSERT INTO "public"."tags" VALUES ('9', 'HTML5', null, '1', '2017-07-01 10:15:32.745409', '9', '94e440d6-6ec0-46ab-9363-f90984a61cdf');
INSERT INTO "public"."tags" VALUES ('10', 'CSS', null, '1', '2017-07-01 10:16:45.872588', '10', '6d3b8225-3330-4595-ba5f-e2c9be344659');
INSERT INTO "public"."tags" VALUES ('11', 'Java', null, '1', '2017-07-01 10:16:52.407274', '11', '56cbc6d4-a3ea-4979-9e2a-f6c3e0fb9272');
INSERT INTO "public"."tags" VALUES ('12', 'PHP', null, '1', '2017-07-01 10:16:57.498332', '12', 'b097717c-1e4e-41ce-8107-7f01285089d6');
INSERT INTO "public"."tags" VALUES ('13', 'NodeJS', null, '1', '2017-07-01 10:17:04.430848', '13', '1c2711ec-c0a7-41fe-b713-dc91bdf229c0');
INSERT INTO "public"."tags" VALUES ('14', 'ReachJS', null, '1', '2017-07-01 10:17:11.718284', '14', 'c640e7eb-0512-4aa1-8f7a-43e9768b1e82');



-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES ('tola', 'tolapheng99@gmail.com', '123456', '2017-07-01 23:09:24', 'M', null, null, 'W', '1', '2017-07-01 12:19:43.124967', null, '1', '1', '9ed8dd14-9cf1-40e0-a108-da80184ae1ad');





-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO "public"."categories" VALUES ('1', 'Programming', null, '1', '2017-07-01 10:01:33.70855', '1', '98d90f09-8ae2-4a37-88a3-bf5e056f6d1a');
INSERT INTO "public"."categories" VALUES ('2', 'Mobile', null, '1', '2017-07-01 10:01:43.789176', '2', 'c69925e1-5203-4fa8-ba9e-8d2216b99127');
INSERT INTO "public"."categories" VALUES ('3', 'Web Design', null, '1', '2017-07-01 10:01:49.488068', '3', '61a36ca5-93e4-4dfb-aa25-fcb5f4dfaddd');
INSERT INTO "public"."categories" VALUES ('4', 'Graphic Design', null, '1', '2017-07-01 10:01:56.309211', '4', '8f4b51b9-b484-4dac-9154-146e9f1ffe42');
INSERT INTO "public"."categories" VALUES ('5', 'Linux', null, '1', '2017-07-01 10:01:59.512071', '5', '44305bfe-4862-4d64-aed2-99caba491625');


SELECT 
	A.title,
	A.content,
	A.viewed,
	A.shared,
	A.id,
	A.remark,
	A.status, 
	A.created_date, 
	A.index, 
	A.uuid,
	U.username,
	U.id AS user_id,
	U.email,
	--'article_imgage' As article_image,
	C.id as category_id,
	C.name As category_name
FROM 
	articles A INNER JOIN users U ON A.user_id = U.id
	INNER JOIN  categories C ON A.category_id = C.id
WHERE 
	A.status='1';


SELECT 
	path, size, type, id, status, index, uuid, extension, created_date
FROM 
	Files 
WHERE 
	owner_id=3 AND status='1' AND type='article_image';

SELECT 
	T.name,
	T.uuid
FROM 
	article_tags AT INNER JOIN tags T ON AT.tag_id = T.id
WHERE 
	AT.article_id=3

SELECT last_value FROM users_id_seq
