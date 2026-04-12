package runner;

import com.intuit.karate.junit5.Karate;

class RunnerTest {

    @Karate.Test
    Karate runTestSuite() {
        return Karate.run("classpath:features").tags("@users");
    }

}
