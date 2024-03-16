package examples.users;

import com.intuit.karate.junit5.Karate;

public class ProductRunner {
	
	@Karate.Test
	Karate testProducto() {
		return Karate.run("").relativeTo(getClass());
	}

}
