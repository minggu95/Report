package cn.itcast.report.service;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Date;

import javax.security.auth.login.LoginException;

import cn.itcast.report.dao.UserDao;
import cn.itcast.report.domain.User;
import cn.itcast.report.exception.ActiveUserException;
import cn.itcast.report.exception.RegisterException;
import cn.itcast.report.utils.Md5UtilHelp;

public class UserService {
	private UserDao dao = new UserDao();

	// 注册操作
	public void register(User user) throws RegisterException {
		// 调用dao完成注册操作
		try {
            User tempUser = dao.findUserByName(user.getUsername());
            if(tempUser != null)
            {
                throw new RegisterException("用户已存在");
            }
			//密码MD5加密
			String psw = Md5UtilHelp.getEncryptedPwd(user.getPassword());
			user.setPassword(psw);
			dao.addUser(user);

			// 发送激活邮件
//			String emailMsg = "感谢您注册网上书城，点击<a href='http://localhost:8080/bookstore/activeUser?activeCode="
//					+ user.getActiveCode() + "'>&nbsp;激活&nbsp;</a>后使用。<br>为保障您的账户安全，请在24小时内完成激活操作";
//			MailUtils.sendMail(user.getEmail(), emailMsg);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RegisterException(e.getMessage());
		}
	}

	// 激活用户
	public void activeUser(String activeCode) throws ActiveUserException {

		try {
			// 根据激活码查找用户
			User user = dao.findUserByActiveCode(activeCode);
			if (user == null) {
				throw new ActiveUserException("激活用户失败");
			}

			// 判断激活码是否过期 24小时内激活有效.
			// 1.得到注册时间
			Date registTime = user.getRegistTime();
			// 2.判断是否超时
			long time = System.currentTimeMillis() - registTime.getTime();
			if (time / 1000 / 60 / 60 > 24) {
				throw new ActiveUserException("激活码过期");
			}

			// 激活用户，就是修改用户的state状态
			dao.activeUser(activeCode);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ActiveUserException("激活用户失败");
		}
	}

	// 登录操作
	public User login(String username, String password) throws LoginException {
		try {
			User user = dao.findUserByName(username);
            //根据登录时表单输入的用户名和密码，查找用户
			//User user = dao.findUserByUsernameAndPassword(username, password);
			//如果找到，还需要确定用户是否为激活用户
			if (user != null) {
                String pwdInDb = user.getPassword();
                if(!Md5UtilHelp.validPassword(password, pwdInDb)){ // 该用户存在
                    throw new LoginException("密码错误");
                }
				// 只有是激活才能登录成功，否则提示“用户未激活”
				if (user.getState() == 1) {
					return user;
				}
				throw new LoginException("用户未激活");
			}
            else{
                throw new LoginException("用户未注册");
            }
		} catch (SQLException e) {
			e.printStackTrace();
			throw new LoginException(e.getMessage());
		} catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            throw new LoginException(e.getMessage());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            throw new LoginException(e.getMessage());
        }

    }
}
