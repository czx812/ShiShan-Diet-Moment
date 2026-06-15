package com.sssk.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.User;
import com.sssk.mapper.ClockRecordMapper;
import com.sssk.mapper.UserMapper;
import com.sssk.mapper.UserProfileMapper;
import com.sssk.mapper.UserWeightRecordMapper;
import com.sssk.service.UserService;
import com.sssk.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserProfileMapper userProfileMapper;

    @Autowired
    private UserWeightRecordMapper weightRecordMapper;

    @Autowired
    private ClockRecordMapper clockRecordMapper; // 这里我帮你加上了

    // 登录
    @Override
    public Result<User> login(String username, String password) {
        User user = lambdaQuery()
                .eq(User::getUsername, username)
                .one();

        if (user == null || !user.getPassword().equals(password)) {
            return Result.error("账号或密码错误");
        }
        return Result.success(user);
    }

    // 注册
    @Override
    public Result<?> register(User user) {
        User exist = lambdaQuery()
                .eq(User::getUsername, user.getUsername())
                .one();

        if (exist != null) {
            return Result.error("用户名已存在");
        }
        save(user);
        return Result.success("注册成功");
    }

    // 修改密码
    @Override
    public Result<?> updatePwd(Long userId, String oldPwd, String newPwd) {
        User user = getById(userId);
        if (user == null) {
            return Result.error("用户不存在");
        }
        if (!user.getPassword().equals(oldPwd)) {
            return Result.error("原密码错误");
        }

        user.setPassword(newPwd);
        updateById(user);
        return Result.success("修改成功");
    }

    // 注销账号（删除所有数据）
    @Override
    @Transactional
    public void deleteUser(Long userId) {
        // 删除体重记录
        weightRecordMapper.deleteByUserId(userId);
        // 删除档案
        userProfileMapper.deleteByUserId(userId);
        // 删除打卡记录
        clockRecordMapper.deleteByUserId(userId);
        // 删除用户
        removeById(userId);
    }
}