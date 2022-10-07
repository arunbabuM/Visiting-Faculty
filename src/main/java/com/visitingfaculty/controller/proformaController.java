package com.visitingfaculty.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.visitingfaculty.dao.UserDaoInterface;

@RestController
public class proformaController 
{
    @Autowired
    UserDaoInterface userDaoInterface;

    @PostMapping(value="/get-application-data")
    public Object performerResume(@RequestParam(value = "application_lid") int application_lid)
    {
        System.out.println("Resume :"+application_lid);
        Object resume = userDaoInterface.getJobResume(application_lid);
        return resume;
    }

    @PostMapping(value="/proforma-view")
    public Object performerView(@RequestBody String data)
    {
        Object perfomaView = userDaoInterface.getJobView(data);
        return perfomaView;
    }
   
    @PostMapping("/proforma-report")
    public Object proformaReportView(@RequestBody String data)
    {
        System.err.println("DATA>>>>>>>>>>>>>>" + data);

        Object perfomaView = userDaoInterface.getReport(data);
        return perfomaView;
    }

    @PostMapping(value="/proforma-report-view")
    public Object proformaReport(@RequestBody String data)
    {
        System.err.println(data);
        Object perfomaView = userDaoInterface.getProformaReport(data);
        return perfomaView;
    }

    @PostMapping(value="/get-all-proforma")
    public Object getAllProforma(@RequestBody String data)
    {
        System.err.println(data);
        Object perfomaView = userDaoInterface.getAllProforma(data);
        return perfomaView;
    }

    @PostMapping(value="/get-all-rejected-proforma")
    public Object getAllRejectedProforma()
    {
        Object perfomaView = userDaoInterface.getAllRejectedProforma();
        return perfomaView;
    }

    @PostMapping(value="/get-all-proforma-report")
    public Object getAllProformaReport(@RequestBody String data)
    {
        System.err.println(data);
        Object perfomaView = userDaoInterface.getAllProformaReport(data);
        return perfomaView;
    }

    @PostMapping(value="/get-all-approved-proforma")
    public Object getAllApprovedProforma()
    {
        Object perfomaView = userDaoInterface.getAllApprovedProforma();
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

    @PostMapping(value="/get-proforma-filter")
    public Object performfilter(@RequestBody String data)
    {
        System.out.println("data : "+data);
        Object perfomafilter = userDaoInterface.getProformaFilter(data);
        return perfomafilter;
    }

    @PostMapping(value="/get-proforma-report-filter")
    public Object getProformaFilterReport(@RequestBody String data)
    {
        System.out.println("data : "+data);
        Object perfomafilter = userDaoInterface.getProformaFilterReport(data);
        return perfomafilter;
    }
    @PostMapping("/discontinue-faculty")
    public Object discontinueFaculty(@RequestBody String data) {
        System.out.println("data : "+data);
        Object perfomaexp = userDaoInterface.discontinueFaculty(data);
        return perfomaexp;
    }
}
