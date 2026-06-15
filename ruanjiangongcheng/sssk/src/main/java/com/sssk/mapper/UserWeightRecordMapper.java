package com.sssk.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sssk.entity.UserWeightRecord;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import java.util.List;

@Mapper
public interface UserWeightRecordMapper extends BaseMapper<UserWeightRecord> {

    @Select("SELECT * FROM user_weight_record WHERE user_id = #{userId} ORDER BY record_date ASC")
    List<UserWeightRecord> listByUserId(@Param("userId") Long userId);

    @Delete("DELETE FROM user_weight_record WHERE user_id=#{userId}")
    void deleteByUserId(@Param("userId") Long userId);

}