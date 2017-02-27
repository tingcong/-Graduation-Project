package XML;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import Logic.staticVariable;


public class papersSaveXmlHelper {

     
     public  String path=staticVariable.path;
     
     public  void creatXML(String typename){
 		Document document=DocumentHelper.createDocument();
 		document.addElement("papers");
 		File file=new File(path+typename+".xml");
 		writeXML(document,file);
 	}
 	
 	private  int writeXML(Document document,File file){
 		int value=0;
 		
 		OutputFormat format=OutputFormat.createPrettyPrint();
 		format.setEncoding("UTF-8");  
         format.setNewlines(true);
         XMLWriter writer=null;
 		try{
 			//格式化输出
 	        writer=new  XMLWriter(new FileOutputStream(file),format);
 	        writer.write(document);
 	        writer.close();
 	        value=1;
 	        
 		}catch(Exception ex){
 			ex.printStackTrace();
 			
 		}
 		
 		return value;
 	}
 	
 	public  int addPaper(String typename,String studentID,
    String teacherID,String testDate,String totalScore,String examTime,String usedTime,
    singleChoiceQuestionOnPaper singleChoiceQuestions[],
    judgementQuestionOnPaper judgmentQuestions[],essayQuestionOnPaper essayQuestions[],
    multipleChoiceQuestionOnPaper multipleChoiceQuestions[],
    String subjectiveScore,String objectiveScore,String finalScore){
 		int value=0;
 		File file=new File(path+typename+".xml");
 		if(!file.exists()){
 			creatXML(typename);
 			file=new File(path+typename+".xml");
 		}
 		Document document=null;
 		
 		try{
 			
 			SAXReader reader=new SAXReader();
 			document=reader.read(file);
 			Element rootElement=document.getRootElement();
 			
 			
 			int paperid = 1;
 			List papers=document.selectNodes("/papers/paper");
 			Iterator iter=papers.iterator();
 			
 			while(iter.hasNext()){						

 				Element maxElement=(Element) iter.next();
 				paperid = Integer.parseInt(maxElement.element("paperID").getText(), 10) + 1; 
 			}
 			
 			Element paperElement=rootElement.addElement("paper");
 			String paperID = String.valueOf(paperid);
 			Element paperIDElement = paperElement.addElement("paperID");
 			paperIDElement.setText(paperID);
 			
 			Element studentIDElement=paperElement.addElement("studentID");
 			studentIDElement.setText(studentID);
 			
 			Element teacherIDElement  = paperElement.addElement("teacherID");
 			teacherIDElement.setText(teacherID);
 			
 			Element testDateElement  = paperElement.addElement("testDate");
 			testDateElement.setText(testDate);
 			
 			Element totalScoreElement  = paperElement.addElement("totalScore");
 			totalScoreElement.setText(totalScore);
 			
 			Element examTimeElement  = paperElement.addElement("examTime");
 			examTimeElement.setText(examTime);
 			
 			Element usedTimeElement  = paperElement.addElement("usedTime");
 			usedTimeElement.setText(usedTime);
 			
 			//添加考试具体内容
 			Element contentElement  = paperElement.addElement("content");
 			Element singleChoiceQuestionsElement  = contentElement.addElement("singleChoiceQuestions");
 			Element judgmentQuestionsElement  = contentElement.addElement("judgmentQuestions");
 			Element essayQuestionsElement  = contentElement.addElement("essayQuestions");
 			Element multipleChoiceQuestionsElement  = contentElement.addElement("multipleChoiceQuestions");
 			for (int i= 0 ;i < singleChoiceQuestions.length;i++){
 				Element singleChoiceQuestionElement = singleChoiceQuestionsElement.addElement("singleChoiceQuestion");
 				Element titleElement  = singleChoiceQuestionElement.addElement("title");
 				titleElement.setText(singleChoiceQuestions[i].getTitle());
 				
 				String s[] = singleChoiceQuestions[i].getChoices();
 				Element choicesElement  = singleChoiceQuestionElement.addElement("choices");
 				
 				Element choiceAElement=choicesElement.addElement("choiceA");
 				choiceAElement.setText(s[0]);
 				
 				Element choiceBElement=choicesElement.addElement("choiceB");
 				choiceBElement.setText(s[1]);
 				
 				Element choiceCElement=choicesElement.addElement("choiceC");
 				choiceCElement.setText(s[2]);
 				
 				Element choiceDElement=choicesElement.addElement("choiceD");
 				choiceDElement.setText(s[3]);
 				
 				Element studentAnswerElement  = singleChoiceQuestionElement.addElement("studentAnswer");
 				studentAnswerElement.setText(singleChoiceQuestions[i].getStudentAnswer());
 				
 				Element scoreElement  = singleChoiceQuestionElement.addElement("score");
 				scoreElement.setText(singleChoiceQuestions[i].getScore());
 			}
 			
 			for (int i= 0 ;i < judgmentQuestions.length;i++){
 				Element judgmentQuestionElement  = judgmentQuestionsElement.addElement("judgmentQuestion");
 				Element titleElement  = judgmentQuestionElement.addElement("title");
 				titleElement.setText(judgmentQuestions[i].getTitle());
 				
 				
 				Element studentAnswerElement  = judgmentQuestionElement.addElement("studentAnswer");
 				studentAnswerElement.setText(judgmentQuestions[i].getStudentAnswer());
 				
 				Element scoreElement  = judgmentQuestionElement.addElement("score");
 				scoreElement.setText(judgmentQuestions[i].getScore());
 			}
 			
 			for (int i= 0 ;i < essayQuestions.length;i++){
 				Element essayQuestionElement  = essayQuestionsElement.addElement("essayQuestion");
 				Element titleElement  = essayQuestionElement.addElement("title");
 				titleElement.setText(essayQuestions[i].getTitle());
 				
 				
 				Element studentAnswerElement  = essayQuestionElement.addElement("studentAnswer");
 				studentAnswerElement.setText(essayQuestions[i].getStudentAnswer());
 				
 				Element scoreElement  = essayQuestionElement.addElement("score");
 				scoreElement.setText(essayQuestions[i].getScore());
 			}
 			for (int i= 0 ;i < multipleChoiceQuestions.length;i++){
 				Element multipleQuestionElement  = multipleChoiceQuestionsElement.addElement("multipleChoiceQuestion");
 				Element titleElement  = multipleQuestionElement.addElement("title");
 				titleElement.setText(multipleChoiceQuestions[i].getTitle());
 				
 				String choices[] = multipleChoiceQuestions[i].getChoices();
 				Element choicesElement  = multipleQuestionElement.addElement("choices");
 				
 				Element choiceAElement=choicesElement.addElement("choiceA");
 				choiceAElement.setText(choices[0]);
 				
 				Element choiceBElement=choicesElement.addElement("choiceB");
 				choiceBElement.setText(choices[1]);
 				
 				Element choiceCElement=choicesElement.addElement("choiceC");
 				choiceCElement.setText(choices[2]);
 				
 				Element choiceDElement=choicesElement.addElement("choiceD");
 				choiceDElement.setText(choices[3]);
 				
 				Element studentChoicesElement  = multipleQuestionElement.addElement("studentChoices");
 				String studentChoices[] = multipleChoiceQuestions[i].getStudentChoices();
 				for(int a = 0 ; a <studentChoices.length;a++){
 					Element choiceElement = studentChoicesElement.addElement("choice");
 					choiceElement.setText(studentChoices[a]);
 				}
 				
 				Element scoreElement  = multipleQuestionElement.addElement("score");
 				scoreElement.setText(multipleChoiceQuestions[i].getScore());
 			}
 			Element subjectiveScoreElement  = paperElement.addElement("subjectiveScore");
 			subjectiveScoreElement.setText(subjectiveScore);
 			
 			Element objectiveScoreElement  = paperElement.addElement("objectiveScore");
 			objectiveScoreElement.setText(objectiveScore);
 			
 			Element finalScoreElement  = paperElement.addElement("finalScore");
 			finalScoreElement.setText(finalScore);
 			
 		}catch(Exception ex){
 			ex.printStackTrace();
 		}
 		
 		value=writeXML(document,file);
 		
 		return value;
 		
 	}
 	
