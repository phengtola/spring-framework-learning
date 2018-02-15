package com.phengtola.domain.responses;

public class Transaction {

	public static class Success {
		public static final String CREATED = "created";
		public static final String RETRIEVE = "retrieved";
		public static final String UPDATED = "updated";
		public static final String DELETED = "deleted";
	}
	
	public static class Fail {
		public static final String CREATED = "create";
		public static final String RETRIEVE = "retrieve";
		public static final String UPDATED = "update";
		public static final String DELETED = "delete";
	}
	
}
