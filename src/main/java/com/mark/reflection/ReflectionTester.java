package com.mark.reflection;

import java.lang.reflect.Field;

/**
 * 测试反射代码
 * @author mark
 */
public class ReflectionTester {
    public static void main(String[] args) {
        String todayWeather = "Cloudy";
        boolean isInstance = String.class.isInstance(todayWeather);
        System.out.println(isInstance);
    }

    /**
     * 校验对象是否有值是null的属性
     * @param clazz
     * @param obj
     * @throws Exception
     */
    public static void checkNull(Class<?> clazz, Object obj) throws Exception {
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true);
            Object val = field.get(obj);
            if (val == null) {
                throw new Exception(field.getName() + " 值为null");
            }
        }
    }
}
