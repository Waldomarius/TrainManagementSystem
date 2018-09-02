package com.trainmanagement.controllers.restcontrollers;


import com.trainmanagement.data.FreightTrainData;
import com.trainmanagement.data.TrainData;
import com.trainmanagement.dto.FreightTrainDto;
import com.trainmanagement.dto.TrainDto;
import com.trainmanagement.pojo.FreightTrain;
import com.trainmanagement.pojo.Train;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/api")
public class TrainRestController {

    @Autowired
    TrainData trainData;

    @Autowired
    FreightTrainData freightTrainData;

    @RequestMapping(value = "/allPassengerTrains", method = RequestMethod.GET)
    public List<TrainDto> getPassengerTrains() {return trainData.getTrainDTO();}

    @RequestMapping(value = "/allFreightTrains", method = RequestMethod.GET)
    public List<FreightTrainDto> getFreightTrains() {return freightTrainData.getFreightTrainDTO();}

    @RequestMapping(value = "/saveFreightTrain", method = RequestMethod.POST)
    public void saveFreightTrain(@RequestBody FreightTrain train) { freightTrainData.save(train);}

    @RequestMapping(value = "/deleteFreightTrain/{id}", method = RequestMethod.DELETE)
    public void deleteFreightTrain(@PathVariable("id") Integer id) {
        freightTrainData.deleteTrain(id);
    }

    @RequestMapping(value = "/saveTrain", method = RequestMethod.POST)
    public void saveTrain(@RequestBody Train train) { trainData.save(train);}

    @RequestMapping(value = "/deleteTrain/{id}", method = RequestMethod.DELETE)
    public void deleteTrain(@PathVariable("id") Integer id) {
        trainData.deleteTrain(id);
    }

    @RequestMapping(value = "/updateSell/{id}/{sell}", method = RequestMethod.GET)
    public void updateSell(@PathVariable("id") Integer id,
                           @PathVariable("sell")Integer sell)
    { trainData.updateSell(id,sell);}

    @RequestMapping(value = "/updateFreightSell/{id}/{volume}/{weight}", method = RequestMethod.GET)
    public void updateFreightSell(@PathVariable("id") Integer id,
                                  @PathVariable("volume")Integer volume,
                                  @PathVariable("weight")Integer weight)
    { freightTrainData.updateFreightSell(id,volume,weight);}

}
