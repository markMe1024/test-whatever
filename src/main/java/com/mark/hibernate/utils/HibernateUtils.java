package com.mark.hibernate.utils;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

/**
 * @author mark
 */
public class HibernateUtils {
    private static SessionFactory sessionFactory;
    private static StandardServiceRegistry serviceRegistry;
    private static Configuration configuration = new Configuration();

    static {
        try {
            configuration.configure("hibernate.cfg.xml");
            serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        } catch (HibernateException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取Session
     * @return Session
     */
    public static Session getSession() {
        return sessionFactory.openSession();
    }
}
