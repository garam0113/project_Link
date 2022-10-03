package feed;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.link.common.Search;
import com.link.service.feed.FeedService;
import com.link.service.user.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class FeedServiceTest {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("feedServiceImpl")
	private FeedService feedService;

	@Test
	public void testGetFeedList() {
		
		Search search = new Search();
		search.setCurrentPage(1);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = feedService.getFeedList(search);
		
		System.out.println(map.get("list"));
	}

}
