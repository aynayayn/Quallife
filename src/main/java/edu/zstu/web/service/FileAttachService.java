package edu.zstu.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.zstu.web.dao.FileAttachDao;
import edu.zstu.web.entity.FileAttach;

@Service
public class FileAttachService extends CrudService<FileAttach, FileAttachDao> {

	@Autowired
	private FileAttachDao fileAttachDao;
	@Autowired
	public void setFileAttachDao(FileAttachDao fileAttachDao){
		this.fileAttachDao=fileAttachDao;
	}
	@Override
	protected FileAttachDao getDao() {
		// TODO Auto-generated method stub
		return this.fileAttachDao;
	}
}
