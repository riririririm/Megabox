package com.megabox.upload;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.util.DBConnector;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UploadService implements Action{
	
	private UploadDAO uploadDAO;
	
	public UploadService() {
		uploadDAO = new UploadDAO();
	}
	

	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		//스마트에디터 파일 업로드
		 ActionForward actionForward = new ActionForward();
		 int maxPostSize=50*1024*1024;
		 String saveDirectory = request.getServletContext().getRealPath("upload_se2");
		 System.out.println(saveDirectory);
		 File file = new File(saveDirectory);
		 if(!file.exists()) {
			 file.mkdirs();
		 }
		 try {
			 MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory, maxPostSize, "UTF-8", new DefaultFileRenamePolicy());
			 String callback = multipartRequest.getParameter("callback");
			 String callback_func = multipartRequest.getParameter("callback_func");
			 String fileName = multipartRequest.getFilesystemName("Filedata");
			 
			 //1.절대경로
			 String path = request.getContextPath();
			 //2.최종결과물
			 String result = "&bNewLine=true&sFileURL="+path+"/upload_se2/"+fileName;
			 //3.
			 result = callback+"?callback_func="+callback_func+result;
			 System.out.println(result);
			 
			 actionForward.setCheck(false);
			 actionForward.setPath(result);
			 
		 }catch(IOException e) {
			 e.printStackTrace();
		 }
		 
		 return actionForward;
	}

	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		Connection conn = null;
		int result=0;
		
		try {
			conn=DBConnector.getConnection();
			int pnum = Integer.parseInt(request.getParameter("pnum"));
			result=uploadDAO.delete(pnum, conn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		request.setAttribute("result", result);
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/common/result.jsp");
		
		
		return actionForward;
	}
	

}
