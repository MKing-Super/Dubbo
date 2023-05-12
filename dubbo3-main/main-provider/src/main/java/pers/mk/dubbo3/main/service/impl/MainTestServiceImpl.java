package pers.mk.dubbo3.main.service.impl;

import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.common.Version;
import org.apache.dubbo.config.ApplicationConfig;
import org.springframework.stereotype.Service;
import pers.mk.dubbo3.main.api.service.MainTestService;

import java.util.Date;

/**
 * @describe: TODO
 * @Author MK
 * @PackageName dubbo3-main
 * @Package pers.mk.dubbo3.main.service.impl
 * @Date 2023/5/12 9:53
 * @Version 1.0
 */
@Slf4j
@Service("mainTestService")
public class MainTestServiceImpl implements MainTestService {
    @Override
    public String test(String name) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("version","dubbo " + Version.getVersion());
        jsonObject.put("className",this.getClass().getName());
        jsonObject.put("method","test");
        jsonObject.put("parameter",name);
        jsonObject.put("time",new Date());
        log.info(jsonObject.toJSONString());
        return jsonObject.toJSONString();
    }
}
