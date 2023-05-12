package pers.mk.dubbo3.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;

/**
 * @describe: TODO
 * @Author MK
 * @PackageName dubbo3
 * @Package pers.mk.dubbo3.web
 * @Date 2023/5/12 9:03
 * @Version 1.0
 */
@Slf4j
@ComponentScan(basePackages = {"pers.mk.dubbo3.api.service","pers.mk.dubbo3.web"})
@ImportResource({"classpath:/spring/*.xml"})
@SpringBootApplication
public class WebApplication {
    public static void main(String[] args) {
        SpringApplication.run(WebApplication.class,args);
        log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }
}
