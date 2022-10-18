package com.link.service.serviceCenter.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.link.common.Search;
import com.link.service.domain.Notice;
import com.link.service.domain.QandA;
import com.link.service.domain.Report;
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
		
		sqlSession.insert("NoticeMapper.addNotice", notice);
		
	}

	@Override
	public Notice getNotice(int noticeNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("NoticeMapper.getNotice", noticeNo);
	}


	@Override
	public void updateNotice(Notice notice) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("NoticeMapper.updateNotice", notice);
	}

	

	@Override
	public void getCount(int noticeNo) throws Exception {
		sqlSession.update("NoticeMapper.getCount", noticeNo);
		
	}

	@Override
	public void deleteNotice(int noticeNo) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.delete("NoticeMapper.deleteNotice", noticeNo);
		
	}
//==================================================================여기까지가 Notice	
	
	
	@Override
	public Map<String, Object> getNoticeList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		map.put("getNoticeList",sqlSession.selectList("NoticeMapper.getNoticeList", map));
		return map;
	}

	
	@Override
	public Map<String, Object> getReportList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		map.put("getReportList",sqlSession.selectList("Report_PushMapper.getReportList", map));
		return map;
	}
	
	

	@Override
	public Map<String, Object> getQandAList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		map.put("getQandAList", sqlSession.selectList("QandAMapper.getQandAList", map));
		return map;
	}
//==================================================================여기까지가 List

	@Override
	public void addQandA(QandA qandA) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("QandAMapper.addQandA", qandA);
	}



	@Override
	public void updateQandA(QandA qandA) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("QandAMapper.updateQandA",qandA);
		
	}
	
	@Override
	public QandA getQandA(int qandANo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("QandAMapper.getQandA", qandANo);
	}

	@Override
	public void deleteQandA(int qandA) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("QandAMapper.deleteQandA", qandA);
	}
	
//==================================================================여기까지가 QandA

	@Override
	public void addReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		
		
		sqlSession.insert("Report_PushMapper.addReport", report); //신고하기
	}

	@Override
	public Report getReport(int reportNo) throws Exception {
		
		// TODO Auto-generated method stub
	
	return sqlSession.selectOne("Report_PushMapper.getReport", reportNo);
	}

	@Override
	public void updateReport(Report report) throws Exception {
		// TODO Auto-generated method stub
	 
		sqlSession.update("Report_PushMapper.handleReportCondition", report);
		Report report2 = getReport(report.getNo());
		sqlSession.update("Report_PushMapper.addReportCount", report2); 
		Report report3 = getReport(report.getNo());
		sqlSession.update("Report_PushMapper.stopDate",report3);

	}
	
	@Override
	public Report getReportDuple(Report report) throws Exception{
	System.out.println("데이터 확인용 : " + report);
	return	sqlSession.selectOne("Report_PushMapper.getReportDuple", report);
	
	}
	
//==================================================================여기까지가 Report
	@Override
	public int getTotalCount(Search search, int a) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println(search);
		System.out.println(a);
		
		if(a == 0) {
			return sqlSession.selectOne("Report_PushMapper.getTotalCount", search);
		}else if (a == 1) {
			return sqlSession.selectOne("QandAMapper.getTotalCount", search);
		}else if (a==2) {
			return sqlSession.selectOne("NoticeMapper.getTotalCount", search);
		}else  {  //a==3
			return sqlSession.selectOne("QandAMapper.getTotalCount2", search);
		}
//		else {
//			return sqlSession.selectOne("Report_PushMapper.getTotalCount2", search);
			
//		}
	}
//==================================================================여기까지가 공통


}
