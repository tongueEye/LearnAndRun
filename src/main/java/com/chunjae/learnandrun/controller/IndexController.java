package com.chunjae.learnandrun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
    @GetMapping("/index")
    public String index(){
        return "main/index";
    }

    @GetMapping("/test")
    public String test(Model model){

        model.addAttribute("page","test");
        return "main/index";
    }
}
