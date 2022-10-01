package feed;

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

	public void testGetFeedList() {
		
		Search search = null;
		
		feedService.getFeedList(search);
	}

}
