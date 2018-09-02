package com.trainmanagement.data;

import com.trainmanagement.dto.FreightTrainDto;
import com.trainmanagement.pojo.FreightTrain;

import java.util.List;

public interface FreightTrainData {

    List<FreightTrain> getAll();

    FreightTrain save(FreightTrain freightTrain);

    void deleteTrain(Integer id);

    void updateFreightSell(int id,int volume,int weight);

    List<FreightTrainDto> getFreightTrainDTO();
}
