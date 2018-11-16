package com.kh.board.gallery.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.kh.board.attachedfile.model.vo.AttachedFile;
import com.kh.board.gallery.model.service.GalleryService;
import com.kh.board.gallery.model.vo.Gallery;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class GalleryInsertServler
 */
@WebServlet("/gInsert.ga")
public class GalleryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GalleryInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GalleryService gs = new GalleryService();
		
		if(ServletFileUpload.isMultipartContent(request)){
			// 만약 multipart/form-data 로 전송이 되었다면 실행해라!
			
			System.out.println("서블릿 들어왔니?");
			
			// 전송할 파일의 용량 선정
			int maxSize = 1024 * 1024 * 10;
			
			// 저장할 경로 설정하기
			String root = request.getServletContext().getRealPath("/resources");
			
			System.out.println("root 경로 확인 : " + root);
			
			String savePath = root + "/uploadFiles/";
			
			// 사용자가 저장하는 파일을 서버의 형식에 맞게
			// 이름을 변경하여 설정하기
			// ex) kakaoTalk_20181029_00000.jpg
			
			// DefaultFileRenamePolicy 의 경우 같은 파일이 이미 존재하는 지 검사한 후에
			// 만약 존재한다면 파일명 뒤에 숫자를 붙여서 이름을 변경한다.
			// abc.zip --> abc1.zip ---> abc2.zip
			
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
			// Gallery 객체 생성 후 DB 전달 VO 설정하기
			/////
			Gallery g = new Gallery();
			
			System.out.println("userId : " + mrequest.getParameter("userId"));
			
			g.setBtype(2);
			g.setBtitle(mrequest.getParameter("title"));
			g.setBcontent(mrequest.getParameter("content"));
			g.setBwriter(Integer.parseInt(mrequest.getParameter("userId")));
			g.setGcategoryid(Integer.parseInt(mrequest.getParameter("category")));
			g.setCclid(Integer.parseInt(mrequest.getParameter("cclid")));
			g.setGtag(mrequest.getParameter("tags"));
			
			System.out.println("setBcontent : " + mrequest.getParameter("content"));
			System.out.println("tags : " + mrequest.getParameter("tags"));
			
			// Attachment에 기록하기 위한 파일 리스트 처리하기
			ArrayList<AttachedFile> list = new ArrayList<AttachedFile>();
			
			if(!(list.isEmpty())){
				for(int i = saveFiles.size()-1 ; i >= 0 ; i--){
						// 기존에 역순으로 저장된 파일 리스트를 올바른 순서로 재정렬하기
						AttachedFile af = new AttachedFile();
						
						af.setFpath(savePath);
						af.setFname(saveFiles.get(i));
						
						System.out.println("af : " + af);
						list.add(af);
				} 
			} else {
				AttachedFile af = new AttachedFile();
				
				af.setFpath(root + "/images/");
				
				switch(g.getGcategoryid()){
				case 1: af.setFname("textCategoryImage.png"); break;
				case 3: af.setFname("audioCategoryImage.png"); break;
				case 4: af.setFname("videoCategoryImage.png"); break;								
				}
	
				System.out.println("af : " + af);
				list.add(af);
			}
			
			
			System.out.println("list : " + list);
			// service로 작성한 내용 전송하기
			
			int result = gs.insertGallery(g, list);
			
			if(result > 0) {
				response.sendRedirect("gSelectOne.ga?bid="+result);
				
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