 	public  int updatePaper(String typename,String paperID,String studentID,
 		    String teacherID,String testDate,String totalScore,String examTime,String usedTime,
 		    singleChoiceQuestionOnPaper singleChoiceQuestions[],
 		    judgementQuestionOnPaper judgmentQuestions[],essayQuestionOnPaper essayQuestions[],
 		   multipleChoiceQuestionOnPaper multipleChoiceQuestions[],
 		    String subjectiveScore,String objectiveScore,String finalScore){
		int value=0;
		SAXReader reader=new SAXReader();
		Document document;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){
				document=reader.read(file);
				Node node=document.selectSingleNode("/papers/paper[paperID='"+paperID+"']");
				Element paperElement=(Element)node;
				paperElement.element("studentID").setText(studentID);
				paperElement.element("teacherID").setText(teacherID);
				paperElement.element("testDate").setText(testDate);
				paperElement.element("totalScore").setText(totalScore);
				paperElement.element("examTime").setText(examTime);
				paperElement.element("usedTime").setText(usedTime);
				paperElement.element("subjectiveScore").setText(subjectiveScore);
				paperElement.element("objectiveScore").setText(objectiveScore);
				paperElement.element("finalScore").setText(finalScore);
				
				Element contentElement  = paperElement.element("content");
	 			Element singleChoiceQuestionsElement  = contentElement.element("singleChoiceQuestions");
	 			Element judgmentQuestionsElement  = contentElement.element("judgmentQuestions");
	 			Element essayQuestionsElement  = contentElement.element("essayQuestions");
	 			Element multipleChoiceQuestionsElement  = contentElement.element("multipleChoiceQuestions");
	 			singleChoiceQuestionsElement.getParent().remove(singleChoiceQuestionsElement);
	 			judgmentQuestionsElement.getParent().remove(judgmentQuestionsElement);
	 			essayQuestionsElement.getParent().remove(essayQuestionsElement);
	 			multipleChoiceQuestionsElement.getParent().remove(multipleChoiceQuestionsElement);
	 			
	 			singleChoiceQuestionsElement  = contentElement.addElement("singleChoiceQuestions");
	 			judgmentQuestionsElement  = contentElement.addElement("judgmentQuestions");
	 			essayQuestionsElement  = contentElement.addElement("essayQuestions");
	 			multipleChoiceQuestionsElement = contentElement.addElement("multipleChoiceQuestions");
	 			for (int i= 0 ;i < singleChoiceQuestions.length;i++){
	 				Element singleChoiceQuestionElement = singleChoiceQuestionsElement.addElement("singleChoiceQuestion");
	 				Element titleElement  = singleChoiceQuestionElement.addElement("title");
	 				titleElement.setText(singleChoiceQuestions[i].getTitle());
	 				
	 				String s[] = singleChoiceQuestions[i].getChoices();
	 				Element choicesElement  = singleChoiceQuestionElement.addElement("choices");
	 				
	 				Element choiceAElement=choicesElement.addElement("choiceA");
	 				choiceAElement.setText(s[0]);
	 				
	 				Element choiceBElement=choicesElement.addElement("choiceB");
	 				choiceBElement.setText(s[1]);
	 				
	 				Element choiceCElement=choicesElement.addElement("choiceC");
	 				choiceCElement.setText(s[2]);
	 				
	 				Element choiceDElement=choicesElement.addElement("choiceD");
	 				choiceDElement.setText(s[3]);
	 				
	 				Element studentAnswerElement  = singleChoiceQuestionElement.addElement("studentAnswer");
	 				studentAnswerElement.setText(singleChoiceQuestions[i].getStudentAnswer());
	 				
	 				Element scoreElement  = singleChoiceQuestionElement.addElement("score");
	 				scoreElement.setText(singleChoiceQuestions[i].getScore());
	 			}
	 			
	 			for (int i= 0 ;i < judgmentQuestions.length;i++){
	 				Element judgmentQuestionElement  = judgmentQuestionsElement.addElement("judgmentQuestion");
	 				Element titleElement  = judgmentQuestionElement.addElement("title");
	 				titleElement.setText(judgmentQuestions[i].getTitle());
	 				
	 				
	 				Element studentAnswerElement  = judgmentQuestionElement.addElement("studentAnswer");
	 				studentAnswerElement.setText(judgmentQuestions[i].getStudentAnswer());
	 				
	 				Element scoreElement  = judgmentQuestionElement.addElement("score");
	 				scoreElement.setText(judgmentQuestions[i].getScore());
	 			}
	 			
	 			for (int i= 0 ;i < essayQuestions.length;i++){
	 				Element essayQuestionElement  = essayQuestionsElement.addElement("essayQuestion");
	 				Element titleElement  = essayQuestionElement.addElement("title");
	 				titleElement.setText(essayQuestions[i].getTitle());
	 				
	 				
	 				Element studentAnswerElement  = essayQuestionElement.addElement("studentAnswer");
	 				studentAnswerElement.setText(essayQuestions[i].getStudentAnswer());
	 				
	 				Element scoreElement  = essayQuestionElement.addElement("score");
	 				scoreElement.setText(essayQuestions[i].getScore());
	 			}
	 			for (int i= 0 ;i < multipleChoiceQuestions.length;i++){
	 				Element multipleQuestionElement  = multipleChoiceQuestionsElement.addElement("multipleChoiceQuestion");
	 				Element titleElement  = multipleQuestionElement.addElement("title");
	 				titleElement.setText(multipleChoiceQuestions[i].getTitle());
	 				
	 				String choices[] = multipleChoiceQuestions[i].getChoices();
	 				Element choicesElement  = multipleQuestionElement.addElement("choices");
	 				
	 				Element choiceAElement=choicesElement.addElement("choiceA");
	 				choiceAElement.setText(choices[0]);
	 				
	 				Element choiceBElement=choicesElement.addElement("choiceB");
	 				choiceBElement.setText(choices[1]);
	 				
	 				Element choiceCElement=choicesElement.addElement("choiceC");
	 				choiceCElement.setText(choices[2]);
	 				
	 				Element choiceDElement=choicesElement.addElement("choiceD");
	 				choiceDElement.setText(choices[3]);
	 				
	 				Element studentChoicesElement  = multipleQuestionElement.addElement("studentChoices");
	 				String studentChoices[] = multipleChoiceQuestions[i].getStudentChoices();
	 				for(int a = 0 ; a <studentChoices.length;a++){
	 					Element choiceElement = studentChoicesElement.addElement("choice");
	 					choiceElement.setText(studentChoices[a]);
	 				}
	 				
	 				Element scoreElement  = multipleQuestionElement.addElement("score");
	 				scoreElement.setText(multipleChoiceQuestions[i].getScore());
	 			}


				value=writeXML(document,file);
			}
			}catch(DocumentException ex){
				ex.printStackTrace();			
		}
		return value;
	}
 	
 	public  paperBean getPaperByID(String typename,String paperID){
 		paperBean paper=new paperBean();
		SAXReader reader=new SAXReader();
		Document document=null;
		String comments[]=null;
		String commentsStatus[] = null;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){
				document=reader.read(file);
				Node node=document.selectSingleNode("/papers/paper[paperID='"+paperID+"']");
				Element paperElement=(Element)node;
				paper.setPaperID(paperID);
				paper.setStudentID(paperElement.elementText("studentID"));
				paper.setTeacherID(paperElement.elementText("teacherID"));
				paper.setTestDate(paperElement.elementText("testDate"));
				paper.setTotalScore(paperElement.elementText("totalScore"));
				paper.setExamTime(paperElement.elementText("examTime"));
				paper.setUsedTime(paperElement.elementText("usedTime"));
				paper.setSubjectiveScore(paperElement.elementText("subjectiveScore"));
				paper.setObjectiveScore(paperElement.elementText("objectiveScore"));
				paper.setFinalScore(paperElement.elementText("finalScore"));
				
				singleChoiceQuestionOnPaper singleChoiceQuestions[];
		 		judgementQuestionOnPaper judgmentQuestions[];
		 		essayQuestionOnPaper essayQuestions[];
		 		multipleChoiceQuestionOnPaper multipleChoiceQuestions[];

		 		List singleChoices=document.selectNodes
		 				("/papers/paper[paperID='"+paperID+"']/content/singleChoiceQuestions/singleChoiceQuestion");
		 		
	 			Iterator iter=singleChoices.iterator();
	 			
	 			singleChoiceQuestions = new singleChoiceQuestionOnPaper[singleChoices.size()];
	 			
	 			int m = 0;
	 			while(iter.hasNext()){						

	 				Element singleChoiceElement=(Element) iter.next();
	 				singleChoiceQuestionOnPaper single = new singleChoiceQuestionOnPaper();
	 				single.setTitle(singleChoiceElement.elementText("title"));
	 				single.setStudentAnswer(singleChoiceElement.elementText("studentAnswer"));
	 				single.setScore(singleChoiceElement.elementText("score"));
	 				String s[] = new String[4];
	 				Element choicesElement  = singleChoiceElement.element("choices");
	 				
	 				s[0]=choicesElement.elementText("choiceA");
	 				s[1]=choicesElement.elementText("choiceB");
	 				s[2]=choicesElement.elementText("choiceC");
	 				s[3]=choicesElement.elementText("choiceD");
	 				
	 				single.setChoices(s);
	 				singleChoiceQuestions[m] = single;
	 				m++;

	 			}
	 			
	 			List judgments=document.selectNodes
	 					("/papers/paper[paperID='"+paperID+"']/content/judgmentQuestions/judgmentQuestion");
	 			iter=judgments.iterator();
	 		
	 			judgmentQuestions = new judgementQuestionOnPaper[judgments.size()];
	 			
	 			m = 0;
	 			while(iter.hasNext()){						

	 				Element judgmentElement=(Element) iter.next();
	 				judgementQuestionOnPaper jug = new judgementQuestionOnPaper();
	 				jug.setTitle(judgmentElement.elementText("title"));
	 				jug.setStudentAnswer(judgmentElement.elementText("studentAnswer"));
	 				jug.setScore(judgmentElement.elementText("score"));
	 				
	 				judgmentQuestions[m] = jug;
	 				m++;

	 			}
	 			
	 			List essays=document.selectNodes
	 					("/papers/paper[paperID='"+paperID+"']/content/essayQuestions/essayQuestion");
	 			
	 			iter=essays.iterator();
	 			
	 			essayQuestions = new essayQuestionOnPaper[essays.size() ];
	 			
	 			m = 0;
	 			while(iter.hasNext()){						

	 				Element essayQuestionElement=(Element) iter.next();
	 				essayQuestionOnPaper essay = new essayQuestionOnPaper();
	 				essay.setTitle(essayQuestionElement.elementText("title"));
	 				essay.setStudentAnswer(essayQuestionElement.elementText("studentAnswer"));
	 				essay.setScore(essayQuestionElement.elementText("score"));
	 				
	 				essayQuestions[m] = essay;
	 				m++;

	 			}
	 			

		 		List multipleChoices=document.selectNodes
		 				("/papers/paper[paperID='"+paperID+"']/content/multipleChoiceQuestions/multipleChoiceQuestion");
		 		
	 			iter=multipleChoices.iterator();
	 			
	 			multipleChoiceQuestions = new multipleChoiceQuestionOnPaper[multipleChoices.size()];
	 			
	 			m = 0;
	 			while(iter.hasNext()){						

	 				Element multipleChoiceElement=(Element) iter.next();
	 				multipleChoiceQuestionOnPaper multi = new multipleChoiceQuestionOnPaper();
	 				multi.setTitle(multipleChoiceElement.elementText("title"));
	 				multi.setScore(multipleChoiceElement.elementText("score"));
	 				String choices[] = new String[4];
	 				Element choicesElement  = multipleChoiceElement.element("choices");
	 				
	 				choices[0]=choicesElement.elementText("choiceA");
	 				choices[1]=choicesElement.elementText("choiceB");
	 				choices[2]=choicesElement.elementText("choiceC");
	 				choices[3]=choicesElement.elementText("choiceD");
	 				
	 				List answers=multipleChoiceElement.selectNodes
			 				("studentChoices/choice");
	 				Iterator answeriter=answers.iterator();
	 				String studentChoices[] = new String[answers.size()];
	 				int w = 0;
	 				while(answeriter.hasNext()){
	 					Element choiceElement=(Element) answeriter.next();
	 					studentChoices[w] = choiceElement.getText();
	 					w++;
	 				}
	 				
	 				multi.setStudentChoices(studentChoices);
	 				multi.setChoices(choices);
	 				multipleChoiceQuestions[m] = multi;
	 				m++;

	 			}
	 	 		
		 		paper.setSingleChoiceQuestions(singleChoiceQuestions);
		 		paper.setJudgmentQuestions(judgmentQuestions);
		 		paper.setEssayQuestions(essayQuestions);
				paper.setMultipleChoiceQuestions(multipleChoiceQuestions);
				
				
			}
		}catch(DocumentException ex){
			ex.printStackTrace();
		}
		
		return paper;
		
	}
 	
 	public  ArrayList<paperBean> getPapersByProperty(String[] typeNames ,String property
			,String value ,boolean isApproximate){
		ArrayList<paperBean> arrPaper = new ArrayList<paperBean>();
		SAXReader reader=new SAXReader();
		Document document=null;
		
		for (int i = 0; i < typeNames.length ;i++){
			String typename = typeNames[i];
			try{
				File file=new File(path+typename+".xml");
				if(file.exists()){
					document=reader.read(file);
						List list=document.selectNodes("/papers/paper");
						Iterator iter=list.iterator();
						while(iter.hasNext()){
							Element paperElement=(Element)iter.next();
						if(!isApproximate){
							if(paperElement.element(property).getText().equals(value)){
								String paperID = paperElement.element("paperID").getText();
								arrPaper.add(getPaperByID(typename,paperID));
							}
						}else{
							//近似查找
							if(paperElement.element(property).getText().indexOf(value) != -1){
								String paperID = paperElement.element("paperID").getText();
							
								arrPaper.add(getPaperByID(typename,paperID));
							}
						}		
						}
						
				}
			}catch(DocumentException ex){
				ex.printStackTrace();
			}
		}
		
		return arrPaper;
	}
 	
 	public  void main(String[] args){
//		creatXML("shy");
 		String choices[] ={"AW","WEEE","cds","D"};
 		String TorF[]={"T","F"};
 		essayQuestionOnPaper essay = new essayQuestionOnPaper();
 		essay.setTitle("essay");
 	
 		
 		judgementQuestionOnPaper jud = new judgementQuestionOnPaper();
 		jud.setTitle("jud");
 		
 		singleChoiceQuestionOnPaper single = new singleChoiceQuestionOnPaper();
 		single.setTitle("single");
 		single.setChoices(choices);
 		
 		multipleChoiceQuestionOnPaper mul = new  multipleChoiceQuestionOnPaper();
 		mul.setTitle("mul");
 		mul.setChoices(choices);
 		mul.setStudentChoices(choices);
 		
 		singleChoiceQuestionOnPaper singleChoiceQuestions[] = {single };
 		judgementQuestionOnPaper judgmentQuestions[] ={jud};
 		essayQuestionOnPaper essayQuestions[] ={essay};
 		multipleChoiceQuestionOnPaper multipleChoiceQuestions[] = {mul};
// 		addPaper("shy","studentID","teacherID","testDate","totalScore","examTime",
// 				"usedTime",singleChoiceQuestions,judgmentQuestions, essayQuestions,
// 				multipleChoiceQuestions,
// 			    "subjectiveScore","objectiveScore","String finalScore");

 		
// 		 updatePaper("shy","1","studentID","teacherID","testDate","totalScore","examTime",
//  				"usedTime",singleChoiceQuestions,judgmentQuestions, essayQuestions,multipleChoiceQuestions,
//  			    "subjectiveScore","objectiveScore","String finalScore");

// 		String arr[] = {"shy"};
//		System.out.println(getPapersByProperty(arr,"studentID","2",true).get(0).getPaperID());
//		deleteNews("shy.xml","1");	
		System.out.print(getPaperByID("shy","1").getMultipleChoiceQuestions()[0].getStudentChoices()[1]);
	}

}
