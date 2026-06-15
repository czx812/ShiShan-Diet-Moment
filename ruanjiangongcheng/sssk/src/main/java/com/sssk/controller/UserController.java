package com.sssk.controller;

import com.sssk.entity.User;
import com.sssk.service.UserService;
import com.sssk.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    // 登录
    @PostMapping("/login")
    public Result<User> login(@RequestParam String username, @RequestParam String password) {
        return userService.login(username, password);
    }

    // 注册
    @PostMapping("/register")
    public Result<?> register(@RequestBody User user) {
        return userService.register(user);
    }

    // ======================
    // 修改密码
    // ======================
    @PostMapping("/updatePwd")
    public Result<?> updatePwd(@RequestBody Map<String, Object> map) {
        Long userId = Long.valueOf(map.get("userId").toString());
        String oldPwd = map.get("oldPwd").toString();
        String newPwd = map.get("newPwd").toString();
        return userService.updatePwd(userId, oldPwd, newPwd);
    }

    // ======================
    // 注销账号
    // ======================
    @DeleteMapping("/delete/{userId}")
    public Result<?> deleteUser(@PathVariable Long userId) {
        userService.deleteUser(userId);
        return Result.success("注销成功");
    }
}