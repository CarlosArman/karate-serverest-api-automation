package runner;

import com.intuit.karate.junit5.Karate;

class UsersRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:features").tags("@users").relativeTo(getClass());
    }

}
