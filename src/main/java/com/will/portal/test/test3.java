package com.will.portal.test;

import java.util.ArrayList;
import java.util.List;

import javax.print.event.PrintJobAttributeListener;

import org.w3c.dom.ls.LSInput;

public class test3 {

	public static void main(String[] args) {
		List<test1VO> list = new ArrayList<test1VO>();
		list.add(new test1VO("a", "홍길동", "20", "a@com"));
		list.add(new test1VO("b", "김길동", "21", "a@com"));
		list.add(new test1VO("c", "이길동", "22", "a@com"));
		list.add(new test1VO("d", "박길동", "23", "a@com"));

		test1 write = new test1();
		write.xisWiter(list);
		
		test2 reader = new test2();
		List<test1VO> xlist = reader.xlsTocuList("test.xks");
		printList(xlist);
	}
	
	public static void printList(List<test1VO> list ) {
		test1VO vo;
		for (int i=0; i<list.size(); i++) {
			vo=list.get(i);
			System.out.println(vo.toString());
		}
	}

}
