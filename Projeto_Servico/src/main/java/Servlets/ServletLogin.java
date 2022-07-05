package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOLoginRepository;
import Dao.DAOUsuarioPosLogin;
import Model.ModelLogin;

@WebServlet(urlPatterns = {"/principal/ServletLogin","/ServletLogin"})
public class ServletLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private DAOLoginRepository daoLoginRepository = new DAOLoginRepository();
	private DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();
	
	public ServletLogin() {

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		
	try {	
		
		if(acao !=null && !acao.isEmpty() && acao.equalsIgnoreCase("logout")) {
			request.getSession().invalidate();//invalidar
		    RequestDispatcher redirecionar = request.getRequestDispatcher("/login.jsp");
			redirecionar.forward(request, response);

		}else {

		doPost(request, response);
		}
	}catch (Exception e) {
		e.printStackTrace();
		 RequestDispatcher redirecionar = request.getRequestDispatcher("/erro.jsp");
		 redirecionar.forward(request, response);
	}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String url = request.getParameter("url");

		try {

			if (login != null && !login.isEmpty() && senha != null && !senha.isEmpty()) {

				ModelLogin modelLogin = new ModelLogin();
				modelLogin.setLogin(login);
				modelLogin.setSenha(senha);

				if (daoLoginRepository.validarAutenticacao(modelLogin)) {
					
					modelLogin = daoUsuarioPosLogin.consultaUsuarioLogado(login);
					
					request.getSession().setAttribute("isAdmin", modelLogin.getUseradmin());
					request.getSession().setAttribute("usuario", modelLogin.getLogin());
					request.getSession().setAttribute("perfil", modelLogin.getPerfil());
					request.getSession().setAttribute("nome", modelLogin.getNome());
					request.getSession().setAttribute("senha", modelLogin.getSenha());
					request.getSession().setAttribute("telefone", modelLogin.getTelefone());
					request.getSession().setAttribute("estado", modelLogin.getEstado());
					request.getSession().setAttribute("telefone_contato", modelLogin.getTelefone());
					request.getSession().setAttribute("cidade", modelLogin.getCidade());
					request.getSession().setAttribute("cep", modelLogin.getLogradouro());

					if (url == null || url.equals("null")) {
						url = "/principal/principal.jsp";

					}

					RequestDispatcher redirecionar = request.getRequestDispatcher(url);
					redirecionar.forward(request, response);
				} else {
					RequestDispatcher redirecionar = request.getRequestDispatcher("/login.jsp");
					request.setAttribute("msg", "Senha ou Login incorreto");
					redirecionar.forward(request, response);

				}

			} else {
				RequestDispatcher redirecionar = request.getRequestDispatcher("login.jsp");
				request.setAttribute("msg", "Preencha todos os campos");
				redirecionar.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("/erro.jsp");
			redirecionar.forward(request, response);
		}
		
	}

}
	

