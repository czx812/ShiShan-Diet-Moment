package com.sssk.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.sssk.entity.DietPlan;
import java.util.List;

public interface DietPlanService extends IService<DietPlan> {
    // 生成今日饮食计划
    List<DietPlan> generateTodayPlan(Long userId);
}