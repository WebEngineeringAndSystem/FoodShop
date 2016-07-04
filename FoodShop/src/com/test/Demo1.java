package com.test;

import java.util.HashMap;

import org.junit.Test;

public class Demo1 {
	HashMap<String, Integer> items;
	@Test
	public void fun(){
		items=new HashMap<String, Integer>();
		items.put("1001", 1);
		//System.out.print(items);
	}

}
