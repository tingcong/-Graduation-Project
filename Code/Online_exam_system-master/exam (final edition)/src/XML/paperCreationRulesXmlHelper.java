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

public class paperCreationRulesXmlHelper {
	public  String path=staticVariable.path;
	
	public  void creatXML(String typename){
		Document document=DocumentHelper.createDocument();
		document.addElement("paperCreationRules");
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
	
	public  String addRule(String typename,String totalScore,
			String examTime,String difficulty, String numberOfSingleChoice,String perScoreOfSingleChoice,
			String numberOfJudgment,String perScoreOfJudgment,
			String numberOfEssay,String perScoreOfEssay,
			String numberOfMultiply,String perScoreOfMultiply){
		String ID ="";
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
			Element ruleElement=rootElement.addElement("rule");
			
			int ruleid;
			List rules=document.selectNodes("/paperCreationRules/rule");
			ruleid = rules.size();
			
			String ruleID = String.valueOf(ruleid);
			ID = ruleID;
			Element ruleIDElement = ruleElement.addElement("ruleID");
			ruleIDElement.setText(ruleID);
		
			Element totalScoreElement=ruleElement.addElement("totalScore");
			totalScoreElement.setText(totalScore);
			
			Element examTimeElement=ruleElement.addElement("examTime");
			examTimeElement.setText(examTime);
			
			Element difficultyElement=ruleElement.addElement("difficulty");
			difficultyElement.setText(difficulty);
			
			Element contentElement=ruleElement.addElement("content");
			
			Element singleChoiceQuestionElement = contentElement.addElement("singleChoiceQuestion");
			Element judgmentQuestionElement = contentElement.addElement("judgmentQuestion");
			Element essayQuestionElement = contentElement.addElement("essayQuestion");
			Element multiplyQuestionElement = contentElement.addElement("multipleChoiceQuestion");
			
			
			//插入规则
			Element numberOfSingleChoiceElement=singleChoiceQuestionElement.addElement("number");
			numberOfSingleChoiceElement.setText(numberOfSingleChoice);
			
			Element perScoreOfSingleChoiceElement=singleChoiceQuestionElement.addElement("perQuestionScore");
			perScoreOfSingleChoiceElement.setText(perScoreOfSingleChoice);
			
			
			Element numberOfJudgmentElement=judgmentQuestionElement.addElement("number");
			numberOfJudgmentElement.setText(numberOfJudgment);
			
			Element perScoreOfJudgmentElement=judgmentQuestionElement.addElement("perQuestionScore");
			perScoreOfJudgmentElement.setText(perScoreOfJudgment);
			
			Element numberOfEssayElement=essayQuestionElement.addElement("number");
			numberOfEssayElement.setText(numberOfEssay);
			
			Element perScoreOfEssayElement=essayQuestionElement.addElement("perQuestionScore");
			perScoreOfEssayElement.setText(perScoreOfEssay);
			
			
			
			Element numberOfMultiplyElement=multiplyQuestionElement.addElement("number");
			numberOfMultiplyElement.setText(numberOfMultiply);
			
			Element perScoreOfMultiplyElement=multiplyQuestionElement.addElement("perQuestionScore");
			perScoreOfMultiplyElement.setText(perScoreOfMultiply);
			
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		writeXML(document,file);
		
		return ID;
		
	}

	
	public  int updateRule(String typename,String ruleID,String totalScore,
			String examTime, String difficulty,String numberOfSingleChoice,String perScoreOfSingleChoice,
			String numberOfJudgment,String perScoreOfJudgment,
			String numberOfEssay,String perScoreOfEssay,String numberOfMultiply,String perScoreOfMultiply){
		int value=0;
		SAXReader reader=new SAXReader();
		Document document;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){
				document=reader.read(file);
				Node node=document.selectSingleNode("/paperCreationRules/rule[ruleID= '"+ruleID+"']");
				Element ruleElement=(Element)node;
				
				ruleElement.element("totalScore").setText(totalScore);
				ruleElement.element("examTime").setText(examTime);
				ruleElement.element("difficulty").setText(difficulty);
				
				Element contentElement = ruleElement.element("content");
				contentElement.element("singleChoiceQuestion").element("number").setText(numberOfSingleChoice);
				contentElement.element("singleChoiceQuestion").element("perQuestionScore").setText(perScoreOfSingleChoice);
				contentElement.element("judgmentQuestion").element("number").setText(numberOfJudgment);
				contentElement.element("judgmentQuestion").element("perQuestionScore").setText(perScoreOfJudgment);
				contentElement.element("essayQuestion").element("number").setText(numberOfEssay);
				contentElement.element("essayQuestion").element("perQuestionScore").setText(perScoreOfEssay);
				contentElement.element("multipleChoiceQuestion").element("number").setText(numberOfMultiply);
				contentElement.element("multipleChoiceQuestion").element("perQuestionScore").setText(perScoreOfMultiply);

				value=writeXML(document,file);
			}
			}catch(DocumentException ex){
				ex.printStackTrace();			
		}
		return value;
	}

	public  paperRuleBean getRuleByID(String typename,String ruleID){
		paperRuleBean rule=new paperRuleBean();
		SAXReader reader=new SAXReader();
		Document document=null;
		String comments[]=null;
		String commentsStatus[] = null;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){
				document=reader.read(file);
				Node node=document.selectSingleNode("/paperCreationRules/rule[ruleID= '"+ruleID+"']");
				Element ruleElement=(Element)node;
				rule.setExamTime(ruleElement.elementText("examTime"));
				rule.setTotalScore(ruleElement.elementText("totalScore"));
				rule.setRuleID(ruleElement.elementText("ruleID"));
				rule.setDifficulty(ruleElement.elementText("difficulty"));
				
				Element contentElement = ruleElement.element("content");
				rule.setPerScoreOfEssay(contentElement.element("essayQuestion").elementText("perQuestionScore"));
				rule.setNumberOfEssay(contentElement.element("essayQuestion").elementText("number"));
				
				rule.setPerScoreOfSingleChoice(contentElement.element("singleChoiceQuestion").elementText("perQuestionScore"));
				rule.setNumberOfSingleChoice(contentElement.element("singleChoiceQuestion").elementText("number"));
				
				rule.setNumberOfJudgment(contentElement.element("judgmentQuestion").elementText("number"));
				rule.setPerScoreOfJudgment(contentElement.element("judgmentQuestion").elementText("perQuestionScore"));
				
				rule.setNumberOfJudgment(contentElement.element("multipleChoiceQuestion").elementText("number"));
				rule.setPerScoreOfMultiply(contentElement.element("multipleChoiceQuestion").elementText("perQuestionScore"));
				
				
				
				
			}
		}catch(DocumentException ex){
			ex.printStackTrace();
		}
		
		return rule;
		
	}
	
	
	public  void main(String[] args){
//		creatXML("shy");
////	
//		updateNews("shy","2","wu",
//				"4", "ss","ss");
//		updateRule("shy","1","500","3600","C","5","6","10","2","10","2","10","2");
//		deleteRule("shy","1");
//		addRule("shy","500","3600","A","10","2","10","2","10","2","10","2");
//		String arr[] = {"SHY"};
//		System.out.println(getRuleByID("shy","1").getDifficulty());
//		deleteNews("shy.xml","1");	
//		System.out.print(getExaminationByID("SHY","1").getCourseID());
	}
}
		

