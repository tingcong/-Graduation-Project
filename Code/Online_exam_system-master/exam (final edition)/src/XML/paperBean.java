package XML;

public class paperBean {
	String paperID;
    String studentID;
    String teacherID;
    String testDate;
    String totalScore;
    String examTime;
    String usedTime;
    singleChoiceQuestionOnPaper singleChoiceQuestions[];
    judgementQuestionOnPaper judgmentQuestions[];
    essayQuestionOnPaper essayQuestions[];
    multipleChoiceQuestionOnPaper multipleChoiceQuestions[];
    
	
	public multipleChoiceQuestionOnPaper[] getMultipleChoiceQuestions() {
		return multipleChoiceQuestions;
	}
	public void setMultipleChoiceQuestions(multipleChoiceQuestionOnPaper[] multipleChoiceQuestions) {
		this.multipleChoiceQuestions = multipleChoiceQuestions;
	}
	String subjectiveScore;
    String objectiveScore;
    String finalScore;
	public String getPaperID() {
		return paperID;
	}
	public void setPaperID(String paperID) {
		this.paperID = paperID;
	}
	public String getStudentID() {
		return studentID;
	}
	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}
	public String getTeacherID() {
		return teacherID;
	}
	public void setTeacherID(String teacherID) {
		this.teacherID = teacherID;
	}
	public String getTestDate() {
		return testDate;
	}
	public void setTestDate(String testDate) {
		this.testDate = testDate;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public String getExamTime() {
		return examTime;
	}
	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}
	public String getUsedTime() {
		return usedTime;
	}
	public void setUsedTime(String usedTime) {
		this.usedTime = usedTime;
	}
	public singleChoiceQuestionOnPaper[] getSingleChoiceQuestions() {
		return singleChoiceQuestions;
	}
	public void setSingleChoiceQuestions(singleChoiceQuestionOnPaper[] singleChoiceQuestions) {
		this.singleChoiceQuestions = singleChoiceQuestions;
	}
	public judgementQuestionOnPaper[] getJudgmentQuestions() {
		return judgmentQuestions;
	}
	public void setJudgmentQuestions(judgementQuestionOnPaper[] judgmentQuestions) {
		this.judgmentQuestions = judgmentQuestions;
	}
	public essayQuestionOnPaper[] getEssayQuestions() {
		return essayQuestions;
	}
	public void setEssayQuestions(essayQuestionOnPaper[] essayQuestions) {
		this.essayQuestions = essayQuestions;
	}
	public String getSubjectiveScore() {
		return subjectiveScore;
	}
	public void setSubjectiveScore(String subjectiveScore) {
		this.subjectiveScore = subjectiveScore;
	}
	public String getObjectiveScore() {
		return objectiveScore;
	}
	public void setObjectiveScore(String objectiveScore) {
		this.objectiveScore = objectiveScore;
	}
	public String getFinalScore() {
		return finalScore;
	}
	public void setFinalScore(String finalScore) {
		this.finalScore = finalScore;
	}

}
