package com.sssk.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.sssk.entity.Announcement;
import com.sssk.service.AnnouncementService;
import com.sssk.utils.Result;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/announce")
public class AnnouncementController {
    private final AnnouncementService announceService;

    public AnnouncementController(AnnouncementService announceService) {
        this.announceService = announceService;
    }

    // 管理员发布公告
    @PostMapping("/add")
    public Result<Void> addAnnounce(@RequestBody Announcement announce){
        announce.setIsDelete(0);
        if(announce.getIsTop() == null) announce.setIsTop(0);
        announceService.save(announce);
        return Result.success();
    }

    // 用户查看公告
    @GetMapping("/list")
    public Result<List<Announcement>> listAnnounce(){
        List<Announcement> list = announceService.list(
                new LambdaQueryWrapper<Announcement>()
                        .eq(Announcement::getIsDelete,0)
                        .orderByDesc(Announcement::getIsTop,Announcement::getCreateTime)
        );
        return Result.success(list);
    }
}