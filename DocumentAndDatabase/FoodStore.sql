use master
go
drop database [DATN_FoodStore] 
go
create database [DATN_FoodStore] 
go
use [DATN_FoodStore] 
go
CREATE TABLE users (
    id bigint IDENTITY(1,1) primary key,
	username varchar(100) not null unique,
	password varchar(100) not null unique,
	fullname nvarchar(200) ,
	gender bit not null,
	phone varchar(100) ,
	email varchar(100) not null ,
	birthday date ,
	avatar nvarchar(100) ,
	address nvarchar(200),
	remember_token varchar(100),
	code varchar(100),
	status bigint ,
	create_date datetime,
	create_by bigint ,
	is_display bit not null
);
go
CREATE TABLE roles (
    id bigint IDENTITY(1,1) primary key,
	name varchar(100) not null unique,
	display_name nvarchar(100) not null unique,
	create_date datetime ,
	create_by bigint ,
	is_display bit not null
);
go
CREATE TABLE permissions (
    id bigint IDENTITY(1,1) primary key,
	name varchar(100) not null unique,
	display_name nvarchar(100) not null unique,
	is_display bit not null
);
go
CREATE TABLE user_roles (
    id bigint IDENTITY(1,1) primary key,
	user_id bigint not null FOREIGN KEY REFERENCES users(id),
	role_id bigint not null FOREIGN KEY REFERENCES roles(id),
	unique(user_id,role_id)
);
go
CREATE TABLE user_permissions (
    id bigint IDENTITY(1,1) primary key,
	user_id bigint not null FOREIGN KEY REFERENCES users(id),
	permission_id bigint not null FOREIGN KEY REFERENCES permissions(id),
	unique(user_id,permission_id)
);
go
CREATE TABLE role_permissions (
    id bigint IDENTITY(1,1) primary key,
	role_id bigint not null FOREIGN KEY REFERENCES roles(id),
	permission_id bigint not null FOREIGN KEY REFERENCES permissions(id),
	unique(role_id,permission_id)
);
go
CREATE TABLE histories (
    id bigint IDENTITY(1,1) primary key,
	user_id bigint not null FOREIGN KEY REFERENCES users(id),	
	create_date datetime ,
	record_id bigint not null ,	
	table_name varchar(100) not null,
	memo nvarchar(1000)
)
go
CREATE TABLE foods (
    id bigint IDENTITY(1,1) primary key,
	name nvarchar(300) not null,
	price float not null ,	
	quantity_limit bigint not null ,	
	view_count bigint not null ,
	description nvarchar(1000),
	create_date datetime ,
	create_by bigint not null FOREIGN KEY REFERENCES users(id),	
	is_display bit not null ,
	status bigint not null 
)
go
CREATE TABLE categories (
    id bigint IDENTITY(1,1) primary key,
	name varchar(300) not null,
	display_name nvarchar(300),
	description nvarchar(1000),
	image_name varchar(300),
	color varchar(50),
	create_date datetime ,
	create_by bigint not null FOREIGN KEY REFERENCES users(id),	
	is_display bit not null ,
	type bigint not null 
)
go
CREATE TABLE category_foods (
    id bigint IDENTITY(1,1) primary key,
	category_id bigint not null FOREIGN KEY REFERENCES categories(id),
	food_id bigint not null FOREIGN KEY REFERENCES foods(id),
	unique(category_id,food_id)
);
go
CREATE TABLE food_images (
    id bigint IDENTITY(1,1) primary key,
	food_id bigint not null FOREIGN KEY REFERENCES foods(id),
	image_name varchar(500) not null unique,
);
go
CREATE TABLE food_discounts (
    id bigint IDENTITY(1,1) primary key,
	food_id bigint not null FOREIGN KEY REFERENCES foods(id),
	name nvarchar(300) not null,
	amount float not null ,	
	is_fixed bit not null ,	
	start_date datetime ,
	end_date datetime ,
	create_date datetime ,
	create_by bigint not null FOREIGN KEY REFERENCES users(id),	
	is_display bit not null ,
)
go
CREATE TABLE customers (
    id bigint IDENTITY(1,1) primary key,
	username varchar(100) not null unique,
	password varchar(100) not null unique,
	fullname nvarchar(100) ,
	gender bit not null,
	email varchar(100) not null ,
	birthday datetime ,
	avatar varchar(100) ,
	remember_token varchar(100),
	code nvarchar(100),
	status bigint ,
	create_date datetime ,
	is_display bit not null
);
go
CREATE TABLE customer_phone_address (
    id bigint IDENTITY(1,1) primary key,
	customer_id bigint not null FOREIGN KEY REFERENCES customers(id),
	is_address bit not null,
	phone_or_address nvarchar(500),
	is_default bit not null
);
go
CREATE TABLE food_reviews (
    id bigint IDENTITY(1,1) primary key,
	food_id bigint not null FOREIGN KEY REFERENCES foods(id),
	customer_id bigint not null FOREIGN KEY REFERENCES customers(id),
	rating bigint not null ,	
	views bigint not null ,	
	create_date datetime ,
	update_date datetime ,
	status bigint not null ,
	is_favorite bit not null ,
	is_display bit not null ,
	unique(food_id,customer_id)
)
go
CREATE TABLE cart (
    id bigint IDENTITY(1,1) primary key,
	food_id bigint not null FOREIGN KEY REFERENCES foods(id),
	customer_id bigint not null FOREIGN KEY REFERENCES customers(id),
	quantity int not null
);
go
CREATE TABLE review_comments (
    id bigint IDENTITY(1,1) primary key,
	review_id bigint not null FOREIGN KEY REFERENCES food_reviews(id),
	title bigint not null ,	
	content datetime ,
	create_date datetime ,
	update_date datetime ,
	status bigint not null ,
	is_display bit not null 
)
go
CREATE TABLE paymentmethods (
    id bigint IDENTITY(1,1) primary key,
	name varchar(100) not null unique,
	description varchar(1000),
	code nvarchar(100),
	status bigint ,
	image_name nvarchar(100) ,
	is_display bit not null
);
go
CREATE TABLE orders (
    id bigint IDENTITY(1,1) primary key,
	customer_id bigint not null FOREIGN KEY REFERENCES customers(id),
	payment_id bigint not null FOREIGN KEY REFERENCES paymentmethods(id),
	order_date datetime not null ,	
	shipped_date datetime not null ,	
	shipped_address nvarchar(500),
	shipped_phone nvarchar(50),
	fee float not null,
	paid_date datetime ,	
	status bigint not null ,
	is_watched bit not null ,
	is_display bit not null 
)
go
CREATE TABLE order_details (
    id bigint IDENTITY(1,1) primary key,
	order_id bigint not null FOREIGN KEY REFERENCES orders(id),
	food_id bigint not null FOREIGN KEY REFERENCES foods(id),
	quantity bigint not null ,	
	price float not null ,	
	discount_amount float not null ,	
	is_fixed bit not null,
	coupon_code varchar(100),	
	status bigint not null ,
	memo varchar(1000) ,
	is_display bit not null 
)
go
CREATE TABLE notifications (
    id bigint IDENTITY(1,1) primary key,
	customer_id bigint not null FOREIGN KEY REFERENCES foods(id),
	order_id bigint not null FOREIGN KEY REFERENCES orders(id),
	create_at datetime ,
	is_watched bigint not null ,
)
go
CREATE TABLE coupons (
    id bigint IDENTITY(1,1) primary key,
	name nvarchar(300) not null,
	code nvarchar(100),
	description nvarchar(1000),
	user_limit bigint not null ,	
	food_limit bigint not null ,	
	amount bigint not null ,	
	is_fixed bit not null ,	
	start_date datetime ,
	end_date datetime ,
	create_date datetime ,
	create_by bigint not null FOREIGN KEY REFERENCES users(id),	
	is_display bit not null ,
	status bigint not null 
)
go
CREATE TABLE food_coupons (
    id bigint IDENTITY(1,1) primary key,
	food_id bigint not null FOREIGN KEY REFERENCES foods(id),
	coupon_id bigint not null FOREIGN KEY REFERENCES coupons(id),
	create_date datetime ,
	status bigint not null ,
	unique(food_id,coupon_id)
)
go
CREATE TABLE customer_coupons (
    id bigint IDENTITY(1,1) primary key,
	customer_id bigint not null FOREIGN KEY REFERENCES customers(id),
	coupon_id bigint not null FOREIGN KEY REFERENCES coupons(id),
	create_date datetime ,
	status bigint not null ,
	unique(customer_id,coupon_id)
)