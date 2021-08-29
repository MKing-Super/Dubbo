package pers.mk.dubbo.learn.config;

import com.ctrip.framework.apollo.Config;
import com.ctrip.framework.apollo.ConfigService;
import org.junit.jupiter.api.Test;

/**
 * @Description: 测试从本地apollo上获取配置
 * @Author: mk
 * @Date: 2021/8/29 12:13
 */
public class GetApolloConfigTest {

    public static void main(String[] args) {
        Config appConfig = ConfigService.getAppConfig();
        String someKsy = "sms.enable";
        String value = appConfig.getProperty(someKsy, null);
        System.out.println(value);
    }
}
