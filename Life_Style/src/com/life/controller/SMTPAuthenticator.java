package com.life.controller;

import javax.mail.PasswordAuthentication;
import javax.mail.Authenticator;
 

public class SMTPAuthenticator extends Authenticator {
 
    public PasswordAuthentication getPasswordAuthentication() {
        String username = "pooo3405@gmail.com";
        String password = "akdi926112";
        return new PasswordAuthentication(username, password);
    }
}