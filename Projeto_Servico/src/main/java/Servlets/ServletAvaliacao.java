package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOUsuarioPosLogin;

@WebServlet("/ServletAvaliacao")
public class ServletAvaliacao extends ServletGenericUtil {
	private static final long serialVersionUID = 1L;
    
	DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();
    
    public ServletAvaliacao() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		
		if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarPagina")) {
			
			
			
			request.getRequestDispatcher("principal/validarAvaliacao.jsp").forward(request, response);
		}
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
