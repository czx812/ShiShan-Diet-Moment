package com.sssk.controller;

import com.sssk.entity.DietPlan;
import com.sssk.service.DietPlanService;
import com.sssk.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/plan")
public class DietPlanController {

    @Resource
    private DietPlanService dietPlanService;

    // 获取今日饮食计划（删掉空数据自动生成，解决删完自动回弹）
    @GetMapping("/list/{userId}")
    public Result<List<DietPlan>> getTodayPlan(@PathVariable Long userId) {
        try {
            List<DietPlan> plans = dietPlanService.lambdaQuery()
                    .eq(DietPlan::getUserId, userId)
                    .eq(DietPlan::getIsDelete, 0)
                    .list();
            // 仅查询，为空不自动生成
            return Result.success(plans);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("获取计划失败：" + e.getMessage());
        }
    }

    // 手动刷新生成全套计划
    @PostMapping("/refresh/{userId}")
    public Result<List<DietPlan>> refreshPlan(@PathVariable Long userId) {
        try {
            List<DietPlan> plans = dietPlanService.generateTodayPlan(userId);
            return Result.success(plans);
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("刷新计划失败");
        }
    }

    // 删除单条计划
    @DeleteMapping("/delete/{id}")
    public Result deleteDietPlan(@PathVariable Long id) {
        boolean success = dietPlanService.removeById(id);
        if (success) {
            return Result.success("删除成功");
        } else {
            return Result.error("删除失败，计划不存在");
        }
    }
}