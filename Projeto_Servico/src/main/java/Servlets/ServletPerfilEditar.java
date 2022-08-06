package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DAOUsuarioPosLogin;

@WebServlet("/ServletPerfilEditar")
public class ServletPerfilEditar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();

 
    public ServletPerfilEditar() {
        super();     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		String acao = (String) request.getAttribute("acao");
		
		if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarPerfil")) {
			
			HttpSession session = request.getSession();

			String usuarioLogado = (String) session.getAttribute("usuario");

			Long id_session = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

			
			
			
		}else {
			request.getRequestDispatcher("principal/principal.jsp").forward(request, response);
		}
		
		}catch (Exception e) {
			e.printStackTrace();

			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
			
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
