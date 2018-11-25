SET FOREIGN_KEY_CHECKS=0
;

DROP TABLE IF EXISTS `auth` CASCADE
;

DROP TABLE IF EXISTS `chat_group` CASCADE
;

DROP TABLE IF EXISTS `collection` CASCADE
;

DROP TABLE IF EXISTS `dictionary` CASCADE
;

DROP TABLE IF EXISTS `dictionary_type` CASCADE
;

DROP TABLE IF EXISTS `file` CASCADE
;

DROP TABLE IF EXISTS `message` CASCADE
;

DROP TABLE IF EXISTS `org_role` CASCADE
;

DROP TABLE IF EXISTS `organization` CASCADE
;

DROP TABLE IF EXISTS `role` CASCADE
;

DROP TABLE IF EXISTS `role_auth` CASCADE
;

DROP TABLE IF EXISTS `routine` CASCADE
;

DROP TABLE IF EXISTS `server_config` CASCADE
;

DROP TABLE IF EXISTS `user` CASCADE
;

DROP TABLE IF EXISTS `user_login_log` CASCADE
;

DROP TABLE IF EXISTS `user_org` CASCADE
;

DROP TABLE IF EXISTS `user_org_role` CASCADE
;

DROP TABLE IF EXISTS `work_group_member` CASCADE
;

CREATE TABLE `auth`
(
	`auth_id` VARCHAR(32) NOT NULL,
	`auth_name` VARCHAR(50),
	`auth_url` VARCHAR(200),
	`parent_id` VARCHAR(32),
	`auth_type` VARCHAR(3),
	`api_url` VARCHAR(200),
	CONSTRAINT `PK_auth` PRIMARY KEY (`auth_id`)
)
;

CREATE TABLE `chat_group`
(
	`chat_group_id` VARCHAR(32) NOT NULL,
	`org_id` VARCHAR(32),
	`user_id` VARCHAR(32),
	`chat_group_name` VARCHAR(50),
	CONSTRAINT `PK_chat_group` PRIMARY KEY (`chat_group_id`)
)
;

CREATE TABLE `collection`
(
	`collection_id` VARCHAR(32) NOT NULL,
	`user_id` VARCHAR(32),
	`create_time` DATETIME(0),
	`collection_type` VARCHAR(3),
	`content` VARCHAR(10000),
	CONSTRAINT `PK_collection` PRIMARY KEY (`collection_id`)
)
;

CREATE TABLE `dictionary`
(
	`dictionary_id` VARCHAR(32) NOT NULL,
	`code_item_id` VARCHAR(50),
	`code_id` VARCHAR(50),
	`code_name` VARCHAR(50),
	`create_time` DATETIME(0),
	`create_person` VARCHAR(32),
	`modify_time` DATETIME(0),
	`modify_person` VARCHAR(32),
	`parent_code_id` VARCHAR(50),
	CONSTRAINT `PK_dictionary` PRIMARY KEY (`dictionary_id`)
)
;

CREATE TABLE `dictionary_type`
(
	`code_item_id` VARCHAR(50) NOT NULL,
	`code_item_name` VARCHAR(50),
	`parent_id` VARCHAR(50),
	`create_time` DATETIME(0),
	`create_person` VARCHAR(32),
	`modify_person` VARCHAR(32),
	`modify_time` DATETIME(0),
	CONSTRAINT `PK_dictionary_type` PRIMARY KEY (`code_item_id`)
)
;

CREATE TABLE `file`
(
	`file_id` VARCHAR(50) NOT NULL,
	`origin_name` VARCHAR(100),
	`file_size` NUMERIC(18,0),
	`create_time` DATETIME(0),
	`busi_id` VARCHAR(32),
	`comp_id` VARCHAR(32),
	`mime_type` VARCHAR(100),
	`user_id` VARCHAR(32),
	`valid` VARCHAR(3) default 'Y',
	CONSTRAINT `PK_file` PRIMARY KEY (`file_id`)
)
;

