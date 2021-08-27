package pers.mk.dubbo.learn.mapper;


import org.apache.ibatis.annotations.Mapper;
import pers.mk.dubbo.learn.model.DubboUser;

@Mapper
public interface DubboUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DubboUser record);

    int insertSelective(DubboUser record);

    DubboUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DubboUser record);

    int updateByPrimaryKey(DubboUser record);
}