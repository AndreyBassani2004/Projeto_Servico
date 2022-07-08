package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ModelAnuncio;

@WebServlet("/ServletCadastraAnuncio")
public class ServletCadastraAnuncio extends HttpServlet {
	private static final long serialVersionUID = 1L;

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

			String servico = request.getParameter("servico");
			String estado = request.getParameter("uf");
			String regiao = request.getParameter("regiao");
			String titulo = request.getParameter("tituloAn");
			String descricao = request.getParameter("descricao");
			String emailContato = request.getParameter("emailContato");

			String msg = "Cadastrado com sucesso !";

			if (servico == null && servico.isEmpty() && regiao == null && regiao.isEmpty() && titulo == null
					&& titulo.isEmpty() && descricao == null && descricao.isEmpty()) {
				msg = "Preencha todos os campos !";
			} else {

				ModelAnuncio modelAnuncio = new ModelAnuncio();

				modelAnuncio.setServico(servico);
				modelAnuncio.setEstdado(estado);
				modelAnuncio.setRegiao(regiao);
				modelAnuncio.setTitulo(titulo);
				modelAnuncio.setDescricao(descricao);
				modelAnuncio.setEmailContato(emailContato);

				msg = "Cadastrado com sucesso !";

				request.setAttribute("msg", msg);
				request.setAttribute("modelAnuncio", modelAnuncio);
				request.getRequestDispatcher("/principal/criarAnuncio.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
