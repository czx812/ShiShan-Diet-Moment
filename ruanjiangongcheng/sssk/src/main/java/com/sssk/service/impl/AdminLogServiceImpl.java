package com.sssk.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.AdminLog;
import com.sssk.mapper.AdminLogMapper;
import com.sssk.service.AdminLogService;
import org.springframework.stereotype.Service;

@Service
public class AdminLogServiceImpl extends ServiceImpl<AdminLogMapper, AdminLog> implements AdminLogService {
}
