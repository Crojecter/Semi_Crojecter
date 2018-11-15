package com.kh.board.attachedfile.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class AttachedFileInsertServlet
 */
@WebServlet("/sInsert.fo")
public class SummernoteImageViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SummernoteImageViewServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			// 만약 multipart/form-data 로 전송이 되었다면 실행해라!

			System.out.println("summernote imageUpload 서블릿 들어왔니?");

			// 전송할 파일의 용량 선정
			int maxSize = 1024 * 1024 * 10;

			// 저장할 경로 설정하기
			String root = request.getServletContext().getRealPath("/resources");

			System.out.println("root 경로 확인 : " + root);

			String url = request.getContextPath() + "/resources/uploadFiles/";
			String savePath = root + "/uploadFiles/";

			// 사용자가 저장하는 파일을 서버의 형식에 맞게
			// 이름을 변경하여 설정하기
			// ex) kakaoTalk_20181029_00000.jpg

			// DefaultFileRenamePolicy 의 경우 같은 파일이 이미 존재하는 지 검사한 후에
			// 만약 존재한다면 파일명 뒤에 숫자를 붙여서 이름을 변경한다.
			// abc.zip --> abc1.zip ---> abc2.zip

			MultipartRequest srequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new DefaultFileRenamePolicy());

			// 폼으로 전송된 파일 이름들을 받아온다.
			Enumeration<String> files = srequest.getFileNames();

			JSONObject jobj = new JSONObject();

			String uploadPath = "";

			// 각 파일의 정보를 가져와서 DB에 저장할 내용을 추출한다.
			String name = files.nextElement();
			String fileName = srequest.getFilesystemName(name);

			uploadPath = url + fileName;

			jobj.put("url", uploadPath);

			System.out.println("uploadPath : " + uploadPath);
			System.out.println("name : " + fileName);

			response.setContentType("text/html; application/json; charset=UTF-8"); // 데이터 타입을 json으로 설정하기															// 위한 세팅

			//response.getWriter().print(jobj.toJSONString());
			response.getWriter().print(uploadPath);
			
			System.out.println(jobj.toJSONString());

		} else {
			System.out.println("섬머노트 이 바보야!!!");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
