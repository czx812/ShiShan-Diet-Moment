package com.sssk.controller;

import com.sssk.entity.UserProfile;
import com.sssk.service.UserProfileService;
import com.sssk.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/userProfile")
public class UserProfileController {
    @Resource
    private UserProfileService userProfileService;

    @GetMapping("/{userId}")
    public Result<UserProfile> getInfo(@PathVariable Integer userId) {
        // 用正确的字段名查询
        UserProfile profile = userProfileService.lambdaQuery()
                .eq(UserProfile::getUserId, userId)
                .eq(UserProfile::getIsDelete, 0)
                .one();
        return Result.success(profile);
    }

    @PostMapping("/save")
    public Result<?> saveInfo(@RequestBody UserProfile profile) {
        // 用正确的字段名保存
        userProfileService.saveOrUpdate(profile);
        return Result.success("保存成功");
    }
}