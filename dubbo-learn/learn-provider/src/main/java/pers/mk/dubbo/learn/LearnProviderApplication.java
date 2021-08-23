package pers.mk.dubbo.learn;

import com.alibaba.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@ImportResource({"classpath:/META-INF/spring/*.xml"})
@SpringBootApplication
public class LearnProviderApplication {

    public static void main(String[] args) {
        SpringApplication.run(LearnProviderApplication.class, args);
    }

}
