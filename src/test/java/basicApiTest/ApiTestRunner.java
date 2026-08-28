package basicApiTest;

import com.intuit.karate.junit5.Karate;

public class ApiTestRunner {

    @Karate.Test
    Karate runTest(){
        return Karate.run("classpath:Features/basicApiTest.feature").relativeTo(getClass());
    }
}
