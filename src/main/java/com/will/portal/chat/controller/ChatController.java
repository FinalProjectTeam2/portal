package com.will.portal.chat.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.portal.chat.model.ChatMessage;
import com.will.portal.chat.model.ChatRoom;
import com.will.portal.chat.model.ChatRoomForm;
import com.will.portal.chat.model.ChatRoomRepository;
import com.will.portal.chat.model.ChatService;
import com.will.portal.common.MemberDetails;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatController {
	
	//private Logger logger = LoggerFactory.getLogger(ChatController.class);
	private final ChatRoomRepository chatRoomRepository;
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/chatMain")
	public void chatMain() {
		
	}
	
	@RequestMapping(value = "/chatting", method = RequestMethod.GET)
	public void websocket() {
		log.info("채팅 방 보여주기");
	}
	@GetMapping("/chatRooms")
    public String chatRooms(Model model){
		log.info("채팅방 보여주기");
        model.addAttribute("rooms",chatRoomRepository.findAllRoom());
        log.info("list.size={}",chatRoomRepository.findAllRoom().size());
        return "/chat/chatRooms";
    }
	@GetMapping("/")
    public String rooms(Model model){
		log.info("채팅방 보여주기");
        model.addAttribute("rooms",chatRoomRepository.findAllRoom());
        log.info("list.size={}",chatRoomRepository.findAllRoom().size());
        return "/chat/rooms";
    }

    @GetMapping("/rooms")
    public String room(@RequestParam String roomId, Model model){
        ChatRoom room = chatRoomRepository.findRoomById(roomId);
        log.info("채팅방 정보 room={}",room);
        
        List<ChatMessage> list = chatService.selectMessage(room.getRoomId());
        
        model.addAttribute("room",room);
        model.addAttribute("list",list);
        return "/chat/chatRoom";
    }

    @GetMapping("/new")
    public String make(Model model){
    	log.info("채팅방 생성 페이지");
        ChatRoomForm form = new ChatRoomForm();
        model.addAttribute("form",form);
        return "/chat/newRoom";
    }

    @PostMapping("/room/new")
    @ResponseBody
    public String makeRoom(@ModelAttribute ChatRoomForm form,
    		Principal principal ){
    	MemberDetails user = (MemberDetails) ((Authentication)principal).getPrincipal();
    	log.info("채팅방 만들기 파라미터 form={}",form);
    	ChatRoom room = chatRoomRepository.createChatRoom(form.getName(),user.getOfficialNo());
        
        return room.getRoomId();
    }
    @GetMapping(value = "/room/delete", produces = "application/json; charset=utf8")
    @ResponseBody
    public String delRoom(@RequestParam String roomId) {
    	log.info("채팅방 삭제 처리, 파라미터 roomId={}",roomId);
    	String result = "삭제 실패";
    	int cnt = chatService.deleteRoom(roomId);
    	if(cnt > 0) {
    		if(chatRoomRepository.deleteChatRoom(roomId)) {
    			result = "삭제 성공";
    		}
    	}
    	return result;
    }
}
