package com.mapper;

import java.util.List;

import com.model.Job;

public interface JobMapper {
    int deleteByPrimaryKey(Integer tJid);

    int insert(Job record);

    int insertSelective(Job record);

    Job selectByPrimaryKey(Integer tJid);

    int updateByPrimaryKeySelective(Job record);

    int updateByPrimaryKey(Job record);
    
    /*下面是自己增加的部分*/
    //获取所有job
    List<Job> getAllJob();
    //根据用户id获取所有job
    List<Job> getJobsByUserId(Integer uid);
}