package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DAOAnuncioRepository;
import Dao.DAOAvaliarRequisicao;
import Dao.DAOCarregarPublicoRepository;
import Dao.DAOSistemaAdmRepository;
import Dao.DAOUsuarioPosLogin;
import Model.ModelAnuncio;
import Model.ModelAvaliacao;
import Model.ModelDenunciaAnuncio;
import Model.ModelDenunciaAvaliacao;
import Model.ModelMensagem;

@WebServlet("/ServletCarregarRequisicao")
public class ServletCarregarRequisicao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DAOAvaliarRequisicao daoAvaliarRequisicao = new DAOAvaliarRequisicao();
	DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();
	DAOAnuncioRepository daoAnuncioRepository = new DAOAnuncioRepository();
	DAOCarregarPublicoRepository daoCarregarPublicoRepository = new DAOCarregarPublicoRepository();
	DAOSistemaAdmRepository daoSistemaAdmRepository = new DAOSistemaAdmRepository();

	public ServletCarregarRequisicao() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String acao = request.getParameter("acao");

			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarDenuncias")) {

				String id_user = request.getParameter("id_user");

				String paginar = request.getParameter("paginar");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("ADMIN")) {
					List<ModelDenunciaAnuncio> modelDenunciaAnuncios = daoAvaliarRequisicao
							.lisarDenunciaAnuncio(Long.parseLong(paginar));

					request.setAttribute("modelDenunciaAnuncios", modelDenunciaAnuncios);
					request.setAttribute("totalPagina", daoAvaliarRequisicao.totalPaginaDenunciaAnuncio());
					request.getRequestDispatcher("principal/validarDenunciaAnuncio.jsp").forward(request, response);
				} else {

					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}

			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarDenunciasAprovada")) {
				
				String id_user = request.getParameter("id_user");

				String paginar = request.getParameter("paginar");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("ADMIN")) {
					List<ModelDenunciaAnuncio> modelDenunciaAnuncios = daoAvaliarRequisicao
							.lisarDenunciaAnuncioAprovado(Long.parseLong(paginar));

					request.setAttribute("modelDenunciaAnuncios", modelDenunciaAnuncios);
					request.setAttribute("totalPagina", daoAvaliarRequisicao.totalPaginaDenunciaAnuncioAprovado());
					request.getRequestDispatcher("principal/ProvidenciaDenunciaAnuncio.jsp").forward(request, response);
				} else {

					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}
				
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarAvaliacoes")) {

				String id_user = request.getParameter("id_user");

				HttpSession session = request.getSession();

				String paginar = request.getParameter("paginar");

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("ADMIN")) {
					List<ModelAvaliacao> modelAvaliacaos = daoAvaliarRequisicao
							.listarAvaliacaoesValidar(Long.parseLong(paginar));

					request.setAttribute("modelAvaliacaos", modelAvaliacaos);
					request.setAttribute("totalPagina", daoAvaliarRequisicao.totalPaginaAvaliacao());
					request.getRequestDispatcher("principal/validarAvaliacao.jsp").forward(request, response);
				} else {

					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarDenunciaAvaliacoes")) {

				String id_user = request.getParameter("id_user");

				String paginar = request.getParameter("paginar");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("ADMIN")) {
					
					List<ModelDenunciaAvaliacao> modelDenunciaAvaliacaos = daoAvaliarRequisicao.listarDenunciaAvaliacao(Long.parseLong(paginar));

					request.setAttribute("modelDenunciaAvaliacaos", modelDenunciaAvaliacaos);
					request.setAttribute("totalPagina", daoAvaliarRequisicao.totalPaginaDenunciaAvaliacao());
					request.getRequestDispatcher("principal/validarDenunciaAvaliação.jsp").forward(request, response);

				} else {
					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarCriarAnuncio")) {

				String id_user = request.getParameter("id_user");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("PRESTADOR")) {

					Integer pagina = daoAnuncioRepository.quantidadeAnuncioUsuario(id_usuario);

					Integer maximo = 4;

					if (pagina >= maximo) {

						List<ModelAnuncio> modelAnuncios = daoAnuncioRepository.listAnuncio2((id_usuario));

						request.setAttribute("modelAnuncios", modelAnuncios);
						request.setAttribute("msg",
								"Numero maximo de 4 anuncios excedido! <br/> <b>Veja seus Anuncios abaixo:</b>");
						request.getRequestDispatcher("principal/Meus_Anuncios.jsp").forward(request, response);
					} else {
						request.getRequestDispatcher("principal/criarAnuncio.jsp").forward(request, response);
					}
				} else {
					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarMinhasAvaliacoes")) {

				//String paginar = request.getParameter("paginar");
				
				String id_user = request.getParameter("id_user");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("PRESTADOR")) {

					List<ModelAnuncio> modelAnuncios = daoAnuncioRepository.listAnuncio2((id_usuario));

					request.setAttribute("modelAnuncios", modelAnuncios);
					request.setAttribute("totalPagina", daoAvaliarRequisicao.totalPaginaAvaliacao());
					request.getRequestDispatcher("principal/MinhasAvaliacoes.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}

			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarVisualizacaoAnuncio")) {
				

				String id_user = request.getParameter("id_user");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("PRESTADOR")) {
					
					String id = request.getParameter("id_anuncio");
					
					String paginar = request.getParameter("paginar");
					
					ModelAnuncio modelAnuncio = daoCarregarPublicoRepository.consultarAnuncioID(Long.parseLong(id));
					
					ModelAvaliacao modelAvaliacao = daoCarregarPublicoRepository.carregarNotaMediaAvaliacao(Long.parseLong(id));
					
					List<ModelAvaliacao> modelAvaliacaos = daoCarregarPublicoRepository.listAvaliacaoPaginada(Long.parseLong(id), Integer.parseInt(paginar));
					
					request.setAttribute("modelAvaliacaos", modelAvaliacaos);												
					request.setAttribute("modelAvaliacao", modelAvaliacao);												
					request.setAttribute("modelAnuncio", modelAnuncio);	
					request.setAttribute("totalPagina", daoCarregarPublicoRepository.totalPagina2(Long.parseLong(id)));
					
					request.getRequestDispatcher("principal/AnuncioVisualizar.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}
				
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("denunciarAvaliacao")) {
			
				String id_avaliacao = request.getParameter("id");
				
				String id_anuncio = request.getParameter("id_anuncio");
				
				String id_user = request.getParameter("id_user");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("PRESTADOR")) {
					
					ModelDenunciaAvaliacao modelDenunciaAvaliacao = daoCarregarPublicoRepository.carregarDenunciaAvaliacao(Long.parseLong(id_avaliacao), Long.parseLong(id_anuncio));
					
					request.setAttribute("modelDenunciaAvaliacao", modelDenunciaAvaliacao);	
					request.getRequestDispatcher("principal/denunciarAvaliacao.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}
				
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("AvaliarDenunciaAvaliacao")) {	
				
				String id_avaliacao = request.getParameter("id_anuncio");
				
				String id_user = request.getParameter("id_user");

				String paginar = request.getParameter("paginar");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("ADMIN")) {
					
					ModelDenunciaAvaliacao modelDenunciaAvaliacao = daoAvaliarRequisicao.carregarDenunciaAvaliação(Long.parseLong(id_avaliacao));
					
					request.setAttribute("modelDenunciaAvaliacao", modelDenunciaAvaliacao);	
					request.getRequestDispatcher("principal/CarregarDenunciaAvaliacao.jsp").forward(request, response);
				} else {

					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}
			
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("CarregarProvidenciaDenunciaAnuncio")) {	
			
				
				String id_user = request.getParameter("id_user");

				String id_denuncia = request.getParameter("id_denuncia");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("ADMIN")) {

					ModelDenunciaAnuncio modelDenunciaAnuncio = daoSistemaAdmRepository
							.consultaDenunciaProvidencia(Long.parseLong(id_denuncia));

					request.setAttribute("modelDenunciaAnuncio", modelDenunciaAnuncio);
					request.getRequestDispatcher("/principal/carregarProvidenciaDenuncia.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}
				
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("ignorarDenunciaAnuncio")) {
				
				String id_user = request.getParameter("id_user");

				String paginar = "0";
				
				String id_denuncia = request.getParameter("id_denuncia");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("ADMIN")) {
					
					daoAvaliarRequisicao.ignorarDenunciaAnuncio(Long.parseLong(id_denuncia));
					
					List<ModelDenunciaAnuncio> modelDenunciaAnuncios = daoAvaliarRequisicao
							.lisarDenunciaAnuncioAprovado(Long.parseLong(paginar));

					request.setAttribute("modelDenunciaAnuncios", modelDenunciaAnuncios);
					request.setAttribute("msg", "Operação efetuada com sucesso!");
					request.setAttribute("totalPagina", daoAvaliarRequisicao.totalPaginaDenunciaAnuncioAprovado());
					request.getRequestDispatcher("principal/ProvidenciaDenunciaAnuncio.jsp").forward(request, response);
				} else {

					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}
			
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarMensagem")) {
				
				String paginar = request.getParameter("paginar");
				
				String id_user = request.getParameter("id_user");

				String id_denuncia = request.getParameter("id_denuncia");

				HttpSession session = request.getSession();

				String usuarioLogado = (String) session.getAttribute("usuario");

				Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();

				String perfil = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getPerfil();

				if (id_usuario.equals(Long.parseLong(id_user)) && perfil.equals("PRESTADOR")) {
				
					List<ModelMensagem> modelMensagems =
					daoAvaliarRequisicao.listarMensagensUser(id_usuario, Long.parseLong(paginar));
					
					request.setAttribute("ModelMensagems", modelMensagems);
					request.setAttribute("totalPagina", daoAvaliarRequisicao.totalPaginaMensagem(id_usuario));
					request.getRequestDispatcher("principal/mensagens.jsp").forward(request, response);
					
				}else {
					request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
				}
				
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
		doGet(request, response);
	}

}
