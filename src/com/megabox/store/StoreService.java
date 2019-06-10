package com.megabox.store;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;
import com.megabox.theater.NoTheaterDAO;
import com.megabox.theater.NoTheaterDTO;
import com.megabox.theater.TheaterDAO;
import com.megabox.theater.TheaterDTO;
import com.megabox.util.DBConnector;

public class StoreService implements Action{
	private StoreDAO storeDAO;
	private TheaterDAO theaterDAO;
	private NoTheaterDAO noTheaterDAO;
	
	public StoreService() {
		storeDAO = new StoreDAO();
		theaterDAO = new TheaterDAO();
		noTheaterDAO = new NoTheaterDAO();
	}

	public ActionForward insertStoreHistory(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		
		actionForward.setPath("../WEB-INF/views/store/store.jsp");
		actionForward.setCheck(true);
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
		try {
			//ar= storeDAO.selectList();
			megaTicket = storeDAO.selectListByCategory("메가티켓");
			megaChance = storeDAO.selectListByCategory("메가찬스");
			goods = storeDAO.selectListByCategory("팝콘/음료/굿즈");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//request.setAttribute("list", ar);
		request.setAttribute("megaTicket", megaTicket);
		request.setAttribute("megaChance", megaChance);
		request.setAttribute("goods", goods);
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
			int result1, result2 = 0;
			
			try {
				con = DBConnector.getConnect();

				StoreDTO storeDTO = new StoreDTO();
				storeDTO.setStore_category(request.getParameter("store_category"));
				storeDTO.setStore_name(request.getParameter("store_name"));
				storeDTO.setStore_theater(request.getParameter("store_theater"));
				//storeDTO.setStore_noTheater(request.getParameter("store_noTheater"));
				storeDTO.setStore_period(Integer.parseInt(request.getParameter("store_period")));
				storeDTO.setStore_count(Integer.parseInt(request.getParameter("store_count")));
				storeDTO.setStore_cancel(request.getParameter("store_cancel"));
				storeDTO.setStore_price(Integer.parseInt(request.getParameter("store_price")));
				String[] noTheaters = request.getParameterValues("store_noTheater"); //사용불가능 매장이름
				
				result1 =storeDAO.insert(storeDTO, con);
				
				NoTheaterDTO noTheaterDTO = new NoTheaterDTO();
				for(int i=0;i<noTheaters.length;i++) {
					noTheaterDTO.setStore_num(storeDAO.searchStoreNum(storeDTO.getStore_name(), con));
					noTheaterDTO.setTheater_name(noTheaters[i]);	
					result2 =noTheaterDAO.insert(noTheaterDTO, con);
				}
			
				if(result1>0 && result2>0) {
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionForward delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

}
