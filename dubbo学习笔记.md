# dubbo学习笔记（持续更新）

## 一、简介

​	Apache Dubbo 是一款微服务开发框架，它提供了 RPC通信 与 微服务治理 两大关键能力。

​	dubbo原理图：

![](https://dubbo.apache.org/imgs/architecture.png)

节点角色说明： 
 Provider: 暴露服务的服务提供方。 
 Consumer: 调用远程服务的服务消费方。 
 Registry: 服务注册与发现的注册中心。 
 Monitor: 统计服务的调用次调和调用时间的监控中心。 
 Container: 服务运行容器。

调用过程：
0 服务容器负责启动，加载，运行服务提供者。
1 服务提供者在启动时，向注册中心注册自己提供的服务。
2 服务消费者在启动时，向注册中心订阅自己所需的服务。
3 注册中心返回服务提供者地址列表给消费者，如果有变更，注册中心将基于长连接推送变更数据给消费者。
4 服务消费者，从提供者地址列表中，基于软负载均衡算法，选一台提供者进行调用，如果调用失败，再选另一台调用。
5 服务消费者和提供者，在内存中累计调用次数和调用时间，定时每分钟发送一次统计数据到监控中心。



## 二、概念&架构

### 1、服务发现

​	服务发现，即消费端自动发现服务地址列表的能力，是微服务框架需要具备的关键能力，借助于自动化的服务发现，微服务之间可以在无需感知对端部署位置与 IP 地址的情况下实现通信。

​	![](https://dubbo.apache.org/imgs/architecture.png)

​	服务发现的一个核心组件是注册中心，Provider 注册地址到注册中心，Consumer 从注册中心读取和订阅 Provider 地址列表



### 2、协议

​	dubbo的原生协议：Triple(Dubbo3)、Dubbo2 协议

​	第三方协议： gRPC、Thrift、JsonRPC、Hessian2、REST 等



### 3、流量管理

​	流量管理的本质是将请求根据制定好的路由规则分发到应用服务上，如下图所示：

![](https://dubbo.apache.org/imgs/v3/concepts/what-is-traffic-control.png)







## 点我获取项目代码

[https://github.com/MKing-Super/Dubbo](https://github.com/MKing-Super/Dubbo)

