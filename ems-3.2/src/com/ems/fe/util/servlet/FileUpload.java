package com.ems.fe.util.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;
import java.util.*;
import java.util.regex.*;
import java.io.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;

/*
 * �������� 2005-4-10
 *
 * TODO Ҫ���Ĵ����ɵ��ļ���ģ�壬��ת��
 * ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */

/**
 * @author gaolong1
 * 
 * TODO Ҫ���Ĵ����ɵ�����ע�͵�ģ�壬��ת�� ���� �� ��ѡ�� �� Java �� ������ʽ �� ����ģ��
 */
public class FileUpload extends HttpServlet {

	/**
	 * Destruction of the servlet. <br>
	 */
	private String uploadPath = ""; // ���ڴ���ϴ��ļ���Ŀ¼
	
	
	
	
	private File tempPath = new File("C:\\"); // ���ڴ����ʱ�ļ���Ŀ¼

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		uploadPath = req.getRealPath("images/upload_images") + "/";
		System.out.println(req.getRealPath("images/upload_images"));;
		res.setContentType("text/html; charset=GB2312");
		PrintWriter out = res.getWriter();
		System.out.println(req.getContentLength());
		System.out.println(req.getContentType());
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(4096);
		// the location for saving data that is larger than getSizeThreshold()
		factory.setRepository(new File("C:\\"));

		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum size before a FileUploadException will be thrown
		upload.setSizeMax(1000000);
		
		String sId = "";
		String year = "";
		String month = "";
		String course = "";
		String search = "";
		String pageNo = "";
		String isStudent = "";
		try {
			List fileItems = upload.parseRequest(req);
			// assume we know there are two files. The first file is a small
			// text file, the second is unknown and is written to a file on
			// the server
			Iterator iter = fileItems.iterator();

			// ����ƥ�䣬����·��ȡ�ļ���
			String regExp = "(.+)$";

			// ���˵����ļ�����
			String[] errorType = { ".exe", ".com", ".cgi", ".asp" };
			Pattern p = Pattern.compile(regExp);
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				if (item.isFormField()) {
					if ("sId".equals(item.getFieldName())) {
						sId = item.getString();
					}
				}
//System.out.println(sId);
				if (item.isFormField()) {
					if ("year".equals(item.getFieldName())) {
						year = item.getString();
					}
				}
				if (item.isFormField()) {
					if ("month".equals(item.getFieldName())) {
						month = item.getString();
					}
				}
				if (item.isFormField()) {
					if ("course".equals(item.getFieldName())) {
						course = item.getString();
					}
				}
				if (item.isFormField()) {
					if ("search".equals(item.getFieldName())) {
						search = item.getString();
					}
				}
				if (item.isFormField()) {
					if ("pageNo".equals(item.getFieldName())) {
						pageNo = item.getString();
					}
				}
				if (item.isFormField()) {
					if ("isStudent".equals(item.getFieldName())) {
						isStudent = item.getString();
					}
				}
				String querycode = "";
				String uri = "";
				if("true".equals(isStudent)){
					querycode = "&gra=" + year + "&dep=" + month + "&cla=" + course + "&search=" + search;
					uri = "all_student_info.jsp";
				}else{
					querycode = "&year=" + year + "&month=" + month + "&course=" + course + "&search=" + search;
					uri = "all_paper.jsp";
				}
				// �������������ļ�������б���Ϣ
				if (!item.isFormField()) {
					String name = item.getName();
					name = name.substring(name.lastIndexOf("\\")+1);
					long size = item.getSize();
					if ((name == null || name.equals("")) && size == 0)
						continue;
					Matcher m = p.matcher(name);
					boolean result = m.find();
					if (result) {
						for (int temp = 0; temp < errorType.length; temp++) {
							if (m.group(1).endsWith(errorType[temp])) {
								throw new IOException(name + ": wrong type");
							}
						}
						try {
							String temp = req.getSession().getServletContext().getRealPath("images/item");
							System.out.println("temp=" + temp);
							// �����ϴ����ļ���ָ����Ŀ¼
							// ���������ϴ��ļ������ݿ�ʱ�����������д
							item.write(new File(uploadPath + sId + ".jpg"));
//System.out.println(querycode);
							out.print(name + "&nbsp;&nbsp;" + size + "<br>");
							res.sendRedirect(req.getContextPath() + "/admin/"+ uri +"?pageNo="+pageNo + querycode);
							//window.parent.frames.bottom.location.reload();
						} catch (Exception e) {
							out.println(e);
						}

					} else {
						throw new IOException("fail to upload");
					}
				}
			}
		} catch (IOException e) {
			out.println(e);
		} catch (FileUploadException e) {
			out.println(e);
		}

		// �����ϴ����ļ���ָ����Ŀ¼

		// ���������ϴ��ļ������ݿ�ʱ�����������д

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occure
	 */
	public void init() throws ServletException {
		this.uploadPath = this.getServletConfig().getInitParameter("upload_path");
	}

//	public void init(ServletConfig config) throws ServletException {
//		super.init(config);
//		this.uploadPath =  config.getInitParameter("upload-path");
//	}
	
}