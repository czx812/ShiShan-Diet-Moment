package com.sssk.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.Dish;
import com.sssk.entity.Canteen;
import com.sssk.mapper.DishMapper;
import com.sssk.service.CanteenService;
import com.sssk.service.DishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class DishServiceImpl extends ServiceImpl<DishMapper, Dish> implements DishService {

    @Autowired
    private CanteenService canteenService;

    // 👇 这里 100% 和接口一致！！！
    @Override
    public List<Dish> getDishList(
            String keyword,
            Integer cateId,
            BigDecimal minPrice,
            BigDecimal maxPrice,
            Integer canteenId,
            String fitTarget
    ) {
        LambdaQueryWrapper<Dish> wrapper = new LambdaQueryWrapper<>();

        if (keyword != null && !keyword.isBlank()) {
            wrapper.like(Dish::getDishName, keyword);
        }
        if (cateId != null) {
            wrapper.eq(Dish::getCateId, cateId);
        }
        if (minPrice != null) {
            wrapper.ge(Dish::getPrice, minPrice);
        }
        if (maxPrice != null) {
            wrapper.le(Dish::getPrice, maxPrice);
        }
        if (canteenId != null) {
            wrapper.eq(Dish::getCanteenId, canteenId);
        }
        if (fitTarget != null && !fitTarget.isBlank()) {
            wrapper.eq(Dish::getFitTarget, fitTarget);
        }

        wrapper.eq(Dish::getIsDelete, 0);
        wrapper.eq(Dish::getIsOnSale, 1);

        List<Dish> dishList = list(wrapper);

        // 赋值逻辑 正确
        for (Dish dish : dishList) {
            Integer cid = dish.getCanteenId();
            if (cid != null) {
                Canteen canteen = canteenService.getById(cid);
                if (canteen != null) {
                    dish.setLocation(canteen.getLocation());
                }
            }
        }

        return dishList;
    }

    @Override
    public Dish randomRecommend(Long userId) {
        List<Dish> list = list();
        if (list.isEmpty()) return null;
        return list.get((int) (Math.random() * list.size()));
    }
}