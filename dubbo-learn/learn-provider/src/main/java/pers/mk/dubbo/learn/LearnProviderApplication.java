package pers.mk.dubbo.learn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;

@ComponentScan(basePackages = {"pers.mk.dubbo.learn.mapper","pers.mk.dubbo.learn.service"})
@ImportResource({"classpath:/META-INF/spring/*.xml"})
@SpringBootApplication
public class LearnProviderApplication {
    private static final Logger LOGGER = LoggerFactory.getLogger(LearnProviderApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(LearnProviderApplication.class, args);
        LOGGER.warn(">>>>>>>>>>>>>>>>LearnProvider server start by springboot>>>>>>>>>>>>>>>>>>>>>>");
    }

}
