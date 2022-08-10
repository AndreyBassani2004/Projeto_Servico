package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DAOAvaliarRequisicao;
import Dao.DAOSistemaAdmRepository;
import Dao.DAOUsuarioPosLogin;
import Model.ModelAvaliacao;

@WebServlet("/ServletAvaliarAvaliacao")
public class ServletAvaliarAvaliacao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();
	DAOAvaliarRequisicao daoAvaliarRequisicao = new DAOAvaliarRequisicao();
	DAOSistemaAdmRepository daoSistemaAdmRepository = new DAOSistemaAdmRepository();

	public ServletAvaliarAvaliacao() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");

		try {

			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarAvaliacao")) {

				String id_user = request.getParameter("id_user");

				String id_anuncio = request.getParameter("id_anuncio");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("ADMIN")) {

					ModelAvaliacao modelAvaliacao = daoSistemaAdmRepository
							.consultaAvaliacao(Long.parseLong(id_anuncio));

					request.setAttribute("modelAvaliacao", modelAvaliacao);
					request.getRequestDispatcher("principal/carregarAvaliacao.jsp").forward(request, response);

				} else {
					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("alterar")) {

				String id_user = request.getParameter("id_user");

				String id_avaliacao = request.getParameter("id_avaliacao");
				
				String situacao = request.getParameter("situacao");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("ADMIN")) {
					
					ModelAvaliacao modelAvaliacao = new ModelAvaliacao();
					
					modelAvaliacao.setId(Long.parseLong(id_avaliacao));
					modelAvaliacao.setId_adm_alterador(id_usuario);
					modelAvaliacao.setEstado(situacao);
					
					daoSistemaAdmRepository.atualizarAvaliacao(modelAvaliacao);
					
					request.getRequestDispatcher("principal/averiguarAvaliacaoSuc2.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}

			} else {
				request.getRequestDispatcher("principal/principal.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("erro.jsp").forward(request, response);

		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
