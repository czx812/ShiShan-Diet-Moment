package com.sssk.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sssk.entity.Announcement;
import com.sssk.mapper.AnnouncementMapper;
import com.sssk.service.AnnouncementService;
import org.springframework.stereotype.Service;

@Service
public class AnnouncementServiceImpl extends ServiceImpl<AnnouncementMapper, Announcement> implements AnnouncementService {
}