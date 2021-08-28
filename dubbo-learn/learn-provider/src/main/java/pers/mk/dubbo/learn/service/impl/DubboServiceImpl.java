package pers.mk.dubbo.learn.service.impl;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import pers.mk.dubbo.learn.mapper.DubboUserMapper;
import pers.mk.dubbo.learn.model.DubboUser;
import pers.mk.dubbo.learn.service.DubboService;

import javax.annotation.Resource;

/**
 * @Description: TODO
 * @Author: mk
 * @Date: 2021/8/28 11:14
 */
@Service("dubboService")
public class DubboServiceImpl implements DubboService {
    @Resource
    private DubboUserMapper dubboUserMapper;

    @Override
    public DubboUser getDubboUserById(Integer id) {
        return dubboUserMapper.selectByPrimaryKey(id);
    }
}
