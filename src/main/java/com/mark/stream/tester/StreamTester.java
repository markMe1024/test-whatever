package com.mark.stream.tester;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

public class StreamTester {
    public static void main(String[] args) {
        List<String> list = Arrays.asList("12fa6789a04ab08b998c98a98", "", "", "12fa6789a09808b998c98a98");
        list.stream().sorted(Comparator.reverseOrder()).forEach(x -> System.out.println(x));
    }
}
