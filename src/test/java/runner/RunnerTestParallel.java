package runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class RunnerTestParallel {

    @Test
    void runTestSuite() {
        Results results = Runner.path("classpath:features")        // raíz donde están tus .feature
                .tags("@users")                                           // tag a ejecutar
                .backupReportDir(false)                             // evita crear karate-reports-<timestamp>
                .reportDir("target/karate-reports")                 // fuerza la ruta estándar
                .outputJunitXml(true)                               // opcional: para CI
                .outputCucumberJson(true)                           // opcional: para plugins de reportes
                .parallel(5);                                  // ejecuta en paralelo

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}