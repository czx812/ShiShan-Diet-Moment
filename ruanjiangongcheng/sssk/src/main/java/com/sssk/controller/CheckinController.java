package com.sssk.controller;

import com.sssk.entity.CheckinRecord;
import com.sssk.service.CheckinRecordService;
import com.sssk.utils.Result;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/checkin")
public class CheckinController {

    @Resource
    private CheckinRecordService checkinRecordService;

    @PostMapping("/add")
    public Result<?> add(@RequestBody CheckinRecord record) {
        return checkinRecordService.addRecord(record);
    }

    @GetMapping("/list/{userId}")
    public Result<List<CheckinRecord>> list(@PathVariable Long userId) {
        return Result.success(checkinRecordService.listByUserId(userId));
    }
}