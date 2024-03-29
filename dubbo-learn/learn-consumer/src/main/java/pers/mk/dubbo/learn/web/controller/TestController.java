package pers.mk.dubbo.learn.web.controller;

import com.ctrip.framework.apollo.Config;
import com.ctrip.framework.apollo.ConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.mk.dubbo.learn.model.DubboUser;
import pers.mk.dubbo.learn.model.TestModel;
import pers.mk.dubbo.learn.service.DubboService;
import pers.mk.dubbo.learn.service.TestService;

import java.util.Date;
import java.util.List;

/**
 * @Description: TODO
 * @Author: mk
 * @Date: 2021/8/22 14:38
 */
@Controller
@RequestMapping("/test")
public class TestController {
    @Autowired
    private TestService testService;
    @Autowired
    private DubboService dubboService;

    @RequestMapping("/index")
    public String index(Model model) {
        model.addAttribute("test", "这里是test的index");
        model.addAttribute("nowdate", new Date());
        return "/jsp/test/index";
    }

    @ResponseBody
    @RequestMapping("/test")
    public List<TestModel> initOrder() {
        List<TestModel> testInformation = testService.getTestInformation();
        return testInformation;
    }

    @ResponseBody
    @RequestMapping("/dubboUser")
    public DubboUser get() {
        DubboUser dubboUser = testService.getDubboUser(1);
        System.out.println(dubboUser);
        return dubboUser;
    }

    @ResponseBody
    @RequestMapping("/propertyTime")
    public String propertyTime() {
        Config config = ConfigService.getAppConfig();
        return "获取超过时间：" + config.getIntProperty("server.port", 200);
    }


    @ResponseBody
    @RequestMapping("/dubboTest")
    public String dubboTest() {
        testService.remoteCall1();
        dubboService.remoteCall2();
        testService.remoteCall1();
        return "dubbo远程调用成功！";
    }


}