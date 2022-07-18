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
				
				String msg = "";

				List<ModelAnuncio> modelAnuncios = daoAnuncioRepository.listAnuncio2(Long.parseLong(id));

				
				request.setAttribute("msg", msg);
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

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarAnuncio")) {
				String idUser = request.getParameter("id");
				
				String id_Anuncio = request.getParameter("id_anuncio");
				
				ModelAnuncio modelAnuncio = daoAnuncioRepository.consultarAnuncioID(Long.parseLong(idUser), Long.parseLong(id_Anuncio));

				request.setAttribute("modelAnuncio", modelAnuncio);
				request.getRequestDispatcher("principal/carregarAnuncio.jsp").forward(request, response);
			}else {			
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

		try {

			String id = request.getParameter("id");
			String servico = request.getParameter("servico");
			String estado = request.getParameter("uf2");
			String regiao = request.getParameter("regiao");
			String titulo = request.getParameter("tituloAn");
			String descricao = request.getParameter("descricao");
			String emailContato = request.getParameter("emailContato");
			String situacao = request.getParameter("situacao");


			String msg = "Cadastrado com sucesso !";

			if (servico == null && servico.isEmpty() && regiao == null && regiao.isEmpty() && titulo == null
					&& titulo.isEmpty() && descricao == null && descricao.isEmpty()) {
				ModelAnuncio modelAnuncio = new ModelAnuncio();

				modelAnuncio.setId(Long.parseLong(id));
				modelAnuncio.setServico(servico);
				modelAnuncio.setEstado(estado);
				modelAnuncio.setRegiao(regiao);
				modelAnuncio.setTitulo(titulo);
				modelAnuncio.setDescricao(descricao);
				modelAnuncio.setEmail_contato(emailContato);
				modelAnuncio.setSituacao(situacao);

				request.setAttribute("msg", "Preencha todos os campos !");
				request.setAttribute("modelAnuncio", modelAnuncio);
				request.getRequestDispatcher("/principal/carregarAnuncio.jsp").forward(request, response);
			} else {
				ModelAnuncio modelAnuncio = new ModelAnuncio();

				modelAnuncio.setId(Long.parseLong(id));
				modelAnuncio.setServico(servico);
				modelAnuncio.setEstado(estado);
				modelAnuncio.setRegiao(regiao);
				modelAnuncio.setTitulo(titulo);
				modelAnuncio.setDescricao(descricao);
				modelAnuncio.setEmail_contato(emailContato);
				modelAnuncio.setSituacao(situacao);

				daoAnuncioRepository.updateAnuncio(modelAnuncio);

				msg = "Alterado com sucesso !";

				request.setAttribute("msg", msg);
				request.setAttribute("modelAnuncio", modelAnuncio);
				request.getRequestDispatcher("/principal/carregarAnuncio.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();

			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}

	}

}