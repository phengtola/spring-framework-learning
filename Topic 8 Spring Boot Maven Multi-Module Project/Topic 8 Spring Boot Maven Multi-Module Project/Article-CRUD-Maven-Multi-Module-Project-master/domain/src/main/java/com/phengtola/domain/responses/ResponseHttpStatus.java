package com.phengtola.domain.responses;

public enum ResponseHttpStatus {

	// 2xxx Success
	// GET 10xx
	OK(200, "Success! Eyerything is working"), 
	SUCCESS_RETRIEVED_RECORD(2001,"Retrieves a specific record"), 
	SUCCESS_RETRIEVED_LIST_OF_RECORDS(2002, "Retrieves a list of records"),

	// POST 201x
	SUCCESS_CREATED(201, "New record has been created successfully"), 

	// PUT/PATCH/DELETE 202x
	SUCCESS_UPDATED(2021, "The specific record was successfully updated"),
	SUCCESS_DELETED(2022, "The specific record was successfully daleted"),

	// --- 4xx Client Error ---
	// POST 400x
	BAD_REQUEST(400,"The request was invalid or cannot be served. The exact error should be explained in the error payload. E.g. „The JSON is not valid"),
	FAIL_CREATED(4001, "Unable to create record"),
	FAIL_DELETED(4001,"Unable to delete record"), 
	FAIL_UPDATED(4001,"Unable to update record"), 
	OPERATION_FAIL(4000, "Operation failed"),

	// GET/DELTE 404x
	NOT_FOUND(4040, " There is no resource behind the URI"), 
	RECORD_NOT_FOUND(4041,"Record(s) not found"),

	// --- 5xxx Server Error ---
	// Internal Server Error - HTTP Response Code: 500x
	INTERNAL_SERVER_ERROR(5000, "Something is broken. Please contact to developers team!");


	private final int value;
	private final String reasonPhrase;

	ResponseHttpStatus(int value, String reasonPhrase) {
		this.value = value;
		this.reasonPhrase = reasonPhrase;
	}

	public int value() {
		return this.value;
	}

	public String getReasonPhrase() {
		return this.reasonPhrase;
	}

}
