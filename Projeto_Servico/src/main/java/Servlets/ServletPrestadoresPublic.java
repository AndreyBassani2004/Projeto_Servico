package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOCarregarPublicoRepository;
import Model.ModelAnuncio;
import Model.ModelAvaliacao;
import Model.ModelDenunciaAnuncio;

@WebServlet("/ServletPrestadores")
public class ServletPrestadoresPublic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DAOCarregarPublicoRepository daoCarregarPublicoRepository = new DAOCarregarPublicoRepository();

	public ServletPrestadoresPublic() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String acao = request.getParameter("acao");

			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listar")) {

				String categoria = "alvenaria";

				String msg = categoria;

				List<ModelAnuncio> modelAnuncios = daoCarregarPublicoRepository.listAnuncio2(categoria);

				request.setAttribute("msg", msg);
				request.setAttribute("modelAnuncios", modelAnuncios);
				request.setAttribute("totalPagina", daoCarregarPublicoRepository.totalPagina(categoria));
				request.getRequestDispatcher("/alvenaria.jsp").forward(request, response);
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("paginar")) {

				String categoria = "alvenaria";

				String msg = categoria;

				Integer offset = Integer.parseInt(request.getParameter("pagina"));

				List<ModelAnuncio> modelAnuncios = daoCarregarPublicoRepository.listAnuncioPaginada(categoria, offset);

				request.setAttribute("msg", msg);
				request.setAttribute("modelAnuncios", modelAnuncios);
				request.setAttribute("totalPagina", daoCarregarPublicoRepository.totalPagina(categoria));
				request.getRequestDispatcher("/alvenaria.jsp").forward(request, response);

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listar2")) {
				String categoria = "eletricista";

				String msg = categoria;

				List<ModelAnuncio> modelAnuncios = daoCarregarPublicoRepository.listAnuncio2(categoria);

				request.setAttribute("msg", msg);
				request.setAttribute("modelAnuncios", modelAnuncios);
				request.setAttribute("totalPagina", daoCarregarPublicoRepository.totalPagina(categoria));
				request.getRequestDispatcher("/eletricista.jsp").forward(request, response);
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("paginar2")) {
				String categoria = "eletricista";

				String msg = categoria;

				Integer offset = Integer.parseInt(request.getParameter("pagina"));

				List<ModelAnuncio> modelAnuncios = daoCarregarPublicoRepository.listAnuncioPaginada(categoria, offset);

				request.setAttribute("msg", msg);
				request.setAttribute("modelAnuncios", modelAnuncios);
				request.setAttribute("totalPagina", daoCarregarPublicoRepository.totalPagina(categoria));
				request.getRequestDispatcher("/eletricista.jsp").forward(request, response);
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listar3")) {
				String categoria = "faztudo";

				String msg = categoria;

				List<ModelAnuncio> modelAnuncios = daoCarregarPublicoRepository.listAnuncio2(categoria);

				request.setAttribute("msg", msg);
				request.setAttribute("modelAnuncios", modelAnuncios);
				request.setAttribute("totalPagina", daoCarregarPublicoRepository.totalPagina(categoria));
				request.getRequestDispatcher("/faztudo.jsp").forward(request, response);
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("paginar3")) {
				String categoria = "faztudo";

				String msg = categoria;

				Integer offset = Integer.parseInt(request.getParameter("pagina"));

				List<ModelAnuncio> modelAnuncios = daoCarregarPublicoRepository.listAnuncioPaginada(categoria, offset);

				request.setAttribute("msg", msg);
				request.setAttribute("modelAnuncios", modelAnuncios);
				request.setAttribute("totalPagina", daoCarregarPublicoRepository.totalPagina(categoria));
				request.getRequestDispatcher("/faztudo.jsp").forward(request, response);
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listar4")) {
				String categoria = "encanador";

				String msg = categoria;

				List<ModelAnuncio> modelAnuncios = daoCarregarPublicoRepository.listAnuncio2(categoria);

				request.setAttribute("msg", msg);
				request.setAttribute("modelAnuncios", modelAnuncios);
				request.setAttribute("totalPagina", daoCarregarPublicoRepository.totalPagina(categoria));
				request.getRequestDispatcher("/encanador.jsp").forward(request, response);
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("paginar4")) {
				String categoria = "encanador";

				String msg = categoria;

				Integer offset = Integer.parseInt(request.getParameter("pagina"));

				List<ModelAnuncio> modelAnuncios = daoCarregarPublicoRepository.listAnuncioPaginada(categoria, offset);

				request.setAttribute("msg", msg);
				request.setAttribute("modelAnuncios", modelAnuncios);
				request.setAttribute("totalPagina", daoCarregarPublicoRepository.totalPagina(categoria));
				request.getRequestDispatcher("/encanador.jsp").forward(request, response);
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("perfil")) {
				
				String id = request.getParameter("id");
				
				String paginar = request.getParameter("paginar");
				
				ModelAnuncio modelAnuncio = daoCarregarPublicoRepository.consultarAnuncioID(Long.parseLong(id));
				
				ModelAvaliacao modelAvaliacao = daoCarregarPublicoRepository.carregarNotaMediaAvaliacao(Long.parseLong(id));
				
				List<ModelAvaliacao> modelAvaliacaos = daoCarregarPublicoRepository.listAvaliacaoPaginada(Long.parseLong(id), Integer.parseInt(paginar));
				
				request.setAttribute("modelAvaliacaos", modelAvaliacaos);												
				request.setAttribute("modelAvaliacao", modelAvaliacao);												
				request.setAttribute("modelAnuncio", modelAnuncio);	
				request.setAttribute("totalPagina", daoCarregarPublicoRepository.totalPagina2(Long.parseLong(id)));
				request.getRequestDispatcher("/perfil.jsp").forward(request, response);
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("avaliar")) {
				
				String id = request.getParameter("id");
				
				ModelAvaliacao modelAvaliacao = daoCarregarPublicoRepository.carregarAnuncioAvaliarID(Long.parseLong(id));
				
				request.setAttribute("modelAvaliacao", modelAvaliacao);												
				request.getRequestDispatcher("/avaliar.jsp").forward(request, response);
			
			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("denuncia")) {
				
				String id = request.getParameter("id");
				
				ModelDenunciaAnuncio modelDenunciaAnuncio = daoCarregarPublicoRepository.carregarAnuncioDenunciaID(Long.parseLong(id));
				
				request.setAttribute("modelDenunciaAnuncio", modelDenunciaAnuncio);	
				request.getRequestDispatcher("/denunciar.jsp").forward(request, response);
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("inicio")) {
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("quemsomos")) {
				request.getRequestDispatcher("/quemsomos.jsp").forward(request, response);
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("trabalheConosco")) {
				request.getRequestDispatcher("/trabalheconosco.jsp").forward(request, response);
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("cadastrase")) {
				request.getRequestDispatcher("/cadastrase.jsp").forward(request, response);
			}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("login")) {
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("/erro.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
