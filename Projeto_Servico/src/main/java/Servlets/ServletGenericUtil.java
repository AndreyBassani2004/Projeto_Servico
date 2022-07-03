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


public class ServletGenericUtil extends HttpServlet  implements Serializable {
	private static final long serialVersionUID = 1L;
    
	private DAOLoginRepository daoLoginRepository = new DAOLoginRepository();
	
	public Long getUserLogado(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();

		String usuarioLogado = (String) session.getAttribute("usuario");

		return daoLoginRepository.consultarUsuarioLogado(usuarioLogado).getId();
	}

}
