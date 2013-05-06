package com.ems.fe.exceptions;
/**
 * 应用层异常
 * @author 陈云展
 *
 */
public class AppException extends RuntimeException {

	public AppException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AppException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public AppException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public AppException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

}
