package Logic;
import java.sql.*;
import java.util.ArrayList;

import DB.DBHelper;
import XML.examinationBean;
import XML.examArrangementXmlHelper;

public class getExam {
	public static ArrayList<examinationBean> get(String type, String id, String time, String hasRole, String isScored) throws Exception{
		ArrayList<examinationBean> arrExam = new ArrayList<examinationBean>();
		String sql = null;
		if(type.equals("student")){
			sql="SELECT courseID FROM sc where studentID='"+id+"'";
		}
		else{
			sql="SELECT courseID FROM tc where teacherID='"+id+"'";
		}
		DBHelper.getConnection();
		ResultSet rs = DBHelper.Query(sql);
		examArrangementXmlHelper examHelper = new examArrangementXmlHelper();	
		while(rs.next()){
	         String courseID = rs.getString("courseID");
	         arrExam.addAll(examHelper.getExaminationsByProperty(new String[]{"exam"}, "courseID",courseID, false));
	    }
		long currentTime = System.currentTimeMillis()/1000;
		ArrayList<examinationBean> edExam = new ArrayList<examinationBean>();
		ArrayList<examinationBean> ingExam = new ArrayList<examinationBean>();
		ArrayList<examinationBean> beExam = new ArrayList<examinationBean>();
		ArrayList<examinationBean> returnExam = new ArrayList<examinationBean>();
		if (isScored.equals("0")){
			if(hasRole.equals("0")){
				for(int i=0;i<arrExam.size();i++){
					if(arrExam.get(i).getIsScored().equals("-1") && arrExam.get(i).getRuleID().equals("-1")){
						if(Long.parseLong(arrExam.get(i).getDateEnd())<currentTime){
							edExam.add(arrExam.get(i));
						}
						else if(Long.parseLong(arrExam.get(i).getDateBegin())>currentTime){
							beExam.add(arrExam.get(i));
						}
						else{
							ingExam.add(arrExam.get(i));
						}
					}
				}
			}
			else {
				for(int i=0;i<arrExam.size();i++){
					if(arrExam.get(i).getIsScored().equals("-1") && !arrExam.get(i).getRuleID().equals("-1")){
						if(Long.parseLong(arrExam.get(i).getDateEnd())<currentTime){
							edExam.add(arrExam.get(i));
						}
						else if(Long.parseLong(arrExam.get(i).getDateBegin())>currentTime){
							beExam.add(arrExam.get(i));
						}
						else{
							ingExam.add(arrExam.get(i));
						}
					}
				}
			}
		}
		else{
			if(hasRole.equals("0")){
				for(int i=0;i<arrExam.size();i++){
					if(!arrExam.get(i).getIsScored().equals("-1") && arrExam.get(i).getRuleID().equals("-1")){
						if(Long.parseLong(arrExam.get(i).getDateEnd())<currentTime){
							edExam.add(arrExam.get(i));
						}
						else if(Long.parseLong(arrExam.get(i).getDateBegin())>currentTime){
							beExam.add(arrExam.get(i));
						}
						else{
							ingExam.add(arrExam.get(i));
						}
					}
				}
			}
			else {
				for(int i=0;i<arrExam.size();i++){
					if(!arrExam.get(i).getIsScored().equals("-1") && !arrExam.get(i).getRuleID().equals("-1")){
						if(Long.parseLong(arrExam.get(i).getDateEnd())<currentTime){
							edExam.add(arrExam.get(i));
						}
						else if(Long.parseLong(arrExam.get(i).getDateBegin())>currentTime){
							beExam.add(arrExam.get(i));
						}
						else{
							ingExam.add(arrExam.get(i));
						}
					}
				}
			}
		}
		if (time.equals("ed")){
			returnExam = edExam;
		}
		else if(time.equals("ing")){
			returnExam = ingExam;
		}
		else if(time.equals("be")){
			returnExam = beExam;
		}
		return returnExam;
	}
}
