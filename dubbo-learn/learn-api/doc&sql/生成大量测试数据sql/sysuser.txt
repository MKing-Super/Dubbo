CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) DEFAULT NULL COMMENT '用户编码',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `del_flag` tinyint(255) DEFAULT '0' COMMENT '是否删除？否：0；是：1',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into sql_learn.sys_user values(1,1,1,'user_1', 1,0,'2018-01-01 00:00:00', '2018-03-01 12:00:00');

set @i=1;
insert into sql_learn.sys_user(code, phone, username,password, create_time, last_login_time) 
select left (UUID(),CEILING(RAND()*36+1)) as code,   
				 CONCAT((substring(('000,156,136,176,183'), 1+(FLOOR(1 + (RAND() * 3))*4), 3)), CEILING(RAND()*90000000+10000000)) as phone , #手机号
        concat('user_',@i:=@i+1),   #按序列生成不同的username
				CONCAT((substring(('@$D,@B*,XH*,~(K,X_+'), 1+(FLOOR(1 + (RAND() * 3))*4), 3)), CEILING(RAND()*90+10)) as password,
        date_add(create_time,interval +@i*cast(rand()*100 as signed) SECOND), #生成有时间大顺序随机注册时间
        date_add(date_add(create_time,interval +@i*cast(rand()*100 as signed) SECOND), interval + cast(rand()*1000000 as signed) SECOND) #生成有时间大顺序的随机的最后登录时间
from sql_learn.sys_user;
select count(1) from sql_learn.sys_user;