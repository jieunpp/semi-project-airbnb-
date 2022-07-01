package com.toy.project.controller;

import com.toy.project.dto.Booking;
import com.toy.project.dto.BookingRoomGhouseUsers;
import com.toy.project.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Date;
import java.text.SimpleDateFormat;


@Controller
@RequestMapping("/book")
public class BookingController {

    private final BookService bookService;
    public BookingController(BookService bookService){ this.bookService=bookService;}

//객실상세페이지에서 예약 확인페이지로
    @RequestMapping(value = "/beforeBooking/{u_no},{r_no}")
    public String beforeBooking(BookingRoomGhouseUsers info, @PathVariable("u_no")int u_no, @PathVariable("r_no")int r_no, Model model){
        int b_pno = info.getB_pno();
        int b_price = info.getB_price();
        Date b_in = info.getB_in();
        Date b_out = info.getB_out();
        info.setU_no(u_no);
        info = this.bookService.getBookingConfirm(info);
        info.setR_no(r_no);
        info.setB_price(b_price);
        info.setB_in(b_in);
        info.setB_out(b_out);
        info.setB_pno(b_pno);
//        System.out.println("beforeBookingbeforeBooking// BookingRoomGhouseUsers.toString"+ info);
        model.addAttribute("Info", info);
        return "/rev001";
    }

//예약하기 booking에 insert
    @RequestMapping(value = "/booking/{u_no},{r_no}")
    public String bookConfirmInfo(Booking booking ,@PathVariable("u_no")int u_no, @PathVariable("r_no")int r_no, Model model){
//        System.out.println("booking.toString : " + booking.toString());
        booking.setB_uno(u_no);
        booking.setB_rno(r_no);
        bookService.insertBook(booking);
//        return "redirect:/book/getBookInfo/"+ u_no +","+ r_no;
        return "/rev002";
    }
}
