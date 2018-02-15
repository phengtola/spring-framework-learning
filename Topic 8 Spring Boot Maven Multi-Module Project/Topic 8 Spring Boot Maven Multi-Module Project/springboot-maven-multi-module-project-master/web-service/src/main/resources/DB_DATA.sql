/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : PostgreSQL
 Source Server Version : 90602
 Source Host           : localhost
 Source Database       : ArticleMG
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90602
 File Encoding         : utf-8

 Date: 07/07/2017 16:48:26 PM
*/

-- ----------------------------
--  Sequence structure for articles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."articles_id_seq";
CREATE SEQUENCE "public"."articles_id_seq" INCREMENT 1 START 106 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."articles_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for articles_index_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."articles_index_seq";
CREATE SEQUENCE "public"."articles_index_seq" INCREMENT 1 START 106 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."articles_index_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for categories_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."categories_id_seq";
CREATE SEQUENCE "public"."categories_id_seq" INCREMENT 1 START 34 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."categories_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for categories_index_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."categories_index_seq";
CREATE SEQUENCE "public"."categories_index_seq" INCREMENT 1 START 31 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."categories_index_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for comments_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."comments_id_seq";
CREATE SEQUENCE "public"."comments_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."comments_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for comments_index_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."comments_index_seq";
CREATE SEQUENCE "public"."comments_index_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."comments_index_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for files_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."files_id_seq";
CREATE SEQUENCE "public"."files_id_seq" INCREMENT 1 START 300 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."files_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for files_index_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."files_index_seq";
CREATE SEQUENCE "public"."files_index_seq" INCREMENT 1 START 300 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."files_index_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for permissions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."permissions_id_seq";
CREATE SEQUENCE "public"."permissions_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."permissions_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for permissions_index_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."permissions_index_seq";
CREATE SEQUENCE "public"."permissions_index_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."permissions_index_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for roles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."roles_id_seq";
CREATE SEQUENCE "public"."roles_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."roles_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for roles_index_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."roles_index_seq";
CREATE SEQUENCE "public"."roles_index_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."roles_index_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for tags_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tags_id_seq";
CREATE SEQUENCE "public"."tags_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."tags_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for tags_index_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tags_index_seq";
CREATE SEQUENCE "public"."tags_index_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."tags_index_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."users_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for users_index_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_index_seq";
CREATE SEQUENCE "public"."users_index_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."users_index_seq" OWNER TO "postgres";

