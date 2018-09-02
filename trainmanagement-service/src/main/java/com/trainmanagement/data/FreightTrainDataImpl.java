package com.trainmanagement.data;

import com.trainmanagement.dto.FreightTrainDto;
import com.trainmanagement.pojo.FreightTrain;
import com.trainmanagement.repositories.FreightTrainRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class FreightTrainDataImpl implements FreightTrainData {

    @Autowired
    FreightTrainRepository freightTrainRepository;

    @Override
    public List<FreightTrain> getAll() {
        return freightTrainRepository.findAll();
    }

    @Override
    public FreightTrain save(FreightTrain freightTrain) {
        return freightTrainRepository.saveAndFlush(freightTrain);
    }

    @Override
    public void deleteTrain(Integer id) {
        freightTrainRepository.delete(id);
    }

    @Override
    public void updateFreightSell(int id, int volume, int weight) {
        freightTrainRepository.setFreightSellFor(id,volume,weight);
    }

    @Transactional(readOnly = true)
    @Override
    public List<FreightTrainDto> getFreightTrainDTO() {

        List<FreightTrainDto> freightTrainDTOs = new ArrayList<>();

        for (FreightTrain freightTrain : getAll()) {
            freightTrainDTOs.add(constructUserDTO(freightTrain));
        }
        return freightTrainDTOs;
    }


    private FreightTrainDto constructUserDTO(FreightTrain freightTrain) {

        FreightTrainDto freightTrainDto = new FreightTrainDto();

        freightTrainDto.setId(freightTrain.getId());
        freightTrainDto.setNumber(freightTrain.getNumber());
        freightTrainDto.setDate(freightTrain.getDate());
        freightTrainDto.setDeparture(freightTrain.getDeparture());
        freightTrainDto.setArrival(freightTrain.getArrival());
        freightTrainDto.setVolumeLimit(freightTrain.getVolumeLimit());
        freightTrainDto.setWeightLimit(freightTrain.getWeightLimit());
        freightTrainDto.setVolume(freightTrain.getVolume());
        freightTrainDto.setWeight(freightTrain.getWeight());

        return freightTrainDto;
    }


}
