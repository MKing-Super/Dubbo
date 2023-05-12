package pers.mk.dubbo3.web.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pers.mk.dubbo3.api.service.DemoService;
import pers.mk.dubbo3.main.api.service.MainTestService;

/**
 * @describe: TODO
 * @Author MK
 * @PackageName dubbo3
 * @Package pers.mk.dubbo3.web.controller
 * @Date 2023/5/12 9:06
 * @Version 1.0
 */
@Slf4j
@RestController
@RequestMapping("/demo")
@RequiredArgsConstructor
public class DemoController {

    private final DemoService demoService;
    private final MainTestService mainTestService;

    @RequestMapping("/test")
    public String test(Integer temp){
        String s = demoService.testMk(temp);
        log.info(s);
        return s;
    }

    @RequestMapping("/main")
    public String main(){
        String ttt = mainTestService.test("我炸了");
        return ttt;
    }

}
