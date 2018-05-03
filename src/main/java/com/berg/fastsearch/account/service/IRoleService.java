package com.berg.fastsearch.account.service;

import com.berg.fastsearch.account.dto.RoleDto;

import java.util.List;

/**
 * <p>角色服务接口</p>
 *
 * @author bo.he02@hand-china.com
 * @version v1.0
 * @apiNote Created on 18-3-18
 */
public interface IRoleService{

    /**
     * 根据用户的id来查找其所拥有的权限对象
     * @param userId        用户id
     * @return              所有的权限对象
     */
    List<RoleDto> findByUserId(Long userId);
}
