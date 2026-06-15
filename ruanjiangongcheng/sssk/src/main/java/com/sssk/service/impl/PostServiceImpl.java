// PostServiceImpl.java（实现类）
package com.sssk.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.Post;
import com.sssk.mapper.PostMapper;
import com.sssk.service.PostService;
import com.sssk.utils.Result;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements PostService {

    @Override
    public List<Post> list() {
        return super.list();
    }

    @Override
    public Result<?> publish(Post post) {
        save(post);
        return Result.success("发布成功");
    }

    @Override
    public List<Post> search(String keyword) {
        LambdaQueryWrapper<Post> wrapper = new LambdaQueryWrapper<>();
        wrapper.like(Post::getTitle, keyword)
                .or()
                .like(Post::getContent, keyword);
        return list(wrapper);
    }
}
