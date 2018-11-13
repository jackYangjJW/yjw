package com.yjw.po;

public class Borrow {
	private Integer borrowid;//借阅编号
	private Integer bookid;//书籍编号
	private Integer readerid;//读者编号
	private	String bookname;//书籍名
	private	String readername;//书籍名
	private	String borrowdate;//借书时间
	private	String borrowts;//天数
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
