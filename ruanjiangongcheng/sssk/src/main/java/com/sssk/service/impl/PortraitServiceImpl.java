package com.sssk.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.Portrait;
import com.sssk.mapper.PortraitMapper;
import com.sssk.service.PortraitService;
import org.springframework.stereotype.Service;

@Service
public class PortraitServiceImpl extends ServiceImpl<PortraitMapper, Portrait> implements PortraitService {
}
