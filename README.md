## Hydra sense 简介
Time series of humidity in head sensor of Pandora instrument

## 软件需求
* jdk8+
* mysql5.7+
* Maven 3.0+
* Redis 3.0+

## 本地部署
进入 hydra-server 模块，运行 HydraServerApplication类，即可启动

## linux部署
服务器需要Java8以上的环境，打成jar包后直接部署在Linux服务器中
命令：nohup java -jar hydra-server-1.0-SNAPSHOT.jar > hydra-server.log 2>&1 &
