package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOAnuncioRepository;
import Dao.DAOUsuarioPosLogin;
import Model.ModelAnuncio;
import Model.ModelLogin;

@WebServlet(urlPatterns = { "/ServletCadastraAnuncio" })
public class ServletCadastraAnuncio extends ServletGenericUtil {
	private static final long serialVersionUID = 1L;

	private DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();

	private DAOAnuncioRepository daoAnuncioRepository = new DAOAnuncioRepository();

	//private ModelLogin modelLogin = new ModelLogin();

	public ServletCadastraAnuncio() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String id_prestador = request.getParameter("id");
			String servico = request.getParameter("servico");
			String estado = request.getParameter("uf2");
			String regiao = request.getParameter("regiao");
			String titulo = request.getParameter("tituloAn");
			String descricao = request.getParameter("descricao");
			String emailContato = request.getParameter("emailContato");

			String msg = "Cadastrado com sucesso !";

			if (servico == null && servico.isEmpty() && regiao == null && regiao.isEmpty() && titulo == null
					&& titulo.isEmpty() && descricao == null && descricao.isEmpty()) {
				ModelAnuncio modelAnuncio = new ModelAnuncio();

				modelAnuncio.setId_prestador(daoUsuarioPosLogin.consultaUsuarioId(Long.parseLong(id_prestador)));
				modelAnuncio.setServico(servico);
				modelAnuncio.setEstado(estado);
				modelAnuncio.setRegiao(regiao);
				modelAnuncio.setTitulo(titulo);
				modelAnuncio.setDescricao(descricao);
				modelAnuncio.setEmail_contato(emailContato);

				request.setAttribute("msg", "Preencha todos os campos !");
				request.setAttribute("modelAnuncio", modelAnuncio);
				request.getRequestDispatcher("/principal/criarAnuncio.jsp").forward(request, response);
			} else {
				ModelAnuncio modelAnuncio = new ModelAnuncio();

				modelAnuncio.setId_prestador(daoUsuarioPosLogin.consultaUsuarioId(Long.parseLong(id_prestador)));
				modelAnuncio.setServico(servico);
				modelAnuncio.setEstado(estado);
				modelAnuncio.setRegiao(regiao);
				modelAnuncio.setTitulo(titulo);
				modelAnuncio.setDescricao(descricao);
				modelAnuncio.setEmail_contato(emailContato);

				daoAnuncioRepository.gravaAnuncio(modelAnuncio);

				msg = "Cadastrado com sucesso !";

				request.setAttribute("msg", msg);
				request.setAttribute("modelAnuncio", modelAnuncio);
				request.getRequestDispatcher("/principal/cadastroAnSuc.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();

			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}

		doGet(request, response);
	}

}
