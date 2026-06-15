package com.sssk.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.DietPlan;
import com.sssk.entity.Dish;
import com.sssk.entity.UserProfile;
import com.sssk.mapper.DietPlanMapper;
import com.sssk.mapper.DishMapper;
import com.sssk.mapper.UserProfileMapper;
import com.sssk.service.DietPlanService;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@Service
public class DietPlanServiceImpl extends ServiceImpl<DietPlanMapper, DietPlan> implements DietPlanService {

    private final DishMapper dishMapper;
    private final UserProfileMapper userProfileMapper;

    public DietPlanServiceImpl(DishMapper dishMapper, UserProfileMapper userProfileMapper) {
        this.dishMapper = dishMapper;
        this.userProfileMapper = userProfileMapper;
    }

    @Override
    public List<DietPlan> generateTodayPlan(Long userId) {
        // 1. 参数校验
        if (userId == null) {
            throw new IllegalArgumentException("userId 不能为空");
        }
        Integer uid = userId.intValue();

        // 2. 获取最新用户资料（更标准写法）
        UserProfile profile = userProfileMapper.selectOne(
                new LambdaQueryWrapper<UserProfile>()
                        .eq(UserProfile::getUserId, uid)
                        .eq(UserProfile::getIsDelete, 0)
                        .orderByDesc(UserProfile::getCreateTime)
                        .last("LIMIT 1")
        );
        String target = (profile != null && profile.getTarget() != null) ? profile.getTarget() : "均衡";

        // 3. 获取所有菜品并判空
        List<Dish> dishes = dishMapper.selectList(null);
        if (CollectionUtils.isEmpty(dishes)) {
            throw new RuntimeException("暂无菜品数据，无法生成饮食计划");
        }

        // 4. 按目标过滤，为空则用全量
        List<Dish> filteredDishes = dishes.stream()
                .filter(dish -> target.equals(dish.getFitTarget()))
                .collect(Collectors.toList());
        if (CollectionUtils.isEmpty(filteredDishes)) {
            filteredDishes = dishes;
        }

        // 5. 生成三餐计划
        List<DietPlan> plans = new ArrayList<>(3); // 预设容量
        String[] mealTypes = {"早餐", "午餐", "晚餐"};
        Random random = new Random();
        LocalDateTime now = LocalDateTime.now();

        for (String mealType : mealTypes) {
            DietPlan plan = new DietPlan();
            plan.setUserId(uid);
            plan.setPlanName(mealType + "日常饮食计划");
            Dish dish = filteredDishes.get(random.nextInt(filteredDishes.size()));
            plan.setRecipeContent(dish.getDishName() + "，适配" + target + "饮食");
            plan.setTotalCalories(dish.getCalories());
            plan.setStatus("active");
            plan.setCreateTime(now);
            plan.setUpdateTime(now);
            plan.setIsDelete(0);
            plans.add(plan);
        }

        // 6. 批量保存
        this.saveBatch(plans);
        return plans;
    }
}