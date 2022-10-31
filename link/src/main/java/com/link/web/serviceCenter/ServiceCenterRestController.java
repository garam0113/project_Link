package com.link.web.serviceCenter;



import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.link.common.Search;
import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.Club;
import com.link.service.domain.ClubPost;
import com.link.service.domain.Comment;
import com.link.service.domain.Feed;
import com.link.service.domain.Report;
import com.link.service.domain.User;
import com.link.service.feed.FeedService;
import com.link.service.serviceCenter.ServiceCenterService;

@RestController
@RequestMapping("/serviceCenterRest/*")
public class ServiceCenterRestController {
	
	@Autowired
	@Qualifier("ServiceCenterServiceImpl")
	private ServiceCenterService serviceCenterService;
		
	@Autowired
	@Qualifier("clubPostServiceImpl")
	private ClubPostService	clubPostService;
	
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
	public String addReport(@RequestBody Report report,  Model model , @RequestParam int clubNo,
			@RequestParam(value = "clubPostNo", required =false) int clubPostNo ,Search search  )throws Exception {
			//Search search  )throws Exception {
		
		Comment comment = new Comment();
		System.out.println("/serviceCenterRest/json/addReport : POST");

		System.out.println(report);
		System.out.println("asdf   "+clubNo);  //모임번호
		System.out.println("asdf   "+clubPostNo); //모임게시물번호
		//사진 업로드
		
		Map<String, Object> map = new HashMap<String, Object>();
					Club club = new Club();
					ClubPost clubPost = new ClubPost();
					Feed feed = new Feed();
					
					if(report.getReportSource()==1) {				//모임게시물
						club.setClubNo(clubNo);
						clubPost.setClubPostNo(report.getNo());
						report.setClub(club);
						report.setClubPost(clubPost);
					}else if(report.getReportSource()==2) {   		//모임게시물댓글
						comment.setClubPostCommentNo(report.getNo());
						club.setClubNo(clubNo);
						clubPost.setClubPostNo(clubPostNo);
						report.setComment(comment);
						report.setClub(club);
						report.setClubPost(clubPost);
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
	
	@RequestMapping(value= "/json/getFestivalList", method = RequestMethod.GET)
	public JSONArray getFestivalList(@RequestBody Search search, Model model) throws Exception{
		StringBuilder urlBuilder = new StringBuilder(
				("http://apis.data.go.kr/B551011/KorService/areaBasedList?"
						+ "numOfRows=12"
						+ "&pageNo=1&"
						+ "MobileOS=ETC"
						+ "&MobileApp=AppTest"
						+ "&ServiceKey=zBGM3gx0Dc2jBEW14Zfw26CVqo2w018oxuxycZo6dMCuzeN25ma4CNoVlRDiS2k%2BXoOyBXC88QgaP1T4DZ9DuQ%3D%3D"
						+ "&listYN=Y"
						+ "&arrange=C"
						+ "&contentTypeId=15"
						+ "&areaCode=1"
						+ "&sigunguCode="
						+ "&cat1=A02"
						+ "&cat2=A0207"
						+ "&cat3=A02070200")); 
		
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
		System.out.println(rd.toString());
		
		JSONParser parser = new JSONParser();
		JSONObject obj = (JSONObject)parser.parse(sb.toString());
		JSONArray dataArr = (JSONArray)obj.get("data");
		
		return dataArr;
	}
	
	
	
	
	/*
	 * @RequestMapping(value = "/json/updateReport", method = RequestMethod.POST)
	 * public String updateReport(@RequestBody Report report, Model model , Search
	 * search )throws Exception {
	 * 
	 * 
	 * 
	 * return "forward:/serviceCenter/serviceCenterHome.jsp"; }
	 */
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
	
	@RequestMapping(value = "/json/updateReport", method = RequestMethod.POST)
	public String updateReport(@RequestBody Report report,  String number,
			User user, Map<String, Object> map, ClubPost clubPost, Comment comment, HttpSession httpSession, Model model) throws Exception {
		
		System.out.println("/ServiceCenter/updateReport : POST");

			System.out.println(report+" 처음 들어온 값");
			serviceCenterService.updateReport(report);
			System.out.println(report);
			report = serviceCenterService.getReport(report.getNo());
			
			model.addAttribute("report", report);
		
			return "redirect:/serviceCenter/getReportList";
		
	}
	/////////////////////////////////////////////// 알림 ///////////////////////////////////////////////
	
	@RequestMapping(value = "/json/getPushList", method = RequestMethod.POST)
	public Map<String, Object> getPushList(@RequestBody User user, HttpSession httpSession) throws Exception {
		
		user = (User) httpSession.getAttribute("user");
		
		return serviceCenterService.getPushList(user);
		
	}
	
	
	/////////////////////////////////////////////// 알림 ///////////////////////////////////////////////

}//RestController 끝
