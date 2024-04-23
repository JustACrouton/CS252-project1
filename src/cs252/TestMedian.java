package cs252;

import java.util.Arrays;

public class TestMedian {


    public static void main(String[] args) {
        if (args.length == 0) {
            System.err.println("Supply the number of tests to run on the command line.");
            System.exit(1);
        }
        int n = Integer.parseInt(args[0]);
        if (n > 6) {
            System.err.println("Maximum of 6 tests are supported due to data constraints.");
            System.exit(1);
        }
        boolean result = test(n);
        if (result) {
            System.out.println("Passed all " + n + " tests.");
        } else {
            System.out.println("Failed some tests.");
        }
    }

    private static boolean test(int numTests) {
        double[] inputs = { 1.0, 4.0, 6.5, 2.4, 24.0, 5.0 };
        double[] expected = { 1.0, 2.5, 4.0, 3.2, 4.0, 4.5 };
        
        numTests = Math.min(numTests, inputs.length);

        for (int i = 0; i < numTests; ++i) {
            double[] trimmedInputs = Arrays.copyOf(inputs, i+1);
            Median med = new Median(trimmedInputs);
            double avg = med.median();
            if (avg != expected[i])
                return false;
        }
        return true;
    }
}