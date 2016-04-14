package com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.UserMapper;
import com.model.User;
import com.model.vo.V_LgoinInf;
import com.model.vo.V_RegInf;
import com.service.UserService;
@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Resource
	private UserMapper userMapper=null;
	
	public int regist(V_RegInf v_reginf) {
		User user=new User();
		user.setUname(v_reginf.getUsername());
		user.setUpassword(v_reginf.getPassword());
		return userMapper.insert(user);
	}

	public User login(V_LgoinInf v_logininf) {
		User user=userMapper.selectByUsername(v_logininf.getUsername());
		if(user!=null){//找到该用户,然后判断密码是否正确
			if(v_logininf.getPassword().equals(user.getUpassword())){
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
