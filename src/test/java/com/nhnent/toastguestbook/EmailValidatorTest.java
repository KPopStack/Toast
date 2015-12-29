package com.nhnent.toastguestbook;

import org.junit.Assert;
import org.junit.Test;

import toast.util.EmailValidator;

public class EmailValidatorTest {

	@Test()
	public void ValidEmailTest() {
		EmailValidator emailValidator = new EmailValidator();
		
		String[] email = new String[] { "mkyong@yahoo.com",
				"mkyong-100@yahoo.com", "mkyong.100@yahoo.com",
				"mkyong111@mkyong.com", "mkyong-100@mkyong.net",
				"mkyong.100@mkyong.com.au", "mkyong@1.com",
				"mkyong@gmail.com.com", "mkyong+100@gmail.com",
				"mkyong-100@yahoo-test.com" };
		
		for (String temp : email) {
			boolean valid = emailValidator.validate(temp);
			System.out.println("Email is valid : " + temp + " , " + valid);
			Assert.assertEquals(valid, true);
		}

	}

	@Test()
	public void InValidEmailTest() {
		EmailValidator emailValidator = new EmailValidator();
		
		String[] email = new String[] { "mkyong", "mkyong@.com.my",
				"mkyong123@gmail.a", "mkyong123@.com", "mkyong123@.com.com",
				".mkyong@mkyong.com", "mkyong()*@gmail.com", "mkyong@%*.com",
				"mkyong..2002@gmail.com", "mkyong.@gmail.com",
				"mkyong@mkyong@gmail.com", "mkyong@gmail.com.1a" };
		
		for (String temp : email) {
			boolean valid = emailValidator.validate(temp);
			System.out.println("Email is valid : " + temp + " , " + valid);
			Assert.assertEquals(valid, false);
		}
	}


}
