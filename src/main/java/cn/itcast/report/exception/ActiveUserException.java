package cn.itcast.report.exception;
//激活用户
public class ActiveUserException extends Exception {

	public ActiveUserException() {
		super();
	}

	public ActiveUserException(String message, Throwable cause) {
		super(message, cause);
	}

	public ActiveUserException(String message) {
		super(message);
	}

	public ActiveUserException(Throwable cause) {
		super(cause);
	}

}
