package com.trainmanagement.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "freight_trains")
@Data
@NoArgsConstructor
public class FreightTrain {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "number", nullable = false)
    private String number;

    @Column(name = "date")
    private String date;

    @Column(name = "departure", nullable = false)
    private String departure;

    @Column(name = "arrival", nullable = false)
    private String arrival;

    @Column(name = "volume_limit")
    private Integer volumeLimit;

    @Column(name = "weight_limit")
    private Integer weightLimit;

    @Column(name = "volume")
    private Integer volume;

    @Column(name = "weight")
    private Integer weight;

}
