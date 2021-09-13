package com.asset.ecommerce.dao;

import com.asset.ecommerce.entity.Image;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public class ImageDao extends AbstractDao {

    public Image get(int id){
        Session session = getSession();
        session.beginTransaction();
        Image image = (Image) session.load(Image.class, id);
        session.getTransaction().commit();
        session.close();
        return image;
    }

    public List<Image> getList(){
        Session session = getSession();
        session.beginTransaction();
        Query query = session.createQuery("from Image ");
        List<Image>  images = query.list();
        session.getTransaction().commit();
        session.close();
        return images;
    }

    public Image add(Image image) {
        Session session = getSession();
        session.beginTransaction();
        session.persist(image);
        session.getTransaction().commit();
        session.close();
        return image;
    }

    public Image edit(Image image) {
        Session session = getSession();
        session.beginTransaction();
        session.update(session.merge(image));
        session.getTransaction().commit();
        session.close();
        return image;
    }

    public Image delete(Image image) {

        Session session = getSession();
        session.beginTransaction();
        session.delete(session.merge(image));
        session.getTransaction().commit();
        session.close();
        return image;
    }

}
