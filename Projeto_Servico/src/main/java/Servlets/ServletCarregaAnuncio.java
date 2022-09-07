package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import Dao.DAOAnuncioRepository;
import Dao.DAOUsuarioPosLogin;
import Model.ModelAnuncio;

@MultipartConfig
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
				
				String id_user = request.getParameter("id_user");
				
				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				String msg = "";
				
				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();
				
				Long id_usuario = (daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId());
				
				if(id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("PRESTADOR")) {

				List<ModelAnuncio> modelAnuncios = daoAnuncioRepository
						.listAnuncio2((id_usuario));

				request.setAttribute("msg", msg);
				request.setAttribute("modelAnuncios", modelAnuncios);
				request.getRequestDispatcher("/principal/Meus_Anuncios.jsp").forward(request, response);
				}else {
					RequestDispatcher redirecionar = request.getRequestDispatcher("principal/erro404.jsp");
					redirecionar.forward(request, response);
				}

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarajax")) {
				
				String id_user = request.getParameter("id_user");
				
				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				String msg = "Excluido com Sucesso!";
				
				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();
				
				Long id_usuario = (daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId());
				
				if(id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("PRESTADOR")) {	
				
				String id_anuncio = request.getParameter("id");
				
				if(daoAnuncioRepository.ExisteAvaliacao(Long.parseLong(id_anuncio))) {
					msg = "Este anuncio não pode ser excluido! <br><b>Ele possuí avaliação, somente pode ser pausado.</b>";
				}else {

				daoAnuncioRepository.deleteAnuncioDenuncias(Long.parseLong(id_anuncio));
				daoAnuncioRepository.deletarAnuncio(Long.parseLong(id_anuncio), id_usuario);
				}
				
				String idUser = request.getParameter("id_user");

				List<ModelAnuncio> modelAnuncios = daoAnuncioRepository.listAnuncio2(Long.parseLong(idUser));

				request.setAttribute("msg", msg);
				request.setAttribute("modelAnuncios", modelAnuncios);
				request.getRequestDispatcher("/principal/Meus_Anuncios.jsp").forward(request, response);
				}else {
					RequestDispatcher redirecionar = request.getRequestDispatcher("principal/erro404.jsp");
					redirecionar.forward(request, response);
				}

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarAnuncio")) {
				String idUser = request.getParameter("id");

				String id_Anuncio = request.getParameter("id_anuncio");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");
				
				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();
				
				Long id_usuario = (daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId());

				if (id_usuario.equals(Long.parseLong(idUser)) && perfil.equals("PRESTADOR")) {
					ModelAnuncio modelAnuncio = daoAnuncioRepository.consultarAnuncioID(id_usuario,
							Long.parseLong(id_Anuncio));

					if(modelAnuncio.getSituacao().equals("BANIDO")) {
						RequestDispatcher redirecionar = request.getRequestDispatcher("principal/erro404.jsp");
						redirecionar.forward(request, response);
					}else {
					
					request.setAttribute("modelAnuncio", modelAnuncio);
					request.getRequestDispatcher("principal/carregarAnuncio.jsp").forward(request, response);
					}
				}else {
					RequestDispatcher redirecionar = request.getRequestDispatcher("principal/erro404.jsp");
					redirecionar.forward(request, response);
				}

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

			if (servico == null || servico.isEmpty() || regiao == null || regiao.isEmpty() || titulo == null
					|| titulo.isEmpty() || descricao == null || descricao.isEmpty()) {
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
				
				if (ServletFileUpload.isMultipartContent(request)) {

					Part part = request.getPart("fileFoto"); /*Pega foto da tela*/
					byte[] foto = IOUtils.toByteArray(part.getInputStream());/*Converte imagem para byte*/
					String imagemBase64 = "data:image/"+ part.getContentType().split("\\/")[1] + ";base64," + new Base64().encodeBase64String(foto);
					
					modelAnuncio.setFoto(imagemBase64);
					modelAnuncio.setExtFoto(part.getContentType().split("\\/")[1]);

				}

				daoAnuncioRepository.updateAnuncio(modelAnuncio);

				modelAnuncio = daoAnuncioRepository.consultarAnuncioID2(Long.parseLong(id));
				
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
