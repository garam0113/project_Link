package feed;

import java.util.HashMap;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.link.service.domain.Feed;
import com.link.service.feed.FeedService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class FeedServiceTest {
	
	@Autowired
	@Qualifier("feedServiceImpl")
	private FeedService feedService;

	// @Test
	public void testAddFeed() throws Exception {
		// 피드 등록

		Feed feed = new Feed();
		feed.setUserId("user01");
		feed.setOpenCondition(2);
		feed.setContent("hiyo");
		
		feedService.addFeed(feed);
		
	}
	
	@Test
	public void testGetFeed() throws Exception {
		// 피드 업데이트
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("feedNo", 13);
		
		Feed feed = (Feed) feedService.getFeed(map).get("feed");
		
		Assert.assertEquals(13, feed.getFeedNo());
		
	}

}
