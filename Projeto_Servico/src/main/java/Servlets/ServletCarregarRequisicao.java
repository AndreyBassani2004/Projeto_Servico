package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOAvaliarRequisicao;
import Model.ModelAvaliacao;
import Model.ModelDenunciaAnuncio;

@WebServlet("/ServletCarregarRequisicao")
public class ServletCarregarRequisicao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DAOAvaliarRequisicao daoAvaliarRequisicao = new DAOAvaliarRequisicao();

	public ServletCarregarRequisicao() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String acao = request.getParameter("acao");

			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarDenuncias")) {

				
				List<ModelDenunciaAnuncio> modelDenunciaAnuncios = daoAvaliarRequisicao.lisarDenunciaAnuncio();

				request.setAttribute("modelDenunciaAnuncios", modelDenunciaAnuncios);
				request.getRequestDispatcher("principal/validarDenunciaAnuncio.jsp").forward(request, response);

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarAvaliacoes")) {
				
				List<ModelAvaliacao> modelAvaliacaos = daoAvaliarRequisicao.listarAvaliacaoesValidar();
				
				request.setAttribute("modelAvaliacaos", modelAvaliacaos);
				request.getRequestDispatcher("principal/validarAvaliacao.jsp").forward(request, response);

				
			} else {
				request.getRequestDispatcher("principal/principal.jsp").forward(request, response);

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
