package com.JavaBean;
/*
 * 该JavaBean是用来设置分页显示的类
 */
public class PageNumber {
	int rowCount=1,//总的记录数
			pageSize=1,//每页显示的记录数
			showPage=1,//设置欲显示的页码数
			pageCount=1;//分页之后的总页数

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int n) {
		this.rowCount = n;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int n) {
		this.pageSize = n;
	}

	public int getShowPage() {
		return showPage;
	}

	public void setShowPage(int n) {
		this.showPage = n;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int r,int p) {
		rowCount = r;
		pageSize = p;
		int n=(rowCount%pageSize)==0?(rowCount/pageSize):(rowCount/pageSize+1);
		this.pageCount=n;
	}
	
}
