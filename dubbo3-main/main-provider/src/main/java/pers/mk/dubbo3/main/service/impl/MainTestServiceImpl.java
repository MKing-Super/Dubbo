package pers.mk.dubbo3.main.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import pers.mk.dubbo3.main.api.service.MainTestService;

import java.util.Date;

/**
 * @describe: TODO
 * @Author MK
 * @PackageName dubbo3-main
 * @Package pers.mk.dubbo3.main.service.impl
 * @Date 2023/5/12 9:53
 * @Version 1.0
 */
@Slf4j
@Service("mainTestService")
public class MainTestServiceImpl implements MainTestService {
    @Override
    public String test(String name) {
        log.info("MainTestServiceImpl");
        return "dubbo3-main-provider::" + this.getClass().getName() + "::test()::" + name + "::" + new Date();
    }
}
