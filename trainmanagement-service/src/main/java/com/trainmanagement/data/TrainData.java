package com.trainmanagement.data;

import com.trainmanagement.dto.TrainDto;
import com.trainmanagement.pojo.Train;

import java.util.List;

public interface TrainData {

    List<Train> getAll();

    Train save(Train train);

    void deleteTrain(Integer id);

    void updateSell(Integer id, Integer sell);

    List<TrainDto> getTrainDTO();
}
