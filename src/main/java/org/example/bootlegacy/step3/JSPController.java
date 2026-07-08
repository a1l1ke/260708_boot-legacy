package org.example.bootlegacy.step3;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/jsp")
public class JSPController {
    @GetMapping
    public String jsp(Model model) {
        // 1. jsp -> webapp/WEB-INF/(views) -> 경로 만들기 (for jasper)
        // 2. view resolver prefix(접두사), suffix(접미사)를 jsp에 맞게 수정
        model.addAttribute("data", List.of("자바", "스프링", "톰캣"));
        return "page"; // view resolver -> application.properties
        // SpringBootApplication -> 내장으로 InternalViewResolver 류의 것을 이미 등록
        // 설정만 바꾸면 됩니다
    }
}
