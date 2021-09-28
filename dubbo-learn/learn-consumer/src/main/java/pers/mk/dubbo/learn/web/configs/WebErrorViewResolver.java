package pers.mk.dubbo.learn.web.configs;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorViewResolver;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Component
public class WebErrorViewResolver implements ErrorViewResolver {

    private static Logger log = LoggerFactory.getLogger(WebErrorViewResolver.class);

    @Override
    public ModelAndView resolveErrorView(HttpServletRequest request, HttpStatus status, Map<String, Object> model) {
        log.info("进入异常跳转");
        if("404".equals(String.valueOf(status))){
            log.info("404异常跳转");
            return new ModelAndView("/error/404");
        }else if("403".equals(String.valueOf(status))){
            log.info("403异常跳转");
            return new ModelAndView("/error/403");
        }else if("500".equals(String.valueOf(status))){
            log.info("500异常跳转");
            return new ModelAndView("/error/500");
        }else{
            log.info("默认异常跳转");
            return new ModelAndView("/error/404");
        }
    }
}
