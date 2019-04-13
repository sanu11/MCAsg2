package com.example.asg2;

import android.util.Log;
import java.util.List;

public class SVMClassifier {

    double[] weights;
    double bias;
    SVMClassifier(List model){
        this.weights = (double[])model.get(0);
        this.bias = (double)model.get(1);
    }

    public double classify(double[] test){
        int m= weights.length;
        double prediction=0;
        for(int i=0;i<m;i++){
            prediction+=weights[i]*test[i];
        }
        prediction+=bias;
        if(prediction>=0)
            return 1.0;
        else
            return 0.0;
    }

    public float predict(List testData){
        int n = testData.size();
        double[] testRow;
        double prediction;
        int count=0;
        int m = ((double[])testData.get(0)).length;
        float accuracy =0;
        for(int i=0;i<n;i++){
            testRow  = (double[]) testData.get(i);

            prediction = classify(testRow);
            Log.d("test",testRow[m-1]+"");
            if(prediction==testRow[m-1]){
                count+=1;
            }
        }
        accuracy = ((float)count/(float)n)*100;
        return  accuracy;
    }
}
