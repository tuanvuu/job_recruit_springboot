package com.laptrinhoop.service;

public interface IMailService {
	boolean send(String to, String subject, String body,Object o, String... others);

}
