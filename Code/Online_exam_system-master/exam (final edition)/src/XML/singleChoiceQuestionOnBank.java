package XML;

public class singleChoiceQuestionOnBank {
	//题库中存放的题目
		String questionID = "0";
		String title;
		String choices[];
	    String rightChoice;
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
		public String getRightChoice() {
			return rightChoice;
		}
		public void setRightChoice(String rightChoice) {
			this.rightChoice = rightChoice;
		}
}
