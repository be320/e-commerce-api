package com.asset.ecommerce.rest;

import com.asset.ecommerce.entity.Image;
import com.asset.ecommerce.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ImageRestController {

    private ImageService imageService;

    @Autowired
    public ImageRestController(ImageService imageService){
        this.imageService = imageService;
    }

    @GetMapping("/images/{id}")
    public Image get(@PathVariable int id){
        return imageService.get(id);
    }

    @GetMapping("/images")
    public List<Image> getList(){
        return imageService.getList();
    }

    @PostMapping("/images")
    public Image add(@RequestBody Image image) {
        return imageService.add(image);
    }

    @PutMapping("/images")
    public Image edit(@RequestBody Image image) {
        return imageService.edit(image);
    }

    @DeleteMapping("/images")
    public Image delete(@RequestBody Image image) {
        return imageService.delete(image);
    }

}
