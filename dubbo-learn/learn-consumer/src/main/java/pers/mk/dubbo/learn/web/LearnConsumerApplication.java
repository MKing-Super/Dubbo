package pers.mk.dubbo.learn.web;

import com.alibaba.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@ImportResource({"classpath:/META-INF/spring/*.xml"})
@EnableDubbo
@SpringBootApplication
public class LearnConsumerApplication {

    public static void main(String[] args) {
        SpringApplication.run(LearnConsumerApplication.class, args);
    }

}
