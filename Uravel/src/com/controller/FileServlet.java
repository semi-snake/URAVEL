package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.LocationDto;
import com.dto.ThemeDto;
import com.dto.TravelDto;
import com.dao.ReviewDao;
import com.dto.ReviewDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String UPLOAD_PATH = getServletContext().getRealPath("img");

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		int maxFileSize = 1024 * 1024 * 2;
		String encType = "utf-8";

		ReviewDao dao = new ReviewDao();
		MultipartRequest multi = new MultipartRequest(request, UPLOAD_PATH, maxFileSize, encType,
				new DefaultFileRenamePolicy());

		String command = multi.getParameter("command");

		if (command.equals("reviewwrite")) {
			int userno = Integer.parseInt(multi.getParameter("userno"));
			String title = multi.getParameter("title");
			int travelno = Integer.parseInt(multi.getParameter("travelno"));
			String content = multi.getParameter("content");

			File file = multi.getFile("file[0]");
			String filename = null;
			long filesize = 0;

			if (file != null) {
				filename = file.getName();
				filesize = file.length();
			}

			String localname = multi.getParameter("localname");
			String themename = multi.getParameter("themename");

			ReviewDto dto = new ReviewDto();

			dto.setTitle(title);
			dto.setUserno(userno);
			dto.setTravelno(travelno);
			dto.setThemename(themename);
			dto.setLocalname(localname);
			dto.setContent(content);
			dto.setFilename(filename);
			dto.setFilesize(filesize);

			int res = dao.insert(dto);

			if (res > 0) {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				dispatch("ReviewController?command=list", request, response);
			} else {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				dispatch("ReviewController?command=writeform", request, response);
			}

			return;

		} else if (command.equals("reviewupdate")) {
			int postno = Integer.parseInt(multi.getParameter("postno"));

			String title = multi.getParameter("title");
			int travelno = Integer.parseInt(multi.getParameter("travelno"));
			String content = multi.getParameter("content");
			String localname = multi.getParameter("localname");
			String themename = multi.getParameter("themename");

			File file = multi.getFile("file[0]");
			String filename = null;
			long filesize = 0;

			if (file != null) {
				filename = file.getName();
				filesize = file.length();
			} else {
				filename = multi.getParameter("filename");
				filesize = Long.parseLong(multi.getParameter("filesize"));
			}

			ReviewDto dto = new ReviewDto();

			dto.setPostno(postno);
			dto.setTravelno(travelno);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setThemename(themename);
			dto.setLocalname(localname);
			dto.setFilename(filename);
			dto.setFilesize(filesize);

			int res = dao.update(dto);

			if (res > 0) {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				dispatch("ReviewController?command=list", request, response);

			} else {
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				dispatch("ReviewController?command=updateform", request, response);
			}
			return;
		}
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
