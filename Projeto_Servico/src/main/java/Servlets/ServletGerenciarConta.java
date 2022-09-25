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


@WebServlet("/ServletGerenciarConta")
public class ServletGerenciarConta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();
   
    public ServletGerenciarConta() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		
		String acao = request.getParameter("acao");
		
		if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarUsuariosAdms")) {
			
			String id_user = request.getParameter("id_user");

			String paginar = request.getParameter("paginar");

			HttpSession session = request.getSession();

			String usuarioLogado = (String) session.getAttribute("usuario");

			Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

			String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

			if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("ADMIN")) {
				request.getRequestDispatcher("principal/gerenciarADMS.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);	
			}
			
		}else {
			request.getRequestDispatcher("principal/principal.jsp").forward(request, response);
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		}catch (Exception e) {
			e.printStackTrace();

			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}