package XML;

import java.io.*;
import java.util.*;
import org.dom4j.*;
import org.dom4j.io.*;
import org.dom4j.io.OutputFormat;

import org.dom4j.io.SAXReader;

import org.dom4j.io.SAXValidator;

import org.dom4j.io.XMLWriter;

import org.dom4j.util.XMLErrorHandler;

import Logic.staticVariable;

import javax.xml.parsers.SAXParser;

import javax.xml.parsers.SAXParserFactory;

import java.io.File;

public class examArrangementXmlHelper {
	
	public  String path=staticVariable.path;
		
		public  void creatXML(String typename){
			Document document=DocumentHelper.createDocument();
			document.addElement("examinations");
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
		
		public  int addExamination(String typename,String ruleID,String examinationName,
				String courseID,String teacherID ,String dateBegin,String dateEnd ,String isScored){
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
				Element examinationElement=rootElement.addElement("examination");
				
				int examinationid;
				List examinations=document.selectNodes("/examinations/examination");
				examinationid = examinations.size();
				String examinationID = String.valueOf(examinationid);
				Element examinationIDElement = examinationElement.addElement("examinationID");
				examinationIDElement.setText(examinationID);
			
				
				
				Element coureseIDElement=examinationElement.addElement("courseID");
				coureseIDElement.setText(courseID);
				
				
				Element teacherIDElement=examinationElement.addElement("teacherID");
				teacherIDElement.setText(teacherID);
				
				
				Element ruleIDElement=examinationElement.addElement("ruleID");
				ruleIDElement.setText(ruleID);
				
				Element examinationNameElement=examinationElement.addElement("examinationName");
				examinationNameElement.setText(examinationName);
				
				Element dateBeginElement=examinationElement.addElement("dateBegin");
				dateBeginElement.setText(dateBegin);
				
				Element dateEndElement=examinationElement.addElement("dateEnd");
				dateEndElement.setText(dateEnd);
				
				Element isScoredElement=examinationElement.addElement("isScored");
				isScoredElement.setText(isScored);
				
				
			}catch(Exception ex){
				ex.printStackTrace();
			}
			
			value=writeXML(document,file);
			
			return value;
			
		}	
		
		public  int updateExamination(String typename,String examinationID,String ruleID,
				String examinationName,String courseID, String teacherID,String dateBegin,String dateEnd,String isScored){
			int value=0;
			SAXReader reader=new SAXReader();
			Document document;
			try{
				File file=new File(path+typename+".xml");
				if(file.exists()){
					document=reader.read(file);
					Node node=document.selectSingleNode("/examinations/examination[examinationID='"+examinationID+"']");
					Element examinationElement=(Element)node;
					examinationElement.element("ruleID").setText(ruleID);
					examinationElement.element("examinationName").setText(examinationName);
					examinationElement.element("courseID").setText(courseID);
					examinationElement.element("teacherID").setText(teacherID);
					examinationElement.element("dateBegin").setText(dateBegin);
					examinationElement.element("dateEnd").setText(dateEnd);
					examinationElement.element("isScored").setText(isScored);

					value=writeXML(document,file);
				}
				}catch(DocumentException ex){
					ex.printStackTrace();			
			}
			return value;
		}

		public  examinationBean getExaminationByID(String typename,String examinationID){
			examinationBean examination=new examinationBean();
			SAXReader reader=new SAXReader();
			Document document=null;
			String comments[]=null;
			String commentsStatus[] = null;
			try{
				File file=new File(path+typename+".xml");
				if(file.exists()){
					document=reader.read(file);
					Node node=document.selectSingleNode("/examinations/examination"
							+ "[examinationID='"+examinationID+"']");
					Element examinationElement=(Element)node;
					examination.setRuleID(examinationElement.elementText("ruleID"));
					examination.setCourseID(examinationElement.elementText("courseID"));
					examination.setDateBegin(examinationElement.elementText("dateBegin"));
					examination.setDateEnd(examinationElement.elementText("dateEnd"));
					examination.setTeacherID(examinationElement.elementText("teacherID"));
					examination.setExaminationID(examinationElement.elementText("examinationID"));
					examination.setExaminationName(examinationElement.elementText("examinationName"));
					examination.setIsScored(examinationElement.elementText("isScored"));
					
				}
			}catch(DocumentException ex){
				ex.printStackTrace();
			}
			
			return examination;
			
		}
		
		public  ArrayList<examinationBean> getExaminationsByProperty(String[] typeNames ,String property
				,String value ,boolean isApproximate){
			ArrayList<examinationBean> arreExamination = new ArrayList<examinationBean>();
			SAXReader reader=new SAXReader();
			Document document=null;
			
			for (int i = 0; i < typeNames.length ;i++){
				String typename = typeNames[i];
				try{
					File file=new File(path+typename+".xml");
					if(file.exists()){
						document=reader.read(file);
						
							List list=document.selectNodes("/examinations/examination");
							Iterator iter=list.iterator();
							while(iter.hasNext()){
								Element examinationElement=(Element)iter.next();
							if(!isApproximate){
								if(examinationElement.element(property).getText().equals(value)){
									String examinationID = examinationElement.element("examinationID").getText();
									arreExamination.add(getExaminationByID(typename,examinationID));
								}
							}else{
								//近似查找
								if(examinationElement.element(property).getText().indexOf(value) != -1){
									String examinationID = examinationElement.element("examinationID").getText();
									arreExamination.add(getExaminationByID(typename,examinationID));
								}
							}		
							}
							
					}
				}catch(DocumentException ex){
					ex.printStackTrace();
				}
			}
			
			return arreExamination;
		}
		
		public  void main(String[] args){
//			creatXML("shy");
////		
//			updateNews("shy","2","wu",
//					"4", "ss","ss");
//			deleteExamination("shy","1");
			updateExamination("shy","1","15","18","s","233", "4455555","0","sds");
//			addExamination("shy","15","18","s","4455555", "4455555","0","sds");
//			String arr[] = {"SHY"};
//			System.out.println(getExaminationsByProperty(arr,"courseID","2",true).get(0).getExaminationID());
//			deleteNews("shy.xml","1");	
//			System.out.print(getExaminationByID("SHY","1").getCourseID());
		}
}

