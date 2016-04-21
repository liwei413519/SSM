//package com.zhongxin.candyhouse.web.servlet.actionservlet;
//
//import java.io.File;
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
//
//import com.zhongxin.candyhouse.constant.FromPageVar;
//
///**
// * ��������
// * @author pzh
// *
// */
//public class UpLoadServlet extends HttpServlet {
//    @Override
//    protected void service(HttpServletRequest request, HttpServletResponse response)
//    		throws ServletException, IOException {
//    	 //��������
//    	 String path=FromPageVar.save_user_images;
//         DiskFileItemFactory factory=new DiskFileItemFactory();
//         ServletFileUpload sfu=new ServletFileUpload(factory);
//         sfu.setHeaderEncoding("UTF-8");  //������������
//         sfu.setSizeMax(1024*1024);   //������������
//         try {
//             List<FileItem> fileItems= sfu.parseRequest(request);  //�������� ����������������
//             for (FileItem fi : fileItems) {
//                 //�������� ���������������������� 
//                 if (!fi.isFormField()) { //���������������� 
//                	 if(fi.getString()==null || fi.getString().equals("")){
//                		 continue;
//                	 }
//                     // fn �������������� fish.jpg
//                     String fn=fi.getName();
//                     if(fn.length()>10){
//                    	 fn=fn.substring(fn.lastIndexOf(".")-4, fn.length());
//                     }
//                     request.setAttribute("fileName", fn);
//                     //��������������E:\Java\java����\148(����������)\WorkSpace\testa\WebRoot\images
//                     fi.write(new File(path,fn));
////                     break;//����������������������������
//                 }else{
//                	 String value=fi.getString();
//              		  value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
//             		  request.setAttribute(fi.getFieldName(), value);
//                 }
//             }    
//         } catch (Exception e) {
//             e.printStackTrace();
//         }
//         //����������������
//         request.getRequestDispatcher("/personalInfo.action").forward(request, response);
//    }
//}
