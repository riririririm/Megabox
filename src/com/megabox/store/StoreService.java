package com.megabox.store;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.member.MemberDTO;
import com.megabox.theater.NoTheaterDAO;
import com.megabox.theater.NoTheaterDTO;
import com.megabox.theater.TheaterDAO;
import com.megabox.theater.TheaterDTO;
import com.megabox.upload.StoreUploadDAO;
import com.megabox.upload.StoreUploadDTO;
import com.megabox.util.DBConnector;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;




public class StoreService implements Action{
	private StoreDAO storeDAO;
	private TheaterDAO theaterDAO;
	private NoTheaterDAO noTheaterDAO;
	private Store_historyDAO store_historyDAO;
	private StoreUploadDAO uploadDAO;
	
	public StoreService() {
		storeDAO = new StoreDAO();
		theaterDAO = new TheaterDAO();
		noTheaterDAO = new NoTheaterDAO();
		store_historyDAO = new Store_historyDAO();
		uploadDAO = new StoreUploadDAO();
	}

	public ActionForward settingAttributes2(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String command = request.getMethod();
		
		if (command.equals("POST")) {
			//String[] store_noTheaters = request.getParameterValues("store_noTheaters");
			StoreDTO storeDTO = new StoreDTO();
			storeDTO.setStore_category(request.getParameter("store_category"));
			storeDTO.setStore_count(Integer.parseInt(request.getParameter("store_buy_count"))); //구매개수
			storeDTO.setStore_cancel(request.getParameter("store_cancel"));
			storeDTO.setStore_name(request.getParameter("store_name"));
			storeDTO.setStore_num(Integer.parseInt(request.getParameter("store_num")));
			storeDTO.setStore_period(Integer.parseInt(request.getParameter("store_period")));
			storeDTO.setStore_price(Integer.parseInt(request.getParameter("store_price")));
			//String img = request.getParameter("store_img");
			int store_total_price = Integer.parseInt(request.getParameter("store_total_price"));
			
			HttpSession session = request.getSession();
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			
			String phone = memberDTO.getPhone();
			String[] phones = phone.split("-");
			
			request.setAttribute("phones", phones);
			request.setAttribute("storeDTO", storeDTO);
			request.setAttribute("store_total_price", store_total_price);
			actionForward.setCheck(true);
			actionForward.setPath("/WEB-INF/views/store/myModal2.jsp");
		}
		return actionForward;
	}
	
	public ActionForward settingAttributes(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String command = request.getMethod();
		
		if (command.equals("POST")) {
			String[] store_noTheaters = request.getParameterValues("store_noTheaters");
			StoreDTO storeDTO = new StoreDTO();
			storeDTO.setStore_category(request.getParameter("store_category"));
			storeDTO.setStore_count(Integer.parseInt(request.getParameter("store_count")));
			storeDTO.setStore_cancel(request.getParameter("store_cancel"));
			storeDTO.setStore_name(request.getParameter("store_name"));
			storeDTO.setStore_num(Integer.parseInt(request.getParameter("store_num")));
			storeDTO.setStore_period(Integer.parseInt(request.getParameter("store_period")));
			storeDTO.setStore_price(Integer.parseInt(request.getParameter("store_price")));
			String img = request.getParameter("store_img");
			
			request.setAttribute("store_noTheaters", store_noTheaters);
			request.setAttribute("storeDTO", storeDTO);
			request.setAttribute("store_img", img);
			actionForward.setCheck(true);
			actionForward.setPath("/WEB-INF/views/store/myModal.jsp");
		}
		return actionForward;
	}
	
