package com.hydra.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.hydra") // 自定义Component扫描包
public class HydraServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(HydraServerApplication.class, args);
	}

}
