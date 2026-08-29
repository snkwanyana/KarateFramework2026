package ndosiAPITests;

import com.intuit.karate.junit5.Karate;

public class NdosiApiRunner {

    @Karate.Test
    Karate runTest() {
        return Karate.run("classpath:Features/ndosiApiTest.feature").relativeTo(getClass());
    }

}
