
package io.galeb.router.tests.suites;

import io.galeb.router.tests.cucumber.CucumberTest;
import org.junit.AfterClass;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses({
        CucumberTest.class
})
public class ManagerTestSuite {

    @AfterClass
    public static void after() {
    }
}