package com.yjw.po;

public class Book {
	private Integer bookid;//ͼ����
	private	String bookname;//ͼ����
	private	String bookauthor;//����
	private	String bookclass;//ͼ�����
	private	String bookdate;//����ʱ��
	private	String bookpress;//������
	private	String bookzcdate;//����ʱ��
	public Integer getBookid() {
		return bookid;
	}
	public void setBookid(Integer bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getBookauthor() {
		return bookauthor;
	}
	public void setBookauthor(String bookauthor) {
		this.bookauthor = bookauthor;
	}
	public String getBookclass() {
		return bookclass;
	}
	public void setBookclass(String bookclass) {
		this.bookclass = bookclass;
	}
	public String getBookdate() {
		return bookdate;
	}
	public void setBookdate(String bookdate) {
		this.bookdate = bookdate;
	}
	public String getBookpress() {
		return bookpress;
	}
	public void setBookpress(String bookpress) {
		this.bookpress = bookpress;
	}
	public String getBookzcdate() {
		return bookzcdate;
	}
	public void setBookzcdate(String bookzcdate) {
		this.bookzcdate = bookzcdate;
	}
	@Override
	public String toString() {
		return "Book [bookid=" + bookid + ", bookname=" + bookname + ", bookauthor=" + bookauthor + ", bookclass="
				+ bookclass + ", bookdate=" + bookdate + ", bookpress=" + bookpress + ", bookzcdate=" + bookzcdate
				+ "]";
	}
	
}
