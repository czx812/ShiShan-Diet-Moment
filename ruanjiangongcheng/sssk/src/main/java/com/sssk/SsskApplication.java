package com.sssk;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.sssk.mapper") // 扫描 Mapper 接口
public class SsskApplication {
    public static void main(String[] args) {
        SpringApplication.run(SsskApplication.class, args);
    }
}