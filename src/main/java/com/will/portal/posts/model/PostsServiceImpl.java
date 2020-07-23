package com.will.portal.posts.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostsServiceImpl implements PostsService{
	@Autowired
	private PostsDAO postsDao;

	@Override
	public PostsAllVO SelectByCode(String postCode) {
		return postsDao.SelectByCode(postCode);
	}
	
	
}
