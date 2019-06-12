package com.megabox.seat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megabox.action.Action;
import com.megabox.action.ActionForward;

public class SeatService implements Action {

	@Override
	public ActionForward selectList(HttpServletRequest request, HttpServletResponse response) {
		// 영화관 좌석표 보이기
		ActionForward actionForward = new ActionForward();
		
		actionForward.setCheck(true);
		actionForward.setPath("../WEB-INF/views/movie/movieSeat.jsp");
		return actionForward;
	}

	@Override
	public ActionForward selectOne(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActionForward insert(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
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
