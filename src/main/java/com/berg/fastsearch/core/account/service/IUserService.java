package com.berg.fastsearch.core.account.service;

import com.berg.fastsearch.core.account.entity.User;
import com.berg.fastsearch.core.account.web.dto.RoleQueryCondition;
import com.berg.fastsearch.core.account.web.dto.UserDto;
import com.berg.fastsearch.core.account.web.dto.UserQueryCondition;
import com.berg.fastsearch.core.system.base.service.IBaseService;

/**
 * <p>用户服务接口</p>
 *
 * @author bergturing@qq.com
 * @version v1.0
 * @apiNote Created on 18-3-18
 */
public interface IUserService extends IBaseService<Long, UserDto, UserQueryCondition> {

    /**
     * 根据用户名来查找用户
     * @param name      用户名
     * @return          找到的用户
     */
    UserDto findByName(String name);
}
