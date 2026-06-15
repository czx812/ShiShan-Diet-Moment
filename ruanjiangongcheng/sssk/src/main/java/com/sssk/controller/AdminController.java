package com.sssk.controller;

import com.sssk.utils.Result;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/admin")
public class AdminController {

    // 管理员登录
    @PostMapping("/login")
    public Result<?> login(@RequestParam String username, @RequestParam String password) {
        if ("admin".equals(username) && "admin123".equals(password)) {
            return Result.success("登录成功");
        }
        return Result.error("账号密码错误");
    }

    // 仪表盘接口（修复404）
    @GetMapping("/dashboard")
    public Result<?> dashboard() {
        return Result.success("dashboard data");
    }
}