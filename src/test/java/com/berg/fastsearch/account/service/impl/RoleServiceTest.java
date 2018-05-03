package com.berg.fastsearch.account.service.impl;

import com.berg.fastsearch.FastsearchApplicationTests;
import com.berg.fastsearch.account.dto.RoleDto;
import com.berg.fastsearch.account.service.IRoleService;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>角色服务测试</p>
 *
 * @author bo.he02@hand-china.com
 * @version v1.0
 * @apiNote Created on 18-3-18
 */
public class RoleServiceTest extends FastsearchApplicationTests {

    @Autowired
    private IRoleService roleService;

    /**
     * 测试select
     */
    @Test
    public void testSelect(){
        List<RoleDto> select = roleService.findByUserId(1L);

        Assert.assertEquals(1L, select.size());
        Assert.assertEquals("ADMIN", select.get(0).getName());
    }
}

