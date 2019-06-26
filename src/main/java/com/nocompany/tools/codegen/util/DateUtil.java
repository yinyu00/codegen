package com.nocompany.tools.codegen.util;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 日期类工具 含日期常量
 *
 * @author yt.wei
 * @version 0.1
 */
public class DateUtil {

    /**
     * 带毫秒的ISO_8601时间格式
     */
    private static final String ISO_8601_PATTERN = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

    /**
     * 通用日期格式
     */
    private static final String DEFAULT_DATE_PATTERN = "yyyy-MM-dd";

    /**
     * 不带毫秒的通用日期格式
     */
    public static final String DEFAULT_TIME_MIN_PATTERN = "yyyy-MM-dd HH:mm:ss";

    /**
     * 通用日期格式无分隔符
     */
    private static final String DATE_ALL_NUMBER = "yyyyMMdd";

    /**
     * 中文日期格式
     */
    private static final String CHINESE_DATE_FMT = "yyyy年MM月dd日";

    /**
     * 中文日期格式
     */
    private static final String CHINESE_DATE_TIME_FMT = "yyyy年MM月dd日  HH:mm:ss";


    /**
     * ISO_8601日期格式的正则匹配
     */
    private static final String ISO_8601_MATCH_REGEX = "^\\d{4}-\\d{1,2}-\\d{1,2}T\\d{1,2}:\\d{1,2}:\\d{1,2}\\.?\\d{0,3}Z?[+-]?\\d{0,2}:?\\d{0,2}$";


    /**
     * 通用日期格式的正则匹配
     */
    private static final String DEFAULT_DATETIME_REGEX = "^\\d{4}-\\d{1,2}-\\d{1,2} \\d{1,2}:\\d{1,2}:\\d{1,2}\\.?\\d{0,3}$";


    /**
     * 一天的毫秒数
     */
    private static final long ONE_DAY_MILLISECOND = 86400000L;

    /**
     * 八个小时的毫秒数
     */
    private static final int EIGHT_HOUR_MILLISECOND = 28800000;

