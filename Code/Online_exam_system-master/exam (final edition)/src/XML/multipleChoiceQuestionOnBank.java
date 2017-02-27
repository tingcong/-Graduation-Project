package XML;

public class multipleChoiceQuestionOnBank {
	String questionID = "0";
	String title;
	String choices[];
    String rightChoices[];
	public String getQuestionID() {
		return questionID;
	}
	public void setQuestionID(String questionID) {
		this.questionID = questionID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String[] getChoices() {
		return choices;
	}
	public void setChoices(String[] choices) {
		this.choices = choices;
	}
	public String[] getRightChoices() {
		return rightChoices;
	}
	public void setRightChoices(String[] rightChoices) {
		this.rightChoices = rightChoices;
	}
}
