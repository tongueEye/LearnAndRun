package com.chunjae.learnandrun.service;

import com.chunjae.learnandrun.dto.OrderDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface OrderService {
    void insertOrder(int buyer_buyid, int lecture_id, String order_id);

    List<HashMap<String, Object>> listOrder(int startRow, int pageSize,String search, String search_txt);

    void updateAuthorities(Map<String, Boolean> hm);

    int getOrderCount(String search, String search_txt);
}
