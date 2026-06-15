package com.sssk.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.UserProfile;
import com.sssk.mapper.UserProfileMapper;
import com.sssk.service.UserProfileService;
import org.springframework.stereotype.Service;

@Service
public class UserProfileServiceImpl extends ServiceImpl<UserProfileMapper, UserProfile> implements UserProfileService {
}