// PostService.java（接口）
package com.sssk.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.sssk.entity.Post;
import com.sssk.utils.Result;
import java.util.List;

public interface PostService extends IService<Post> {
    // 必须定义这三个方法
    List<Post> list();
    Result<?> publish(Post post);
    List<Post> search(String keyword);
}