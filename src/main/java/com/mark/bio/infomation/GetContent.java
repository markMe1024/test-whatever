package com.mark.bio.infomation;

import com.mark.log4j.tester.Log4jTester;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author mark
 * @date 2019/10/27 13:54
 */
public class GetContent {

    static Logger log = Logger.getLogger(Log4jTester.class);

    static String sampleIdsPath = "C:\\Users\\comma\\Desktop\\10645\\Series_sample_id.txt";
    static String familyPath = "C:\\Users\\comma\\Desktop\\10645\\GSE10645_family.txt";
    static String outputPath = "C:\\Users\\comma\\Desktop\\10645\\GSE10645-after-process.txt";
    static String firstLine = "!Sample_characteristics_ch1 = group: ";
    static String endLine = "!Sample_molecule_ch1 = total RNA";

    public static int loopIndex = 0;

    public static void main(String[] args) {
        try {
            File fileOut = new File(outputPath);
            FileWriter fileWriter = new FileWriter(fileOut);
            BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);

            List<String> sampleIds = getSampleIds();

            for (String sampleId : sampleIds) {
                String sampleInfo = getSampleInfo(sampleId);
                bufferedWriter.write(sampleInfo);
                bufferedWriter.newLine();
            }

            bufferedWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<String> getSampleIds() {
        String sampleId;
        List<String> sampleIds = new ArrayList<>();

        try {
            File file = new File(sampleIdsPath);
            FileInputStream fileInputStream = new FileInputStream(file);
            InputStreamReader inputStreamReader = new InputStreamReader(fileInputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

            do {
                sampleId = bufferedReader.readLine();
                if (StringUtils.isNotBlank(sampleId)) {
                    sampleIds.add(sampleId);
                }
            } while (StringUtils.isNotEmpty(sampleId));

            bufferedReader.close();
        } catch (FileNotFoundException e) {
            log.error("错误类型：FileNotFoundException");
            log.error(e.getMessage());
        } catch (IOException e) {
            log.error("错误类型：IOException");
            log.error(e.getMessage());
        }

        return sampleIds;
    }

    public static String getSampleInfo(String sampleId) {
        try {
            File fileIn = new File(familyPath);
            FileInputStream fileInputStream = new FileInputStream(fileIn);
            InputStreamReader inputStreamReader = new InputStreamReader(fileInputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

            String read;
            StringBuilder oneline = new StringBuilder();
            oneline.append(sampleId.replace("!Sample_geo_accession = ", "")).append(",");
            Boolean rightSample = false;
            Boolean rightLine = false;

            do {
                read = bufferedReader.readLine();
                if (StringUtils.isBlank(read)) {
                    continue;
                }

                if (read.contains(sampleId)) {
                    rightSample = true;
                }

                if (rightSample) {
                    if (read.contains(endLine)) {
                        System.out.println(++loopIndex);
                        break;
                    }

                    if (read.contains(firstLine)) {
                        oneline.append(read.split(":")[1]).append(",");
                        rightLine = true;
                        continue;
                    }

                    if (rightLine) {
                        if (read.contains("!Sample_characteristics_ch1 = tmprss2: ERG gene fusion status: ")) {
                            oneline.append(read.replace("!Sample_characteristics_ch1 = tmprss2: ERG gene fusion status: ", "")).append(",");
                        } else {
                            oneline.append(read.split(":")[1]).append(",");
                        }

                    }
                }
            } while (!read.contains("EOF"));

            bufferedReader.close();

            return oneline.toString();

        } catch (FileNotFoundException e) {
            log.error("错误类型：FileNotFoundException");
            log.error(e.getMessage());
        } catch (IOException e) {
            log.error("错误类型：IOException");
            log.error(e.getMessage());
        }

        return "";
    }
}
