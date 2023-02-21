package pers.mk.dubbo.learn.service;

import pers.mk.dubbo.learn.model.DubboUser;

/**
 * @Description: TODO
 * @Author: mk
 * @Date: 2021/8/28 11:14
 */
public interface DubboService {
    DubboUser getDubboUserById(Integer id);
    String remoteCall2();
}
