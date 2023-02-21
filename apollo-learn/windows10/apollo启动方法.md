# Apollo本地启动的方法

## 1、修改config中数据库信息

默认

​	root

​	123

## 2、依次启动jar包

```java
java -jar apollo-adminservice-1.9.0.jar
java -jar apollo-configservice-1.9.0.jar
java -jar apollo-portal-1.9.0.jar
```

或

**双击xxx-run.bat文件。**



## 3、登录

[http://127.0.0.1:8070/](http://127.0.0.1:8070/)

账号：apollo

密码：admin





```bash
create database ApolloPortalDB DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
create database ApolloConfigDB DEFAULT CHARSET utf8 COLLATE utf8_general_ci;


set global innodb_file_format = BARRACUDA;
set global innodb_large_prefix = ON;
```



在建表时候，`apolloportaldb`.SPRING_SESSION_ATTRIBUTES表字段超过767：

SHOW VARIABLES LIKE 'innodb_large_prefix'; 
SET GLOBAL INNODB_LARGE_PREFIX = ON; 