package com.sssk.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sssk.entity.Post;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PostMapper extends BaseMapper<Post> {
}