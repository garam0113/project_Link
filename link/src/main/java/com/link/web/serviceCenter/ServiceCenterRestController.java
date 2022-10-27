package com.link.web.serviceCenter;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.link.common.Search;
import com.link.service.domain.ClubPost;
import com.link.service.domain.Comment;
import com.link.service.domain.Feed;
import com.link.service.domain.Report;
import com.link.service.feed.FeedService;
import com.link.service.serviceCenter.ServiceCenterService;

@RestController
@RequestMapping("/serviceCenterRest/*")
public class ServiceCenterRestController {
	
	@Autowired
	@Qualifier("ServiceCenterServiceImpl")
	private ServiceCenterService serviceCenterService;
	
	@Autowired
	@Qualifier("feedServiceImpl")
	private FeedService	feedService;
	
	public ServiceCenterRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass() + "default constructor");
	}
	
	@Value("#{commonProperties['pageSize'] ?: 10}")
	int pageSize;

	@Value("#{commonProperties['pageUnit'] ?: 10}")
	int pageUnit;
	
	@RequestMapping(value = "/json/addReport", method = RequestMethod.POST)
	public String addReport(@RequestBody Report report,  Model model , @PathVariable int clubNo,
			@RequestParam(value = "clubPostNo", required =false) int clubPostNo ,Search search  )throws Exception {
		
		Comment comment = new Comment();
		System.out.println("/serviceCenterRest/json/addReport : POST");

		System.out.println(report);
		//사진 업로드
/*		int fileCount = 0;
		
		String root ="C:\\Users\\903-16\\git\\link\\link\\src\\main\\webapp\\resources\\image\\uploadFiles\\";
			 
		for(MultipartFile files : file) {
			fileCount++;
			System.out.println(files.getOriginalFilename());
				
			if(fileCount != file.length) {
			  report.setReportImage2(files.getOriginalFilename());
			}
			 report.setReportImage1(files.getOriginalFilename());
			File saveFile = new File(root+ files.getOriginalFilename());
			boolean isExists = saveFile.exists();
			if(!isExists) {
				files.transferTo(saveFile);
			}
		}   */	

		
		Map<String, Object> map = new HashMap<String, Object>();
	
					ClubPost clubPost = new ClubPost();
					Feed feed = new Feed();
					
					if(report.getReportSource()==1) {				//모임게시물
						clubPost.setClubPostNo(report.getNo());
						report.setClubPost(clubPost);
					}else if(report.getReportSource()==2) {   		//모임게시물댓글
						comment.setClubPostCommentNo(report.getNo());
						report.setClubPostComment(comment);
					}
					else if(report.getReportSource()==3) {			//피드
						feed.setFeedNo(report.getNo());
						report.setFeed(feed);
						
					}else if(report.getReportSource()==4) {			//피드댓글
					report.setFeedComment(feedService.getFeedComment(report.getNo()));
					map.put("feedNo", report.getFeedComment().getFeedNo());
					report.setFeed((Feed)feedService.getFeed(map).get("feed"));
					}
					

			serviceCenterService.addReport(report);
			model.addAttribute("report", report);

		
		//돌려보내는 곳 신고하기 전 -1하고, alter 창? 완료 되었습니다 2개 변경
		return "forward:/serviceCenter/serviceCenterHome.jsp";
	}
	
	/*
	 * @RequestMapping(value="/json/getQandAList", method = RequestMethod.POST)
	 * public Map<String, Object> getQandAList(@RequestBody Search search, QandA
	 * qandA, String userId) throws Exception {
	 * 
	 * System.out.println("/serviceCenter/getQandAList :POST");
	 * if(search.getCurrentPage() == 0) { search.setCurrentPage(1); }
	 * search.setPageSize(pageSize); String userId1=""; Map<String, Object> map =
	 * serviceCenterService.getQandAList(search, qandA , userId1);
	 * 
	 * Page resultPage = new Page(search.getCurrentPage(),
	 * ((Integer)map.get("totalCount")), pageUnit, pageSize);
	 * 
	 * map.put("search", search); map.put("qandA", qandA); map.put("resultPage",
	 * resultPage); map.put("userId", "userId");
	 * 
	 * return map; }
	 */
	

}//RestController 끝
