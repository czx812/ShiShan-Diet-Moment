package com.sssk.controller;

import com.sssk.entity.Dish;
import com.sssk.service.DishService;
import com.sssk.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.annotation.TableField;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/dish")
public class DishController {

    @Resource
    private DishService dishService;

    // 直接用 JDBC 读数据库！不需要任何 Mapper
    @Resource
    private JdbcTemplate jdbcTemplate;

    // 读取菜品分类（从 dish_category 表）
    @GetMapping("/category/list")
    public Result categoryList() {
        String sql = "SELECT cate_id id, cate_name name FROM dish_category ORDER BY cate_id";
        return Result.success(jdbcTemplate.queryForList(sql));
    }

    @GetMapping("/list")
    public Result<List<Map<String, Object>>> getDishList(
            @RequestParam(required = false) String keyword,
            @RequestParam(required = false) Integer cate_id,
            @RequestParam(required = false) BigDecimal minPrice,
            @RequestParam(required = false) BigDecimal maxPrice,
            @RequestParam(required = false) Integer canteen_id,
            @RequestParam(required = false) String fitTarget
    ) {
        List<Dish> list = dishService.getDishList(keyword, cate_id, minPrice, maxPrice, canteen_id, fitTarget);
        List<Map<String, Object>> result = new ArrayList<>();

        for (Dish dish : list) {
            Map<String, Object> map = new java.util.HashMap<>();
            map.put("dishId", dish.getDishId());
            map.put("dishName", dish.getDishName());
            map.put("calories", dish.getCalories());
            map.put("protein", dish.getProtein());
            map.put("fat", dish.getFat());
            map.put("carbs", dish.getCarbs());
            map.put("fitTarget", dish.getFitTarget());
            map.put("canteenId", dish.getCanteenId());
            map.put("location", dish.getLocation());
            // ======================
            // 直接从数据库查询窗口名称
            // ======================
            if (dish.getCanteenId() != null) {
                try {
                    String sql = "SELECT canteen_name FROM canteen WHERE canteen_id = ?";
                    String canteenName = jdbcTemplate.queryForObject(sql, String.class, dish.getCanteenId());
                    map.put("canteenName", canteenName);
                } catch (Exception e) {
                    map.put("canteenName", "未设置");
                }
            } else {
                map.put("canteenName", "未设置");
            }

            result.add(map);
        }

        return Result.success(result);
    }

    @GetMapping("/random")
    public Result<Dish> randomRecommend(@RequestParam Long userId) {
        Dish dish = dishService.randomRecommend(userId);
        return Result.success(dish);
    }
}