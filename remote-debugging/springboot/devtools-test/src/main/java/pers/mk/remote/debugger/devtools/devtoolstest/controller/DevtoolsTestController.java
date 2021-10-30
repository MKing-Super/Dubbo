package pers.mk.remote.debugger.devtools.devtoolstest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/devtools")
public class DevtoolsTestController {
    @GetMapping("/hello")
    @ResponseBody
    public String hello(){
        return "hello makun";
    }
}
