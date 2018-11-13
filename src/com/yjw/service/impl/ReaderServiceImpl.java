package com.yjw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yjw.dao.ReaderDao;
import com.yjw.po.Reader;
import com.yjw.service.ReaderService;


@Service("readerService")
@Transactional
public class ReaderServiceImpl implements ReaderService {
	@Autowired
	private ReaderDao readerDao;
	@Override
	public int createReader(Reader reader) {
		// TODO Auto-generated method stub
		return readerDao.createReader(reader);
	}

	@Override
	public Reader getReaderById(Integer id) {
		// TODO Auto-generated method stub
		Reader reader=readerDao.getReaderById(id);
		return reader;
	}

	@Override
	public int updateReader(Reader reader) {
		// TODO Auto-generated method stub
		return readerDao.updateReader(reader);
	}

	@Override
	public int deleteReader(Integer id) {
		// TODO Auto-generated method stub
		return readerDao.deleteReader(id);
	}

	@Override
	public List<Reader> list() {
		// TODO Auto-generated method stub
		return readerDao.list();
	}

	@Override
	public List<Reader> searchName(String name) {
		// TODO Auto-generated method stub
		return readerDao.searchName(name);
		
	}

	@Override
	public Reader findReader(Integer readerid, String password) {
		// TODO Auto-generated method stub
		Reader reader = this.readerDao.findReader(readerid, password);
		return reader;
	}
}
