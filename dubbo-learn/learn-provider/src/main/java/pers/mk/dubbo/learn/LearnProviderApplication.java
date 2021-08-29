package pers.mk.dubbo.learn;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;

//使用apollo的时候打开 @EnableApolloConfig
@EnableApolloConfig
@ComponentScan(basePackages = {"pers.mk.dubbo.learn.mapper","pers.mk.dubbo.learn.service"})     //扫描包，使注解生效
@ImportResource({"classpath:/META-INF/spring/*.xml"})
@SpringBootApplication
public class LearnProviderApplication {
    private static final Logger LOGGER = LoggerFactory.getLogger(LearnProviderApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(LearnProviderApplication.class, args);
        LOGGER.warn(">>>>>>>>>>>>>>>>LearnProvider server start by springboot>>>>>>>>>>>>>>>>>>>>>>");
    }

}
