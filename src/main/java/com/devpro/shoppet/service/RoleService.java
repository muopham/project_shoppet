package com.devpro.shoppet.service;

import org.springframework.stereotype.Service;

import com.devpro.shoppet.entities.Role;

@Service
public class RoleService extends BaseService<Role> {

	@Override
	protected Class<Role> clazz() {
		
		return Role.class;
	}
	
	public Role getGuestRole() {
		return getOneByNativeSQL("SELECT * FROM tbl_roles where name = 'GUEST'");
	}
	
	public Role getAdminRole() {
		return getOneByNativeSQL("SELECT * FROM tbl_roles where name = 'ADMIN'");
	}

}
