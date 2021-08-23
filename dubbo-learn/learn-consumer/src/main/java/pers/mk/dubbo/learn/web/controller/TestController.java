package pers.mk.dubbo.learn.web.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.mk.dubbo.learn.model.TestModel;
import pers.mk.dubbo.learn.service.TestService;

import java.util.List;

/**
 * @Description: TODO
 * @Author: mk
 * @Date: 2021/8/22 14:38
 */
@Controller
public class TestController {
    @Autowired
    private TestService testService;

    @ResponseBody
    @RequestMapping("/test")
    public List<TestModel> initOrder() {
        List<TestModel> testInformation = testService.getTestInformation();
        return testInformation;
    }
}