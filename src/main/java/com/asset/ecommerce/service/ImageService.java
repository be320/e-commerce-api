package com.asset.ecommerce.service;

import com.asset.ecommerce.dao.ImageDao;
import com.asset.ecommerce.entity.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageService {

    private ImageDao imageDao;

    @Autowired
    public ImageService(ImageDao imageDao){
        this.imageDao = imageDao;
    }

    public Image get(int id){
        return imageDao.get(id);
    }

    public List<Image> getList(){
        return imageDao.getList();
    }

    public Image add(Image image) {
        return imageDao.add(image);
    }

    public Image edit(Image image) {
        return imageDao.edit(image);
    }

    public Image delete(Image image) {
        return imageDao.delete(image);
    }

}
