package com.will.portal.board_food.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board_food")
public class FoodMenuController {
		@RequestMapping(value="/foodMenuDetail", method = RequestMethod.GET) public String
		foodMenuDetail_get() {
			
			return "board_food/foodMenuDetail";
		}
}
