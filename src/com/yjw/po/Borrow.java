package com.yjw.po;

public class Borrow {
	private Integer borrowid;//���ı��
	private Integer bookid;//�鼮���
	private Integer readerid;//���߱��
	private	String bookname;//�鼮��
	private	String readername;//�鼮��
	private	String borrowdate;//����ʱ��
	private	String borrowts;//����
	public Integer getBorrowid() {
		return borrowid;
	}
	public void setBorrowid(Integer borrowid) {
		this.borrowid = borrowid;
	}
	public Integer getBookid() {
		return bookid;
	}
	public void setBookid(Integer bookid) {
		this.bookid = bookid;
	}
	public Integer getReaderid() {
		return readerid;
	}
	public void setReaderid(Integer readerid) {
		this.readerid = readerid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getBorrowdate() {
		return borrowdate;
	}
	public void setBorrowdate(String borrowdate) {
		this.borrowdate = borrowdate;
	}
	public String getBorrowts() {
		return borrowts;
	}
	public void setBorrowts(String borrowts) {
		this.borrowts = borrowts;
	}
	public String getReadername() {
		return readername;
	}
	public void setReadername(String readername) {
		this.readername = readername;
	}

}
