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
			
			System.out.println("GalleryUpdateServlet 서블릿 들어왔니?");
			
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
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			Enumeration<String> files = mrequest.getFileNames();
			
			while(files.hasMoreElements()){
				// 새로 입력된 파일의 정보를 가져와서 DB에 저장할 내용을 추출한다.
				String name = files.nextElement();
				String fileName = mrequest.getFilesystemName(name);  
				
				System.out.println("name : " + fileName);
				
				saveFiles.add(fileName);				
			}						
			 
			System.out.println("savefiles : " + saveFiles);
			
			// selectGalleryMap(bid) : galleryUpdate.jap에서 받아온 bid로 Gallery와 AttachedFile을 불러온다.
			int bid = Integer.parseInt(request.getParameter("bid"));
			System.out.println("bid : " + bid);

			HashMap<String, Object> gal = gs.selectGalleryMap(bid);
			
			// 기존 bid의 gallery 객체 불러와서 업데이트 하기 
			Gallery g = (Gallery)gal.get("gallery");

			g.setBtitle(mrequest.getParameter("title"));
			g.setBcontent(mrequest.getParameter("content"));
			g.setGcategoryid(Integer.parseInt(mrequest.getParameter("category")));
			g.setCclid(Integer.parseInt(mrequest.getParameter("cclid")));
			g.setGtag(mrequest.getParameter("tags"));
			
			/// 기존 bid의 AttachedFile 객체 불러와서 업데이트 하기 
			ArrayList<AttachedFile> list = (ArrayList<AttachedFile>)gal.get("attachedfile");

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
						
						af.setFid(list.get(i).getFid()+1);
						af.setFname(saveFiles.get(i));
						af.setFpath(savePath);
						af.setBid(bid);
						
						System.out.println("af : " + af);
						list.add(af);											
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
			
			response.sendRedirect("gSelectOne.ga?bid="+g.getBid());
			
		} else {
			
			page= "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 수정 실패!!");
			request.getRequestDispatcher(page).forward(request, response);
			
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
