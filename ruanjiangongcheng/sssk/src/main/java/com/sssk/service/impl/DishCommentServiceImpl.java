package com.sssk.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.DishComment;
import com.sssk.mapper.DishCommentMapper;
import com.sssk.service.DishCommentService;
import org.springframework.stereotype.Service;

@Service
public class DishCommentServiceImpl extends ServiceImpl<DishCommentMapper, DishComment> implements DishCommentService {
}