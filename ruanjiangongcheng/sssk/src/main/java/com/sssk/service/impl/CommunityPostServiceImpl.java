package com.sssk.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.CommunityPost;
import com.sssk.mapper.CommunityPostMapper;
import com.sssk.service.CommunityPostService;
import org.springframework.stereotype.Service;

@Service
public class CommunityPostServiceImpl extends ServiceImpl<CommunityPostMapper, CommunityPost> implements CommunityPostService {
}
