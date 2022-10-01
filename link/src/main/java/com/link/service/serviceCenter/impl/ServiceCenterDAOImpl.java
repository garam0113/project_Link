package com.link.service.serviceCenter.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.link.common.Search;
import com.link.service.domain.Notice;
import com.link.service.serviceCenter.ServiceCenterDAO;

@Repository("ServiceCenterDAOImpl")
public class ServiceCenterDAOImpl implements ServiceCenterDAO {
	
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ServiceCenterDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addNotice(Notice notice) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("\n[ServiceCenterDAOImpl addNotice start]\n");
		
		sqlSession.insert("NoticeMapper.addNotice", notice);
		
		System.out.println("\n[ServiceCenterDAOImpl addNotice end]\n");
	}

	@Override
	public Notice getNotice(int noticeNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("NoticeMapper.getNotice", noticeNo);
	}

	@Override
	public List<Notice> getNoticeList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("NoticeMapper.getNoticeList", search);
	}

	@Override
	public void updateNotice(Notice notice) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("NoticeMapper.updateNotice", notice);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("NoticeMapper.getTotalCount", search);
	}
	
	@Override
	public void removeFileNotice() {
		// TODO Auto-generated method stub

	}
	

	@Override
	public void getCount(int noticeNo) throws Exception {
		sqlSession.update("NoticeMapper.getCount", noticeNo);
		
	}
	
}
