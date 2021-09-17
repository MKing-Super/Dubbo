package pers.mk.dubbo.information.dubboinformation;

import org.slf4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.slf4j.LoggerFactory;

@SpringBootApplication
public class DubboInformationApplication {

    private static final Logger LOGGER = LoggerFactory.getLogger(DubboInformationApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(DubboInformationApplication.class, args);
        LOGGER.warn(">>>>>>>>>>>>>>>>DubboInformation server start by springboot>>>>>>>>>>>>>>>>>>>>>>");
    }

}
