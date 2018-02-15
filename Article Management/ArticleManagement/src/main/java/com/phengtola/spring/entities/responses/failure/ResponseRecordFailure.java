package com.phengtola.spring.entities.responses.failure;

import com.phengtola.spring.entities.responses.ResponseHttpStatus;
import com.phengtola.spring.entities.responses.ResponseRecord;

public class ResponseRecordFailure<T> extends ResponseRecord<T>{
	
	private Error error;
	
	public ResponseRecordFailure() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ResponseRecordFailure(String message, boolean status, ResponseHttpStatus error) {
		super.setMessage(message);
		super.setStatus(status);
		super.setData(null);
		this.setError(new Error(error));
	}

	public static class Error {

		private int code;
		private String message;
		
		public Error(ResponseHttpStatus status) {
			super();
			this.code = status.value();
			this.message = status.getReasonPhrase();
		}

		public int getCode() {
			return code;
		}
		
		public void setCode(int code) {
			this.code = code;
		}
		
		public String getMessage() {
			return message;
		}
		
		public void setMessage(String message) {
			this.message = message;
		}
	}
	
	public Error getError() {
		return error;
	}

	public void setError(Error error) {
		this.error = error;
	}
}
