package com.xiliu.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.xiliu") // 自定义Component扫描包
public class XiliuServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(XiliuServerApplication.class, args);
	}

}
