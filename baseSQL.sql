-- 管理员信息
create table `admin`(
    id int primary key auto_increment,
    a_name varchar(20) default "管理员",
    a_code varchar(20) not null,
    a_pwd varchar(50) not null comment "md5加密"
);
-- 管理员详情
create table `admininfo`(
	id int primary key auto_increment,
    a_code varchar(20) not null,
    a_phone char(11),
    a_address varchar(80),
    a_email varchar(30),
    a_sex tinyint default 1 comment "男 => 1;女 => 0"
);
-- 用户信息
create table `user`(
    id int primary key auto_increment,
    u_name varchar(20) default "用户",
    u_code varchar(20) not null,
    u_pwd varchar(50) not null comment "md5加密",
    u_role enum('student', 'teacher') not null,
    u_state tinyint default 1 comment "0 => 账号已注销; 1 => 账号正在使用"
);
-- 用户详情
create table `userinfo`(
	id int primary key auto_increment,
    u_code varchar(20) not null,
    u_phone char(11),
    u_address varchar(80),
    u_email varchar(30),
    u_sex tinyint default 1 comment "男 => 1;女 => 2"
);
-- 发布课题
create table course(
    id int primary key auto_increment,
	c_code varchar(20) not null comment "时间戳+6位随机数",
    c_name varchar(50) not null,
    c_create_time datetime default now(),
    c_author_code varchar(20) not null,
    c_state tinyint default 1 comment "课题状态，1表示课题使用中，0表示课题已注销"
);
-- 发布课题说明
create table courseinfo(
    c_code varchar(20) primary key,
    c_task text comment "课题说明",
    c_tip text comment "课题要求",
    c_file_code varchar(20) comment "时间戳+6位随机数"
);
-- 学员课题
create table stucourse(
	c_code varchar(20) primary key,
    u_code varchar(20) not null,
    create_time datetime default now(),
    action_log varchar(20) not null comment "时间戳+6位随机数"
);
-- 学员课题说明
create table stucourselog(
    id int primary key auto_increment,
	action_log varchar(20) not null comment "时间戳+6位随机数",
    t_task text comment "老师评语",
    s_file_code varchar(20) comment "时间戳+6位随机数"
);
-- 学员课题操作日志
create table stuactionlog(
	id int primary key auto_increment,
    action_name varchar(10) default "download" comment "download 接受课题, upload 上传课题相关文件",
    action_time datetime default now(),
    action_task varchar(100)
);
-- 老师课题文件相关
create table teacherfiles(
	id int primary key auto_increment,
    f_code varchar(20) not null comment "上传文件是确定(前端提供)",
    f_name varchar(30) not null,
    f_truth_name varchar(20) not null comment "存储在服务器上的名称",
    f_path varchar(30) not null comment "存储路径",
    f_state tinyint default 1 comment "0 => 文件还存在单不显示; 1 => 文件不仅存在而且显示"
);
-- 学生课题文件相关
create table studentfiles(
	id int primary key auto_increment,
    f_code varchar(20) not null comment "上传文件是确定(前端提供)",
    f_name varchar(30) not null,
    f_truth_name varchar(20) not null comment "存储在服务器上的名称",
    f_path varchar(30) not null comment "存储路径",
    f_state tinyint default 1 comment "0 => 文件还存在单不显示; 1 => 文件不仅存在而且显示"
);
-- 地区表
create table addressinfo(
	id int primary key,
    name varchar(50) not null,
    side_level int default 0,
    prev_id int
);