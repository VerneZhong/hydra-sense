## Hydra sense 简介
Time series of humidity in head sensor of Pandora instrument

## 软件需求
* jdk8+
* mysql5.7+
* Maven 3.0+
* Redis 3.0+

## 本地服务启动
进入 hydra-server 模块，运行 HydraServerApplication类，即可启动

## linux部署
服务器需要Java8以上的环境，通过maven打成jar包后直接部署在Linux服务器中
* 进入到项目到根目录 xx/xx/hydra-sence/ 
* 通过maven命令打包：mvn clean package
* 然后将进入到 hydra-server/target的目录下，将hydra-server-1.0-SNAPSHOT.jar上传到服务器当中， 
* 首先通过jps命令，查看当前正在运行的程序中的进程ID，然后通过kill -9 pid的方式停止程序，
* 最后通过以下命令启动服务 ：nohup java -jar hydra-server-1.0-SNAPSHOT.jar > hydra-server.log 2>&1 &
