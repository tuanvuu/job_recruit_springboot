package com.laptrinhoop.common;

import java.io.File;
import java.io.IOException;

public class HelperUtils {
    public static String getCurrentDir() {
        File directory = new File("/");
        try {
            String current = new java.io.File(".").getCanonicalPath();
            System.out.println(current);
            return current;
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "/";
    }

}
