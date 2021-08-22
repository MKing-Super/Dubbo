package pers.mk.dubbo.start.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import org.springframework.stereotype.Component;
import pers.mk.dubbo.start.model.TestModel;
import pers.mk.dubbo.start.service.TestService;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @Description: TODO
 * @Author: mk
 * @Date: 2021/8/22 14:33
 */
@Service//暴露服务
@Component
public class TestServiceImpl implements TestService {
    @Override
    public List<TestModel> getTestInformation() {
        TestModel testModel0 = new TestModel(1,"mk","666",new Date());
        TestModel testModel1 = new TestModel(1111,"up","wfwfw",new Date());
        return Arrays.asList(testModel0,testModel1);
    }
}
