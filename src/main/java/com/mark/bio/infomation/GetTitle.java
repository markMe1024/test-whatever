package com.mark.bio.infomation;

import org.apache.commons.lang3.StringUtils;

import java.io.*;

/**
 * @author mark
 * @date 2019/10/27 13:54
 */
public class GetTitle {

    static String titleFromThese = "C:\\Users\\comma\\Desktop\\10645\\Title_from_these.txt";
    static String outputPath = "C:\\Users\\comma\\Desktop\\10645\\GSE10645-after-process.txt";

    public static void main(String[] args) {
        try {
            File file = new File(titleFromThese);
            FileInputStream fileInputStream = new FileInputStream(file);
            InputStreamReader inputStreamReader = new InputStreamReader(fileInputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

            File fileOut = new File(outputPath);
            FileWriter fileWriter = new FileWriter(fileOut);
            BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);

            StringBuilder oneLine = new StringBuilder("id,");
            String read;
            do {
                read = bufferedReader.readLine();
                if (read != null) {
                    oneLine.append(read.split(":")[0]).append(",");
                }
            } while (StringUtils.isNotBlank(read));

            bufferedWriter.write(oneLine.toString());
            bufferedWriter.newLine();

            bufferedReader.close();;
            bufferedWriter.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
