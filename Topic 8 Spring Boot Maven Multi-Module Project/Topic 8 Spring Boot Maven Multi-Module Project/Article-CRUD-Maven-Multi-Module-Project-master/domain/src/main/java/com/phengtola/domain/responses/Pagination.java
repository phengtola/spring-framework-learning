package com.phengtola.domain.responses;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.phengtola.excepetions.CustomGenericException;


public class Pagination implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@JsonProperty("page")
	private int page;
	
	@JsonProperty("limit")
	private int limit;
	
	@JsonProperty("total_count")
	private int totalCount;
	
	@JsonProperty("total_pages")
	private int totalPages;
	
	@JsonIgnore
	private int offset;
	
	public Pagination(){
		this(1,15,0,0);
	}	
	
	public Pagination(int page, int limit){
		this.page = page;
		this.limit = limit;
		this.totalCount = 0;
		this.totalPages = 0;
	}
	
	public Pagination(int page, int limit, int totalCount, int totalPages){
		this.page = page;
		this.limit = limit;
		this.totalCount = totalCount;
		this.totalPages = totalPages;
	}
	public int getPage() {
		return page;
	}

	public int totalPages(){
		return (int) Math.ceil((double)this.totalCount/limit);
		
	}
	
	public int nextPage(){
		return this.page+1;
	}
	
	public int previousPage(){
		return this.page-1;
	}
	
	public boolean hasNextPage(){
		return this.nextPage() <=this.totalPages()? true :false;
	}
	
	public boolean hasPreviousPage(){
		return this.previousPage()>=1 ? true : false;
	}	
	
	public int offset(){
		this.offset = (this.page-1)* limit;
		return this.offset;
	}
	
	public void setPage(int currentPage) {
		this.page = currentPage;
		this.offset();
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.totalPages = (int) totalPages();
		if(this.totalPages() < this.page){
			throw new CustomGenericException("500", "The total pages has only " + this.totalPages() +" and your current page is "+ this.page);
		}
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	/**
	 * @return the offset
	 */
	public int getOffset() {
		return offset;
	}

	/**
	 * @param offset the offset to set
	 */
	public void setOffset(int offset) {
		this.offset = offset;
	}

	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	

}
