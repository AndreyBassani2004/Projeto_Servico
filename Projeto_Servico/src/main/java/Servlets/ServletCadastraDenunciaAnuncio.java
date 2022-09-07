package Servlets;

import java.io.IOException;

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

import Dao.DAOCarregarPublicoRepository;
import Model.ModelDenunciaAnuncio;

@MultipartConfig
@WebServlet(urlPatterns = {"/ServletCadastraDenunciaAnuncio"})
public class ServletCadastraDenunciaAnuncio extends ServletGenericUtil {
	private static final long serialVersionUID = 1L;

	DAOCarregarPublicoRepository daoCarregarPublicoRepository = new DAOCarregarPublicoRepository();
	
	public ServletCadastraDenunciaAnuncio() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String id_anuncio = request.getParameter("id");
			String nome_cliente = request.getParameter("nome_cliente");
			String email_cliente = request.getParameter("email_cliente");
			String motivo = request.getParameter("motivo");
			String descricao = request.getParameter("descricao");

			if (id_anuncio != null && !id_anuncio.isEmpty() && nome_cliente != null && !nome_cliente.isEmpty()
					&& email_cliente != null && !email_cliente.isEmpty() && motivo != null && !motivo.isEmpty()
					&& descricao != null && !descricao.isEmpty()) {

				ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();

				modelDenunciaAnuncio.setId_anuncio(Long.parseLong(id_anuncio));
				modelDenunciaAnuncio.setNome_cliente(nome_cliente);
				modelDenunciaAnuncio.setEmail_cliente(email_cliente);
				modelDenunciaAnuncio.setDescricao_denuncia(descricao);
				modelDenunciaAnuncio.setMotivo(motivo);
				
				if (ServletFileUpload.isMultipartContent(request)) {

					Part part = request.getPart("fileFoto"); /*Pega foto da tela*/
					byte[] foto = IOUtils.toByteArray(part.getInputStream());/*Converte imagem para byte*/
					String imagemBase64 = "data:image/"+ part.getContentType().split("\\/")[1] + ";base64," + new Base64().encodeBase64String(foto);

					modelDenunciaAnuncio.setFoto(imagemBase64);
					modelDenunciaAnuncio.setExtFoto(part.getContentType().split("\\/")[1]);
		
				}
				
				daoCarregarPublicoRepository.cadastrarDenuncia(modelDenunciaAnuncio);

				RequestDispatcher redirecionar = request.getRequestDispatcher("sucessoDenuncia.jsp");
				redirecionar.forward(request, response);

			} else {

				ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();

				modelDenunciaAnuncio.setId_anuncio(Long.parseLong(id_anuncio));
				modelDenunciaAnuncio.setNome_cliente(nome_cliente);
				modelDenunciaAnuncio.setEmail_cliente(email_cliente);
				modelDenunciaAnuncio.setDescricao_denuncia(descricao);
				modelDenunciaAnuncio.setMotivo(motivo);

				RequestDispatcher redirecionar = request.getRequestDispatcher("denuncia.jsp");
				request.setAttribute("msg", "Preencha todos os campos!");
				request.setAttribute("modelDenunciaAnuncio", modelDenunciaAnuncio);
				redirecionar.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
