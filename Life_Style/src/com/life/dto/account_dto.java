package com.life.dto;

import java.util.Date;

public class account_dto {
	private int account_io_seq;
	private Date account_date;
	private int account_in_cash;
	private int account_out_cash;
	private String account_io_content;
	private int account_totalcash;
	public int getAccount_io_seq() {
		return account_io_seq;
	}
	public void setAccount_io_seq(int account_io_seq) {
		this.account_io_seq = account_io_seq;
	}
	public Date getAccount_date() {
		return account_date;
	}
	public void setAccount_date(Date account_date) {
		this.account_date = account_date;
	}
	public int getAccount_in_cash() {
		return account_in_cash;
	}
	public void setAccount_in_cash(int account_in_cash) {
		this.account_in_cash = account_in_cash;
	}
	public int getAccount_out_cash() {
		return account_out_cash;
	}
	public void setAccount_out_cash(int account_out_cash) {
		this.account_out_cash = account_out_cash;
	}
	public String getAccount_io_content() {
		return account_io_content;
	}
	public void setAccount_io_content(String account_io_content) {
		this.account_io_content = account_io_content;
	}
	public int getAccount_totalcash() {
		return account_totalcash;
	}
	public void setAccount_totalcash(int account_totalcash) {
		this.account_totalcash = account_totalcash;
	}
	
	
}
