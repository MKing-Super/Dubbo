package pers.mk.dubbo.learn.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.mk.dubbo.learn.model.DubboUser;
import pers.mk.dubbo.learn.service.DubboService;

/**
 * @Description: TODO
 * @Author: mk
 * @Date: 2021/8/28 11:14
 */
@Controller
public class DubboUserController {
    @Autowired
    private DubboService dubboService;

    @ResponseBody
    @RequestMapping("id")
    public DubboUser getDubboUserById(){
        return dubboService.getDubboUserById(1);
    }
}
