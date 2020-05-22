package cn.itcast.bookStore.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DataSourceUtils {

	private static DataSource dataSource = new ComboPooledDataSource("aaa");
	private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();

	public static DataSource getDataSource() {
		return dataSource;
	}

	/**
	 * 当DBUtils需要手动控制事务时，调用该方法获得一个连接
	 * 
	 * @return
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		Connection con = tl.get();
		if (con == null) {
			con = dataSource.getConnection();
			tl.set(con);
		}
		return con;
	}

	/**
	 * 开启事务
	 * 
	 * @throws SQLException
	 */
	public static void startTransaction() throws SQLException {
		Connection con = getConnection();
		if (con != null)
			con.setAutoCommit(false);//把数据默认的自动提交 修改为 手动提交
	}

	/**
	 * 从ThreadLocal中释放并且关闭Connection,并结束事务
	 * 
	 * @throws SQLException
	 */
	public static void releaseAndCloseConnection() throws SQLException {
		Connection con = getConnection();
		if (con != null) {
			con.commit();
			tl.remove();
			con.close();

		}
	}

	/**
	 * 事务回滚
	 * @throws SQLException 
	 */

	public static void rollback() throws SQLException {
		Connection con = getConnection();
		if (con != null) {
			con.rollback();
		}
	}
	
	
//	public void test(){
//		
//		//update
//		
//		String sql = "update user set username='小明' where id=1";
//		String sql1 = "insert user values('xiaxiao','')";
//		
//		try(){
//		
//		//执行更新
//		con.excute(sql);
//		//执行插叙
//		con.excute(sql1);
//		
//		con.commit();
//		}catch(Exception e){
//			e.printStackTrace();
//			con.rollback();
//		}
//		
//		
//		
//		
//	}
}
