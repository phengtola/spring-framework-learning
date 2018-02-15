package com.phengtola.spring.test;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class GetEncryptPasswordBasicAuthentication {

	public static void main(String[] args) {
		
		// Encrypt Password 
		System.out.println(
				new BCryptPasswordEncoder().encode("123456")
				);
		
		
	}
	
}
