package org.example.bootlegacy.step2;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController // 응답을 간단한 Text/JSON 형태로 제공
@RequestMapping // "/"
public class ScanController {
    @GetMapping // "/"
    public String hello() {
        return "Hello Boot!";
    }
}