    /**
     * 日志
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(DateUtil.class);


    /**
     * 转为通用日期格式字符串
     *
     * @param date 日期
     * @return 日期字符串
     */
    public static synchronized String formatDateTime(final Date date) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DEFAULT_TIME_MIN_PATTERN);
        return simpleDateFormat.format(date);
    }

    /**
     * 将通用日期格式字符串转为Date
     *
     * @param date 日期格式字符串
     * @return Date格式日期
     * @throws ParseException 转换异常
     */
    public static synchronized Date parseDateTime(final String date) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DEFAULT_TIME_MIN_PATTERN);
        return simpleDateFormat.parse(date);
    }

    /**
     * 转换字符时间为Date类型
     */
    public static final Date getDateWithString(String strDate) {
        SimpleDateFormat df = null;
        Date date = null;
        df = new SimpleDateFormat(DEFAULT_TIME_MIN_PATTERN);
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug(
                    "converting '" + strDate + "' to date with mask '" + DEFAULT_TIME_MIN_PATTERN
                            + "'");
        }
        try {
            date = df.parse(strDate);
        } catch (ParseException pe) {
            LOGGER.error("ParseException: " + pe);
        }
        return (date);
    }


    /**
     * This method generates a string representation of a date/time in the format you specify on input
     *
     * @param aMask the date pattern the string is in
     * @param strDate a string representation of a date
     * @return a converted Date object
     * @see SimpleDateFormat
     */
    public static Date convertStringToDate(String aMask, String strDate) throws ParseException {
        SimpleDateFormat df = null;
        Date date = null;
        df = new SimpleDateFormat(aMask);

        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("converting '" + strDate + "' to date with mask '" + aMask + "'");
        }

        try {
            date = df.parse(strDate);
        } catch (ParseException pe) {
            throw new ParseException(pe.getMessage(), pe.getErrorOffset());
        }

        return (date);
    }

    /**
     * 获取今天的日期
     *
     * @return 今天的日期
     */
    public static Calendar getToday() {
        Date today = getCurrentTimestamp();
        SimpleDateFormat df = new SimpleDateFormat(DEFAULT_DATE_PATTERN);

        String todayAsString = df.format(today);
        Calendar cal = new GregorianCalendar();
        cal.setTime(convertStringToDate(todayAsString));

        return cal;
    }

    /**
     * This method generates a string representation of a date's date/time in the format you specify on input
     *
     * @param aMask the date pattern the string is in
     * @param aDate a date object
     * @return a formatted string representation of the date
     * @see SimpleDateFormat
     */
    public static final String getDateTime(String aMask, Date aDate) {
        SimpleDateFormat df = null;
        String returnValue = "";

        if (aDate == null) {
            LOGGER.error("aDate is null!");
        } else {
            df = new SimpleDateFormat(aMask);
            returnValue = df.format(aDate);
        }

        return (returnValue);
    }

    /**
     * This method generates a string representation of a date based on the System Property 'dateFormat' in the format you specify on input
     *
     * @param aDate A date to convert
     * @return a string representation of the date
     */
    public static final String convertDateToString(Date aDate) {
        return getDateTime(DEFAULT_DATE_PATTERN, aDate);
    }

    public static final String convertDateToString(String datePattern, Date aDate) {
        return getDateTime(datePattern, aDate);
    }

    /**
     * This method converts a String to a date using the datePattern
     *
     * @param strDate the date to convert (in format yyyy-mm-dd)
     * @return a date object
     */
    public static Date convertStringToDate(String strDate) {
        Date aDate = null;

        try {
            if (LOGGER.isDebugEnabled()) {
                LOGGER.debug("converting date with pattern: " + DEFAULT_DATE_PATTERN);
            }

            aDate = convertStringToDate(DEFAULT_DATE_PATTERN, strDate);
        } catch (ParseException pe) {
            LOGGER.error("Could not convert '" + strDate + "' to a date, throwing exception");
        }

        return aDate;
    }

    public static String format(Date aDate, String aFormat) {
        if (aDate == null || aFormat == null) {
            return "";
        }
        return new SimpleDateFormat(aFormat).format(aDate);
    }

    /**
     * 获取无分隔符的日期格式 yyyyMMdd
     *
     * @param aDate 日期
     * @return yyyyMMdd格式的日期字符串
     */
    public static String getDateNumString(Date aDate) {
        return DateUtil.format(aDate, DATE_ALL_NUMBER);
    }

    /**
     * 将mFormatIso8601格式的String时间转为Timestamp型
     */
    public synchronized static Timestamp strTimeFormatToDates(String strDate) {
        Date dateTime = null;
        Timestamp timestamp = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat(ISO_8601_PATTERN);
            dateTime = dateFormat.parse(strDate);
            timestamp = new Timestamp(dateTime.getTime() + EIGHT_HOUR_MILLISECOND);
        } catch (ParseException e) {
            LOGGER.error("date transform error", e);
        }
        return timestamp;
    }

    /**
     * 获取中文格式的日期格式
     *
     * @param data 日期
     * @return 中文日期格式字符串
     */
    public static String getCnDateFormat(Date data) {
        return DateUtil.format(data, CHINESE_DATE_FMT);
    }

    /**
     * 获取中文格式的日期时间格式
     *
     * @param data 日期
     * @return 中文日期时间格式字符串
     */
    public static String getCnDateTimeFormat(Date data) {
        return DateUtil.format(data, CHINESE_DATE_TIME_FMT);
    }

    /**
     * 日期转换为通用日期格式字符串 yyyy-MM-dd
     *
     * @param aDate 时间戳
     * @return 通用日期格式字符串
     */
    public static String getDefaultDateFormat(long aDate) {
        Date date = new Date(aDate);
        return DateUtil.format(date, DEFAULT_DATE_PATTERN);
    }

    /**
     * 获取总天数的毫秒数
     */
    public static long getDaysMillisecond(int days) {
        return days * ONE_DAY_MILLISECOND;
    }

    /**
     * 获取当前年份数字
     */
    public static int getCurrentYear() {
        Calendar calendar = Calendar.getInstance();
        return calendar.get(Calendar.YEAR);

    }

    /**
     * 获取上个周一的日期
     *
     * @return 上个周一的日期字符串
     */
    public static String getLastMondy() {
        Calendar calendar = Calendar.getInstance();
        int n = 1;
        calendar.add(Calendar.DATE, n * (-7));
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        return new SimpleDateFormat(DEFAULT_DATE_PATTERN).format(calendar.getTime());
    }

    /**
     * 获取上个周日的日期字符串
     *
     * @return 上个周日的日期字符串
     */
    public static String getLastSunday() {
        Calendar calendar = Calendar.getInstance();
        int n = 1;
        calendar.add(Calendar.DATE, n);
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
        return new SimpleDateFormat(DEFAULT_DATE_PATTERN).format(calendar.getTime());
    }

    /**
     * 使用通用日期格式判断是否为日期
     *
     * @param dateTime 日期时间
     * @return 是否有效
     */
    public static boolean isValidDateTime(String dateTime) {
        Matcher matcher = Pattern.compile(DEFAULT_DATETIME_REGEX).matcher(dateTime);
        return matcher.find();
    }

    /**
     * 使用Iso8601格式判断是否为日期
     *
     * @param dateTime 日期时间
     * @return 是否有效
     */
    public static boolean isValidIso8601(String dateTime) {
        Matcher matcher = Pattern.compile(ISO_8601_MATCH_REGEX).matcher(dateTime);
        return matcher.find();
    }

    /**
     * 判断是否输入有效的日期
     *
     * @param date 日期字符串
     * @param pattern 日期格式字符串
     * @return 日期格式是否有效
     */
    private static boolean isValid(String date, String pattern) {
        if (StringUtils.isEmpty(date)) {
            return false;
        }

        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        Date testDate = null;
        try {
            testDate = sdf.parse(date);
        } catch (ParseException e) {
            return false;
        }
        /*
         dateformat.parse will accept any date as long as it's in the format
         you defined, it simply rolls dates over, for example, december 32
         becomes jan 1 and december 0 becomes november 30
         This statement will make suren that once the string
         has been checked for proper formatting that the date is still the
         date that was entered, if it's not, we assume that the date is invalid
         */
        return sdf.format(testDate).equals(date);
    }

    /**
     * 毫秒时间戳转换为秒
     *
     * @param timestamp 毫秒时间戳
     * @return 单位为秒的时间戳
     */
    private static long toSeconds(long timestamp) {
        return timestamp / 1000L;
    }

    /**
     * 毫秒时间戳转换为分钟
     *
     * @param timestamp 毫秒时间戳
     * @return 单位为分钟的时间戳
     */
    private static long toMinutes(long timestamp) {
        return toSeconds(timestamp) / 60L;
    }

    /**
     * 毫秒时间戳转换为小时
     *
     *
     * @param timestamp 毫秒时间戳
     * @return 单位为小时的时间戳
     */
    private static long toHours(long timestamp) {
        return toMinutes(timestamp) / 60L;
    }

    /**
     * 毫秒时间戳转换为天
     *
     * @param timestamp 毫秒时间戳
     * @return 单位为天的时间戳
     */
    private static long toDays(long timestamp) {
        return toHours(timestamp) / 24L;
    }

    /**
     * 时间戳转换为通用时间格式
     *
     * @param timeStamp 时间戳
     * @return 通用日期时间yyyy-MM-dd HH:mm:ss格式
     */
    public static String getDefaultDateTimeString(long timeStamp) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DEFAULT_TIME_MIN_PATTERN);
        return simpleDateFormat.format(timeStamp);
    }

    /**
     * 时间戳转换为通用日期格式
     *
     * @param timeStamp 时间戳
     * @return 通用日期格式yyyy-MM-dd
     */
    public static String getDefaultDateString(long timeStamp) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(DEFAULT_DATE_PATTERN);
        return simpleDateFormat.format(timeStamp);
    }

    /**
     * 获取当前时间 - 毫秒数
     *
     * @return 当前的毫秒数
     */
    public static long getCurrentTimeMillis() {
        return System.currentTimeMillis();
    }

    /**
     * 获取当前时间 - Timestamp格式
     *
     * @return Timestamp格式 当前时间
     */
    public static Timestamp getCurrentTimestamp() {
        return new Timestamp(getCurrentTimeMillis());
    }


    /**
     * 将不带毫秒的时间戳精确到分钟  并转为毫秒格式时间戳
     *
     * @param timestamp 时间戳
     * @return 去掉秒的时间戳
     */
    public static Long trimSeconds(Long timestamp) {
        // 毫秒时间转成分钟,往下取整 1.9=> 1.0
        long floorValue = timestamp / 60;
        return floorValue * 60000;
    }

    /**
     * 功能描述: 将世界标准时间转换为本地时间
     *
     * @param gmtDate
     * @return java.util.Date
     */
    public static Date convertGMT2Local(Date gmtDate) {
        Calendar c = Calendar.getInstance();
        c.setTime(gmtDate);
        int zoneOffset = c.get(Calendar.ZONE_OFFSET);
        int dstOffset = c.get(Calendar.DST_OFFSET);
        c.add(Calendar.MILLISECOND, zoneOffset + dstOffset);
        return c.getTime();
    }

    /**
     * 功能描述: 将世界标准时间转换为本地时间
     *
     * @param gmtDate
     * @return java.sql.Timestamp
     */
    public static Timestamp convertGMT2Local(Timestamp gmtDate) {
        Calendar c = Calendar.getInstance();
        c.setTime(gmtDate);
        int zoneOffset = c.get(Calendar.ZONE_OFFSET);
        int dstOffset = c.get(Calendar.DST_OFFSET);
        c.add(Calendar.MILLISECOND, zoneOffset + dstOffset);
        return new Timestamp(c.getTime().getTime());
    }


    /*
     * 毫秒转化
     */
    public static String formatTime(long ms) {

        int ss = 1000;
        int mi = ss * 60;
        int hh = mi * 60;
        int dd = hh * 24;

        long day = ms / dd;
        long hour = (ms - day * dd) / hh;
        long minute = (ms - day * dd - hour * hh) / mi;
        long second = (ms - day * dd - hour * hh - minute * mi) / ss;
        long milliSecond = ms - day * dd - hour * hh - minute * mi - second * ss;

        String strDay = day < 10 ? "0" + day : "" + day; //天
        String strHour = hour < 10 ? "0" + hour : "" + hour;//小时
        String strMinute = minute < 10 ? "0" + minute : "" + minute;//分钟
        String strSecond = second < 10 ? "0" + second : "" + second;//秒
        String strMilliSecond = milliSecond < 10 ? "0" + milliSecond : "" + milliSecond;//毫秒
        strMilliSecond = milliSecond < 100 ? "0" + strMilliSecond : "" + strMilliSecond;

        return strHour + ":" + strSecond + ":" + "strMinute" + "strSecond";
    }
}
