// CheckinRecordService.java（接口）
package com.sssk.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.sssk.entity.CheckinRecord;
import com.sssk.utils.Result;
import java.util.List;

public interface CheckinRecordService extends IService<CheckinRecord> {
    Result<?> addRecord(CheckinRecord record);
    List<CheckinRecord> listByUserId(Long userId);
}