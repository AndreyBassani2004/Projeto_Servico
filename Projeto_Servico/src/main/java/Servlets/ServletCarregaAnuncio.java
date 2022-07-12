package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOAnuncioRepository;
import Dao.DAOUsuarioPosLogin;
import Model.ModelAnuncio;

@WebServlet(urlPatterns = { "/ServletCarregaAnuncio" })
public class ServletCarregaAnuncio extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();

	private DAOAnuncioRepository daoAnuncioRepository = new DAOAnuncioRepository();

	public ServletCarregaAnuncio() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String acao = request.getParameter("acao");

			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listarAnuncio")) {

				String id = request.getParameter("id_user");

				List<ModelAnuncio> modelAnuncios = daoAnuncioRepository.listAnuncio2(Long.parseLong(id));

				request.setAttribute("msg", "Anuncios da conta.");
				request.setAttribute("modelAnuncios", modelAnuncios);
				request.getRequestDispatcher("/principal/Meus_Anuncios.jsp").forward(request, response);

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarajax")) {
				String idUser = request.getParameter("id");

				daoAnuncioRepository.deletarAnuncio(Long.parseLong(idUser));

				String id = request.getParameter("id_user");

				List<ModelAnuncio> modelAnuncios = daoAnuncioRepository.listAnuncio2(Long.parseLong(id));

				request.setAttribute("msg", "Excluido com Sucesso!");
				request.setAttribute("modelAnuncios", modelAnuncios);
				request.getRequestDispatcher("/principal/Meus_Anuncios.jsp").forward(request, response);

			}

		} catch (Exception e) {
			e.printStackTrace();

			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
