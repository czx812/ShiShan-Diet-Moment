package com.sssk.controller;

import com.sssk.entity.Portrait;
import com.sssk.service.PortraitService;
import com.sssk.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/portrait")
public class PortraitController {

    @Resource
    private PortraitService portraitService;

    // 保存/更新个人档案
    @PostMapping("/save")
    public Result<?> save(@RequestBody Portrait portrait) {
        try {
            // 以 userId 为唯一标识，实现新增/更新
            portraitService.saveOrUpdate(portrait);
            return Result.success("保存成功");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("保存失败：" + e.getMessage());
        }
    }

    // 根据 userId 获取个人档案
    @GetMapping("/{userId}")
    public Result<Portrait> getByUserId(@PathVariable Long userId) {
        try {
            Portrait portrait = portraitService.lambdaQuery()
                    .eq(Portrait::getUserId, userId)
                    .one();
            if (portrait == null) {
                // 如果没有档案，返回默认对象，避免前端报错
                portrait = new Portrait();
                portrait.setUserId(userId);
                portrait.setAge(22);
                portrait.setHeight("175cm");
                portrait.setWeight("65kg");
                portrait.setTarget("均衡");
                portrait.setTabooFoods("");
            }
            return Result.success(portrait);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("获取档案失败");
        }
    }
}