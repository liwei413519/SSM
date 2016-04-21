package com.service;

import org.springframework.web.multipart.MultipartFile;

import com.model.User;
import com.model.vo.V_LgoinInf;
import com.model.vo.V_RegInf;

/**
 * 用户相关的服务
 * @author Administrator
 *
 */
public interface UserService {
	//用户注册
	int regist(V_RegInf v_reginf);
	//用户登录
	User login(V_LgoinInf v_logininf);
	//获取用户
	User getUser(String username);
	//更新用户(不判断是否插入null)
	int updateUser(User user);
	//更新用户(不插入Null)
	int updateUserBySelected(User user);
	//保存用户头像
	boolean saveFiles(MultipartFile[] files,String path);
	//文件上传保存
//	boolean uploadFiles(MultipartFile[] files,String basepath);
}
