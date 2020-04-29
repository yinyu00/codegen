package com.zghlj.management.base.controller;

import com.zghlj.management.base.entity.po.${table.NameFU}Po;
import com.zghlj.management.base.service.I${table.NameFU}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.websocket.server.PathParam;

@Controller
@RequestMapping("/${table.NameFL}/page")
public class ${table.NameFU}PageController {

    private I${table.NameFU}Service ${table.NameFL}Service;
    @Autowired
    public void set${table.NameFU}Service(I${table.NameFU}Service ${table.NameFL}Service) {
        this.${table.NameFL}Service = ${table.NameFL}Service;
    }

    @RequestMapping("/${table.NameFL}Main")
    public String main(){
        return "${table.Schema}/${table.NameFL}Main";
    }

    @GetMapping("/${table.NameFL}List")
    public String ${table.NameFL}List(){
        return "${table.Schema}/${table.NameFU}List";
    }

    @RequestMapping("/${table.NameFL}Form")
    public ModelAndView ${table.NameFL}Info(@PathParam("id") Long id) {
        ModelAndView mav = new ModelAndView("${table.Schema}/${table.NameFU}Form");
        if (null != id) {
            ${table.NameFU}Po po = ${table.NameFL}Service.select${table.NameFU}ById(id);
            mav.addObject("${table.NameFL}", po);
        }
        return mav;
    }
}
