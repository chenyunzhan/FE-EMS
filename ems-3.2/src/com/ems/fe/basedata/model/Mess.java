package com.ems.fe.basedata.model;

public class Mess {
	
	
	private String s_id;
	private String p_id;
	private int timeout;
	private String answer;
	private String timuId;
	private int allowstates;
	private int monistates;
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public int getTimeout() {
		return timeout;
	}
	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getAllowstates() {
		return allowstates;
	}
	public void setAllowstates(int allowstates) {
		this.allowstates = allowstates;
	}
	public int getMonistates() {
		return monistates;
	}
	public void setMonistates(int monistates) {
		this.monistates = monistates;
	}
	public String getTimuId() {
		return timuId;
	}
	public void setTimuId(String timuId) {
		this.timuId = timuId;
	}
	
	
	
}
