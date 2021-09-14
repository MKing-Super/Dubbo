CREATE TABLE `order_item` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `order_id` int(11) DEFAULT NULL COMMENT '订单id（外键）',
    `goods_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
    `goods_number` int(11) DEFAULT NULL COMMENT '商品数量',
    `goods_type` int(11) DEFAULT NULL COMMENT '商品类型',
    `goods_weight` float DEFAULT NULL COMMENT '商品重量',
    `goods_volume` double DEFAULT NULL COMMENT '商品体积',
    `unit_price` decimal(10,0) DEFAULT NULL COMMENT '单价',
    `goods_id` int(11) DEFAULT NULL COMMENT '商品详情id',
    `picture_id` int(11) DEFAULT NULL COMMENT '图片详情id',
    `logistics_id` int(11) DEFAULT NULL COMMENT '物流id',
    `status` tinyint(4) DEFAULT NULL COMMENT '商品状态？未签收：0；签收：1',
    `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除？否：0；是：1',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情表';


insert into sql_learn.order_item values(1,1,'1',1,1,1,1,1,1,1,1,0,0, '2021-06-28 00:00:00', '2021-08-17 00:00:00');

set @i=1;
insert into sql_learn.order_item(order_id, goods_name,goods_number,goods_type,goods_weight,goods_volume, unit_price, goods_id,picture_id,logistics_id, status,
                                 del_flag, create_time,modify_time)
select left (rand()*1048576,1048576) as order_id,
    CONCAT((substring(('去玩儿体雨为欧普拉科技和规范的撒自行车吧那么'), 1+(FLOOR(1 + (RAND() * 2))*4), 2)), (substring(('展现出VB那么爱上对方过后就哭了去玩儿体育欧派'), 1+(FLOOR(1 + (RAND() * 2))*4), 2))) as goods_name,
    RAND()*100 as goods_number,
    RAND()*1048576 as goods_type,
    RAND()*1048576 as goods_weight,
    RAND()*10000 as goods_volume,
    RAND()*10000 as unit_price,
    RAND()*1048576 as goods_id,
    RAND()*1048576 as picture_id,
    RAND()*1048576 as logistics_id,
    RAND() as status,
    RAND() as del_flag,
    date_add(create_time,interval +@i*cast(rand()*100 as signed) SECOND) as create_time,
    date_add(date_add(create_time,interval +@i*cast(rand()*100 as signed) SECOND), interval + cast(rand()*1000000 as signed) SECOND) as modify_time
from sql_learn.order_item;
select count(1) from sql_learn.order_item;