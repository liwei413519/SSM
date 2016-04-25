package com.mapper;

import java.util.List;

import com.model.Msg;

public interface MsgMapper {
    int deleteByPrimaryKey(Integer tMid);

    int insert(Msg record);

    int insertSelective(Msg record);

    Msg selectByPrimaryKey(Integer tMid);

    int updateByPrimaryKeySelective(Msg record);

    int updateByPrimaryKey(Msg record);
    
    /*下面是自己增加的部分*/
    //获取所有消息
    List<Msg> getAll();
    //根据fromid拿到msg对象集合
    List<Msg> getMsgsByFromId(Integer fromid);
    //根据toid拿到msg对象集合
    List<Msg> getMsgsByToId(Integer toid);
    //根据toandfromid拿到对象集合
    List<Msg> getMsgsByFromAndToId(Integer fromid,Integer toid);
    //根据toid获取消息数量
    int getMsgCount(Integer toid);
    //根据toid获取新消息数量
    int getNewMsgCount(Integer toid);
    //
    int updateToHasRead(Integer toid);
}