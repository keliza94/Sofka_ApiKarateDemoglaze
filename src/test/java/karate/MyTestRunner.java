package karate;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;


import static org.junit.jupiter.api.Assertions.assertEquals;

public class MyTestRunner {

    public static void main(String[] args) {
        Results results = Runner.path("classpath:features").tags("~@ignore").parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
