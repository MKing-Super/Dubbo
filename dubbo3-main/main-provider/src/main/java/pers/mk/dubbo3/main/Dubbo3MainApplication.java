package pers.mk.dubbo3.main;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;

/**
 * @describe: TODO
 * @Author MK
 * @PackageName dubbo3-main
 * @Package pers.mk.dubbo3.main
 * @Date 2023/5/12 9:38
 * @Version 1.0
 */
@Slf4j
@ComponentScan(basePackages = {"pers.mk.dubbo3.main.api.service","pers.mk.dubbo3.main"})
@ImportResource({"classpath:/spring/*.xml"})
@SpringBootApplication
public class Dubbo3MainApplication {
    public static void main(String[] args) {
        // 本地项目无法连接zk的解决方案
        System.setProperty("zookeeper.sasl.client","false");
        SpringApplication.run(Dubbo3MainApplication.class,args);
        log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    }
}
