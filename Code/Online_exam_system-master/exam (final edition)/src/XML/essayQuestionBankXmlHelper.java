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

public class essayQuestionBankXmlHelper {
	public  String path=staticVariable.path;
	
	public  void creatXML(String typename){
		Document document=DocumentHelper.createDocument();
		document.addElement("essayQuestions");
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
	
	public  int addQuestion(String typename,String title,
			String referenceAnswer ){
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
			
			
			int questionid = 1;
			List questions=document.selectNodes("/essayQuestions/question");
			Iterator iter=questions.iterator();
			
			while(iter.hasNext()){						

				Element maxElement=(Element) iter.next();
				questionid = Integer.parseInt(maxElement.element("questionID").getText(), 10) + 1; 
			}
			
			Element questionElement=rootElement.addElement("question");
			String questionID = String.valueOf(questionid);
			Element questionIDElement = questionElement.addElement("questionID");
			questionIDElement.setText(questionID);
			
			Element titleElement=questionElement.addElement("title");
			titleElement.setText(title);
			
			Element referenceAnswerElement  = questionElement.addElement("referenceAnswer");
			referenceAnswerElement.setText(referenceAnswer);

			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		value=writeXML(document,file);
		
		return value;
		
	}
	
	public  void deleteQuestion(String typename,String questionID){
	SAXReader reader=new SAXReader();
	Document document;
	try{
		File file=new File(path+typename+".xml");
		if(file.exists()){
		document=reader.read(file);
		Node node=document.selectSingleNode("/essayQuestions/question[questionID='"+questionID+"']");
		Element questionElement=(Element)node;

		questionElement.getParent().remove(questionElement);
		
		writeXML(document,file);
		}
	}catch(DocumentException ex){
		ex.printStackTrace();
	}
}
	
	public  int updateQuestion(String typename,String questionID,String title,
			String referenceAnswer){
		int value=0;
		SAXReader reader=new SAXReader();
		Document document;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){
				document=reader.read(file);
				Node node=document.selectSingleNode("/essayQuestions/question[questionID='"+questionID+"']");
				Element questionElement=(Element)node;
				questionElement.element("title").setText(title);
				questionElement.element("referenceAnswer").setText(referenceAnswer);

				value=writeXML(document,file);
			}
			}catch(DocumentException ex){
				ex.printStackTrace();			
		}
		return value;
	}

	public  essayQuestionOnBank getQuestionByID(String typename,String questionID){
		essayQuestionOnBank question=new essayQuestionOnBank();
		SAXReader reader=new SAXReader();
		Document document=null;
		String comments[]=null;
		String commentsStatus[] = null;
		try{
			File file=new File(path+typename+".xml");
			if(file.exists()){
				document=reader.read(file);
				Node node=document.selectSingleNode("/essayQuestions/question[questionID='"+questionID+"']");
				Element questionElement=(Element)node;
				question.setQuestionID(questionElement.elementText("questionID"));
				question.setTitle(questionElement.elementText("title"));
				question.setReferenceAnswer(questionElement.elementText("referenceAnswer"));
				
				
			}
		}catch(DocumentException ex){
			ex.printStackTrace();
		}
		
		return question;
		
	}
	
	public  ArrayList<essayQuestionOnBank> getQuestionsByProperty(String[] typeNames ,String property
			,String value ,boolean isApproximate){
		ArrayList<essayQuestionOnBank> arrQuestion = new ArrayList<essayQuestionOnBank>();
		SAXReader reader=new SAXReader();
		Document document=null;
		
		for (int i = 0; i < typeNames.length ;i++){
			String typename = typeNames[i];
			try{
				File file=new File(path+typename+".xml");
				if(file.exists()){
					document=reader.read(file);
						List list=document.selectNodes("/essayQuestions/question");
						Iterator iter=list.iterator();
						while(iter.hasNext()){
							Element questionElement=(Element)iter.next();
						if(!isApproximate){
							if(questionElement.element(property).getText().equals(value)){
								String questionID = questionElement.element("questionID").getText();
								arrQuestion.add(getQuestionByID(typename,questionID));
							}
						}else{
							//近似查找
							if(questionElement.element(property).getText().indexOf(value) != -1){
								String questionID = questionElement.element("questionID").getText();
							
								arrQuestion.add(getQuestionByID(typename,questionID));
							}
						}		
						}
						
				}
			}catch(DocumentException ex){
				ex.printStackTrace();
			}
		}
		
		return arrQuestion;
	}
	
	public  int count(String typename){
		int value = 0;
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
			
			
			int questionid = 1;
			List questions=document.selectNodes("/essayQuestions/question");
			Iterator iter=questions.iterator();
			
			value = questions.size();
		}catch(DocumentException ex){
			ex.printStackTrace();
		}
		return value;
	}
	
	public  void main(String[] args){
//		creatXML("shy");
////	

//		updateQuestion("shy","2","wu",
//				"ss");
//		deleteQuestion("shy","1");
//
//		addQuestion("shy","wsadas", "A");
//		String arr[] = {"shy"};
//		System.out.println(getQuestionsByProperty(arr,"title","w",true).get(0).getQuestionID());
//		deleteNews("shy.xml","1");	
//		System.out.print(getQuestionByID("SHY","2").getTitle());
		System.out.println(count("shy"));
	}
}
