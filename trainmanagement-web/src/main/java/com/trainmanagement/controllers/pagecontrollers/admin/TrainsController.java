package com.trainmanagement.controllers.pagecontrollers.admin;

import com.trainmanagement.data.TrainData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/trains")
public class TrainsController {

    @Autowired
    TrainData trainData;

    @RequestMapping(value ="/passenger-trains" , method = RequestMethod.GET)
    public String passengerTrains() {
        return "/admin/trains/passenger-trains";
    }

    @RequestMapping(value = "/passenger-new", method = RequestMethod.GET)
    public String newTrainPassenger() {
        return "/admin/trains/passenger-new";
    }

    @RequestMapping(value = "/passenger-edit/{trainId}", method = RequestMethod.GET)
    public String editTrainPassenger(ModelMap modelMap,@PathVariable Integer trainId) {
        modelMap.addAttribute("trainId", trainId);
        return "/admin/trains/passenger-edit";
    }

    @RequestMapping(value ="/freight-trains" , method = RequestMethod.GET)
    public String freightTrains() {
        return "/admin/trains/freight-trains";
    }

    @RequestMapping(value = "/freight-new", method = RequestMethod.GET)
    public String newTrainFreight() {
        return "/admin/trains/freight-new";
    }

    @RequestMapping(value = "/freight-edit/{trainId}", method = RequestMethod.GET)
    public String editTrainFreight(ModelMap modelMap,@PathVariable Integer trainId) {
        modelMap.addAttribute("trainId", trainId);
        return "/admin/trains/freight-edit";
    }

}
