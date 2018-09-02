package com.trainmanagement.pojo;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "trains")
@Data
@NoArgsConstructor
public class Train {

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

    @Column(name = "sell")
    private Integer sell;

}