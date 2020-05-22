package cn.itcast.bookStore.web.servlet.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.itcast.bookStore.domain.Notice;
import cn.itcast.bookStore.domain.PageBean;
import cn.itcast.bookStore.domain.Product;
import cn.itcast.bookStore.service.NoticeService;
import cn.itcast.bookStore.service.ProductService;

/**
 * 前台页面，用于菜单栏下面搜索功能的servlet
 */
public class MenuSearchSerlvet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doPost(req, resp);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 1.定义当前页码，默认为1
		int currentPage = 1;
		String _currentPage = req.getParameter("currentPage");
		if (_currentPage != null) {
			currentPage = Integer.parseInt(_currentPage);
		}
		// 2.定义每页显示条数,默认为4
		int currentCount = 4;
//		String _currentCount = req.getParameter("currentCount");
//		if (_currentCount != null) {
//			currentCount = Integer.parseInt(_currentCount);
//		}
		
		//获取前台页面搜索框输入的值
		String searchfield = req.getParameter("textfield");
		//获取前台价格区间
		String lowprice = req.getParameter("lowprice");
		String highprice = req.getParameter("highprice");
		//获取前台图书类型
		String category = req.getParameter("category");
		//如果搜索框中没有输入值，则表单传递的为默认值，此时默认查询全部商品目录
		if("请输入类型".equals(category) && "请输入书名".equals(searchfield) && "低至".equals(lowprice) && "最高".equals(highprice)){
			req.getRequestDispatcher("/showProductByPage").forward(req, resp);
			return;
		}
		if("请输入类型".equals(category))
		{
			category="";
		}
		if("请输入书名".equals(searchfield))
		{
			searchfield="";
		}
		if("最低".equals(lowprice))
		{
			lowprice="";
		}
		if("最高".equals(highprice))
		{
			highprice="";
		}
		//调用service层的方法，通过书名模糊查询，查找相应的图书
		ProductService service = new ProductService();
		PageBean bean = service.findProductByManyConditions(currentPage,currentCount,searchfield,category,lowprice,highprice);
		// 将数据存储到request范围，跳转到product_search_list.jsp页面展示
		req.setAttribute("bean", bean);
		req.getRequestDispatcher("/client/product_search_list.jsp").forward(req, resp);
	}
}
