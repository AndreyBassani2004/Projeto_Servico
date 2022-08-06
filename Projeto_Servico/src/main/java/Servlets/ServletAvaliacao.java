package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOUsuarioPosLogin;
import Model.ModelAnuncio;
import Model.ModelLogin;


@WebServlet("/ServletAvaliacao")
public class ServletAvaliacao extends ServletGenericUtil {
	private static final long serialVersionUID = 1L;
    
	DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();
    
    public ServletAvaliacao() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao = request.getParameter("acao");
		
		//ModelLogin modelLogin = new ModelLogin();
		
		//String id_prestador = daoUsuarioPosLogin.consultaUsuarioId(Long.parseLong(id_prestador));
		
		if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarPagina")) {
			
			
			String id = request.getParameter("id_user");
			
	     //   String usuario = (String) request.getSession().getAttribute("usuario");
	        
	       // System.out.println(usuario);
			
			request.getRequestDispatcher("principal/validarAvaliacao.jsp").forward(request, response);
		}
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
