package XML;

public class examinationBean {
	String examinationID;
	
	String ruleID;
	String teacherID;
	String examinationName;

	String courseID;

	String dateBegin;

	String dateEnd;
	String isScored;
	public String getRuleID() {
		return ruleID;
	}

	public void setRuleID(String ruleID) {
		this.ruleID = ruleID;
	}

	public String getIsScored() {
		return isScored;
	}

	public void setIsScored(String isScored) {
		this.isScored = isScored;
	}

	public String getExaminationID() {

	return examinationID;

	}

	public void setExaminationID(String examinationID) {

	this.examinationID = examinationID;

	}

	public String getExaminationName() {

	return examinationName;

	}

	public void setExaminationName(String examinationName) {

	this.examinationName = examinationName;

	}

	public String getCourseID() {

	return courseID;

	}

	public void setCourseID(String courseID) {

	this.courseID = courseID;

	}

	public String getDateBegin() {

	return dateBegin;

	}

	public void setDateBegin(String dateBegin) {

	this.dateBegin = dateBegin;

	}

	public String getDateEnd() {

	return dateEnd;

	}

	public void setDateEnd(String dateEnd) {

	this.dateEnd = dateEnd;

	}

	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}
	public String getTeacherID() {
		return teacherID;
	}

}
