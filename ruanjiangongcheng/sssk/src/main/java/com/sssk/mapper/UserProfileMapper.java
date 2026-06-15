package com.sssk.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sssk.entity.UserProfile;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserProfileMapper extends BaseMapper<UserProfile> {

    @Delete("DELETE FROM user_profile WHERE user_id=#{userId}")
    void deleteByUserId(@Param("userId") Long userId);

}