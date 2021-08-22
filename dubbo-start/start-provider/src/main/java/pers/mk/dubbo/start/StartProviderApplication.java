package pers.mk.dubbo.start;

import com.alibaba.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 1、导入依赖：
 *      1）导入dubbo-starter
 *      2）导入其他依赖
 */

@EnableDubbo    //开启基于注解的dubbo功能
@SpringBootApplication
public class StartProviderApplication {

    public static void main(String[] args) {
        SpringApplication.run(StartProviderApplication.class, args);
    }

}
