package Servlets;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import Dao.DAOAnuncioRepository;
import Dao.DAOUsuarioPosLogin;
import Model.ModelAnuncio;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;

@MultipartConfig
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

			BufferedReader arqIn = new BufferedReader(new InputStreamReader(new FileInputStream("UTF-8"), "UTF-8"));
			
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
				
				if (ServletFileUpload.isMultipartContent(request)) {

					Part part = request.getPart("fileFoto"); /*Pega foto da tela*/
					byte[] foto = IOUtils.toByteArray(part.getInputStream());/*Converte imagem para byte*/
					String imagemBase64 = "data:image/"+ part.getContentType().split("\\/")[1] + ";base64," + new Base64().encodeBase64String(foto);
					
					modelAnuncio.setFoto(imagemBase64);
					modelAnuncio.setExtFoto(part.getContentType().split("\\/")[1]);

				}

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
