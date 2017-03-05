package com.questionario;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(description = "A server for audio questionnaires", urlPatterns = { "/Server" })
public class Server extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ANSWER_PATH = System.getProperty("user.dir");
    private HashMap<String, List<String>> Answers = null;
    private HashSet<String> Keys = null;
    
	public Server() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		System.out.println("Setting Hashmap");
		this.Answers = new HashMap<String, List<String>>();
		this.Keys = new HashSet<String>();
	}
	
	public void destroy() {
		mapToFile(ANSWER_PATH);
	}
	
	public String getUniqueKey(){
		return UUID.randomUUID().toString();
	}
	
	public File mapToFile(String PathToFile){
		String path = PathToFile;
		File f = new File(path);
		DateFormat dateFormat = new SimpleDateFormat("MM-dd HH-mm-ss");
		Date date = new Date();
		if(f.isDirectory()){
			f = new File(path+"resultados "+dateFormat.format(date)+".txt");
		}
		try {
			f.createNewFile();
			PrintWriter pw = new PrintWriter(f);
			List<String> ls = new ArrayList<String>();
		
			for(String s: this.Keys){
				if(this.Answers.containsKey(s)){
					pw.println("User with key: " + s);
					ls=this.Answers.get(s);
					for(Iterator<String> i = ls.iterator(); i.hasNext(); ) {
						  String item = i.next();
						  pw.println(item);
					}
					pw.println("/===================================/");
				}
			}
			pw.close();
			System.out.println(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Create = request.getParameter("Create");
		String QuestionNumber = request.getParameter("QN");
		String CurrentKey = request.getParameter("Key");
		String CurrentType = request.getParameter("Type");
		boolean flag = false;
		
		if(CurrentType == null){
			return;
		}
		
		if(Create != null){
		Create = Create.toLowerCase();
		flag = Boolean.valueOf(Create);
			if(flag){
				String Type = request.getParameter("Type");
				if(Type != null){
					if(Type.equals("ca") || Type.equals("ha")||Type.equals("es")||Type.equals("co")){
						CurrentKey = getUniqueKey() + "type-"+Type;
						this.Keys.add(CurrentKey);
						request.setAttribute("Key", CurrentKey);
						request.setAttribute("Type", Type);
						request.getRequestDispatcher("/qDiagnostico.jsp").forward(request, response);
						return;
					}
				}
				response.getWriter().append("ERROR: Type unidentified").append(request.getContextPath());
				return;
			}
			else{
				response.getWriter().append("ERROR: String \"create\" called but used in wrong context").append(request.getContextPath());
				return;
			}
		}
		
		if(QuestionNumber != null){
			try{
				int qn = Integer.parseInt(QuestionNumber);
				if(qn > 0 && qn < 6){
					if(CurrentKey == null){
						response.getWriter().append("ERROR: User not identified").append(request.getContextPath());
						return;
					}
					else if(! Keys.contains(CurrentKey)){
						response.getWriter().append("ERROR: User not identified").append(request.getContextPath());
						return;
					}
					else{
						String AnswerValue = request.getParameter("AV");
						List<String> ls = this.Answers.get(CurrentKey);
						if(ls == null)
							ls = new ArrayList<String>();
						
						ls.add("QuestionNumberFromType"+CurrentType+"= "+qn+System.lineSeparator()+"Answer= " +AnswerValue);
						
						this.Answers.put(CurrentKey, ls);
						if(qn < 5){
							request.setAttribute("Type", CurrentType);
							request.setAttribute("QN", Integer.toString(qn+1));
							request.setAttribute("Key", CurrentKey);
							request.getRequestDispatcher("/startQuestionnaire.jsp").forward(request, response);
						}
						else{
							request.getRequestDispatcher("/Thanks.html").forward(request, response);
						}
						return;
					}
				}
			}
			catch(Exception e){
				e.printStackTrace();
				response.getWriter().append("ERROR: String \"QuestionNumber\" called but used in wrong context").append(request.getContextPath());
			}
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String CurrentKey = request.getParameter("Key");
		String CurrentType = request.getParameter("Type");
		if(CurrentKey == null || CurrentType == null){
			return;
		}
		if(! this.Keys.contains(CurrentKey)){
			return;
		}
		List<String> ls = new ArrayList<String>();
		ls.add("Name="+request.getParameter("Name"));
		ls.add("Age="+request.getParameter("Age"));
		ls.add("Gender="+request.getParameter("Gender"));
		ls.add("HearingProblems="+request.getParameter("HearingProblems"));
		ls.add("ListeningFrequency="+request.getParameter("ListeningFrequency"));
		ls.add("InstrumentPlayed="+request.getParameter("InstrumentPlayed"));
		ls.add("SingReason="+request.getParameter("SingReason"));
		ls.add("SongA="+request.getParameter("SongA"));
		ls.add("SongB="+request.getParameter("SongB"));
		ls.add("SongC="+request.getParameter("SongC"));
		ls.add("StudyMusic="+request.getParameter("StudyMusic"));
		ls.add("LikesReading="+request.getParameter("LikesReading"));
		ls.add("Exercises="+request.getParameter("Exercises"));
		ls.add("TimeAwake="+request.getParameter("TimeAwake"));
		ls.add("TimeAsleep="+request.getParameter("TimeAsleep"));
		ls.add("NoisyPlace="+request.getParameter("NoisyPlace"));
		ls.add("Medicine="+request.getParameter("Medicine"));
		ls.add("LikesStudying="+request.getParameter("LikesStudying"));
		ls.add("CurrentState="+request.getParameter("CurrentState"));
		ls.add("ExamNervousness="+request.getParameter("ExamNervousness"));
		ls.add("EasilyBored="+request.getParameter("EasilyBored"));
		ls.add("RegularState="+request.getParameter("RegularState"));
		System.out.println(ls);
		this.Answers.put(CurrentKey, ls);
		request.setAttribute("Type", CurrentType);
		request.setAttribute("QN", Integer.toString(1));
		request.setAttribute("Key", CurrentKey);
		request.getRequestDispatcher("/startQuestionnaire.jsp").forward(request, response);
		
	}
	
}
