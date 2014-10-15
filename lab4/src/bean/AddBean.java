package bean;

import conn.connDB;

public class AddBean {
	private long isbn;
	private String title;
	private int authorid;
	private String publisher;
	private long publishdate;
	private float price;
	
	public long getPublishdate() {
		return publishdate;
	}
	
	public void setPublishdate(long publishdate) {
		this.publishdate = publishdate;
	}
	public long getIsbn() {
		return isbn;
	}

	public void setIsbn(long isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getAuthorid() {
		return authorid;
	}

	public void setAuthorid(int authorid) {
		this.authorid = authorid;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public AddBean(){}
	
	/*
	 * 添加数据
	 */
	public String add(){

		system.out.println("------R3------!!!");		

		connDB connadd = new connDB();
		String sql = "";
		int getstate = 0;
		
		sql = "insert into book values( "+ isbn +",\""+ title +"\","+ authorid +",\""+ publisher +"\",\""+ publishdate +"\","+ price +")";
		getstate =  connadd.executeUpdate(sql);
		connadd.close();
		if(getstate != 0){
			return "Add book successful!";
		}else{
			return "Fail to add book!";
		}
	}
	/*
	 * 进行删除操作，重写个麻烦，也不想改名字了，将就用吧
	 */
	
	public String delete(){
		connDB connadd = new connDB();
		String sql = "";
		int getstate = 0;
		
		sql = "delete from book where isbn = "+ isbn +"";
		getstate =  connadd.executeDelete(sql);
		connadd.close();
		if(getstate != 0){
			return "Delete book successful!";
		}else{
			return "Fail to delete book!";
		}
	}

}
