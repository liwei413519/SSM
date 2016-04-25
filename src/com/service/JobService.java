package com.service;

import java.util.List;
import com.model.Job;

/**
 * 岗位相关的服务
 * @author Administrator
 *
 */
public interface JobService {
	//插入一个job对象
	boolean insertJob(Job job);
	//根据主键得到一个job对象
	Job getJobByPrimaryKey(String tJid);
	//根据用户id得到所有job对象
	List<Job> getjobsByUserId(String tJid);
	//根据userid拿到所有job对象
	List<Job> getAllJobs();
}
