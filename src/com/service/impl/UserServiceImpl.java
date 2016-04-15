package com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.UserMapper;
import com.model.User;
import com.model.vo.V_LgoinInf;
import com.model.vo.V_RegInf;
import com.service.UserService;
import com.util.MD5Util;
@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Resource
	private UserMapper userMapper=null;
	
	public int regist(V_RegInf v_reginf) {
		User user=new User();
		user.setUname(v_reginf.getUsername());
		//密码加密保存
		user.setUpassword(MD5Util.MD5(v_reginf.getPassword()));
		user.setUtype(v_reginf.getUsertype());
		return userMapper.insert(user);
	}

	public User login(V_LgoinInf v_logininf) {
		User user=userMapper.selectByUsername(v_logininf.getUsername());
		if(user!=null){//找到该用户,然后判断密码是否正确
			if(MD5Util.MD5(v_logininf.getPassword()).equals(user.getUpassword())){
				return user;
			}
		}
		return null;
	}

	public User getUser(String username) {
		User user=userMapper.selectByUsername(username);
		return user;
	}

	

}
