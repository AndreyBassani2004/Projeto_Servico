package Servlets;

import java.io.Serializable;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
