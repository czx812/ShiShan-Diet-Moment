package com.sssk.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sssk.entity.ClockRecord;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ClockRecordMapper extends BaseMapper<ClockRecord> {

    // 注销账号时删除打卡记录
    @Delete("DELETE FROM clock_record WHERE user_id=#{userId}")
    void deleteByUserId(@Param("userId") Long userId);

}