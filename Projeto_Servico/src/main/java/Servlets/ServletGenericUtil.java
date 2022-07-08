package Servlets;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DAOLoginRepository;
import Dao.DAOUsuarioPosLogin;


public class ServletGenericUtil extends HttpServlet  implements Serializable {
	private static final long serialVersionUID = 1L;
    
	private DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();
	
	public Long getUserLogado(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();

		String usuarioLogado = (String) session.getAttribute("usuario");

		return daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();
	}

}