-- ----------------------------
--  Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."roles";
CREATE TABLE "public"."roles" (
	"id" int4 NOT NULL DEFAULT nextval('roles_id_seq'::regclass),
	"name" varchar(100) COLLATE "default",
	"remark" varchar(200) COLLATE "default",
	"status" varchar(1) DEFAULT 0 COLLATE "default",
	"created_date" timestamp(6) NULL DEFAULT now(),
	"index" int4 NOT NULL DEFAULT nextval('roles_index_seq'::regclass),
	"uuid" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."roles" OWNER TO "postgres";

-- ----------------------------
--  Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_roles";
CREATE TABLE "public"."user_roles" (
	"user_id" int4,
	"role_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."user_roles" OWNER TO "postgres";

-- ----------------------------
--  Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."permissions";
CREATE TABLE "public"."permissions" (
	"id" int4 NOT NULL DEFAULT nextval('permissions_id_seq'::regclass),
	"name" varchar(100) COLLATE "default",
	"remark" varchar(200) COLLATE "default",
	"status" varchar(1) DEFAULT 0 COLLATE "default",
	"created_date" timestamp(6) NULL DEFAULT now(),
	"index" int4 NOT NULL DEFAULT nextval('permissions_index_seq'::regclass),
	"uuid" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."permissions" OWNER TO "postgres";

-- ----------------------------
--  Table structure for role_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."role_permissions";
CREATE TABLE "public"."role_permissions" (
	"role_id" int4,
	"permission_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."role_permissions" OWNER TO "postgres";

-- ----------------------------
--  Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
	"username" varchar(100) COLLATE "default",
	"email" varchar(100) COLLATE "default",
	"password" varchar(100) COLLATE "default",
	"dob" timestamp(6) NULL,
	"gender" varchar(1) COLLATE "default",
	"socail_id" varchar(100) COLLATE "default",
	"socail_type" varchar(1) COLLATE "default",
	"device" varchar(1) COLLATE "default",
	"id" int4 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
	"created_date" timestamp(6) NULL DEFAULT now(),
	"remark" varchar(200) COLLATE "default",
	"status" varchar(1) DEFAULT 0 COLLATE "default",
	"index" int4 NOT NULL DEFAULT nextval('users_index_seq'::regclass),
	"uuid" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."users" OWNER TO "postgres";

-- ----------------------------
--  Records of users
-- ----------------------------
BEGIN;
INSERT INTO "public"."users" VALUES ('tola', 'tolapheng99@gmail.com', '123456', '2017-07-01 23:09:24', 'M', null, null, 'W', '1', '2017-07-01 12:19:43.124967', null, '1', '1', '9ed8dd14-9cf1-40e0-a108-da80184ae1ad');
COMMIT;

-- ----------------------------
--  Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS "public"."categories";
CREATE TABLE "public"."categories" (
	"id" int4 NOT NULL DEFAULT nextval('categories_id_seq'::regclass),
	"name" varchar(100) COLLATE "default",
	"remark" varchar(200) COLLATE "default",
	"status" varchar(1) DEFAULT 0 COLLATE "default",
	"created_date" timestamp(6) NULL DEFAULT now(),
	"index" int4 NOT NULL DEFAULT nextval('categories_index_seq'::regclass),
	"uuid" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."categories" OWNER TO "postgres";

-- ----------------------------
--  Records of categories
-- ----------------------------
BEGIN;
INSERT INTO "public"."categories" VALUES ('2', 'Mobile', null, '1', '2017-07-01 10:01:43.789176', '2', 'c69925e1-5203-4fa8-ba9e-8d2216b99127');
INSERT INTO "public"."categories" VALUES ('3', 'Web Design', null, '1', '2017-07-01 10:01:49.488068', '3', '61a36ca5-93e4-4dfb-aa25-fcb5f4dfaddd');
INSERT INTO "public"."categories" VALUES ('4', 'Graphic Design', null, '1', '2017-07-01 10:01:56.309211', '4', '8f4b51b9-b484-4dac-9154-146e9f1ffe42');
INSERT INTO "public"."categories" VALUES ('5', 'Linux', null, '1', '2017-07-01 10:01:59.512071', '5', '44305bfe-4862-4d64-aed2-99caba491625');
INSERT INTO "public"."categories" VALUES ('1', 'Programming Test', 'Test', '0', '2017-07-01 10:01:33.70855', '10', '98d90f09-8ae2-4a37-88a3-bf5e056f6d1a');
INSERT INTO "public"."categories" VALUES ('25', 'Test', 'Test', '1', '2017-07-06 21:35:01.954883', '22', '71974714-7277-4ab6-bd24-ffb923c76dc2');
INSERT INTO "public"."categories" VALUES ('26', 'Test', 'trsy', '1', '2017-07-06 21:35:27.661381', '23', 'b1a0863f-553f-47e6-a57f-5f09077488bc');
INSERT INTO "public"."categories" VALUES ('27', ' 999 test', 'test', '1', '2017-07-06 21:36:10.832747', '24', 'f204ab43-b7e0-4a39-a793-bdef8d5e2d0d');
INSERT INTO "public"."categories" VALUES ('29', 'string tt', 'string', '1', '2017-07-07 11:11:46.328858', '26', '8dc7599d-a61a-4389-83fd-33a2b5d8a15b');
COMMIT;

-- ----------------------------
--  Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS "public"."articles";
CREATE TABLE "public"."articles" (
	"title" varchar(250) COLLATE "default",
	"content" text COLLATE "default",
	"viewed" int4,
	"shared" int4,
	"user_id" int4,
	"category_id" int4,
	"id" int4 NOT NULL DEFAULT nextval('articles_id_seq'::regclass),
	"remark" varchar(200) COLLATE "default",
	"status" varchar(1) DEFAULT 0 COLLATE "default",
	"created_date" timestamp(6) NULL DEFAULT now(),
	"index" int4 NOT NULL DEFAULT nextval('articles_index_seq'::regclass),
	"uuid" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."articles" OWNER TO "postgres";

-- ----------------------------
--  Records of articles
-- ----------------------------
BEGIN;
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '12', null, '1', '2017-07-03 10:49:45.476868', '12', 'ad9f6d9f-c088-43a7-9a73-e7bd4f43b08b');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '13', null, '1', '2017-07-07 13:53:24.848189', '13', '413bb143-72dd-442b-917a-583ee39a5ae5');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '14', null, '1', '2017-07-07 13:53:29.306652', '14', '56398e7d-8180-42ee-8d3e-3040b2ea9643');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '15', null, '1', '2017-07-07 13:53:29.427728', '15', 'f4571057-bcd4-4858-8da9-471d421dca41');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '16', null, '1', '2017-07-07 13:53:29.550308', '16', '1bfd14f9-3094-4a08-b0b0-83f0c9025d20');
INSERT INTO "public"."articles" VALUES ('Because Browser Diversity Is Good For The Web', 'But this is forgetting our users. Would it be good to effectively force them to use a single browser? To deny them the possibility to choose their preferred user interfaces and features? Of course not!', '0', '0', '1', '1', '3', null, '1', '2017-07-02 01:47:28.716739', '3', 'ef41433c-b8f3-4a3d-b746-fb685d98285d');
INSERT INTO "public"."articles" VALUES ('Everything You Need to Know About AR in 5 Minutes', 'Augmented Reality is at an inflection point.Researchers are predicting it will be a 150 billion dollar industry by 2020. Publications are calling the phone dead. Even Apple is starting to move on.AR is poised to disrupt both desktop & mobile computing — and when it does the world will look like a very different place.This article will get you prepared for that world.', '0', '0', '1', '5', '2', null, '1', '2017-07-02 01:45:21.834494', '2', '5e9ed57b-dbaf-4384-b5c5-4d33c2885450');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '17', null, '1', '2017-07-07 13:53:29.670711', '17', '1b9f435f-88fd-4a7d-bfc0-fa9d24b511e9');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', '0', '0', '1', '3', '4', null, '1', '2017-07-02 01:50:40.172856', '4', 'b0107e8f-9f5f-4b83-8e3d-188da222252a');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '5', null, '1', '2017-07-02 02:33:22.996738', '5', 'b2be5c80-772a-4774-9764-ea10dec1aad7');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '11', null, '1', '2017-07-03 09:04:24.132464', '11', '60cf9a2d-4e5b-4df5-a005-79e9a0cc372e');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '18', null, '1', '2017-07-07 13:53:29.778139', '18', '2e7dfc73-6e16-413b-9fae-39d6459ea8af');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '19', null, '1', '2017-07-07 13:53:29.91413', '19', '535a1494-ef05-4dd3-8973-7b6bb42d150a');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '20', null, '1', '2017-07-07 13:53:30.143617', '20', '5c82cc71-fbbf-4af9-aa9b-ff606594f5dd');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '21', null, '1', '2017-07-07 13:53:30.294931', '21', '98f4117e-8a19-40e4-9f09-f51d703b49e8');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '22', null, '1', '2017-07-07 13:53:30.531857', '22', 'e0731777-f640-429c-b279-2a4466c224f1');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '23', null, '1', '2017-07-07 13:53:30.687084', '23', '0a5208e3-6841-4b67-9d3d-dd00de4e830d');
INSERT INTO "public"."articles" VALUES ('title, hello hello', 'content, test test test', null, null, '1', '1', '6', null, '1', '2017-07-02 10:40:37.381344', '6', '169774c0-af96-4071-9a5f-8330da4d10ca');
INSERT INTO "public"."articles" VALUES ('title, hello hello', 'content, test test test', null, null, '1', '1', '7', null, '1', '2017-07-02 10:41:29.13561', '7', 'd2134eae-1ec6-429e-a67e-c04ef53567b6');
INSERT INTO "public"."articles" VALUES ('title, hello hello', 'content, test test test', null, null, '1', '1', '9', null, '1', '2017-07-02 10:51:44.627282', '9', '63e98aa9-437c-4b1c-981b-f162dd8d6b9d');
INSERT INTO "public"."articles" VALUES ('title, hello hello', 'content, test test test', null, null, '1', '1', '10', null, '1', '2017-07-02 10:52:07.612096', '10', '25dd9042-8e9f-47db-b4b4-7aeef5bfac7e');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '24', null, '1', '2017-07-07 13:53:30.814974', '24', '03921851-e413-4fac-8639-fdf5247bc781');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '25', null, '1', '2017-07-07 13:53:30.946285', '25', '00b15a63-0cc8-42ed-a3fd-ee654b2403a5');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '26', null, '1', '2017-07-07 13:53:31.075702', '26', '32629a93-ac5a-4721-895e-6a432e03cb7a');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '27', null, '1', '2017-07-07 13:53:31.231267', '27', 'b900d9ae-a195-406c-8d75-67abc335d493');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '28', null, '1', '2017-07-07 13:53:31.36308', '28', '89555ba6-762a-4373-a318-bf38dc0b2cf2');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '29', null, '1', '2017-07-07 13:53:31.494004', '29', '3d2fc9a5-9c52-4aa3-8f71-141b8a059b98');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '30', null, '1', '2017-07-07 13:53:31.645421', '30', '2a2b681d-b4d3-4749-bfbf-1d7e22b57270');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '31', null, '1', '2017-07-07 13:53:31.795367', '31', 'fa975ec2-357b-49a0-a28a-7f6b83895a54');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '32', null, '1', '2017-07-07 13:53:33.027375', '32', 'e59c24bd-bf2e-4397-bad7-cf7aa312bf94');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '33', null, '1', '2017-07-07 13:53:33.155764', '33', 'b9563cee-40bf-4686-82b3-b9b5894c7c7f');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '34', null, '1', '2017-07-07 13:53:33.3106', '34', '7242d9dc-5cf2-4d0c-a2b9-f61a4a9398c8');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '35', null, '1', '2017-07-07 13:53:33.448011', '35', '302d66c1-130e-47ee-98c3-28125f880698');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '36', null, '1', '2017-07-07 13:53:33.585843', '36', 'e4f7d940-2803-4c6e-be70-17786a3e0414');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '37', null, '1', '2017-07-07 13:53:33.751704', '37', 'a948d0ef-4f37-4898-ab88-639ed3cef092');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '38', null, '1', '2017-07-07 13:53:33.886449', '38', 'b152f414-56c6-4563-a5cc-db84ea342885');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '39', null, '1', '2017-07-07 13:53:34.059953', '39', '8a17ed58-d352-48ee-a102-7a05e6806e57');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '40', null, '1', '2017-07-07 13:53:34.195695', '40', '0b91cbf8-a6fe-489f-9659-09254a767012');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '41', null, '1', '2017-07-07 13:53:34.358052', '41', '5a104722-de6c-400e-8603-19f070984585');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '42', null, '1', '2017-07-07 13:53:34.514597', '42', '37e61083-fa16-4fed-ba47-58684058d397');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '43', null, '1', '2017-07-07 13:53:34.669555', '43', '508ebfbc-1a06-4a1e-a2a8-1c22934f9a17');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '44', null, '1', '2017-07-07 13:53:34.84057', '44', '90053d8c-bafa-4b5f-af95-ffdb31e5f784');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '45', null, '1', '2017-07-07 13:53:35.010349', '45', '218edff9-69f1-4d24-b3df-e06e2b071fd9');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '46', null, '1', '2017-07-07 13:53:35.181979', '46', 'e66ebd6f-1793-440e-aff0-5dc1258a2208');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '47', null, '1', '2017-07-07 13:53:35.351213', '47', '9a05dcae-9c2c-4d8a-b249-31e650f264cf');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '48', null, '1', '2017-07-07 13:53:35.521824', '48', 'b12c91ae-d7fa-4c78-a116-d99b9550f6ac');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '49', null, '1', '2017-07-07 13:53:35.686228', '49', '2bc29663-b10b-49e8-963e-39ba6bd7bffc');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '50', null, '1', '2017-07-07 13:53:35.864634', '50', '89985b5b-be47-471d-8a0c-a6750b4abc71');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '51', null, '1', '2017-07-07 13:53:36.019511', '51', 'ab559d88-656f-48a7-a0f9-51f33ed61c04');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '52', null, '1', '2017-07-07 13:53:36.189214', '52', '62e79e9b-99cf-40ed-9c78-28a530912e2a');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '53', null, '1', '2017-07-07 13:53:36.360837', '53', '69bfd916-afb4-426b-9a2d-4a36e27d2792');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '54', null, '1', '2017-07-07 13:53:36.53886', '54', 'cf30b4bb-bb36-4196-bb12-0ae80084608d');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '55', null, '1', '2017-07-07 13:53:36.695641', '55', '75a07c50-e222-4c2a-9f62-6057352e15f8');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '56', null, '1', '2017-07-07 13:53:36.840947', '56', '02a802d6-13f8-4fde-a79f-5b8bc7a26312');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '57', null, '1', '2017-07-07 13:53:37.002847', '57', 'fe59e3b0-61f1-4a91-893d-faca1a10c30f');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '58', null, '1', '2017-07-07 13:53:37.167338', '58', '34df9985-c869-4385-b94c-e38014b0f82e');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '59', null, '1', '2017-07-07 13:53:37.336405', '59', 'ea986332-c42e-47a4-89c9-2a8f122831ac');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '60', null, '1', '2017-07-07 13:53:37.507927', '60', '09a6e94a-cc5f-430a-a51d-a8d79e588d12');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '61', null, '1', '2017-07-07 13:53:37.677247', '61', 'f6836168-3007-4a2a-a763-f38b89fc7452');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '62', null, '1', '2017-07-07 13:53:37.843874', '62', '37f0a4b4-1571-4cd8-af60-08180804c3bf');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '63', null, '1', '2017-07-07 13:53:38.010289', '63', 'd1ff03ca-1623-4a24-83de-1fcd50d943a9');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '64', null, '1', '2017-07-07 13:53:38.187865', '64', 'e987beea-892b-41a7-970a-ebe232246619');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '65', null, '1', '2017-07-07 13:53:38.358944', '65', 'e0f20984-fe1a-4b49-ac75-478cfc5d1008');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '66', null, '1', '2017-07-07 13:53:38.53143', '66', '681abe1c-9617-4bac-bc4b-309597022a18');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '67', null, '1', '2017-07-07 13:53:38.69401', '67', '67a557a3-7132-49d9-8dd8-4cae8c27f74c');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '68', null, '1', '2017-07-07 13:53:38.84841', '68', 'a6916d62-00f6-45b8-89c9-c5223fe2865e');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '69', null, '1', '2017-07-07 13:53:39.019882', '69', '647789d5-7ca5-4082-92f9-4d57acbb80f9');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '70', null, '1', '2017-07-07 13:53:39.190943', '70', 'd7f1f7b0-8bcc-4f1f-bbf7-695d08ca25b2');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '71', null, '1', '2017-07-07 13:53:39.365853', '71', '63fa37fb-2426-48b8-8b35-2cee7e56de01');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '72', null, '1', '2017-07-07 13:53:39.553231', '72', '9a4e3541-73b3-4d96-aaab-60f3025abb72');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '73', null, '1', '2017-07-07 13:53:39.727631', '73', 'e51d4358-2962-47f9-909a-1513c42116d5');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '74', null, '1', '2017-07-07 13:53:40.052771', '74', 'a726219f-8ed8-4dbc-b9a8-2af5fea97a56');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '75', null, '1', '2017-07-07 13:53:40.222946', '75', 'a711a2ad-6844-4928-bce3-b1727c302fd9');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '76', null, '1', '2017-07-07 13:53:40.383556', '76', 'ab36f38f-7915-4995-b774-1781650db7d6');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '77', null, '1', '2017-07-07 13:53:40.521287', '77', 'cb3b70fe-510d-4799-8dd3-1f5c52403032');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '78', null, '1', '2017-07-07 13:53:40.692075', '78', 'fd05cce0-9e73-4ddc-bffd-b43108c287c3');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '79', null, '1', '2017-07-07 13:53:40.84274', '79', '3d79d7ff-ea86-4ed0-8bf8-5543c6ea2276');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '80', null, '1', '2017-07-07 13:53:41.017168', '80', '0be0ddb3-d785-4c40-801c-d5bd2d7a3c7d');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '81', null, '1', '2017-07-07 13:53:41.182603', '81', '1c5b2cde-0be9-45b9-b7d9-145c9084a501');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '82', null, '1', '2017-07-07 13:53:41.34396', '82', '46619638-7e0d-495c-a7b0-a84b061c0171');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '83', null, '1', '2017-07-07 13:53:41.515697', '83', '904589b1-92a4-4611-b8bc-571956155b3b');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '84', null, '1', '2017-07-07 13:53:41.68404', '84', '6aa7a0c8-9b2f-4132-8f5f-18f94b379919');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '85', null, '1', '2017-07-07 13:53:41.849774', '85', 'c5dc839f-7391-4e19-98dd-f706e5428678');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '86', null, '1', '2017-07-07 13:53:42.025852', '86', '1a139f18-022f-46fb-89e2-8b87ff6c35f2');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '87', null, '1', '2017-07-07 13:53:42.205228', '87', 'd7d3ce68-f9f5-461b-bc7f-7e44e5690881');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '88', null, '1', '2017-07-07 13:53:42.360909', '88', '2e5c7b8a-c0db-472c-8b58-f50b85f91770');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '89', null, '1', '2017-07-07 13:53:42.532873', '89', 'e1902ecb-3b7e-494d-b0b4-074733f6220b');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '90', null, '1', '2017-07-07 13:53:42.694937', '90', '7cfbf216-c84a-44b3-8cbf-f6416245aad8');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '91', null, '1', '2017-07-07 13:53:42.864967', '91', '2b678234-5700-4410-97e5-675187374515');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '92', null, '1', '2017-07-07 13:53:43.050967', '92', '85fec4f0-3d48-4d96-a5ae-23d6d9e5675a');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '93', null, '1', '2017-07-07 13:53:43.238766', '93', '2a709903-d0e1-4b14-8a46-88ed8f57c0fb');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '94', null, '1', '2017-07-07 13:53:43.416623', '94', '34a4b251-4e5e-4540-971c-93f6a73b4dbd');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '95', null, '1', '2017-07-07 13:53:43.587568', '95', 'd33088e6-32fd-4410-8fe3-2cd7a9066db1');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '96', null, '1', '2017-07-07 13:53:43.758161', '96', '91fcc7e1-ee0a-497d-86c8-479c651e2f6d');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '97', null, '1', '2017-07-07 13:53:43.944131', '97', 'ad101e00-a1b4-4201-95ee-6731ca66146d');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '98', null, '1', '2017-07-07 13:53:44.116078', '98', '3f126531-256a-4ca9-ba06-17d410f45d91');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '99', null, '1', '2017-07-07 13:53:44.294156', '99', 'd6410caa-556b-415f-a488-2805d411fed3');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '100', null, '1', '2017-07-07 13:53:44.481015', '100', 'a0257182-4072-403c-91de-f3f88180ba3c');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '101', null, '1', '2017-07-07 13:53:44.678606', '101', 'c7e28469-082c-4ad2-93f5-bc0e48c77b2c');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '103', null, '1', '2017-07-07 13:53:45.041992', '103', 'c3d07f94-ac57-4b16-bbc1-7188f3228ff4');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '104', null, '1', '2017-07-07 13:53:45.209451', '104', 'f056767e-2ece-4150-be2d-57b977dd8268');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '105', null, '1', '2017-07-07 13:53:45.378054', '105', '131dcad0-e8e2-47fa-8f2b-a1dac4706ec5');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '106', null, '0', '2017-07-07 13:53:45.53108', '106', 'a0402d3c-2577-4fdd-aa06-3f0f9b09036e');
INSERT INTO "public"."articles" VALUES ('Tech and Elitist Design', 'In the past few decades, income inequality in the United States has increased dramatically. Between 1979 and 2007, after-tax income of households in the top 1 percent of earners grew by 275%, compared to 65% for the next 19%, ~40% for the next 60%, and 18% for the bottom fifth of households.', null, null, '1', '3', '102', null, '0', '2017-07-07 13:53:44.85757', '102', '9f19f133-1847-44b3-8c82-3461414d5423');
COMMIT;

