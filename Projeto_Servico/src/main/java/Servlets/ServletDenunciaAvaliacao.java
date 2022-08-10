package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DAOSistemaAdmRepository;
import Dao.DAOUsuarioPosLogin;
import Model.ModelDenunciaAnuncio;

@WebServlet("/ServletDenunciaAvaliacao")
public class ServletDenunciaAvaliacao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DAOSistemaAdmRepository daoSistemaAdmRepository = new DAOSistemaAdmRepository();
	DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();

	public ServletDenunciaAvaliacao() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String acao = request.getParameter("acao");

			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarDenuncia")) {

				String id_user = request.getParameter("id_user");

				String id_denuncia = request.getParameter("id_denuncia");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("ADMIN")) {

					ModelDenunciaAnuncio modelDenunciaAnuncio = daoSistemaAdmRepository
							.consultaDenuncia(Long.parseLong(id_denuncia));

					request.setAttribute("modelDenunciaAnuncio", modelDenunciaAnuncio);
					request.getRequestDispatcher("/principal/carregarDenunciaAnuncio.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("erro.jsp").forward(request, response);
		}

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
