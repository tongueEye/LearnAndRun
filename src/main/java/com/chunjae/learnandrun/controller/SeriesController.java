package com.chunjae.learnandrun.controller;

import com.chunjae.learnandrun.dto.SeriesDTO;
import com.chunjae.learnandrun.dto.UserDTO;
import com.chunjae.learnandrun.service.SeriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class SeriesController {

    private final SeriesService service;
    @Autowired
    public SeriesController(SeriesService service){
        this.service=service;
    }

    /** 세부 강의 리스트 */
    @GetMapping("/listSeries/{lectureNo}")
    public @ResponseBody List<SeriesDTO> listSeries(@PathVariable int lectureNo){

        List<SeriesDTO> list=service.listSeries(lectureNo);

        return list;
    }

    /** 세부 강의 등록 */
    @PostMapping("/insertSeries")
    public @ResponseBody HashMap<String, Object> insertSeries(@RequestBody HashMap<String, Object> hm){

        int result=service.insertSeries(hm);

        return hm;
    }


    /** 세부 강의 수정 */
    @GetMapping("/updateSeries/{lectureNo}/{seriesNo}/{updateDetailName}/{updateDetailUrl}")
    public String updateSeries(HttpSession session
            , @PathVariable int lectureNo
            , @PathVariable int seriesNo
            , @PathVariable(required = false) String updateDetailName
            , @PathVariable(required = false) String updateDetailUrl){

        UserDTO userDTO= (UserDTO) session.getAttribute("dto");
        SeriesDTO seriesDTO=service.detailSeries(seriesNo);

        if(seriesDTO!=null && userDTO!=null){
            if("admin".equals(userDTO.getUserId())){
                SeriesDTO dto=new SeriesDTO();
                dto.setSeriesNo(seriesNo);
                dto.setDetailName(updateDetailName);
                dto.setDetailUrl(updateDetailUrl);
                int result=service.updateSeries(dto);

                return "redirect:/lecture_detail/"+lectureNo;
            }else
                return "redirect:/lecture_list";
        }else{
            return "redirect:/lecture_list";
        }


    }


    /** 세부 강의 삭제 */
    @GetMapping("/deleteSeries/{lectureNo}/{seriesNo}")
    public String deleteSeries(HttpSession session
            , @PathVariable int lectureNo
            , @PathVariable int seriesNo){

        UserDTO userDTO= (UserDTO) session.getAttribute("dto");
        SeriesDTO seriesDTO=service.detailSeries(seriesNo);

        if(userDTO!=null && seriesDTO!=null){
            if("admin".equals(userDTO.getUserId())){
                int result=service.deleteSeries(seriesNo);
                return "redirect:/lecture_detail/"+lectureNo+"#lectureSeries";
            }else
                return "redirect:/lecture_list";
        }else{
            return "redirect:/lecture_list";
        }


    }


    /** 세부 강의 수강 페이지 */
    @GetMapping("lecture_class/{lectureNo}/{seriesNo}")
    public String detailSeries(HttpSession session
            , @PathVariable int lectureNo
            , @PathVariable int seriesNo
            , Model model) {

        SeriesDTO seriesDTO = service.detailSeries(seriesNo);
        String lectureName=service.getLectureName(lectureNo);

        model.addAttribute("dto", seriesDTO);
        model.addAttribute("lectureName", lectureName);

        UserDTO userDTO = (UserDTO) session.getAttribute("dto");

        if(seriesDTO!=null && userDTO!=null){
            int authority=service.getAuthority(lectureNo, userDTO.getUserId());

            if("admin".equals(userDTO.getUserId()) || authority>0){
                return "lecture/lecture_class";
            }else{
                return "redirect:/lecture_detail/"+lectureNo;
            }
        }else{
            return "redirect:/lecture_detail/"+lectureNo;
        }

    }
}
