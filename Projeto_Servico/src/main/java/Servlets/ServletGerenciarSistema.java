package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DAOGerenciarSistemaRepository;
import Dao.DAOUsuarioPosLogin;
import Model.ModelAnuncio;
import Model.ModelAvaliacao;
import Model.ModelLogin;


@WebServlet("/ServletGerenciarSistema")
public class ServletGerenciarSistema extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();
	
	DAOGerenciarSistemaRepository daoGerenciarSistemaRepository = new DAOGerenciarSistemaRepository();
	
    public ServletGerenciarSistema() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String acao = request.getParameter("acao");
			
			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarAnunciosBanido")) {
				
				String id_user = request.getParameter("id_user");

				String paginar = request.getParameter("paginar");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("ADMIN")) {
					
					List<ModelAnuncio> modelAnuncios = daoGerenciarSistemaRepository.listarAnunciosBanido(Long.parseLong(paginar));
					
					request.setAttribute("modelAnuncios", modelAnuncios);
					request.setAttribute("totalPagina", daoGerenciarSistemaRepository.totalPaginaAnunciosBanido());
					request.getRequestDispatcher("principal/GerenciarAnunciosBanido.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);	
				}
				
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarAnuncioBanido")) {

				String id_user = request.getParameter("id_user");

				String paginar = request.getParameter("paginar");
				
				String id = request.getParameter("id"); 

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("ADMIN")) {
					
					ModelAnuncio modelAnuncio = daoGerenciarSistemaRepository.consultarAnuncioID(Long.parseLong(id));							
					
					ModelAvaliacao modelAvaliacao = daoGerenciarSistemaRepository.carregarNotaMediaAvaliacao(Long.parseLong(id));
					
					List<ModelAvaliacao> modelAvaliacaos = daoGerenciarSistemaRepository.listAvaliacaoPaginada(Long.parseLong(id), Integer.parseInt(paginar));					
					
					request.setAttribute("modelAvaliacaos", modelAvaliacaos);												
					request.setAttribute("modelAvaliacao", modelAvaliacao);												
					request.setAttribute("modelAnuncio", modelAnuncio);
					request.setAttribute("totalPagina", daoGerenciarSistemaRepository.totalPaginaAvaliacao(Long.parseLong(id)));
					request.getRequestDispatcher("principal/carregarAnuncioBanido.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("principal/principal.jsp").forward(request, response);
			}
			}	
		}catch (Exception e) {
			e.printStackTrace();

			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
