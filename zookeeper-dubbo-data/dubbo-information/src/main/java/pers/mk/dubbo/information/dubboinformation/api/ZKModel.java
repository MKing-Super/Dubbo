package pers.mk.dubbo.information.dubboinformation.api;

import java.util.List;

public class ZKModel {
    private String father;
    private List<String> son;

    public String getFather() {
        return father;
    }

    public void setFather(String father) {
        this.father = father;
    }

    public List<String> getSon() {
        return son;
    }

    public void setSon(List<String> son) {
        this.son = son;
    }

    @Override
    public String toString() {
        return "ZKModel{" +
                "father='" + father + '\'' +
                ", son=" + son +
                '}';
    }
}

