package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import Dao.DAOCarregarPublicoRepository;
import Model.ModelAvaliacao;

@MultipartConfig
@WebServlet("/ServletCadastrarAvaliacao")
public class ServletCadastrarAvaliacao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DAOCarregarPublicoRepository daoCarregarPublicoRepository = new DAOCarregarPublicoRepository();

	public ServletCadastrarAvaliacao() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String id_prestador = request.getParameter("id");
			String nome_cliente = request.getParameter("nome_cliente");
			String email_cliente = request.getParameter("email_cliente");
			String data_prestacao = request.getParameter("data");
			String descricao_cliente = request.getParameter("descricao_cliente");
			String nota = request.getParameter("nota");
			String titulo_avaliacao = request.getParameter("titulo");
			String descricao = request.getParameter("descricao2");

			if (id_prestador != null && !id_prestador.isEmpty() && nome_cliente != null && !nome_cliente.isEmpty()
					&& email_cliente != null && !email_cliente.isEmpty() && data_prestacao != null
					&& !data_prestacao.isEmpty() && descricao_cliente != null && !descricao_cliente.isEmpty()
					&& nota != null && !nota.isEmpty() && titulo_avaliacao != null && !titulo_avaliacao.isEmpty()
					&& descricao != null && !descricao.isEmpty()) {

				ModelAvaliacao modelAvaliacao = new ModelAvaliacao();

				modelAvaliacao.setId_anuncio(Long.parseLong(id_prestador));
				modelAvaliacao.setNome_cliente(nome_cliente);
				modelAvaliacao.setEmail_cliente(email_cliente);
				modelAvaliacao.setData_prestacao(data_prestacao);
				modelAvaliacao.setDescricao_cliente(descricao_cliente);
				modelAvaliacao.setNota(Double.parseDouble(nota));
				modelAvaliacao.setTitulo(titulo_avaliacao);
				modelAvaliacao.setDescricao(descricao);
				
				if (ServletFileUpload.isMultipartContent(request)) {

					Part part = request.getPart("fileFoto"); /*Pega foto da tela*/
					byte[] foto = IOUtils.toByteArray(part.getInputStream());/*Converte imagem para byte*/
					String imagemBase64 = "data:image/"+ part.getContentType().split("\\/")[1] + ";base64," + new Base64().encodeBase64String(foto);

					modelAvaliacao.setFoto(imagemBase64);
					modelAvaliacao.setExtfoto(part.getContentType().split("\\/")[1]);
				}

				daoCarregarPublicoRepository.gravarAvaliacao(modelAvaliacao);

				RequestDispatcher redirecionar = request.getRequestDispatcher("sucessoAvaliacao.jsp");
				request.setAttribute("msg", "Operacao efetuado com sucesso!");
				redirecionar.forward(request, response);
			} else {

				ModelAvaliacao modelAvaliacao = new ModelAvaliacao();

				modelAvaliacao.setId_anuncio(Long.parseLong(id_prestador));
				modelAvaliacao.setNome_cliente(nome_cliente);
				modelAvaliacao.setEmail_cliente(email_cliente);
				modelAvaliacao.setData_prestacao(data_prestacao);
				modelAvaliacao.setDescricao_cliente(descricao_cliente);
				modelAvaliacao.setNota(Double.parseDouble(nota));
				modelAvaliacao.setTitulo(titulo_avaliacao);
				modelAvaliacao.setDescricao(descricao);

				RequestDispatcher redirecionar = request.getRequestDispatcher("avaliar.jsp");
				request.setAttribute("msg", "Preencha todos os campos");
				redirecionar.forward(request, response);
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
