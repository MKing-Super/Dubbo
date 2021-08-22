package pers.mk.dubbo.start.service;

import pers.mk.dubbo.start.model.TestModel;

import java.util.List;

/**
 * @Description: TODO
 * @Author: mk
 * @Date: 2021/8/22 14:31
 */
public interface TestService {
    public List<TestModel> getTestInformation();
}
