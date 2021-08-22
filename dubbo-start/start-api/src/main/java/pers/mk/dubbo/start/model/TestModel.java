package pers.mk.dubbo.start.model;

import java.util.Date;

/**
 * @Description: TODO
 * @Author: mk
 * @Date: 2021/8/22 14:29
 */
public class TestModel {
    private Integer id;
    private String userName;
    private String password;
    private Date createTime;

    public TestModel(Integer id, String userName, String password, Date createTime) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "TestModel{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
