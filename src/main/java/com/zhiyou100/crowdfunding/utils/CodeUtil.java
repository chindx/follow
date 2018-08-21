package com.zhiyou100.crowdfunding.utils;
import java.util.Random;
import java.util.UUID;
public class CodeUtil {

	/** 生成32位的激活码 */
	public static String generateUniqueCode() {
		return UUID.randomUUID().toString().replaceAll("-", "");
//		return UUID.randomUUID().toString();
	}

	/**
	 * 生成随机码值，包含数字、大小写字母
	 * 
	 * @author 
	 * @param number
	 *            生成的随机码位数
	 * @return
	 */
	public static String getRandomCode(int number) {
		String codeNum = "";
		int[] code = new int[3];
		Random random = new Random();
		for (int i = 0; i < number; i++) {
			int num = random.nextInt(10) + 48;
			int uppercase = random.nextInt(26) + 65;
			int lowercase = random.nextInt(26) + 97;
			code[0] = num;
			code[1] = uppercase;
			code[2] = lowercase;
			codeNum += (char) code[random.nextInt(3)];
		}
		System.out.println(codeNum);

		return codeNum;
	}
	
	public static void main(String[] args) {
		getRandomCode(128);
		System.out.println("==============================================================");
		getRandomCode(4);
		System.out.println("==============================================================");
		System.out.println(generateUniqueCode());
	}
}