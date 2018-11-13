package com.yjw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.yjw.dao.YouDao;

import com.yjw.po.You;
import com.yjw.service.YouService;
@Service("YouService")

public class YouServiceImpl implements YouService {
	@Autowired
	private YouDao youDao;
	
	@Override
	public List<You> list() {
		// TODO Auto-generated method stub
		List<You> list=youDao.list();
		return list;
	}

}
