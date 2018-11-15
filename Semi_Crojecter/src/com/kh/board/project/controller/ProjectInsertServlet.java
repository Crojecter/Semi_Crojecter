package com.kh.board.project.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.attachedfile.model.vo.AttachedFile;
import com.kh.board.project.model.service.ProjectService;
import com.kh.board.project.model.vo.Project;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ProjectSelectOneServlet
 */
@WebServlet("/pInsert.pr")
public class ProjectInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProjectService ps = new ProjectService();
		
		if(ServletFileUpload.isMultipartContent(request)){
			// 만약 multipart/form-data 로 전송이 되었다면 실행해라!
			
			System.out.println("서블릿 들어왔니?");
			
			// 전송할 파일의 용량 선정
			int maxSize = 1024 * 1024 * 10;
			
			// 저장할 경로 설정하기
			String root = request.getServletContext().getRealPath("/resources");
			
			System.out.println("root 경로 확인 : " + root);
			
			String savePath = root + "/uploadFiles/";
			
			MultipartRequest mrequest =
					new MultipartRequest(request, 
										 savePath,
										 maxSize,
										 "UTF-8",
										 new DefaultFileRenamePolicy()
							);
			
			// 폼으로 전송된 파일 이름들을 받아온다.
			Enumeration<String> files = mrequest.getFileNames();
			
			ArrayList<String> saveFiles = new ArrayList<String>();
		
			
			while(files.hasMoreElements()){
				// 각 파일의 정보를 가져와서 DB에 저장할 내용을 추출한다.
				String name = files.nextElement();
				String fileName = mrequest.getFilesystemName(name);  
				
				System.out.println("name : " + fileName);
				
				saveFiles.add(fileName);				
			}						
			
			System.out.println("savefiles : " + saveFiles);
			// Project 객체 생성 후 DB 전달 VO 설정하기

			Project p = new Project();
			
			System.out.println("userId : " + mrequest.getParameter("userId"));
			
			p.setBtype(3);
			p.setBtitle(mrequest.getParameter("title"));
			p.setBcontent(mrequest.getParameter("content"));
			p.setBwriter(Integer.parseInt(mrequest.getParameter("userId")));
			 
		    String endDate = mrequest.getParameter("date");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    Date jend;
			try {
				jend = new Date(sdf.parse(endDate).getTime());
				p.setJend(jend);
			} catch (ParseException e) {
				e.printStackTrace();
			}	    
			
			
			p.setJtag(mrequest.getParameter("tags"));
			
			System.out.println("setBcontent : " + mrequest.getParameter("content"));
			System.out.println("tags : " + mrequest.getParameter("tags"));
			
			// Attachment에 기록하기 위한 파일 리스트 처리하기
			ArrayList<AttachedFile> list = new ArrayList<AttachedFile>();
			

			for(int i = saveFiles.size()-1 ; i >= 0 ; i--){
				// 기존에 역순으로 저장된 파일 리스트를 올바른 순서로 재정렬하기
				AttachedFile af = new AttachedFile();
						
				af.setFpath(savePath);
				af.setFname(saveFiles.get(i));
						
				System.out.println("af : " + af);
				list.add(af);
			} 
			
			
			System.out.println("list : " + list);
			// service로 작성한 내용 전송하기
			
			int result = ps.insertProject(p, list);
			
			if(result > 0) {
				response.sendRedirect("selectList.ga");
				
			} else {
				request.setAttribute("msg", "파일 전송 실패!");
				
				// 실패했을 때 이전 파일 정보 삭제하기
				for(int i = 0; i < saveFiles.size() ; i++){
					File file = new File(savePath+saveFiles.get(i));
					
					System.out.println(i+"번 파일 삭제 : " + file.delete());
				}
				
				request.getRequestDispatcher("views/common/errorPage.jsp")
				.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
