package com.sssk.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.CheckinRecord;
import com.sssk.mapper.CheckinRecordMapper;
import com.sssk.service.CheckinRecordService;
import com.sssk.utils.Result;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class CheckinRecordServiceImpl extends ServiceImpl<CheckinRecordMapper, CheckinRecord> implements CheckinRecordService {

    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    @Override
    public Result<?> addRecord(CheckinRecord record) {
        try {
            // 1. 强制给userId赋值兜底
            if (record.getUserId() == null) {
                record.setUserId(1L);
            }

            // 2. 设置日期和状态
            String todayStr = LocalDate.now().format(FORMATTER);
            record.setDate(todayStr);
            record.setStatus("已打卡");

            // 3. 直接保存（先不判重，保证先跑通）
            save(record);

            // 4. 固定返回标准成功JSON
            return Result.success("打卡成功");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("打卡失败：" + e.getMessage());
        }
    }

    @Override
    public List<CheckinRecord> listByUserId(Long userId) {
        return lambdaQuery()
                .eq(CheckinRecord::getUserId, userId)
                .orderByDesc(CheckinRecord::getDate)
                .list();
    }
}