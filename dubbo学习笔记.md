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



### 4、Dubbo配置

#### 1、API配置

​	基本配置：

```java
// 注册中心
RegistryConfig registry = new RegistryConfig();
registry.setAddress("zookeeper://127.0.0.1:2181");
// 配置中心
ConfigCenterConfig configCenter = new ConfigCenterConfig();
configCenter.setAddress("zookeeper://127.0.0.1:8080");
// 元数据中心
MetadataReportConfig metadataReport = new MetadataReportConfig();
metadataReport.setAddress("zookeeper://192.168.10.3:2181");
// 服务提供者协议配置
ProtocolConfig protocol = new ProtocolConfig();
protocol.setName("dubbo");
protocol.setPort(9010);
// Provider配置（ServiceConfig默认配置）
ProviderConfig provider = new ProviderConfig();
provider.setGroup("demo");
provider.setVersion("1.0.0");
// Consumer配置（ReferenceConfig默认配置）
ConsumerConfig consumer = new ConsumerConfig();
consumer.setGroup("demo");
consumer.setVersion("1.0.0");
consumer.setTimeout(2000);
```

> API属性与XML配置项对应。例：ApplicationConfig.setName("xxx")` 对应 `<dubbo:application name="xxx" />



#### 2、XML配置（常用）

​	提供者的配置：

```xml
	<!-- 协议配置：用于配置提供服务的协议信息，协议由提供方指定，消费方被动接受 -->
    <dubbo:protocol name="dubbo" port="20880"/>

    <!-- 应用配置：用于配置当前应用信息，不管该应用是提供者还是消费者 -->
    <dubbo:application name="learn-provider"/>

    <!-- 模块配置（可选）：用于配置当前模块信息，可选 -->
    <!--<dubbo:module name=""></dubbo:module>-->

    <!-- 注册中心配置：用于配置连接注册中心相关信息 -->
    <dubbo:registry address="zookeeper://127.0.0.1:2181"/>
    <!-- 用于测试时的直连 -->
<!--    <dubbo:registry address="127.0.0.1:2181" register="false" />-->

    <!-- 监控中心配置（可选）：用于配置连接监控中心相关信息，可选 -->
    <dubbo:monitor protocol="registry"/>

    <!-- 提供方配置（可选）： 当 ProtocolConfig 和 ServiceConfig 某属性没有配置时，采用此缺省值，可选-->
    <!--<dubbo:provider></dubbo:provider>-->

    <!-- 消费方配置（可选）：当 ReferenceConfig 某属性没有配置时，采用此缺省值，可选 -->
    <!--<dubbo:consumer></dubbo:consumer>-->

    <!-- 方法配置（可选）：用于 ServiceConfig 和 ReferenceConfig 指定方法级的配置信息 -->
    <!--<dubbo:method name=""></dubbo:method>-->

    <!-- 参数配置：用于指定方法参数配置 -->
    <!--<dubbo:argument></dubbo:argument>-->

    <!-- 服务配置：用于暴露一个服务，定义服务的元信息，一个服务可以用多个协议暴露，一个服务也可以注册到多个注册中心 -->
    <dubbo:service interface="pers.mk.dubbo.learn.service.TestService" ref="testService" version="1.0.0" owner="mk"/>
```

​	消费者的配置：

```xml
	<dubbo:reference interface="pers.mk.dubbo.learn.service.TestService" id="testService" version="1.0.0" owner="mk"/>
```



#### 3、注解配置

service注解暴露服务

```java
@Service
public class AnnotationServiceImpl implements AnnotationService {
    @Override
    public String sayHello(String name) {
        return "annotation: hello, " + name;
    }
}
```

消费方

```java
@Component("annotationAction")
public class AnnotationAction {

    @Reference
    private AnnotationService annotationService;
    
    public String doSayHello(String name) {
        return annotationService.sayHello(name);
    }
}
```

在启动类扫描包、扫描静态类

```java
@Configuration
@EnableDubbo(scanBasePackages = "xxx.xxx.xxx")
@PropertySource("classpath:/spring/dubbo-provider.properties")
```



#### 4、属性配置



#### 5、外部化配置（常用）

​	外部化配置目的之一是实现配置的集中式管理，这部分业界已经有很多成熟的专业配置系统如 Apollo, Nacos 等，Dubbo 所做的主要是保证能配合这些系统正常工作。

1、apollo

​	引入依赖

```java
	<dependency>
    	<groupId>com.ctrip.framework.apollo</groupId>
       	<artifactId>apollo-client</artifactId>
        <version>1.1.0</version>
	</dependency>	
```

​	在启动类上添加注解

```java
@EnableApolloConfig
```

​	配置yml

```yml
# apollo配置
app:
  # 对应apollo的id
  id: learn-provider-apollo
apollo:
  # 配置中心的地址
  meta: http://127.0.0.1:8080
  # 在应用启动阶段，向Spring容器注入被托管的application.properties文件的配置信息。
  bootstrap:
    enabled: true
    # 将Apollo配置加载提到初始化日志系统之前。
    eagerLoad:
      enabled: true
```



#### 6、自动加载环境变量



### 5、部署架构

​	Dubbo的三大中心化组件：注册中心、配置中心、元数据中心。

- 注册中心

  协调 Consumer 与 Provider 之间的地址注册与发现。

- 配置中心

  - 存储 Dubbo 启动阶段的全局配置，保证配置的跨环境共享与全局一致性
  - 负责服务治理规则（路由规则、动态配置等）的存储与推送

- 元数据中心

  - 接收 Provider 上报的服务接口元数据，为 Admin 等控制台提供运维能力（如服务测试、接口文档等）
  - 作为服务发现机制的补充，提供额外的接口/方法级别配置信息的同步能力，相当于注册中心的额外扩展

![https://dubbo.apache.org/imgs/v3/concepts/threecenters.png](https://dubbo.apache.org/imgs/v3/concepts/threecenters.png)

​	上述是Dubbo微服务组件与各个中心的交互过程。

#### 1、注册中心

![https://dubbo.apache.org/imgs/v3/concepts/centers-registry.png](https://dubbo.apache.org/imgs/v3/concepts/centers-registry.png)

#### 2、配置中心

![https://dubbo.apache.org/imgs/v3/concepts/centers-config.png](https://dubbo.apache.org/imgs/v3/concepts/centers-config.png)

#### 3、元数据中心

![https://dubbo.apache.org/imgs/v3/concepts/centers-metadata.png](https://dubbo.apache.org/imgs/v3/concepts/centers-metadata.png)



### 6、扩展性

​	平等对待第三方的实现。在 Dubbo 中，所有内部实现和第三方实现都是平等的，用户可以基于自身业务需求，替换 Dubbo 提供的原生实现。











## 点我获取项目代码

[https://github.com/MKing-Super/Dubbo](https://github.com/MKing-Super/Dubbo)

持续更新~
