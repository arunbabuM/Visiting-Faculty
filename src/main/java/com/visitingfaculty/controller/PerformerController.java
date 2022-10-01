package com.visitingfaculty.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.visitingfaculty.dao.UserDaoInterface;

@RestController
public class PerformerController 
{
    @Autowired
    UserDaoInterface userDaoInterface;

    @PostMapping(value="/performer-resume")
    public Object performerResume(@RequestParam(value = "application_lid") int application_lid)
    {
        System.out.println("Resume :"+application_lid);
        Object resume = userDaoInterface.getJobResume(application_lid);
        return resume;
    }

    @PostMapping(value="/performer-view")
    public Object performerView(@RequestBody String data)
    {
        System.err.println(data);
        Object perfomaView = userDaoInterface.getJobView(data);
        return perfomaView;
    }

    @PostMapping(value="/get-all-proforma")
    public Object getAllProforma(@RequestBody String data)
    {
        System.err.println(data);
        Object perfomaView = userDaoInterface.getAllProforma(data);
        return perfomaView;
    }

    @PostMapping(value="/get-qual")
    public Object performerqual(@RequestBody String data)
    {
        System.out.println("data : "+data);
        Object perfomaqual = userDaoInterface.getQualPerformer(data);
        return perfomaqual;
    }

    @PostMapping(value="/get-experience")
    public Object performerexp(@RequestBody String data)
    {
        System.out.println("data : "+data);
        Object perfomaexp = userDaoInterface.getExpperfoma(data);
        return perfomaexp;
    }
}
