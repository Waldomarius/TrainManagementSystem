package com.trainmanagement.repositories;

import com.trainmanagement.pojo.Train;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TrainRepository extends JpaRepository<Train, Integer> {


    @Modifying
    @Query("UPDATE Train u SET u.sell = :sell WHERE u.id= :id")
    void setSellFor(@Param("id") int id,
                    @Param("sell") int sell);

//    @Modifying
//    @Query("UPDATE Train c SET c.sell = ?2 WHERE c.id= ?1")
//    void setSellFor( int id, int sell);

}
