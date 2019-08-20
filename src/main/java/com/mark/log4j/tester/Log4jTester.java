package com.mark.log4j.tester;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

/**
 * 试验log4j
 * @author mark
 */
public class Log4jTester {
    public static void main(String[] args) {
        BasicConfigurator.configure();
        Logger log = Logger.getLogger(Log4jTester.class);
        log.info("打印打印");
    }
}