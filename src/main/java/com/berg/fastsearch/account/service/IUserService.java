package com.berg.fastsearch.account.service;

import com.berg.fastsearch.account.dto.UserDto;
import com.berg.fastsearch.account.entity.User;

/**
 * <p>用户服务接口</p>
 *
 * @author bo.he02@hand-china.com
 * @version v1.0
 * @apiNote Created on 18-3-18
 */
public interface IUserService{

    /**
     * 根据用户名来查找用户
     * @param name      用户名
     * @return          找到的用户
     */
    UserDto findByName(String name);
}
