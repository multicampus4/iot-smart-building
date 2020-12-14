package com.chat;

public class TESTET {

	public static void main(String[] args) {
		
		// start char: "$"
		// end char: "^"
		String newBufferStr = "26.00;hum80.00;^$tmp26.00;hum80.00;^$tmp26.00;hum80.00;^";

		String bufferStr = "";
//		String newBufferStr = "p26.00;hum80.00;^$tmp26";
		
		if (newBufferStr.contains("$") && newBufferStr.contains("^")) {
			bufferStr = bufferStr.concat(newBufferStr);
			
			int start = bufferStr.indexOf("$");
			int end = bufferStr.indexOf("^");
			System.out.println("start: " + start + "; end: " + end);
			if (start == end + 1) {
				// ^$ 붙어있는 경우
				// ^ 까지 날리고 반환
				bufferStr = bufferStr.substring(end+1);
//				return null;
			} else {
				String correctBufferStr = bufferStr.substring(start + 1, end);
				System.out.println(correctBufferStr);
				bufferStr = bufferStr.substring(end + 1);
				
				System.out.println("bufferStr" + bufferStr);
				System.out.println("correctBufferStr = " + correctBufferStr);
				//return correctBufferStr;
			}
			

		} else {
			// new + old 해서 리턴
			bufferStr = bufferStr.concat(newBufferStr);
//			return null;
		}
		
		

	}

}
