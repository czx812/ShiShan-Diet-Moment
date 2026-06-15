package com.sssk.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.NutritionStats;
import com.sssk.mapper.NutritionStatsMapper;
import com.sssk.service.NutritionStatsService;
import org.springframework.stereotype.Service;

@Service
public class NutritionStatsServiceImpl extends ServiceImpl<NutritionStatsMapper, NutritionStats> implements NutritionStatsService {
}