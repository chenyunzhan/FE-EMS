package com.ems.fe.util;

import java.util.List;
/**
 * ҳ��ģ��
 * @author ����չ
 *
 */
public class PageModel {
	
	private List list;
	
	private int totalRecords;
	
	private int pageSize;
	
	private int pageNo;
	
	/**
	 * ��ҳ��
	 * @return
	 */
	public int getTotalPages() {
		return (this.totalRecords + this.pageSize - 1)/this.pageSize;
	}
	
	/**
	 * ȡ����ҳ
	 * @return
	 */
	public int getTopPageNo() {
		return 1;
	}
	
	/**
	 * ��һҳ
	 * @return
	 */
	public int getPreviousPageNo() {
		if (this.pageNo <= 1){
			return 1;
		}
		return this.pageNo - 1;
	}
	
	/**
	 * ��һҳ
	 * @return
	 */
	public int getNextPageNo() {
		if (this.pageNo >= this.getBottomPageNo()) {
			return this.getBottomPageNo();
		}
		return this.pageNo + 1;
	}
	
	/**
	 * βҳ
	 * @return
	 */
	public int getBottomPageNo() {
		return this.getTotalPages();
	}
	
	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}
