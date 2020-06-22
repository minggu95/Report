package cn.itcast.report.service;

import java.util.stream.Stream;

public class test {

    public static void main(String[] args) {
        String[] jayArray = {"jay", "boy"};
        Stream.of(jayArray).forEach(System.out::println);

    }

}
