package pers.mk.dubbo.learn.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

@Controller
@RequestMapping("/standard")
public class StandardController {

    @RequestMapping("/index")
    public String index(Model model) {
        model.addAttribute("test","这里是test的index");
        model.addAttribute("nowdate",new Date());
        return "/jsp/standard/index";
    }

}
