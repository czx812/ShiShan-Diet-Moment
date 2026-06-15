package com.sssk.controller;

import com.sssk.entity.ClockRecord;
import com.sssk.service.ClockRecordService;
import com.sssk.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/clock")
public class ClockController {

    @Resource
    private ClockRecordService clockRecordService;

    @GetMapping("/list/{userId}")
    public Result<List<ClockRecord>> list(@PathVariable Integer userId) {
        List<ClockRecord> list = clockRecordService.lambdaQuery()
                .eq(ClockRecord::getUserId, userId)
                .eq(ClockRecord::getIsDelete, 0)
                .orderByDesc(ClockRecord::getClockTime)
                .list();
        return Result.success(list);
    }

    @PostMapping("/add")
    public Result<?> add(@RequestBody ClockRecord record) {
        LocalDateTime todayStart = LocalDate.now().atStartOfDay();
        LocalDateTime todayEnd = LocalDate.now().plusDays(1).atStartOfDay();
        long count = clockRecordService.lambdaQuery()
                .eq(ClockRecord::getUserId, record.getUserId())
                .between(ClockRecord::getClockTime, todayStart, todayEnd)
                .count();
        if (count > 0) {
            return Result.error("今日已打卡");
        }
        record.setClockTime(LocalDateTime.now());
        record.setCreateTime(LocalDateTime.now());
        record.setIsDelete(0);
        clockRecordService.save(record);
        return Result.success("打卡成功");
    }
}