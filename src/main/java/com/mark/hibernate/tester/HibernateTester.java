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
        List<Object> list = nativeQuery.list();
        for (Iterator iterator = list.iterator(); iterator.hasNext();) {
            Object[] objs = (Object[])iterator.next();
            System.out.println(objs[0]);
        }
    }
}
