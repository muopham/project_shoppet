package com.devpro.shoppet.service;

import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.devpro.shoppet.entities.Role;
import com.devpro.shoppet.entities.User;

@Service
public class UserService extends BaseService<User> {
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserService userService;

	@Override
	protected Class<User> clazz() {
		return User.class;
	}

	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'";
		return this.getOneByNativeSQL(sql);
	}

	@Transactional
	public User add(User u) throws IllegalStateException, IOException {

		u.setPassword(new BCryptPasswordEncoder(4).encode(u.getPassword()));

		Role guest = roleService.getGuestRole();
		u.addRoles(guest);

		return userService.saveOrUpdate(u);
	}

	@Transactional
	public User addProfile(User u) throws IllegalStateException, IOException {

		User userIdb = super.getById(u.getId());

		if (u.getPassword() == null) {
			u.setPassword(userIdb.getPassword());
		}
		
		u.setUsername(u.getUsername());
		u.setEmail(u.getEmail());
		u.setAddress(u.getAddress());
		u.setPhone(u.getPhone());

		return userService.saveOrUpdate(u);
	}

}
