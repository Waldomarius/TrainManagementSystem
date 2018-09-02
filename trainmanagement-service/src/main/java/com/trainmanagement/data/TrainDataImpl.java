package com.trainmanagement.data;

import com.trainmanagement.dto.TrainDto;
import com.trainmanagement.pojo.Train;
import com.trainmanagement.repositories.TrainRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class TrainDataImpl implements TrainData{

    @Autowired
    TrainRepository trainRepository;

    @Override
    public List<Train> getAll() {
        return trainRepository.findAll();
    }

    @Override
    public Train save(Train train) {
        return trainRepository.saveAndFlush(train);
    }

    @Override
    public void deleteTrain(Integer id) {
        trainRepository.delete(id);
    }

    @Override
    public void updateSell(Integer id, Integer sell) {
        trainRepository.setSellFor(id,sell);
    }

    @Transactional(readOnly = true)
    @Override
    public List<TrainDto> getTrainDTO() {

        List<TrainDto> trainDTOs = new ArrayList<>();

        for (Train train : getAll()) {
            trainDTOs.add(constructUserDTO(train));
        }
        return trainDTOs;
    }

    private TrainDto constructUserDTO(Train train) {

        TrainDto trainDTO = new TrainDto();

        trainDTO.setId(train.getId());
        trainDTO.setNumber(train.getNumber());
        trainDTO.setDate(train.getDate());
        trainDTO.setDeparture(train.getDeparture());
        trainDTO.setArrival(train.getArrival());
        trainDTO.setSell(train.getSell());

        return trainDTO;
    }

}
