package com.kh.board.gallery.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.attachedfile.model.vo.AttachedFile;
import com.kh.board.gallery.model.service.GalleryService;
import com.kh.board.gallery.model.vo.Gallery;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class GalleryUpdateServlet
 */
@WebServlet("/gUpdate.ga")
public class GalleryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GalleryUpdateServlet() {
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
			
			MultipartRequest mrequest =
					new MultipartRequest(request, 
										 savePath,
										 maxSize,
										 "UTF-8",
										 new DefaultFileRenamePolicy()
							);
			
			// 폼으로 전송된 파일 이름들을 받아온다.
			
			int bid = Integer.parseInt(mrequest.getParameter("bid"));
			HashMap<String, Object> gal = gs.selectGalleryMap(bid);
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			Enumeration<String> files = mrequest.getFileNames();
			
			while(files.hasMoreElements()){
				// 각 파일의 정보를 가져와서 DB에 저장할 내용을 추출한다.
				String name = files.nextElement();
				String fileName = mrequest.getFilesystemName(name);  
				
				System.out.println("name : " + fileName);
				
				saveFiles.add(fileName);				
			}						
			
			System.out.println("savefiles : " + saveFiles);
			// Gallery 객체 생성 후 DB 전달 VO 설정하기

			Gallery g = (Gallery)gal.get("gallery");

			g.setBtitle(mrequest.getParameter("title"));
			g.setBcontent(mrequest.getParameter("content"));
			g.setGcategoryid(Integer.parseInt(mrequest.getParameter("category")));
			g.setCclid(Integer.parseInt(mrequest.getParameter("cclid")));
			g.setGtag(mrequest.getParameter("tags"));
			
			// Attachment에 기록하기 위한 파일 리스트 처리하기
			ArrayList<AttachedFile> list = new ArrayList<AttachedFile>();

			AttachedFile af = new AttachedFile();
				
			switch(g.getGcategoryid()){
				case 1: 
					af.setFname("textCategoryImage.png"); 
					af.setFpath(savePath);
					list.add(af); 
					break;
				case 2: 
					for(int i = saveFiles.size()-1 ; i >= 0 ; i--){
						// 기존에 역순으로 저장된 파일 리스트를 올바른 순서로 재정렬하기
						af = new AttachedFile();												
						af.setFname(saveFiles.get(i));
						af.setFpath(savePath);
						System.out.println("af : " + af);
						list.add(af);											
					}
					for(int i = originFiles.size() -1 ; i >= 0 ; i--){
						int j = originFiles.size() - i - 1;
						if(originFiles.get(i) != null) {
							new File(savePath+list.get(j).getChangeName()).delete();
							
							list.get(j).setFilePath(savePath);
							list.get(j).setOriginName(originFiles.get(i));
							list.get(j).setChangeName(saveFiles.get(i));
							
						}
					}
					break;
				case 3: 
					af.setFname("audioCategoryImage.png"); 
					af.setFpath(savePath);
					list.add(af); 
					break;
				case 4: 
					af.setFname("videoCategoryImage.png"); 
					af.setFpath(savePath);
					list.add(af); 
					break;								
			}

		int result = gs.updateGallery(g, list);
		
		String page = "";
		
		if( result > 0 ) {
			
			page = "views/board/galleryDetail.jsp";
			request.setAttribute("gallery", g);
			
		} else {
			
			page= "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 수정 실패!!");
			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
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
