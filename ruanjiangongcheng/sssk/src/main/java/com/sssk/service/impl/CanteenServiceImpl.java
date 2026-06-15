package com.sssk.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.Canteen;
import com.sssk.mapper.CanteenMapper;
import com.sssk.service.CanteenService;
import org.springframework.stereotype.Service;

@Service
public class CanteenServiceImpl extends ServiceImpl<CanteenMapper, Canteen> implements CanteenService {
}