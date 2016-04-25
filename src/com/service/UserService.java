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
	//根据用户名获取用户
	User getUser(String username);
	//根据用户id获取用户
	User getUser(int userid);
	//更新用户(不判断是否插入null)
	int updateUser(User user);
	//更新用户(不插入Null)
	int updateUserBySelected(User user);
	//上传文件保存
	boolean saveFiles(MultipartFile[] files,String path);
}
