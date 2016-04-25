package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.JobMapper;
import com.model.Job;
import com.service.JobService;

@Service
@Transactional
public class JobServiceImpl implements JobService{
	@Resource
	private JobMapper jobMapper=null;
	public boolean insertJob(Job job) {
		if(jobMapper.insertSelective(job)>0){
			return true;
		}
		return false;
	}
	public Job getJobByPrimaryKey(String tJid) {
		return jobMapper.selectByPrimaryKey(Integer.valueOf(tJid));
	}
	public List<Job> getjobsByUserId(String tJid) {
		return jobMapper.getJobsByUserId(Integer.valueOf(tJid));
	}
	public List<Job> getAllJobs() {
		return jobMapper.getAllJob();
	}

}
