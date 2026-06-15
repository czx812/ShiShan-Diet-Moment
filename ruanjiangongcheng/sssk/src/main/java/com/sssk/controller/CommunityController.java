package com.sssk.controller;

import com.sssk.entity.Post;
import com.sssk.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/community")
public class CommunityController {

    @GetMapping("/post/list")
    public Result list() {
        Post p = new Post();
        p.setId(1L);
        p.setTitle("今天减脂成功！");
        p.setContent("坚持饮食控制打卡！");
        return Result.success(List.of(p));
    }
}