package examples;


import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;

public class ApiTest {

	@Test
	void testKarate() {
		Results results = Runner.path("classpath:examples")
			.parallel(5);
		assertEquals(0,results.getFailCount(),results.getErrorMessages());
	}
}
