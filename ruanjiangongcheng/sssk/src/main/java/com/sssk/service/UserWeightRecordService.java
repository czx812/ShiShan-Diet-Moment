package com.sssk.service;

import com.sssk.entity.UserWeightRecord;
import com.sssk.mapper.UserWeightRecordMapper;
import org.springframework.stereotype.Service;
import jakarta.annotation.Resource; // 这里换成 jakarta
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class UserWeightRecordService {

    @Resource
    private UserWeightRecordMapper mapper;

    public void save(Long userId, BigDecimal weight) {
        UserWeightRecord record = new UserWeightRecord();
        record.setUserId(userId);
        record.setWeight(weight);
        record.setRecordDate(LocalDateTime.now());
        mapper.insert(record);
    }

    public List<UserWeightRecord> getHistory(Long userId) {
        return mapper.listByUserId(userId);
    }
}