package com.sssk.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.ClockRecord;
import com.sssk.mapper.ClockRecordMapper;
import com.sssk.service.ClockRecordService;
import org.springframework.stereotype.Service;

@Service
public class ClockRecordServiceImpl extends ServiceImpl<ClockRecordMapper, ClockRecord> implements ClockRecordService {
}