CREATE TABLE `message`
(
	`id` VARCHAR(32) NOT NULL,
	`from` VARCHAR(32),
	`to` VARCHAR(32),
	`cmd` NUMERIC(3,0),
	`create_time` DATETIME(0),
	`chat_type` NUMERIC(3,0),
	`group_id` VARCHAR(50),
	`content` VARCHAR(5000),
	CONSTRAINT `PK_message` PRIMARY KEY (`id`)
)
;

CREATE TABLE `org_role`
(
	`org_role_id` VARCHAR(32) NOT NULL,
	`org_id` VARCHAR(32),
	`org_role_numbers` NUMERIC(10,0),
	`role_id` VARCHAR(32),
	`role_name` VARCHAR(50),
	CONSTRAINT `PK_org_role` PRIMARY KEY (`org_role_id`)
)
;

CREATE TABLE `organization`
(
	`org_id` VARCHAR(32) NOT NULL,
	`parent_id` VARCHAR(32),
	`org_type` VARCHAR(3),
	`pro_type` VARCHAR(3),
	`org_description` VARCHAR(10000),
	`org_name` VARCHAR(50),
	`org_image_url` VARCHAR(255),
	`org_annouce` VARCHAR(100),
	`valid` VARCHAR(3) NOT NULL default 'Y',
	`user_id` VARCHAR(32),
	`create_time` DATETIME,
	CONSTRAINT `PK_organization` PRIMARY KEY (`org_id`)
)
;

CREATE TABLE `role`
(
	`role_id` VARCHAR(32) NOT NULL,
	`role_name` VARCHAR(50),
	`role_description` VARCHAR(255),
	`role_auth_id` VARCHAR(0),
	CONSTRAINT `PK_role` PRIMARY KEY (`role_id`)
)
;

CREATE TABLE `role_auth`
(
	`role_auth_id` VARCHAR(32) NOT NULL,
	`role_id` VARCHAR(32),
	`auth_id` VARCHAR(32),
	CONSTRAINT `PK_role_auth` PRIMARY KEY (`role_auth_id`)
)
;

CREATE TABLE `routine`
(
	`routine_id` VARCHAR(32) NOT NULL,
	`user_id` VARCHAR(32),
	`user_name` VARCHAR(50),
	`routine_type` VARCHAR(3),
	`content` VARCHAR(10000),
	`create_time` DATETIME(0),
	`user_type` VARCHAR(50),
	`org_id` VARCHAR(2),
	CONSTRAINT `PK_routine` PRIMARY KEY (`routine_id`)
)
;

CREATE TABLE `server_config`
(
	`config_id` VARCHAR(32) NOT NULL,
	`mapping_key` VARCHAR(32),
	`mapping_value` VARCHAR(256),
	CONSTRAINT `PK_server_config` PRIMARY KEY (`config_id`)
)
;

CREATE TABLE `user`
(
	`user_id` VARCHAR(32) NOT NULL,
	`user_account` VARCHAR(32),
	`user_password` VARCHAR(32),
	`user_name` VARCHAR(50),
	`user_mobile` VARCHAR(20),
	`user_email` VARCHAR(50),
	`user_image_url` VARCHAR(255),
	`user_description` VARCHAR(255),
	`user_password_changed` DATETIME(0),
	`valid` VARCHAR(3) NOT NULL default 'Y',
	`user_enabled_date` DATETIME(0),
	`user_disabled_date` DATETIME(0),
	`user_account_locked` VARCHAR(2) default 'N',
	`last_login_date` DATETIME(0),
	`create_time` DATETIME(0),
	`create_person` VARCHAR(32),
	`modity_time` DATETIME(0),
	`modify_person` VARCHAR(32),
	`user_sex` VARCHAR(3),
	`user_type` VARCHAR(3),
	CONSTRAINT `PK_Table1` PRIMARY KEY (`user_id`)
)
;

CREATE TABLE `user_login_log`
(
	`login_log_id` VARCHAR(32) NOT NULL,
	`user_account` VARCHAR(32),
	`session_id` VARCHAR(100),
	`logout_time` DATETIME(0),
	`user_ip` VARCHAR(100),
	CONSTRAINT `PK_user_login_log` PRIMARY KEY (`login_log_id`)
)
;

