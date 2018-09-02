package com.trainmanagement.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FreightTrainDto {

    private int id;
    private String number;
    private String date;
    private String departure;
    private String arrival;
    private Integer volumeLimit;
    private Integer weightLimit;
    private Integer volume;
    private Integer weight;
}
