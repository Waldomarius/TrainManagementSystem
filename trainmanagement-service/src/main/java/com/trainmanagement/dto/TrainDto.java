package com.trainmanagement.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TrainDto {

    private int id;
    private String number;
    private String date;
    private String departure;
    private String arrival;
    private Integer sell;
}