-- ----------------------------
--  Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS "public"."tags";
CREATE TABLE "public"."tags" (
	"id" int4 NOT NULL DEFAULT nextval('tags_id_seq'::regclass),
	"name" varchar(100) COLLATE "default",
	"remark" varchar(200) COLLATE "default",
	"status" varchar(1) DEFAULT 0 COLLATE "default",
	"created_date" timestamp(6) NULL DEFAULT now(),
	"index" int4 NOT NULL DEFAULT nextval('tags_index_seq'::regclass),
	"uuid" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."tags" OWNER TO "postgres";

-- ----------------------------
--  Records of tags
-- ----------------------------
BEGIN;
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
COMMIT;

-- ----------------------------
--  Table structure for article_tags
-- ----------------------------
DROP TABLE IF EXISTS "public"."article_tags";
CREATE TABLE "public"."article_tags" (
	"article_id" int4,
	"tag_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."article_tags" OWNER TO "postgres";

-- ----------------------------
--  Records of article_tags
-- ----------------------------
BEGIN;
INSERT INTO "public"."article_tags" VALUES ('2', '1');
INSERT INTO "public"."article_tags" VALUES ('2', '2');
INSERT INTO "public"."article_tags" VALUES ('3', '3');
INSERT INTO "public"."article_tags" VALUES ('3', '4');
INSERT INTO "public"."article_tags" VALUES ('4', '3');
INSERT INTO "public"."article_tags" VALUES ('4', '4');
INSERT INTO "public"."article_tags" VALUES ('5', '3');
INSERT INTO "public"."article_tags" VALUES ('5', '4');
INSERT INTO "public"."article_tags" VALUES ('9', '1');
INSERT INTO "public"."article_tags" VALUES ('9', '2');
INSERT INTO "public"."article_tags" VALUES ('9', '3');
INSERT INTO "public"."article_tags" VALUES ('11', '3');
INSERT INTO "public"."article_tags" VALUES ('11', '4');
INSERT INTO "public"."article_tags" VALUES ('12', '3');
INSERT INTO "public"."article_tags" VALUES ('12', '4');
INSERT INTO "public"."article_tags" VALUES ('13', '3');
INSERT INTO "public"."article_tags" VALUES ('13', '4');
INSERT INTO "public"."article_tags" VALUES ('14', '3');
INSERT INTO "public"."article_tags" VALUES ('14', '4');
INSERT INTO "public"."article_tags" VALUES ('15', '3');
INSERT INTO "public"."article_tags" VALUES ('15', '4');
INSERT INTO "public"."article_tags" VALUES ('16', '3');
INSERT INTO "public"."article_tags" VALUES ('16', '4');
INSERT INTO "public"."article_tags" VALUES ('17', '3');
INSERT INTO "public"."article_tags" VALUES ('17', '4');
INSERT INTO "public"."article_tags" VALUES ('18', '3');
INSERT INTO "public"."article_tags" VALUES ('18', '4');
INSERT INTO "public"."article_tags" VALUES ('19', '3');
INSERT INTO "public"."article_tags" VALUES ('19', '4');
INSERT INTO "public"."article_tags" VALUES ('20', '3');
INSERT INTO "public"."article_tags" VALUES ('20', '4');
INSERT INTO "public"."article_tags" VALUES ('21', '3');
INSERT INTO "public"."article_tags" VALUES ('21', '4');
INSERT INTO "public"."article_tags" VALUES ('22', '3');
INSERT INTO "public"."article_tags" VALUES ('22', '4');
INSERT INTO "public"."article_tags" VALUES ('23', '3');
INSERT INTO "public"."article_tags" VALUES ('23', '4');
INSERT INTO "public"."article_tags" VALUES ('24', '3');
INSERT INTO "public"."article_tags" VALUES ('24', '4');
INSERT INTO "public"."article_tags" VALUES ('25', '3');
INSERT INTO "public"."article_tags" VALUES ('25', '4');
INSERT INTO "public"."article_tags" VALUES ('26', '3');
INSERT INTO "public"."article_tags" VALUES ('26', '4');
INSERT INTO "public"."article_tags" VALUES ('27', '3');
INSERT INTO "public"."article_tags" VALUES ('27', '4');
INSERT INTO "public"."article_tags" VALUES ('28', '3');
INSERT INTO "public"."article_tags" VALUES ('28', '4');
INSERT INTO "public"."article_tags" VALUES ('29', '3');
INSERT INTO "public"."article_tags" VALUES ('29', '4');
INSERT INTO "public"."article_tags" VALUES ('30', '3');
INSERT INTO "public"."article_tags" VALUES ('30', '4');
INSERT INTO "public"."article_tags" VALUES ('31', '3');
INSERT INTO "public"."article_tags" VALUES ('31', '4');
INSERT INTO "public"."article_tags" VALUES ('32', '3');
INSERT INTO "public"."article_tags" VALUES ('32', '4');
INSERT INTO "public"."article_tags" VALUES ('33', '3');
INSERT INTO "public"."article_tags" VALUES ('33', '4');
INSERT INTO "public"."article_tags" VALUES ('34', '3');
INSERT INTO "public"."article_tags" VALUES ('34', '4');
INSERT INTO "public"."article_tags" VALUES ('35', '3');
INSERT INTO "public"."article_tags" VALUES ('35', '4');
INSERT INTO "public"."article_tags" VALUES ('36', '3');
INSERT INTO "public"."article_tags" VALUES ('36', '4');
INSERT INTO "public"."article_tags" VALUES ('37', '3');
INSERT INTO "public"."article_tags" VALUES ('37', '4');
INSERT INTO "public"."article_tags" VALUES ('38', '3');
INSERT INTO "public"."article_tags" VALUES ('38', '4');
INSERT INTO "public"."article_tags" VALUES ('39', '3');
INSERT INTO "public"."article_tags" VALUES ('39', '4');
INSERT INTO "public"."article_tags" VALUES ('40', '3');
INSERT INTO "public"."article_tags" VALUES ('40', '4');
INSERT INTO "public"."article_tags" VALUES ('41', '3');
INSERT INTO "public"."article_tags" VALUES ('41', '4');
INSERT INTO "public"."article_tags" VALUES ('42', '3');
INSERT INTO "public"."article_tags" VALUES ('42', '4');
INSERT INTO "public"."article_tags" VALUES ('43', '3');
INSERT INTO "public"."article_tags" VALUES ('43', '4');
INSERT INTO "public"."article_tags" VALUES ('44', '3');
INSERT INTO "public"."article_tags" VALUES ('44', '4');
INSERT INTO "public"."article_tags" VALUES ('45', '3');
INSERT INTO "public"."article_tags" VALUES ('45', '4');
INSERT INTO "public"."article_tags" VALUES ('46', '3');
INSERT INTO "public"."article_tags" VALUES ('46', '4');
INSERT INTO "public"."article_tags" VALUES ('47', '3');
INSERT INTO "public"."article_tags" VALUES ('47', '4');
INSERT INTO "public"."article_tags" VALUES ('48', '3');
INSERT INTO "public"."article_tags" VALUES ('48', '4');
INSERT INTO "public"."article_tags" VALUES ('49', '3');
INSERT INTO "public"."article_tags" VALUES ('49', '4');
INSERT INTO "public"."article_tags" VALUES ('50', '3');
INSERT INTO "public"."article_tags" VALUES ('50', '4');
INSERT INTO "public"."article_tags" VALUES ('51', '3');
INSERT INTO "public"."article_tags" VALUES ('51', '4');
INSERT INTO "public"."article_tags" VALUES ('52', '3');
INSERT INTO "public"."article_tags" VALUES ('52', '4');
INSERT INTO "public"."article_tags" VALUES ('53', '3');
INSERT INTO "public"."article_tags" VALUES ('53', '4');
INSERT INTO "public"."article_tags" VALUES ('54', '3');
INSERT INTO "public"."article_tags" VALUES ('54', '4');
INSERT INTO "public"."article_tags" VALUES ('55', '3');
INSERT INTO "public"."article_tags" VALUES ('55', '4');
INSERT INTO "public"."article_tags" VALUES ('56', '3');
INSERT INTO "public"."article_tags" VALUES ('56', '4');
INSERT INTO "public"."article_tags" VALUES ('57', '3');
INSERT INTO "public"."article_tags" VALUES ('57', '4');
INSERT INTO "public"."article_tags" VALUES ('58', '3');
INSERT INTO "public"."article_tags" VALUES ('58', '4');
INSERT INTO "public"."article_tags" VALUES ('59', '3');
INSERT INTO "public"."article_tags" VALUES ('59', '4');
INSERT INTO "public"."article_tags" VALUES ('60', '3');
INSERT INTO "public"."article_tags" VALUES ('60', '4');
INSERT INTO "public"."article_tags" VALUES ('61', '3');
INSERT INTO "public"."article_tags" VALUES ('61', '4');
INSERT INTO "public"."article_tags" VALUES ('62', '3');
INSERT INTO "public"."article_tags" VALUES ('62', '4');
INSERT INTO "public"."article_tags" VALUES ('63', '3');
INSERT INTO "public"."article_tags" VALUES ('63', '4');
INSERT INTO "public"."article_tags" VALUES ('64', '3');
INSERT INTO "public"."article_tags" VALUES ('64', '4');
INSERT INTO "public"."article_tags" VALUES ('65', '3');
INSERT INTO "public"."article_tags" VALUES ('65', '4');
INSERT INTO "public"."article_tags" VALUES ('66', '3');
INSERT INTO "public"."article_tags" VALUES ('66', '4');
INSERT INTO "public"."article_tags" VALUES ('67', '3');
INSERT INTO "public"."article_tags" VALUES ('67', '4');
INSERT INTO "public"."article_tags" VALUES ('68', '3');
INSERT INTO "public"."article_tags" VALUES ('68', '4');
INSERT INTO "public"."article_tags" VALUES ('69', '3');
INSERT INTO "public"."article_tags" VALUES ('69', '4');
INSERT INTO "public"."article_tags" VALUES ('70', '3');
INSERT INTO "public"."article_tags" VALUES ('70', '4');
INSERT INTO "public"."article_tags" VALUES ('71', '3');
INSERT INTO "public"."article_tags" VALUES ('71', '4');
INSERT INTO "public"."article_tags" VALUES ('72', '3');
INSERT INTO "public"."article_tags" VALUES ('72', '4');
INSERT INTO "public"."article_tags" VALUES ('73', '3');
INSERT INTO "public"."article_tags" VALUES ('73', '4');
INSERT INTO "public"."article_tags" VALUES ('74', '3');
INSERT INTO "public"."article_tags" VALUES ('74', '4');
INSERT INTO "public"."article_tags" VALUES ('75', '3');
INSERT INTO "public"."article_tags" VALUES ('75', '4');
INSERT INTO "public"."article_tags" VALUES ('76', '3');
INSERT INTO "public"."article_tags" VALUES ('76', '4');
INSERT INTO "public"."article_tags" VALUES ('77', '3');
INSERT INTO "public"."article_tags" VALUES ('77', '4');
INSERT INTO "public"."article_tags" VALUES ('78', '3');
INSERT INTO "public"."article_tags" VALUES ('78', '4');
INSERT INTO "public"."article_tags" VALUES ('79', '3');
INSERT INTO "public"."article_tags" VALUES ('79', '4');
INSERT INTO "public"."article_tags" VALUES ('80', '3');
INSERT INTO "public"."article_tags" VALUES ('80', '4');
INSERT INTO "public"."article_tags" VALUES ('81', '3');
INSERT INTO "public"."article_tags" VALUES ('81', '4');
INSERT INTO "public"."article_tags" VALUES ('82', '3');
INSERT INTO "public"."article_tags" VALUES ('82', '4');
INSERT INTO "public"."article_tags" VALUES ('83', '3');
INSERT INTO "public"."article_tags" VALUES ('83', '4');
INSERT INTO "public"."article_tags" VALUES ('84', '3');
INSERT INTO "public"."article_tags" VALUES ('84', '4');
INSERT INTO "public"."article_tags" VALUES ('85', '3');
INSERT INTO "public"."article_tags" VALUES ('85', '4');
INSERT INTO "public"."article_tags" VALUES ('86', '3');
INSERT INTO "public"."article_tags" VALUES ('86', '4');
INSERT INTO "public"."article_tags" VALUES ('87', '3');
INSERT INTO "public"."article_tags" VALUES ('87', '4');
INSERT INTO "public"."article_tags" VALUES ('88', '3');
INSERT INTO "public"."article_tags" VALUES ('88', '4');
INSERT INTO "public"."article_tags" VALUES ('89', '3');
INSERT INTO "public"."article_tags" VALUES ('89', '4');
INSERT INTO "public"."article_tags" VALUES ('90', '3');
INSERT INTO "public"."article_tags" VALUES ('90', '4');
INSERT INTO "public"."article_tags" VALUES ('91', '3');
INSERT INTO "public"."article_tags" VALUES ('91', '4');
INSERT INTO "public"."article_tags" VALUES ('92', '3');
INSERT INTO "public"."article_tags" VALUES ('92', '4');
INSERT INTO "public"."article_tags" VALUES ('93', '3');
INSERT INTO "public"."article_tags" VALUES ('93', '4');
INSERT INTO "public"."article_tags" VALUES ('94', '3');
INSERT INTO "public"."article_tags" VALUES ('94', '4');
INSERT INTO "public"."article_tags" VALUES ('95', '3');
INSERT INTO "public"."article_tags" VALUES ('95', '4');
INSERT INTO "public"."article_tags" VALUES ('96', '3');
INSERT INTO "public"."article_tags" VALUES ('96', '4');
INSERT INTO "public"."article_tags" VALUES ('97', '3');
INSERT INTO "public"."article_tags" VALUES ('97', '4');
INSERT INTO "public"."article_tags" VALUES ('98', '3');
INSERT INTO "public"."article_tags" VALUES ('98', '4');
INSERT INTO "public"."article_tags" VALUES ('99', '3');
INSERT INTO "public"."article_tags" VALUES ('99', '4');
INSERT INTO "public"."article_tags" VALUES ('100', '3');
INSERT INTO "public"."article_tags" VALUES ('100', '4');
INSERT INTO "public"."article_tags" VALUES ('101', '3');
INSERT INTO "public"."article_tags" VALUES ('101', '4');
INSERT INTO "public"."article_tags" VALUES ('102', '3');
INSERT INTO "public"."article_tags" VALUES ('102', '4');
INSERT INTO "public"."article_tags" VALUES ('103', '3');
INSERT INTO "public"."article_tags" VALUES ('103', '4');
INSERT INTO "public"."article_tags" VALUES ('104', '3');
INSERT INTO "public"."article_tags" VALUES ('104', '4');
INSERT INTO "public"."article_tags" VALUES ('105', '3');
INSERT INTO "public"."article_tags" VALUES ('105', '4');
INSERT INTO "public"."article_tags" VALUES ('106', '3');
INSERT INTO "public"."article_tags" VALUES ('106', '4');
COMMIT;

-- ----------------------------
--  Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS "public"."comments";
CREATE TABLE "public"."comments" (
	"user_id" int4,
	"article_id" int4,
	"comment" varchar(500) COLLATE "default",
	"reply_id" int4 DEFAULT 0,
	"id" int4 NOT NULL DEFAULT nextval('comments_id_seq'::regclass),
	"remark" varchar(200) COLLATE "default",
	"status" varchar(1) DEFAULT 0 COLLATE "default",
	"created_date" timestamp(6) NULL DEFAULT now(),
	"index" int4 NOT NULL DEFAULT nextval('comments_index_seq'::regclass),
	"uuid" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."comments" OWNER TO "postgres";

-- ----------------------------
--  Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS "public"."files";
CREATE TABLE "public"."files" (
	"owner_id" int4,
	"path" varchar(200) COLLATE "default",
	"size" int4,
	"type" varchar(100) COLLATE "default",
	"id" int4 NOT NULL DEFAULT nextval('files_id_seq'::regclass),
	"original_name" varchar(100) COLLATE "default",
	"remark" varchar(200) COLLATE "default",
	"status" varchar(1) DEFAULT 0 COLLATE "default",
	"created_date" timestamp(6) NULL DEFAULT now(),
	"index" int4 NOT NULL DEFAULT nextval('files_index_seq'::regclass),
	"uuid" varchar(100) COLLATE "default",
	"extension" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."files" OWNER TO "postgres";

-- ----------------------------
--  Records of files
-- ----------------------------
BEGIN;
INSERT INTO "public"."files" VALUES ('11', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '13', '1.Tech and Elitist Design', null, null, '2017-07-03 09:04:24.132464', '13', null, null);
INSERT INTO "public"."files" VALUES ('11', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '14', '2.Tech and Elitist Design', null, null, '2017-07-03 09:04:24.132464', '14', null, null);
INSERT INTO "public"."files" VALUES ('11', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '15', '3.Tech and Elitist Design', null, null, '2017-07-03 09:04:24.132464', '15', null, null);
INSERT INTO "public"."files" VALUES ('12', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '16', '1.Tech and Elitist Design', null, null, '2017-07-03 10:49:45.476868', '16', null, null);
INSERT INTO "public"."files" VALUES ('12', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '17', '2.Tech and Elitist Design', null, null, '2017-07-03 10:49:45.476868', '17', null, null);
INSERT INTO "public"."files" VALUES ('12', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '18', '3.Tech and Elitist Design', null, null, '2017-07-03 10:49:45.476868', '18', null, null);
INSERT INTO "public"."files" VALUES ('13', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '19', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:24.848189', '19', null, null);
INSERT INTO "public"."files" VALUES ('13', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '20', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:24.848189', '20', null, null);
INSERT INTO "public"."files" VALUES ('13', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '21', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:24.848189', '21', null, null);
INSERT INTO "public"."files" VALUES ('2', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', 'article_image', '1', '1.Everything You Need to Know About AR in 5 Minutes', null, '1', '2017-07-02 01:45:21.834494', '1', null, null);
INSERT INTO "public"."files" VALUES ('2', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', 'article_image', '2', '2.Everything You Need to Know About AR in 5 Minutes', null, '1', '2017-07-02 01:45:21.834494', '2', null, null);
INSERT INTO "public"."files" VALUES ('2', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', 'article_image', '3', '2.Everything You Need to Know About AR in 5 Minutes', null, '1', '2017-07-02 01:45:21.834494', '3', null, null);
INSERT INTO "public"."files" VALUES ('3', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', 'article_image', '4', '1.Because Browser Diversity Is Good For The Web', null, '1', '2017-07-02 01:47:28.716739', '4', null, null);
INSERT INTO "public"."files" VALUES ('3', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', 'article_image', '5', '2.Because Browser Diversity Is Good For The Web', null, '1', '2017-07-02 01:47:28.716739', '5', null, null);
INSERT INTO "public"."files" VALUES ('3', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', 'article_image', '6', '3.Because Browser Diversity Is Good For The Web', null, '1', '2017-07-02 01:47:28.716739', '6', null, null);
INSERT INTO "public"."files" VALUES ('4', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', 'article_image', '7', '1.Tech and Elitist Design', null, '1', '2017-07-02 01:50:40.172856', '7', null, null);
INSERT INTO "public"."files" VALUES ('4', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', 'article_image', '8', '2.Tech and Elitist Design', null, '1', '2017-07-02 01:50:40.172856', '8', null, null);
INSERT INTO "public"."files" VALUES ('4', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', 'article_image', '9', '3.Tech and Elitist Design', null, '1', '2017-07-02 01:50:40.172856', '9', null, null);
INSERT INTO "public"."files" VALUES ('5', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '10', '1.Tech and Elitist Design', null, null, '2017-07-02 02:33:22.996738', '10', null, null);
INSERT INTO "public"."files" VALUES ('5', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '11', '2.Tech and Elitist Design', null, null, '2017-07-02 02:33:22.996738', '11', null, null);
INSERT INTO "public"."files" VALUES ('5', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '12', '3.Tech and Elitist Design', null, null, '2017-07-02 02:33:22.996738', '12', null, null);
INSERT INTO "public"."files" VALUES ('14', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '22', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.306652', '22', null, null);
INSERT INTO "public"."files" VALUES ('14', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '23', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.306652', '23', null, null);
INSERT INTO "public"."files" VALUES ('14', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '24', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.306652', '24', null, null);
INSERT INTO "public"."files" VALUES ('15', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '25', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.427728', '25', null, null);
INSERT INTO "public"."files" VALUES ('15', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '26', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.427728', '26', null, null);
INSERT INTO "public"."files" VALUES ('15', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '27', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.427728', '27', null, null);
INSERT INTO "public"."files" VALUES ('16', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '28', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.550308', '28', null, null);
INSERT INTO "public"."files" VALUES ('16', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '29', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.550308', '29', null, null);
INSERT INTO "public"."files" VALUES ('16', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '30', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.550308', '30', null, null);
INSERT INTO "public"."files" VALUES ('17', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '31', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.670711', '31', null, null);
INSERT INTO "public"."files" VALUES ('17', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '32', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.670711', '32', null, null);
INSERT INTO "public"."files" VALUES ('17', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '33', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.670711', '33', null, null);
INSERT INTO "public"."files" VALUES ('18', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '34', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.778139', '34', null, null);
INSERT INTO "public"."files" VALUES ('18', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '35', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.778139', '35', null, null);
INSERT INTO "public"."files" VALUES ('18', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '36', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.778139', '36', null, null);
INSERT INTO "public"."files" VALUES ('19', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '37', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.91413', '37', null, null);
INSERT INTO "public"."files" VALUES ('19', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '38', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.91413', '38', null, null);
INSERT INTO "public"."files" VALUES ('19', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '39', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:29.91413', '39', null, null);
INSERT INTO "public"."files" VALUES ('20', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '40', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.143617', '40', null, null);
INSERT INTO "public"."files" VALUES ('20', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '41', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.143617', '41', null, null);
INSERT INTO "public"."files" VALUES ('20', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '42', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.143617', '42', null, null);
INSERT INTO "public"."files" VALUES ('21', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '43', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.294931', '43', null, null);
INSERT INTO "public"."files" VALUES ('21', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '44', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.294931', '44', null, null);
INSERT INTO "public"."files" VALUES ('21', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '45', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.294931', '45', null, null);
INSERT INTO "public"."files" VALUES ('22', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '46', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.531857', '46', null, null);
INSERT INTO "public"."files" VALUES ('22', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '47', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.531857', '47', null, null);
INSERT INTO "public"."files" VALUES ('22', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '48', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.531857', '48', null, null);
INSERT INTO "public"."files" VALUES ('23', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '49', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.687084', '49', null, null);
INSERT INTO "public"."files" VALUES ('23', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '50', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.687084', '50', null, null);
INSERT INTO "public"."files" VALUES ('23', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '51', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.687084', '51', null, null);
INSERT INTO "public"."files" VALUES ('24', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '52', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.814974', '52', null, null);
INSERT INTO "public"."files" VALUES ('24', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '53', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.814974', '53', null, null);
INSERT INTO "public"."files" VALUES ('24', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '54', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.814974', '54', null, null);
INSERT INTO "public"."files" VALUES ('25', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '55', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.946285', '55', null, null);
INSERT INTO "public"."files" VALUES ('25', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '56', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.946285', '56', null, null);
INSERT INTO "public"."files" VALUES ('25', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '57', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:30.946285', '57', null, null);
INSERT INTO "public"."files" VALUES ('26', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '58', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.075702', '58', null, null);
INSERT INTO "public"."files" VALUES ('26', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '59', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.075702', '59', null, null);
INSERT INTO "public"."files" VALUES ('26', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '60', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.075702', '60', null, null);
INSERT INTO "public"."files" VALUES ('27', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '61', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.231267', '61', null, null);
INSERT INTO "public"."files" VALUES ('27', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '62', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.231267', '62', null, null);
INSERT INTO "public"."files" VALUES ('27', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '63', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.231267', '63', null, null);
INSERT INTO "public"."files" VALUES ('28', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '64', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.36308', '64', null, null);
INSERT INTO "public"."files" VALUES ('28', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '65', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.36308', '65', null, null);
INSERT INTO "public"."files" VALUES ('28', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '66', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.36308', '66', null, null);
INSERT INTO "public"."files" VALUES ('29', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '67', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.494004', '67', null, null);
INSERT INTO "public"."files" VALUES ('29', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '68', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.494004', '68', null, null);
INSERT INTO "public"."files" VALUES ('29', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '69', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.494004', '69', null, null);
INSERT INTO "public"."files" VALUES ('30', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '70', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.645421', '70', null, null);
INSERT INTO "public"."files" VALUES ('30', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '71', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.645421', '71', null, null);
INSERT INTO "public"."files" VALUES ('30', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '72', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.645421', '72', null, null);
INSERT INTO "public"."files" VALUES ('31', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '73', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.795367', '73', null, null);
INSERT INTO "public"."files" VALUES ('31', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '74', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.795367', '74', null, null);
INSERT INTO "public"."files" VALUES ('31', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '75', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:31.795367', '75', null, null);
INSERT INTO "public"."files" VALUES ('32', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '76', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.027375', '76', null, null);
INSERT INTO "public"."files" VALUES ('32', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '77', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.027375', '77', null, null);
INSERT INTO "public"."files" VALUES ('32', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '78', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.027375', '78', null, null);
INSERT INTO "public"."files" VALUES ('33', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '79', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.155764', '79', null, null);
INSERT INTO "public"."files" VALUES ('33', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '80', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.155764', '80', null, null);
INSERT INTO "public"."files" VALUES ('33', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '81', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.155764', '81', null, null);
INSERT INTO "public"."files" VALUES ('34', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '82', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.3106', '82', null, null);
INSERT INTO "public"."files" VALUES ('34', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '83', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.3106', '83', null, null);
INSERT INTO "public"."files" VALUES ('34', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '84', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.3106', '84', null, null);
INSERT INTO "public"."files" VALUES ('35', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '85', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.448011', '85', null, null);
INSERT INTO "public"."files" VALUES ('35', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '86', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.448011', '86', null, null);
INSERT INTO "public"."files" VALUES ('35', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '87', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.448011', '87', null, null);
INSERT INTO "public"."files" VALUES ('36', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '88', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.585843', '88', null, null);
INSERT INTO "public"."files" VALUES ('36', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '89', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.585843', '89', null, null);
INSERT INTO "public"."files" VALUES ('36', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '90', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.585843', '90', null, null);
INSERT INTO "public"."files" VALUES ('37', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '91', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.751704', '91', null, null);
INSERT INTO "public"."files" VALUES ('37', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '92', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.751704', '92', null, null);
INSERT INTO "public"."files" VALUES ('37', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '93', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.751704', '93', null, null);
INSERT INTO "public"."files" VALUES ('38', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '94', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.886449', '94', null, null);
INSERT INTO "public"."files" VALUES ('38', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '95', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.886449', '95', null, null);
INSERT INTO "public"."files" VALUES ('38', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '96', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:33.886449', '96', null, null);
INSERT INTO "public"."files" VALUES ('39', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '97', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.059953', '97', null, null);
INSERT INTO "public"."files" VALUES ('39', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '98', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.059953', '98', null, null);
INSERT INTO "public"."files" VALUES ('39', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '99', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.059953', '99', null, null);
INSERT INTO "public"."files" VALUES ('40', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '100', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.195695', '100', null, null);
INSERT INTO "public"."files" VALUES ('40', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '101', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.195695', '101', null, null);
INSERT INTO "public"."files" VALUES ('40', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '102', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.195695', '102', null, null);
INSERT INTO "public"."files" VALUES ('41', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '103', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.358052', '103', null, null);
INSERT INTO "public"."files" VALUES ('41', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '104', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.358052', '104', null, null);
INSERT INTO "public"."files" VALUES ('41', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '105', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.358052', '105', null, null);
INSERT INTO "public"."files" VALUES ('42', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '106', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.514597', '106', null, null);
INSERT INTO "public"."files" VALUES ('42', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '107', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.514597', '107', null, null);
INSERT INTO "public"."files" VALUES ('42', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '108', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.514597', '108', null, null);
INSERT INTO "public"."files" VALUES ('43', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '109', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.669555', '109', null, null);
INSERT INTO "public"."files" VALUES ('43', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '110', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.669555', '110', null, null);
INSERT INTO "public"."files" VALUES ('43', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '111', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.669555', '111', null, null);
INSERT INTO "public"."files" VALUES ('44', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '112', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.84057', '112', null, null);
INSERT INTO "public"."files" VALUES ('44', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '113', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.84057', '113', null, null);
INSERT INTO "public"."files" VALUES ('44', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '114', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:34.84057', '114', null, null);
INSERT INTO "public"."files" VALUES ('45', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '115', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.010349', '115', null, null);
INSERT INTO "public"."files" VALUES ('45', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '116', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.010349', '116', null, null);
INSERT INTO "public"."files" VALUES ('45', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '117', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.010349', '117', null, null);
INSERT INTO "public"."files" VALUES ('46', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '118', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.181979', '118', null, null);
INSERT INTO "public"."files" VALUES ('46', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '119', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.181979', '119', null, null);
INSERT INTO "public"."files" VALUES ('46', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '120', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.181979', '120', null, null);
INSERT INTO "public"."files" VALUES ('47', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '121', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.351213', '121', null, null);
INSERT INTO "public"."files" VALUES ('47', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '122', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.351213', '122', null, null);
INSERT INTO "public"."files" VALUES ('47', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '123', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.351213', '123', null, null);
INSERT INTO "public"."files" VALUES ('48', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '124', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.521824', '124', null, null);
INSERT INTO "public"."files" VALUES ('48', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '125', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.521824', '125', null, null);
INSERT INTO "public"."files" VALUES ('48', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '126', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.521824', '126', null, null);
INSERT INTO "public"."files" VALUES ('49', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '127', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.686228', '127', null, null);
INSERT INTO "public"."files" VALUES ('49', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '128', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.686228', '128', null, null);
INSERT INTO "public"."files" VALUES ('49', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '129', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.686228', '129', null, null);
INSERT INTO "public"."files" VALUES ('50', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '130', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.864634', '130', null, null);
INSERT INTO "public"."files" VALUES ('50', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '131', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.864634', '131', null, null);
INSERT INTO "public"."files" VALUES ('50', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '132', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:35.864634', '132', null, null);
INSERT INTO "public"."files" VALUES ('51', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '133', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.019511', '133', null, null);
INSERT INTO "public"."files" VALUES ('51', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '134', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.019511', '134', null, null);
INSERT INTO "public"."files" VALUES ('51', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '135', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.019511', '135', null, null);
INSERT INTO "public"."files" VALUES ('52', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '136', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.189214', '136', null, null);
INSERT INTO "public"."files" VALUES ('52', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '137', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.189214', '137', null, null);
INSERT INTO "public"."files" VALUES ('52', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '138', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.189214', '138', null, null);
INSERT INTO "public"."files" VALUES ('53', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '139', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.360837', '139', null, null);
INSERT INTO "public"."files" VALUES ('53', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '140', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.360837', '140', null, null);
INSERT INTO "public"."files" VALUES ('53', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '141', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.360837', '141', null, null);
INSERT INTO "public"."files" VALUES ('54', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '142', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.53886', '142', null, null);
INSERT INTO "public"."files" VALUES ('54', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '143', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.53886', '143', null, null);
INSERT INTO "public"."files" VALUES ('54', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '144', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.53886', '144', null, null);
INSERT INTO "public"."files" VALUES ('55', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '145', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.695641', '145', null, null);
INSERT INTO "public"."files" VALUES ('55', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '146', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.695641', '146', null, null);
INSERT INTO "public"."files" VALUES ('55', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '147', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.695641', '147', null, null);
INSERT INTO "public"."files" VALUES ('56', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '148', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.840947', '148', null, null);
INSERT INTO "public"."files" VALUES ('56', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '149', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.840947', '149', null, null);
INSERT INTO "public"."files" VALUES ('56', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '150', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:36.840947', '150', null, null);
INSERT INTO "public"."files" VALUES ('57', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '151', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.002847', '151', null, null);
INSERT INTO "public"."files" VALUES ('57', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '152', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.002847', '152', null, null);
INSERT INTO "public"."files" VALUES ('57', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '153', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.002847', '153', null, null);
INSERT INTO "public"."files" VALUES ('58', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '154', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.167338', '154', null, null);
INSERT INTO "public"."files" VALUES ('58', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '155', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.167338', '155', null, null);
INSERT INTO "public"."files" VALUES ('58', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '156', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.167338', '156', null, null);
INSERT INTO "public"."files" VALUES ('59', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '157', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.336405', '157', null, null);
INSERT INTO "public"."files" VALUES ('59', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '158', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.336405', '158', null, null);
INSERT INTO "public"."files" VALUES ('59', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '159', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.336405', '159', null, null);
INSERT INTO "public"."files" VALUES ('60', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '160', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.507927', '160', null, null);
INSERT INTO "public"."files" VALUES ('60', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '161', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.507927', '161', null, null);
INSERT INTO "public"."files" VALUES ('60', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '162', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.507927', '162', null, null);
INSERT INTO "public"."files" VALUES ('61', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '163', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.677247', '163', null, null);
INSERT INTO "public"."files" VALUES ('61', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '164', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.677247', '164', null, null);
INSERT INTO "public"."files" VALUES ('61', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '165', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.677247', '165', null, null);
INSERT INTO "public"."files" VALUES ('62', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '166', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.843874', '166', null, null);
INSERT INTO "public"."files" VALUES ('62', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '167', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.843874', '167', null, null);
INSERT INTO "public"."files" VALUES ('62', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '168', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:37.843874', '168', null, null);
INSERT INTO "public"."files" VALUES ('63', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '169', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.010289', '169', null, null);
INSERT INTO "public"."files" VALUES ('63', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '170', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.010289', '170', null, null);
INSERT INTO "public"."files" VALUES ('63', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '171', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.010289', '171', null, null);
INSERT INTO "public"."files" VALUES ('64', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '172', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.187865', '172', null, null);
INSERT INTO "public"."files" VALUES ('64', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '173', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.187865', '173', null, null);
INSERT INTO "public"."files" VALUES ('64', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '174', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.187865', '174', null, null);
INSERT INTO "public"."files" VALUES ('65', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '175', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.358944', '175', null, null);
INSERT INTO "public"."files" VALUES ('65', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '176', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.358944', '176', null, null);
INSERT INTO "public"."files" VALUES ('65', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '177', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.358944', '177', null, null);
INSERT INTO "public"."files" VALUES ('66', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '178', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.53143', '178', null, null);
INSERT INTO "public"."files" VALUES ('66', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '179', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.53143', '179', null, null);
INSERT INTO "public"."files" VALUES ('66', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '180', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.53143', '180', null, null);
INSERT INTO "public"."files" VALUES ('67', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '181', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.69401', '181', null, null);
INSERT INTO "public"."files" VALUES ('67', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '182', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.69401', '182', null, null);
INSERT INTO "public"."files" VALUES ('67', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '183', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.69401', '183', null, null);
INSERT INTO "public"."files" VALUES ('68', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '184', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.84841', '184', null, null);
INSERT INTO "public"."files" VALUES ('68', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '185', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.84841', '185', null, null);
INSERT INTO "public"."files" VALUES ('68', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '186', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:38.84841', '186', null, null);
INSERT INTO "public"."files" VALUES ('69', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '187', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.019882', '187', null, null);
INSERT INTO "public"."files" VALUES ('69', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '188', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.019882', '188', null, null);
INSERT INTO "public"."files" VALUES ('69', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '189', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.019882', '189', null, null);
INSERT INTO "public"."files" VALUES ('70', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '190', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.190943', '190', null, null);
INSERT INTO "public"."files" VALUES ('70', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '191', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.190943', '191', null, null);
INSERT INTO "public"."files" VALUES ('70', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '192', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.190943', '192', null, null);
INSERT INTO "public"."files" VALUES ('71', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '193', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.365853', '193', null, null);
INSERT INTO "public"."files" VALUES ('71', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '194', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.365853', '194', null, null);
INSERT INTO "public"."files" VALUES ('71', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '195', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.365853', '195', null, null);
INSERT INTO "public"."files" VALUES ('72', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '196', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.553231', '196', null, null);
INSERT INTO "public"."files" VALUES ('72', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '197', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.553231', '197', null, null);
INSERT INTO "public"."files" VALUES ('72', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '198', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.553231', '198', null, null);
INSERT INTO "public"."files" VALUES ('73', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '199', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.727631', '199', null, null);
INSERT INTO "public"."files" VALUES ('73', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '200', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.727631', '200', null, null);
INSERT INTO "public"."files" VALUES ('73', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '201', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:39.727631', '201', null, null);
INSERT INTO "public"."files" VALUES ('74', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '202', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.052771', '202', null, null);
INSERT INTO "public"."files" VALUES ('74', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '203', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.052771', '203', null, null);
INSERT INTO "public"."files" VALUES ('74', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '204', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.052771', '204', null, null);
INSERT INTO "public"."files" VALUES ('75', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '205', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.222946', '205', null, null);
INSERT INTO "public"."files" VALUES ('75', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '206', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.222946', '206', null, null);
INSERT INTO "public"."files" VALUES ('75', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '207', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.222946', '207', null, null);
INSERT INTO "public"."files" VALUES ('76', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '208', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.383556', '208', null, null);
INSERT INTO "public"."files" VALUES ('76', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '209', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.383556', '209', null, null);
INSERT INTO "public"."files" VALUES ('76', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '210', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.383556', '210', null, null);
INSERT INTO "public"."files" VALUES ('77', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '211', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.521287', '211', null, null);
INSERT INTO "public"."files" VALUES ('77', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '212', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.521287', '212', null, null);
INSERT INTO "public"."files" VALUES ('77', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '213', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.521287', '213', null, null);
INSERT INTO "public"."files" VALUES ('78', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '214', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.692075', '214', null, null);
INSERT INTO "public"."files" VALUES ('78', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '215', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.692075', '215', null, null);
INSERT INTO "public"."files" VALUES ('78', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '216', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.692075', '216', null, null);
INSERT INTO "public"."files" VALUES ('79', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '217', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.84274', '217', null, null);
INSERT INTO "public"."files" VALUES ('79', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '218', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.84274', '218', null, null);
INSERT INTO "public"."files" VALUES ('79', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '219', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:40.84274', '219', null, null);
INSERT INTO "public"."files" VALUES ('80', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '220', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.017168', '220', null, null);
INSERT INTO "public"."files" VALUES ('80', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '221', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.017168', '221', null, null);
INSERT INTO "public"."files" VALUES ('80', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '222', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.017168', '222', null, null);
INSERT INTO "public"."files" VALUES ('81', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '223', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.182603', '223', null, null);
INSERT INTO "public"."files" VALUES ('81', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '224', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.182603', '224', null, null);
INSERT INTO "public"."files" VALUES ('81', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '225', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.182603', '225', null, null);
INSERT INTO "public"."files" VALUES ('82', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '226', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.34396', '226', null, null);
INSERT INTO "public"."files" VALUES ('82', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '227', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.34396', '227', null, null);
INSERT INTO "public"."files" VALUES ('82', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '228', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.34396', '228', null, null);
INSERT INTO "public"."files" VALUES ('83', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '229', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.515697', '229', null, null);
INSERT INTO "public"."files" VALUES ('83', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '230', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.515697', '230', null, null);
INSERT INTO "public"."files" VALUES ('83', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '231', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.515697', '231', null, null);
INSERT INTO "public"."files" VALUES ('84', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '232', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.68404', '232', null, null);
INSERT INTO "public"."files" VALUES ('84', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '233', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.68404', '233', null, null);
INSERT INTO "public"."files" VALUES ('84', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '234', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.68404', '234', null, null);
INSERT INTO "public"."files" VALUES ('85', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '235', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.849774', '235', null, null);
INSERT INTO "public"."files" VALUES ('85', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '236', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.849774', '236', null, null);
INSERT INTO "public"."files" VALUES ('85', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '237', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:41.849774', '237', null, null);
INSERT INTO "public"."files" VALUES ('86', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '238', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.025852', '238', null, null);
INSERT INTO "public"."files" VALUES ('86', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '239', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.025852', '239', null, null);
INSERT INTO "public"."files" VALUES ('86', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '240', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.025852', '240', null, null);
INSERT INTO "public"."files" VALUES ('87', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '241', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.205228', '241', null, null);
INSERT INTO "public"."files" VALUES ('87', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '242', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.205228', '242', null, null);
INSERT INTO "public"."files" VALUES ('87', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '243', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.205228', '243', null, null);
INSERT INTO "public"."files" VALUES ('88', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '244', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.360909', '244', null, null);
INSERT INTO "public"."files" VALUES ('88', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '245', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.360909', '245', null, null);
INSERT INTO "public"."files" VALUES ('88', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '246', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.360909', '246', null, null);
INSERT INTO "public"."files" VALUES ('89', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '247', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.532873', '247', null, null);
INSERT INTO "public"."files" VALUES ('89', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '248', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.532873', '248', null, null);
INSERT INTO "public"."files" VALUES ('89', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '249', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.532873', '249', null, null);
INSERT INTO "public"."files" VALUES ('90', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '250', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.694937', '250', null, null);
INSERT INTO "public"."files" VALUES ('90', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '251', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.694937', '251', null, null);
INSERT INTO "public"."files" VALUES ('90', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '252', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.694937', '252', null, null);
INSERT INTO "public"."files" VALUES ('91', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '253', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.864967', '253', null, null);
INSERT INTO "public"."files" VALUES ('91', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '254', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.864967', '254', null, null);
INSERT INTO "public"."files" VALUES ('91', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '255', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:42.864967', '255', null, null);
INSERT INTO "public"."files" VALUES ('92', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '256', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.050967', '256', null, null);
INSERT INTO "public"."files" VALUES ('92', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '257', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.050967', '257', null, null);
INSERT INTO "public"."files" VALUES ('92', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '258', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.050967', '258', null, null);
INSERT INTO "public"."files" VALUES ('93', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '259', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.238766', '259', null, null);
INSERT INTO "public"."files" VALUES ('93', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '260', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.238766', '260', null, null);
INSERT INTO "public"."files" VALUES ('93', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '261', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.238766', '261', null, null);
INSERT INTO "public"."files" VALUES ('94', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '262', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.416623', '262', null, null);
INSERT INTO "public"."files" VALUES ('94', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '263', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.416623', '263', null, null);
INSERT INTO "public"."files" VALUES ('94', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '264', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.416623', '264', null, null);
INSERT INTO "public"."files" VALUES ('95', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '265', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.587568', '265', null, null);
INSERT INTO "public"."files" VALUES ('95', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '266', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.587568', '266', null, null);
INSERT INTO "public"."files" VALUES ('95', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '267', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.587568', '267', null, null);
INSERT INTO "public"."files" VALUES ('96', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '268', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.758161', '268', null, null);
INSERT INTO "public"."files" VALUES ('96', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '269', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.758161', '269', null, null);
INSERT INTO "public"."files" VALUES ('96', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '270', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.758161', '270', null, null);
INSERT INTO "public"."files" VALUES ('97', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '271', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.944131', '271', null, null);
INSERT INTO "public"."files" VALUES ('97', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '272', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.944131', '272', null, null);
INSERT INTO "public"."files" VALUES ('97', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '273', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:43.944131', '273', null, null);
INSERT INTO "public"."files" VALUES ('98', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '274', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.116078', '274', null, null);
INSERT INTO "public"."files" VALUES ('98', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '275', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.116078', '275', null, null);
INSERT INTO "public"."files" VALUES ('98', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '276', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.116078', '276', null, null);
INSERT INTO "public"."files" VALUES ('99', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '277', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.294156', '277', null, null);
INSERT INTO "public"."files" VALUES ('99', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '278', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.294156', '278', null, null);
INSERT INTO "public"."files" VALUES ('99', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '279', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.294156', '279', null, null);
INSERT INTO "public"."files" VALUES ('100', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '280', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.481015', '280', null, null);
INSERT INTO "public"."files" VALUES ('100', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '281', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.481015', '281', null, null);
INSERT INTO "public"."files" VALUES ('100', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '282', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.481015', '282', null, null);
INSERT INTO "public"."files" VALUES ('101', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '283', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.678606', '283', null, null);
INSERT INTO "public"."files" VALUES ('101', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '284', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.678606', '284', null, null);
INSERT INTO "public"."files" VALUES ('101', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '285', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.678606', '285', null, null);
INSERT INTO "public"."files" VALUES ('102', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '286', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.85757', '286', null, null);
INSERT INTO "public"."files" VALUES ('102', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '287', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.85757', '287', null, null);
INSERT INTO "public"."files" VALUES ('102', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '288', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:44.85757', '288', null, null);
INSERT INTO "public"."files" VALUES ('103', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '289', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:45.041992', '289', null, null);
INSERT INTO "public"."files" VALUES ('103', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '290', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:45.041992', '290', null, null);
INSERT INTO "public"."files" VALUES ('103', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '291', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:45.041992', '291', null, null);
INSERT INTO "public"."files" VALUES ('104', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '292', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:45.209451', '292', null, null);
INSERT INTO "public"."files" VALUES ('104', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '293', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:45.209451', '293', null, null);
INSERT INTO "public"."files" VALUES ('104', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '294', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:45.209451', '294', null, null);
INSERT INTO "public"."files" VALUES ('105', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '295', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:45.378054', '295', null, null);
INSERT INTO "public"."files" VALUES ('105', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '296', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:45.378054', '296', null, null);
INSERT INTO "public"."files" VALUES ('105', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '297', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:45.378054', '297', null, null);
INSERT INTO "public"."files" VALUES ('106', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '298', '1.Tech and Elitist Design', null, null, '2017-07-07 13:53:45.53108', '298', null, null);
INSERT INTO "public"."files" VALUES ('106', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '299', '2.Tech and Elitist Design', null, null, '2017-07-07 13:53:45.53108', '299', null, null);
INSERT INTO "public"."files" VALUES ('106', 'https://scontent.fpnh1-2.fna.fbcdn.net/v/t1.0-9/19601500_1631890416843686_1058219809182671926_n.png?oh=90620671649d7bdce26dec1cfac2e123&oe=59D401B2', '8888', null, '300', '3.Tech and Elitist Design', null, null, '2017-07-07 13:53:45.53108', '300', null, null);
COMMIT;


-- ----------------------------
--  Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."articles_id_seq" RESTART 107 OWNED BY "articles"."id";
ALTER SEQUENCE "public"."articles_index_seq" RESTART 107 OWNED BY "articles"."index";
ALTER SEQUENCE "public"."categories_id_seq" RESTART 35 OWNED BY "categories"."id";
ALTER SEQUENCE "public"."categories_index_seq" RESTART 32 OWNED BY "categories"."index";
ALTER SEQUENCE "public"."comments_id_seq" RESTART 2 OWNED BY "comments"."id";
ALTER SEQUENCE "public"."comments_index_seq" RESTART 2 OWNED BY "comments"."index";
ALTER SEQUENCE "public"."files_id_seq" RESTART 301 OWNED BY "files"."id";
ALTER SEQUENCE "public"."files_index_seq" RESTART 301 OWNED BY "files"."index";
ALTER SEQUENCE "public"."permissions_id_seq" RESTART 2 OWNED BY "permissions"."id";
ALTER SEQUENCE "public"."permissions_index_seq" RESTART 2 OWNED BY "permissions"."index";
ALTER SEQUENCE "public"."roles_id_seq" RESTART 2 OWNED BY "roles"."id";
ALTER SEQUENCE "public"."roles_index_seq" RESTART 2 OWNED BY "roles"."index";
ALTER SEQUENCE "public"."tags_id_seq" RESTART 2 OWNED BY "tags"."id";
ALTER SEQUENCE "public"."tags_index_seq" RESTART 2 OWNED BY "tags"."index";
ALTER SEQUENCE "public"."users_id_seq" RESTART 2 OWNED BY "users"."id";
ALTER SEQUENCE "public"."users_index_seq" RESTART 2 OWNED BY "users"."index";
-- ----------------------------
--  Primary key structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table roles
-- ----------------------------
ALTER TABLE "public"."roles" ADD CONSTRAINT "roles_uuid_key" UNIQUE ("uuid") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table permissions
-- ----------------------------
ALTER TABLE "public"."permissions" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table permissions
-- ----------------------------
ALTER TABLE "public"."permissions" ADD CONSTRAINT "permissions_uuid_key" UNIQUE ("uuid") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_uuid_key" UNIQUE ("uuid") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table categories
-- ----------------------------
ALTER TABLE "public"."categories" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table categories
-- ----------------------------
ALTER TABLE "public"."categories" ADD CONSTRAINT "categories_uuid_key" UNIQUE ("uuid") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table articles
-- ----------------------------
ALTER TABLE "public"."articles" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table articles
-- ----------------------------
ALTER TABLE "public"."articles" ADD CONSTRAINT "articles_uuid_key" UNIQUE ("uuid") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table tags
-- ----------------------------
ALTER TABLE "public"."tags" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table tags
-- ----------------------------
ALTER TABLE "public"."tags" ADD CONSTRAINT "tags_uuid_key" UNIQUE ("uuid") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table comments
-- ----------------------------
ALTER TABLE "public"."comments" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table comments
-- ----------------------------
ALTER TABLE "public"."comments" ADD CONSTRAINT "comments_uuid_key" UNIQUE ("uuid") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table files
-- ----------------------------
ALTER TABLE "public"."files" ADD PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table files
-- ----------------------------
ALTER TABLE "public"."files" ADD CONSTRAINT "files_uuid_key" UNIQUE ("uuid") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table user_roles
-- ----------------------------
ALTER TABLE "public"."user_roles" ADD CONSTRAINT "user_roles_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."roles" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."user_roles" ADD CONSTRAINT "user_roles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table role_permissions
-- ----------------------------
ALTER TABLE "public"."role_permissions" ADD CONSTRAINT "role_permissions_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "public"."roles" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."role_permissions" ADD CONSTRAINT "role_permissions_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "public"."permissions" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table articles
-- ----------------------------
ALTER TABLE "public"."articles" ADD CONSTRAINT "articles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."articles" ADD CONSTRAINT "articles_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."categories" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table article_tags
-- ----------------------------
ALTER TABLE "public"."article_tags" ADD CONSTRAINT "article_tags_article_id_fkey" FOREIGN KEY ("article_id") REFERENCES "public"."articles" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."article_tags" ADD CONSTRAINT "article_tags_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "public"."tags" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table comments
-- ----------------------------
ALTER TABLE "public"."comments" ADD CONSTRAINT "comments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."comments" ADD CONSTRAINT "comments_article_id_fkey" FOREIGN KEY ("article_id") REFERENCES "public"."articles" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."comments" ADD CONSTRAINT "comments_reply_id_fkey" FOREIGN KEY ("reply_id") REFERENCES "public"."comments" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