	public ActionForward insertStoreHistory(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		Store_historyDTO historyDTO = new Store_historyDTO();
		historyDTO.setId(request.getParameter("kakao_id"));
		historyDTO.setCategory(request.getParameter("kakao_category"));
		historyDTO.setStore_name(request.getParameter("kakao_store_name"));
		historyDTO.setBuy_count(Integer.parseInt(request.getParameter("kakao_buy_count")));
		historyDTO.setPrice(Integer.parseInt(request.getParameter("kakao_total_price")));
		int period = Integer.parseInt(request.getParameter("kakao_store_period"));
		
		Connection con=null;
		int result=0;
		
		try {
			con = DBConnector.getConnect();
			result = store_historyDAO.insert(historyDTO,period, con);
			
				request.setAttribute("result",result);
				actionForward.setPath("../WEB-INF/views/store/result2.jsp");
				actionForward.setCheck(true);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return actionForward;
	}
	
	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		boolean check=true;
		String path="../WEB-INF/views/store/storeList.jsp";
		ArrayList<StoreDTO> ar = null;
		ArrayList<StoreDTO> megaTicket = null;
		ArrayList<StoreDTO> megaChance = null;
		ArrayList<StoreDTO> goods = null;
		List<StoreUploadDTO> images = null;
		
		ArrayList<NoTheaterDTO> noTheaterList = null;
		
		
		Connection con=null;
		try {
			//ar= storeDAO.selectList();
			con = DBConnector.getConnect();
			megaTicket = storeDAO.selectListByCategory("메가티켓",con);
			megaChance = storeDAO.selectListByCategory("메가찬스",con);
			goods = storeDAO.selectListByCategory("팝콘/음료/굿즈",con);
			noTheaterList = noTheaterDAO.selectList(con);
			images = uploadDAO.selectList(con);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		request.setAttribute("megaTicket", megaTicket);
		request.setAttribute("megaChance", megaChance);
		request.setAttribute("goods", goods);
		request.setAttribute("noTheaterList", noTheaterList);
		request.setAttribute("images", images);
		actionForward.setCheck(check);
		actionForward.setPath(path);
		
		return actionForward;
	}

	@Override
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String method = request.getMethod();
		
		boolean check=true;
		String path="../WEB-INF/views/store/storeReg.jsp";
		
		
		Connection con = null;
		
		if(method.equals("POST")) {
			String saveDirectory = request.getServletContext().getRealPath("storeUpload");
			int result1=0; int result2=0; int result3 = 0;
			int maxPostSize=1024*1024*100;
			
			File file = new File(saveDirectory);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			try {
				
				MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory, maxPostSize, "UTF-8", new DefaultFileRenamePolicy());
			 	Enumeration<String> e= multipartRequest.getFileNames();//파일의 파라미터 이름들
			 	ArrayList<StoreUploadDTO> ar = new ArrayList<StoreUploadDTO>();
			 	while(e.hasMoreElements()) {
			 		String s = e.nextElement();
			 		String fname = multipartRequest.getFilesystemName(s);
			 		String oname = multipartRequest.getOriginalFileName(s);
			 		StoreUploadDTO uploadDTO = new StoreUploadDTO();
			 		uploadDTO.setFname(fname);
			 		uploadDTO.setOname(oname);
			 		ar.add(uploadDTO);
			 	}
				
				StoreDTO storeDTO = new StoreDTO();
				storeDTO.setStore_category(multipartRequest.getParameter("store_category"));
				storeDTO.setStore_name(multipartRequest.getParameter("store_name"));
				storeDTO.setStore_theater(multipartRequest.getParameter("store_theater"));
				//storeDTO.setStore_noTheater(request.getParameter("store_noTheater"));
				storeDTO.setStore_period(Integer.parseInt(multipartRequest.getParameter("store_period")));
				storeDTO.setStore_count(Integer.parseInt(multipartRequest.getParameter("store_count")));
				storeDTO.setStore_cancel(multipartRequest.getParameter("store_cancel"));
				storeDTO.setStore_price(Integer.parseInt(multipartRequest.getParameter("store_price")));
				String[] noTheaters = multipartRequest.getParameterValues("store_noTheater"); //사용불가능 매장이름
				
				con = DBConnector.getConnect();
				
				//1.시퀀스번호
				int seqNum = storeDAO.getNum(con);
				storeDTO.setStore_num(seqNum);
				//2.store insert
				result1 =storeDAO.insert(storeDTO, con);
				//3. upload insert
				for(StoreUploadDTO uploadDTO:ar) {
					uploadDTO.setNum(storeDTO.getStore_num());
					result2 = uploadDAO.insert(uploadDTO, con);
					if(result2<1) {
						throw new Exception();
					}
				}
				
				NoTheaterDTO noTheaterDTO = new NoTheaterDTO();
				for(int i=0;i<noTheaters.length;i++) {
					noTheaterDTO.setStore_num(storeDAO.searchStoreNum(storeDTO.getStore_name(), con));
					noTheaterDTO.setTheater_name(noTheaters[i]);	
					result3 =noTheaterDAO.insert(noTheaterDTO, con);
				}
			
				if(result1* result2* result3>0) {
					request.setAttribute("message", "상품을 등록했습니다.");
					request.setAttribute("path", "./storeList");
					check = true;
					path = "../WEB-INF/views/common/result.jsp";
				}else {
					request.setAttribute("message", "상품등록 실패.");
					request.setAttribute("path", "./storeList");
					check = true;
					path = "../WEB-INF/views/common/result.jsp";
				}
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}//end of post
		
		try {
			con = DBConnector.getConnect();
			
			ArrayList<TheaterDTO> theaterList = theaterDAO.selectList(con);
			request.setAttribute("theater", theaterList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//end of get
		
		
		actionForward.setCheck(check);
		actionForward.setPath(path);
		return actionForward;
	}

	@Override
	public ActionForward update(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		boolean check=true;
		String path="../WEB-INF/views/common/result.jsp";
		String method = request.getMethod();
		
		int store_num =0;
		Connection con=null;
		StoreDTO storeDTO = null;
		ArrayList<NoTheaterDTO> noTheaters = null;
		ArrayList<TheaterDTO> theaters = null;
		StoreUploadDTO uploadDTO = null;
		
		if(method.equals("POST")) {
			String saveDirectory = request.getServletContext().getRealPath("storeUpload");
			int result1=0; int result2=0; int result3 = 0;
			int maxPostSize=1024*1024*100;
	
			File file = new File(saveDirectory);
			if(!file.exists()) {
				file.mkdirs();
			}
			
			try {
				
				MultipartRequest multipartRequest = new MultipartRequest(request, saveDirectory, maxPostSize, "UTF-8", new DefaultFileRenamePolicy());
			 	Enumeration<String> e= multipartRequest.getFileNames();//파일의 파라미터 이름들
			 	ArrayList<StoreUploadDTO> ar = new ArrayList<StoreUploadDTO>();
			 	while(e.hasMoreElements()) {
			 		String s = e.nextElement();
			 		String fname = multipartRequest.getFilesystemName(s);
			 		String oname = multipartRequest.getOriginalFileName(s);
			 		uploadDTO = new StoreUploadDTO();
			 		uploadDTO.setFname(fname);
			 		uploadDTO.setOname(oname);
			 		ar.add(uploadDTO);
			 	}
				
				store_num = Integer.parseInt(multipartRequest.getParameter("store_num")); 

				storeDTO = new StoreDTO();
				storeDTO.setStore_num(store_num);
				storeDTO.setStore_category(multipartRequest.getParameter("store_category"));
				storeDTO.setStore_name(multipartRequest.getParameter("store_name"));
				storeDTO.setStore_theater(multipartRequest.getParameter("store_theater")); 
				storeDTO.setStore_period(Integer.parseInt(multipartRequest.getParameter("store_period")));
				storeDTO.setStore_count(Integer.parseInt(multipartRequest.getParameter("store_count")));
				storeDTO.setStore_cancel(multipartRequest.getParameter("store_cancel"));
				storeDTO.setStore_price(Integer.parseInt(multipartRequest.getParameter("store_price")));
				String[] noTheater = multipartRequest.getParameterValues("store_noTheater"); //사용불가능 매장이름
				
				con = DBConnector.getConnect();
				
				//1.기존 store update
				result1 =storeDAO.update(storeDTO, con);
				//2.기존 noTheater delete -> insert
				result2 = noTheaterDAO.delete(store_num,con);
				
				NoTheaterDTO noTheaterDTO = new NoTheaterDTO();
				for(int i=0;i<noTheater.length;i++) {
					noTheaterDTO.setStore_num(storeDAO.searchStoreNum(storeDTO.getStore_name(), con));
					noTheaterDTO.setTheater_name(noTheater[i]);	
					result2 =noTheaterDAO.insert(noTheaterDTO, con);
				}
				//3.기존 storeUpload update
				if(ar.get(0).getFname()!=null) {
					for(StoreUploadDTO img:ar) {
						img.setNum(store_num);
						result3 = uploadDAO.update(img, con);
						if(result3<1) {
							throw new Exception();
						}
					}
					
				}else {
					result3=1;
				}
				
				
		
			} catch (Exception e) {
				// TODO: handle exception
			} finally {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
				System.out.println(result1); System.out.println(result2); System.out.println(result3);
				if(result1* result2* result3>0) {
					request.setAttribute("message", "상품을 수정했습니다.");
					request.setAttribute("path", "./storeList");
					check = true;
					path = "../WEB-INF/views/common/result.jsp";
				}else {
					request.setAttribute("message", "상품 수정 실패.");
					request.setAttribute("path", "./storeList");
					check = true;
					path = "../WEB-INF/views/common/result.jsp";
				}
		}else {
			store_num = Integer.parseInt(request.getParameter("store_num"));
			try {
				con = DBConnector.getConnect();
				storeDTO = storeDAO.selectOne(store_num, con);
				noTheaters = noTheaterDAO.selectListByNum(store_num, con);
				theaters = theaterDAO.selectList(con);
				uploadDTO = uploadDAO.selectOne(store_num);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if(storeDTO != null && noTheaters !=null) {
				request.setAttribute("storeDTO", storeDTO);
				request.setAttribute("noTheaters", noTheaters);
				request.setAttribute("theaters", theaters);
				request.setAttribute("uploadDTO", uploadDTO);
				check=true;
				path="../WEB-INF/views/store/storeUpdate.jsp";
			}else {
				request.setAttribute("message", "상품업데이트 실패.");
				request.setAttribute("path", "./storeList");
				check = true;
				path = "../WEB-INF/views/common/result.jsp";
			}
		}
		
		actionForward.setCheck(check);
		actionForward.setPath(path);
		
		return actionForward;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		boolean check=true;
		String path="../WEB-INF/views/common/result.jsp";
		int store_num = Integer.parseInt(request.getParameter("num"));
		int result =0;
		Connection con=null;
		
		try {
			con = DBConnector.getConnect();
			result= storeDAO.delete(store_num, con);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(result>0) {
			request.setAttribute("message", "상품을 삭제했습니다.");
			request.setAttribute("path", "./storeList");	
		}else {
			request.setAttribute("message", "상품삭제 실패.");
			request.setAttribute("path", "./storeList");
		}
		actionForward.setCheck(check);
		actionForward.setPath(path);
		
		return actionForward;
	}

}
