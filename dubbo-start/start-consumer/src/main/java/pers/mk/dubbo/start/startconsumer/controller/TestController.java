package pers.mk.dubbo.start.startconsumer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.mk.dubbo.start.model.TestModel;
import pers.mk.dubbo.start.service.TestService;

import java.util.List;

/**
 * @Description: TODO
 * @Author: mk
 * @Date: 2021/8/22 14:38
 */
@Controller
public class TestController {
    @Reference
    TestService testService;

    @ResponseBody
    @RequestMapping("/test")
    public List<TestModel> initOrder() {
        List<TestModel> testInformation = testService.getTestInformation();
        return testInformation;
    }
}
