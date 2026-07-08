package org.example.bootlegacy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// 루트 경로에 있어한다 - 실질적으로 쓰이는 최상단 패키지 경로 -> {group:org.example}.{artifact:bootlegacy}
// 이 클래스가 있는 패키지부터 시작해서 하단으로 스캔 탐색
@SpringBootApplication
public class BootLegacyApplication {

    public static void main(String[] args) {
        SpringApplication.run(BootLegacyApplication.class, args);
    }

}
