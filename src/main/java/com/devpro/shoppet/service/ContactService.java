package com.devpro.shoppet.service;

import org.springframework.stereotype.Service;

import com.devpro.shoppet.entities.Contact;

@Service
public class ContactService extends BaseService<Contact>{

	@Override
	protected Class<Contact> clazz() {
		// TODO Auto-generated method stub
		return Contact.class;
	}
	
	
}
