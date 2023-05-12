package pers.mk.dubbo3.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import pers.mk.dubbo3.api.service.DemoService;

/**
 * @describe: TODO
 * @Author MK
 * @PackageName dubbo3
 * @Package pers.mk.dubbo3.service.impl
 * @Date 2023/5/11 17:37
 * @Version 1.0
 */
@Slf4j
@Service("demoService")
public class DemoServiceImpl implements DemoService {

    @Override
    public String testMk(Integer temp) {
        log.info("^^^^^^^^^^^^^^^^^^^^^");
        return "调用demoServiceImpl成功：：参数：：" +temp;
    }
}
