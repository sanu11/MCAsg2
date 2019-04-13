package com.example.asg2;

import android.util.Log;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class LoadModel {

        InputStream inputStream;
        double[] weights;
        double bias;
        public LoadModel(InputStream inputStream){
            this.inputStream = inputStream;
        }
        public List read(){
            List resultList = new ArrayList();
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
            String arr[]=null;
            try {
                String csvLine;
                csvLine = reader.readLine();

                if(csvLine!=null) {
                    arr = csvLine.split(",");
                    weights = new double[arr.length];
                    for (int c = 0; c < arr.length; c++) {
                        weights[c] = Float.parseFloat(arr[c]);
                    }
                    resultList.add(weights);
                }
                csvLine = reader.readLine();
                if(csvLine!=null){
                    bias = Float.parseFloat(csvLine);
                    resultList.add(bias);
                }


            }
            catch (IOException ex) {
                throw new RuntimeException("Error in reading CSV file: "+ex);
            }
            finally {
                try {
                    inputStream.close();
                }
                catch (IOException e) {
                    throw new RuntimeException("Error while closing input stream: "+e);
                }
            }
            return resultList;
        }
    }

