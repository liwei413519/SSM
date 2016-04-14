package com.mapper;

import com.model.Msg;

public interface MsgMapper {
    int deleteByPrimaryKey(Integer tMid);

    int insert(Msg record);

    int insertSelective(Msg record);

    Msg selectByPrimaryKey(Integer tMid);

    int updateByPrimaryKeySelective(Msg record);

    int updateByPrimaryKey(Msg record);
}