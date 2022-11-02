/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyencongngo.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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

    public static String convertFormartDay(String day) {
        String date = day;
        int d = 0;
        String[] dateArr = day.split("/");
        if (dateArr.length > 0) {
            for (int i = 0; i < dateArr.length; i++) {
                date = date + dateArr[i];
                ++d;
                if (d < dateArr.length) {
                    date += "-";
                }
            }
        }

        return date;
    }

    public static long subtractDay(String start, String end) throws ParseException {
        SimpleDateFormat fm = new SimpleDateFormat("dd-MM-yyyy");
//        if (start.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})") && end.matches("([0-9]{2})-([0-9]{2})-([0-9]{4})")) {
            Date date1 = fm.parse(start);
            Date date2 = fm.parse(end);
            long c = date1.getTime() - date2.getTime();
            return c;
//        } else {
//            return -1;
//        }
    }

    public static void main(String[] args) throws ParseException {
        String a = "10-10-2022";
        String b = "9-10-2022";
        SimpleDateFormat fm = new SimpleDateFormat("dd-MM-yyyy");
        Date date1 = fm.parse(a);
        Date date2 = fm.parse(b);
        long c = date1.getTime() - date2.getTime();
        System.out.println(c);
    }
}
