package com.sssk.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.sssk.entity.CommunityPost;
import com.sssk.service.CommunityPostService;
import com.sssk.utils.Result;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/post")
public class CommunityPostController {
    private final CommunityPostService postService;

    public CommunityPostController(CommunityPostService postService) {
        this.postService = postService;
    }

    @PostMapping("/add")
    public Result<Void> addPost(@RequestBody CommunityPost post){
        post.setLikeCount(0);
        post.setIsDelete(0);
        postService.save(post);
        return Result.success();
    }

    @GetMapping("/list")
    public Result<List<CommunityPost>> listAll(){
        List<CommunityPost> list = postService.list(
                new LambdaQueryWrapper<CommunityPost>()
                        .eq(CommunityPost::getIsDelete,0)
                        .orderByDesc(CommunityPost::getCreateTime)
        );
        return Result.success(list);
    }

    @PostMapping("/like/{postId}")
    public Result<Void> like(@PathVariable Integer postId){
        CommunityPost post = postService.getById(postId);
        if(post != null){
            post.setLikeCount(post.getLikeCount()+1);
            postService.updateById(post);
        }
        return Result.success();
    }

    // F11帖子搜索
    @GetMapping("/search")
    public Result<List<CommunityPost>> search(@RequestParam String keyword){
        List<CommunityPost> list = postService.list(
                new LambdaQueryWrapper<CommunityPost>()
                        .like(CommunityPost::getTitle,keyword)
                        .or()
                        .like(CommunityPost::getContent,keyword)
                        .eq(CommunityPost::getIsDelete,0)
        );
        return Result.success(list);
    }
}