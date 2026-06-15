package com.sssk.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.sssk.entity.DishComment;
import com.sssk.service.DishCommentService;
import com.sssk.utils.Result;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/comment")
public class DishCommentController {
    private final DishCommentService dishCommentService;

    public DishCommentController(DishCommentService dishCommentService) {
        this.dishCommentService = dishCommentService;
    }

    @PostMapping("/add")
    public Result<Void> addComment(@RequestBody DishComment comment){
        comment.setIsDelete(0);
        dishCommentService.save(comment);
        return Result.success();
    }

    @GetMapping("/list/{dishId}")
    public Result<List<DishComment>> getByDish(@PathVariable Integer dishId){
        List<DishComment> list = dishCommentService.list(
                new LambdaQueryWrapper<DishComment>()
                        .eq(DishComment::getDishId, dishId)
                        .eq(DishComment::getIsDelete, 0)
                        .orderByDesc(DishComment::getCreateTime)
        );
        return Result.success(list);
    }
}