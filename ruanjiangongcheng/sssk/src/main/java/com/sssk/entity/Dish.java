package com.sssk.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.math.BigDecimal;

@TableName(value = "dish", autoResultMap = true)
public class Dish {

    // 你原有代码 完全不动
    @TableId("dish_id")
    private Long dishId;
    private String dishName;
    private BigDecimal price;
    private Integer calories;
    private Integer cateId;
    @TableField("canteen_id")
    private Integer canteenId;
    private String fitTarget;
    private Integer isDelete;
    private Integer isOnSale;

    private BigDecimal protein;
    private BigDecimal fat;
    private BigDecimal carbs;

    // ======================
    // 只加这 4 行
    // ======================
    @TableField(exist = false)
    private String location;

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }


    // 你所有 getter setter 完全不动
    public Long getDishId() { return dishId; }
    public void setDishId(Long dishId) { this.dishId = dishId; }
    public String getDishName() { return dishName; }
    public void setDishName(String dishName) { this.dishName = dishName; }
    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }
    public Integer getCalories() { return calories; }
    public void setCalories(Integer calories) { this.calories = calories; }
    public Integer getCateId() { return cateId; }
    public void setCateId(Integer cateId) { this.cateId = cateId; }
    public Integer getCanteenId() { return canteenId; }
    public void setCanteenId(Integer canteenId) { this.canteenId = canteenId; }
    public String getFitTarget() { return fitTarget; }
    public void setFitTarget(String fitTarget) { this.fitTarget = fitTarget; }
    public Integer getIsDelete() { return isDelete; }
    public void setIsDelete(Integer isDelete) { this.isDelete = isDelete; }
    public Integer getIsOnSale() { return isOnSale; }
    public void setIsOnSale(Integer isOnSale) { this.isOnSale = isOnSale; }

    public BigDecimal getProtein() { return protein; }
    public void setProtein(BigDecimal protein) { this.protein = protein; }
    public BigDecimal getFat() { return fat; }
    public void setFat(BigDecimal fat) { this.fat = fat; }
    public BigDecimal getCarbs() { return carbs; }
    public void setCarbs(BigDecimal carbs) { this.carbs = carbs; }

}