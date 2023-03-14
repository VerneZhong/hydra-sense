
# xiliu-tenant
xiliu-tenant 采用B2B2C架构设计，支持多租户saas，是一套快速开发框架、脚手架、后台管理系统、权限系统，上手简单，拿来即用。


### 项目结构树
````
xiliu-tenant
├── xiliu-common --通用模块
|   ├── annotation -- 自定义注解目录
|   ├── component -- 自定义组件目录
|   ├── config -- 通用配置目录
|   ├── constant -- 通用常量目录
|   ├── controller -- 通用controller目录
|   ├── domain -- 通用封装对象
|   ├── enums -- 通用枚举目录
|   ├── page -- 通用分页相关封装目录
|   ├── result -- 通用返回目录
|   ├── utils -- 通用工具类目录
├── xiliu-generator --代码自动生成模块
|   ├── config -- 读取代码生成相关配置
|   ├── constant -- 代码生成常量
|   ├── controller -- 代码生成访问层
|   ├── entity -- 代码生成实体对象
|   ├── mapper -- 代码生成mapper层
|   ├── service --代码生成业务层 
|   ├── utils -- 代码生成器工具类
├── xiliu-server --业务模块
|   ├── common -- 通用目录
|       ├── aspect -- 切面目录
|       ├── component -- token 组件目录
|       ├── domain -- 封装树结构实体类
|       ├── mybatis -- 集成mybatis-plus相关配置目录
|       ├── security -- 集成security相关配置目录
|       ├── utils -- 通用工具类
|   ├── manager -- 异步任务管理器目录
|   ├── modules -- 存放业务代码
|       ├── basicdata -- 基础数据目录
|       ├── monitor -- 系统监控目录
|       ├── system -- 系统管理目录
|       ├── ucenter -- 用户中心目录
|   ├── XiliuServerApplication -- 启动类


````

### 软件需求
* jdk8+
* mysql5.7+
* Maven 3.0+
* Redis 3.0+


### 所用技术
#### 前端


#### 后端

技术     | 版本 |  说明 |
-------- | ------ | ------
SpringBoot|	2.5.4|	容器+MVC框架
SpringSecurity|	5.3.2|	认证和授权框架
MyBatis-Plus|	3.5.1|	MyBatis增强工具
MyBatis-Plus Generator|	3.5.1|	数据层代码生成器
knife4j|	2.0.7|	swagger文档生成工具
Redis|	5.0|	分布式缓存
Docker|	18.09.0|	应用容器引擎
Druid|	1.1.21|	数据库连接池
JWT|	0.9.0|	JWT登录支持
Lombok|	1.18.12|	简化对象封装工具
easyexcel| 2.2.6| 简化导入导出工具

#数据库表结构

# 开发规约

## 命名规则

- url路径采用 脊柱命名法(server-address)

## 接口定义规则

- 创建表记录：POST /{控制器路由名称}/create
- 修改表记录：POST /{控制器路由名称}/update/{id}
- 删除指定表记录：POST /{控制器路由名称}/delete/{id}
- 分页查询表记录：GET /{控制器路由名称}/list-page
- 获取指定记录详情：GET /{控制器路由名称}/{id}

具体参数及返回结果定义可以运行代码查看Swagger-UI的Api文档：http://localhost:7000/doc.html


### 项目特点


### 本地部署



### linux部署



### 项目演示
* 演示地址：http://
* 账号密码：test/123456

### 系统效果图展示

![系统效果图]()
![系统效果图]()
![系统效果图]()
![系统效果图]()
![系统效果图]()

### 开发指南

### 敬请期待


### 常见问题









