package pers.mk.dubbo.learn.service.impl;

import org.springframework.stereotype.Service;
import pers.mk.dubbo.learn.mapper.DubboUserMapper;
import pers.mk.dubbo.learn.model.DubboUser;
import pers.mk.dubbo.learn.model.TestModel;
import pers.mk.dubbo.learn.service.TestService;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @Description: TODO
 * @Author: mk
 * @Date: 2021/8/22 14:33
 */

@Service("testService")
public class TestServiceImpl implements TestService {
    @Resource
    private DubboUserMapper dubboUserMapper;

    @Override
    public List<TestModel> getTestInformation() {
        TestModel testModel0 = new TestModel(1,"mk","666",new Date());
        TestModel testModel1 = new TestModel(1111,"up","wfwfw",new Date());
        return Arrays.asList(testModel0,testModel1);
    }

    @Override
    public DubboUser getDubboUser(Integer id) {
        return dubboUserMapper.selectByPrimaryKey(id);
    }

    @Override
    public String remoteCall1() {
        return "远程调用成功1~";
    }
}
