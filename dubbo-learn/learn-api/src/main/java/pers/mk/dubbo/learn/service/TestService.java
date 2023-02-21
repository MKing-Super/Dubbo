package pers.mk.dubbo.learn.service;

import pers.mk.dubbo.learn.model.DubboUser;
import pers.mk.dubbo.learn.model.TestModel;

import javax.annotation.Resource;
import javax.annotation.Resources;
import java.util.List;

/**
 * @Description: TODO
 * @Author: mk
 * @Date: 2021/8/22 14:31
 */
public interface TestService {
    List<TestModel> getTestInformation();
    DubboUser getDubboUser(Integer id);
    String remoteCall1();
}
