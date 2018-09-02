package com.trainmanagement.repositories;

import com.trainmanagement.pojo.FreightTrain;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface FreightTrainRepository extends JpaRepository<FreightTrain, Integer> {

    @Modifying
    @Query("UPDATE FreightTrain c SET c.volume = :volume, c.weight=:weight WHERE c.id=:id")
    void setFreightSellFor(@Param("id") int id,
                           @Param("volume") int volume,
                           @Param("weight") int weight);


}
