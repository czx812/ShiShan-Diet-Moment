package com.sssk.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.sssk.entity.Dish;
import java.math.BigDecimal;
import java.util.List;

public interface DishService extends IService<Dish> {
    // 全部统一：canteenId
    List<Dish> getDishList(String keyword, Integer cateId, BigDecimal minPrice, BigDecimal maxPrice, Integer canteenId, String fitTarget);
    Dish randomRecommend(Long userId);
}