package com.chunjae.learnandrun.dto;

import lombok.*;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OrderDTO {
    private int orderNo;
    private int userNo;
    private String orderDate;
    private int lectureNo;
    private boolean authority;
}
