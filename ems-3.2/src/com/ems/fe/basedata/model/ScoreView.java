package com.ems.fe.basedata.model;
/**
 * 分数视图类
 * @author 陈云展
 *
 */
public class ScoreView {
	private String v_sGrade;
	private String v_sClasses;
	private String v_sDepartment;
	private String v_sName;
	private String v_pName;
	private String v_sDepartmentId;
	private int v_score;
	private String v_studentId;
	private String v_paperId;
	private String v_scoreId;
	public String getV_scoreId() {
		return v_scoreId;
	}
	public void setV_scoreId(String id) {
		v_scoreId = id;
	}
	public String getV_studentId() {
		return v_studentId;
	}
	public void setV_studentId(String id) {
		v_studentId = id;
	}
	public String getV_paperId() {
		return v_paperId;
	}
	public void setV_paperId(String id) {
		v_paperId = id;
	}
	public String getV_sGrade() {
		return v_sGrade;
	}
	public void setV_sGrade(String grade) {
		v_sGrade = grade;
	}
	public String getV_sClasses() {
		return v_sClasses;
	}
	public void setV_sClasses(String classes) {
		v_sClasses = classes;
	}
	public String getV_sDepartment() {
		return v_sDepartment;
	}
	public void setV_sDepartment(String department) {
		v_sDepartment = department;
	}
	public String getV_sName() {
		return v_sName;
	}
	public void setV_sName(String name) {
		v_sName = name;
	}
	public String getV_pName() {
		return v_pName;
	}
	public void setV_pName(String name) {
		v_pName = name;
	}
	public String getV_sDepartmentId() {
		return v_sDepartmentId;
	}
	public void setV_sDepartmentId(String departmentId) {
		v_sDepartmentId = departmentId;
	}
	public int getV_score() {
		return v_score;
	}
	public void setV_score(int v_score) {
		this.v_score = v_score;
	}
	
}
