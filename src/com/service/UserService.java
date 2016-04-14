package com.service;

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
}
