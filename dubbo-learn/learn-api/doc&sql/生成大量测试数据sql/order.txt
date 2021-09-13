CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户主键（外键）',
  `order_code` varchar(255) DEFAULT NULL COMMENT '订单号',
  `freight` decimal(10,0) DEFAULT NULL COMMENT '运费',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '是否删除？否：0；是：1',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';


insert into sql_learn.order values(1,1,1,1, 1,0, '2018-03-01 12:00:00');

set @i=1;
insert into sql_learn.order(user_id, order_code, freight,address, del_flag, create_time) 
select left (rand()*1048576,100000000),   
				 UUID(),
				CEILING(RAND()*90+10),
				CONCAT((substring(('上海北京深圳广州三沙'), 1+(FLOOR(1 + (RAND() * 2))*4), 2)), '市') as address,
        RAND(),
        date_add(create_time,interval +@i*cast(rand()*100 as signed) SECOND)#生成有时间大顺序的随机的最后登录时间
from sql_learn.order;
select count(1) from sql_learn.order;