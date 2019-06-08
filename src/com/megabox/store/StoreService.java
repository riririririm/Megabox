package com.megabox.store;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;

public class StoreService implements Action{
	private StoreDAO storeDAO;
	
	public StoreService() {
		storeDAO = new StoreDAO();
	}

	public ActionForward store(HttpServletRequest request, HttpServletResponse response) {
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
		try {
			ar= storeDAO.selectList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("list", ar);
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
		
		if(method.equals("POST")) {
			StoreDTO storeDTO = new StoreDTO();
			storeDTO.setStore_category(request.getParameter("store_category"));
			storeDTO.setStore_name(request.getParameter("store_name"));
			storeDTO.setStore_theater(request.getParameter("store_theater"));
			storeDTO.setStore_noTheater(request.getParameter("store_noTheater"));
			storeDTO.setStore_period(Integer.parseInt(request.getParameter("store_period")));
			storeDTO.setStore_count(Integer.parseInt(request.getParameter("store_count")));
			storeDTO.setStore_cancel(request.getParameter("store_cancel"));
			storeDTO.setStore_price(Integer.parseInt(request.getParameter("store_price")));
			
			int result = 0;
			
			try {
				result =storeDAO.insert(storeDTO);
				if(result>0) {
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
			}
		}//end of post
		
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
