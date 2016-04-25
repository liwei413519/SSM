package com.service.impl;
import java.io.File;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
		//设置用户类型
		user.setUtype(v_reginf.getUsertype());
		return userMapper.insertSelective(user);
	}

	public User login(V_LgoinInf v_logininf) {
		User user=userMapper.selectByUsername(v_logininf.getUsername());
		if(user!=null){//找到该用户,然后判断密码是否正确
			if(MD5Util.MD5(v_logininf.getPassword()).equals(user.getUpassword())){
				//更新用户成功登录次数
				user.setUlogintimes(user.getUlogintimes()+1);
				userMapper.updateByPrimaryKey(user);
				return user;
			}
		}
		return null;
	}

	public User getUser(String username) {
		User user=userMapper.selectByUsername(username);
		return user;
	}

	public int updateUser(User user) {
		return userMapper.updateByPrimaryKey(user);
	}

	public int updateUserBySelected(User user) {
		return userMapper.updateByPrimaryKeySelective(user);
	}

	public boolean saveFiles(MultipartFile[] files,String path) {
		if(files!=null && files.length>0){//文件不空切大于0个
			for(MultipartFile file:files){//循环添加文件名称并且保存文件到指定的路径
				//得到文件后缀
				String filename=file.getOriginalFilename();
				String end=filename.substring(filename.lastIndexOf(".")+1);
				boolean flag=saveFile(file,path+"/"+MD5Util.MD5(filename)+"."+end);
				if(!flag){//文件上传出错
					return false;
				}
			}
			return true;
		}
		return false;//files为空的
	}
	//保存单个文件到指定路径
	public boolean saveFile(MultipartFile file,String path){
		if(!file.isEmpty()){//如果文件不空
			try{
				File f=new File(path);
				if(!f.exists()){//文件目录不存在
					f.mkdirs();
				}
				file.transferTo(new File(path));
				return true;
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return false;
	}

	public User getUser(int userid) {
		return userMapper.selectByPrimaryKey(userid);
	}
}
