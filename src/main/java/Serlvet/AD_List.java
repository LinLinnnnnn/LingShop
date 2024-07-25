package Serlvet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;



import Dao.ProductDAO;
import Entity.Product;

/**
 * Servlet implementation class AD_List
 */
@WebServlet({ "/AD_List", "/AD_Delete_SP","/AD_Export_Excel" })
public class AD_List extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDAO dao = new ProductDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AD_List() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = request.getRequestURL().toString();
		if (url.contains("/AD_Delete_SP")) {
			Integer id = Integer.parseInt(request.getParameter("product_id"));
			if(id != null) {
				dao.deleteImagesByProductId(id);
				dao.delete(id);
				System.out.println("Đã xóa");
				List<Product> list = dao.findAll();
				request.setAttribute("listProduct", list);
				request.getRequestDispatcher("/views/ad_list_Item.jsp").forward(request, response);
			}
		}else if (url.contains("/AD_Export_Excel")) {
			this.export(request, response);
		}else {
			List<Product> list = dao.findAll();
			request.setAttribute("listProduct", list);
			request.getRequestDispatcher("/views/ad_list_Item.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}
	

	protected void export(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		try {
			List<Product> lstProduct = new ArrayList<>();
			XSSFWorkbook workbook = new XSSFWorkbook();
			ProductDAO proDDAO = new ProductDAO();
			lstProduct = proDDAO.findAll();
			XSSFSheet sheet = workbook.createSheet("Product");
			sheet.setColumnWidth(0, 6000);
			sheet.setColumnWidth(1, 4000);
			sheet.setColumnWidth(2, 8000);
			sheet.setColumnWidth(3, 5000);
			sheet.setColumnWidth(4, 8000);
			Row header = sheet.createRow(0);
			
			CellStyle headerStyle = workbook.createCellStyle();
			headerStyle.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
			headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

			XSSFFont font = ((XSSFWorkbook) workbook).createFont();
			font.setFontName("Arial");
			font.setFontHeightInPoints((short) 16);
			font.setBold(true);
			headerStyle.setFont(font);
			//Create header row in the excel
			Cell headerCell = header.createCell(0);
			headerCell.setCellValue("No.");
			headerCell.setCellStyle(headerStyle);

			headerCell = header.createCell(1);
			headerCell.setCellValue("Product ID");
			headerCell.setCellStyle(headerStyle);
			
			headerCell = header.createCell(2);
			headerCell.setCellValue("Name");
			headerCell.setCellStyle(headerStyle);
			
			headerCell = header.createCell(3);
			headerCell.setCellValue("Price");
			headerCell.setCellStyle(headerStyle);
			
			headerCell = header.createCell(4);
			headerCell.setCellValue("Discount");
			headerCell.setCellStyle(headerStyle);
			
			CellStyle style = workbook.createCellStyle();
			style.setWrapText(true);
			int rowIndex = 1;
//			String pattern = "MM/dd/yyyy";
//			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
			for(Product st:lstProduct) {
				Row row = sheet.createRow(rowIndex);
				Cell cell = row.createCell(0);
				cell.setCellValue(rowIndex);
				cell.setCellStyle(style);
				
				cell = row.createCell(1);
				cell.setCellValue(st.getId());
				cell.setCellStyle(style);
				
				cell = row.createCell(2);
				cell.setCellValue(st.getName());
				cell.setCellStyle(style);
				
				cell = row.createCell(3);
				cell.setCellValue(st.getPrice());
				cell.setCellStyle(style);
				
				cell = row.createCell(4);
				cell.setCellValue(st.getDiscount());
				cell.setCellStyle(style);
				rowIndex++;
				System.out.println(st);
			}
			String path = "Excel/productFile.xlsx";
			String fileLocationAndName = request.getServletContext().getRealPath(path);
			
			System.out.println(fileLocationAndName);
			FileOutputStream outputStream = new FileOutputStream(fileLocationAndName);
			workbook.write(outputStream);
			workbook.close();
			outputStream.close();
			List<Product> list = dao.findAll();
			request.setAttribute("listProduct", list);
			request.getRequestDispatcher("/views/ad_list_Item.jsp").forward(request, resp);
		}catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		
		}
	}

}
