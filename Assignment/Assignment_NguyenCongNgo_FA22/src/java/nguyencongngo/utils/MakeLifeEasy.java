/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.utils;

import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author Admin
 */
public class MakeLifeEasy {

    public static String convertDay(String day) {
        String date = "";
        int d = 0;
        String[] dateArr = day.split("-");
        for (int i = dateArr.length - 1; i >= 0; i--) {
            date = date + dateArr[i];
            ++d;
            if (d < dateArr.length) {
                date += "-";
            }
        }
        return date;
    }

    public static void main(String[] args) {
        String a = "HelloHihi";
        String[] b = a.split("/");
        for(int i = 0; i< b.length; i++){
            System.out.println(b[i]);
        }
    }
}