CREATE TABLE `user_org`
(
	`user_org_id` VARCHAR(32) NOT NULL,
	`user_id` VARCHAR(32),
	`org_id` VARCHAR(32),
	`user_name` VARCHAR(50),
	`org_role_id` VARCHAR(32),
	CONSTRAINT `PK_user_org` PRIMARY KEY (`user_org_id`)
)
;

CREATE TABLE `user_org_role`
(
	`org_role_id` VARCHAR(32) NOT NULL,
	`role_id` VARCHAR(32),
	`user_org_id` VARCHAR(32),
	CONSTRAINT `PK_user_org_role` PRIMARY KEY (`org_role_id`)
)
;

CREATE TABLE `work_group_member`
(
	`member_id` VARCHAR(32) NOT NULL,
	`user_id` VARCHAR(32),
	`user_account` VARCHAR(50),
	`chat_group_id` VARCHAR(32),
	`user_name` VARCHAR(50),
	CONSTRAINT `PK_work_group_member` PRIMARY KEY (`member_id`)
)
;

ALTER TABLE `collection` 
 ADD INDEX `IXFK_collection_user` (`user_id` ASC)
;

ALTER TABLE `dictionary` 
 ADD INDEX `IXFK_dictionary_dictionary_type` (`code_item_id` ASC)
;


ALTER TABLE `org_role` 
 ADD INDEX `IXFK_org_role_organization` (`org_id` ASC)
;

ALTER TABLE `org_role` 
 ADD INDEX `IXFK_org_role_role` (`role_id` ASC)
;

ALTER TABLE `organization` 
 ADD INDEX `IXFK_organization_user` (`user_id` ASC)
;

ALTER TABLE `role_auth` 
 ADD INDEX `IXFK_role_auth_auth` (`auth_id` ASC)
;

ALTER TABLE `role_auth` 
 ADD INDEX `IXFK_role_auth_role` (`role_id` ASC)
;

ALTER TABLE `routine` 
 ADD INDEX `IXFK_routine_organization` (`org_id` ASC)
;

ALTER TABLE `user_org` 
 ADD INDEX `IXFK_user_org_organization` (`org_id` ASC)
;

ALTER TABLE `user_org` 
 ADD INDEX `IXFK_user_org_user` (`user_id` ASC)
;

ALTER TABLE `work_group_member` 
 ADD INDEX `IXFK_work_group_member_chat_group` (`chat_group_id` ASC)
;

ALTER TABLE `collection` 
 ADD CONSTRAINT `FK_collection_user`
	FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `dictionary` 
 ADD CONSTRAINT `FK_dictionary_dictionary_type`
	FOREIGN KEY (`code_item_id`) REFERENCES `dictionary_type` (`code_item_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `org_role` 
 ADD CONSTRAINT `FK_org_role_organization`
	FOREIGN KEY (`org_id`) REFERENCES `organization` (`org_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `org_role` 
 ADD CONSTRAINT `FK_org_role_role`
	FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `organization` 
 ADD CONSTRAINT `FK_organization_user`
	FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `role_auth` 
 ADD CONSTRAINT `FK_role_auth_auth`
	FOREIGN KEY (`auth_id`) REFERENCES `auth` (`auth_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `role_auth` 
 ADD CONSTRAINT `FK_role_auth_role`
	FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `routine` 
 ADD CONSTRAINT `FK_routine_organization`
	FOREIGN KEY (`org_id`) REFERENCES `organization` (`org_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `user_org` 
 ADD CONSTRAINT `FK_user_org_organization`
	FOREIGN KEY (`org_id`) REFERENCES `organization` (`org_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `user_org` 
 ADD CONSTRAINT `FK_user_org_user`
	FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `work_group_member` 
 ADD CONSTRAINT `FK_work_group_member_chat_group`
	FOREIGN KEY (`chat_group_id`) REFERENCES `chat_group` (`chat_group_id`) ON DELETE Restrict ON UPDATE Restrict
;

SET FOREIGN_KEY_CHECKS=1
;

