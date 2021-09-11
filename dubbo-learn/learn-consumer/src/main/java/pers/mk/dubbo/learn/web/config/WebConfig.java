package pers.mk.dubbo.learn.web.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @Description: 配置前端页面
 * @Author: mk
 * @Date: 2021/9/11 23:15
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        //默认地址（可以是页面或后台请求接口）
        registry.addViewController("/").setViewName("forward:templates/index.html");
        //设置过滤优先级最高
        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
        WebMvcConfigurer.super.addViewControllers(registry);
    }
}
