package com.sssk.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.sssk.entity.User;
import com.sssk.utils.Result;

public interface UserService extends IService<User> {
    Result<User> login(String username, String password);
    Result<?> register(User user);
    Result<?> updatePwd(Long userId, String oldPwd, String newPwd);
    void deleteUser(Long userId);
}