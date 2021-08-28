package pers.mk.dubbo.learn.web;

import com.alibaba.dubbo.config.spring.context.annotation.EnableDubbo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ImportResource;

@ImportResource({"classpath:/META-INF/spring/*.xml"})                   //扫描静态文件
@SpringBootApplication(exclude= {DataSourceAutoConfiguration.class})    //配置数据库
public class LearnConsumerApplication {
    private static final Logger LOGGER = LoggerFactory.getLogger(LearnConsumerApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(LearnConsumerApplication.class, args);
        LOGGER.warn(">>>>>>>>>>>>>>>>LearnConsumer server start by springboot>>>>>>>>>>>>>>>>>>>>>>");
    }

}
