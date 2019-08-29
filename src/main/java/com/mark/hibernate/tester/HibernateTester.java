package com.mark.hibernate.tester;

import com.mark.hibernate.utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.query.NativeQuery;

import java.util.Iterator;
import java.util.List;

/**
 * Hibernate试验类
 * @author mark
 */
public class HibernateTester {
    public static void main(String[] args) {
        String sql = "select location, floors from building";

        Session session = HibernateUtils.getSession();
        NativeQuery nativeQuery = session.createSQLQuery(sql);
        /*
         * 下面返回的list，每个元素实际上是一个Object数组，
         * 数组中的每一个元素对应数据库中的一个字段，
         * 比如这里每个数组有两个元素，分别是location和floors两个字段的值
         */
        List<Object> list = nativeQuery.list();

        for (Iterator iterator = list.iterator(); iterator.hasNext();) {
            Object[] objs = (Object[])iterator.next();
            System.out.println(objs[0]);
            System.out.println(objs[1]);
        }
    }
}
