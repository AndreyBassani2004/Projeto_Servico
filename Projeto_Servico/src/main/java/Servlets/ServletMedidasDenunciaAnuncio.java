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
import Model.ModelDenunciaAnuncio;
import Model.ModelMensagem;


@WebServlet(urlPatterns = {"/ServletMedidasDenunciaAnuncio"})
public class ServletMedidasDenunciaAnuncio extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	DAOAvaliarRequisicao daoAvaliarRequisicao = new DAOAvaliarRequisicao();
   
    public ServletMedidasDenunciaAnuncio() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
						
			String id_anuncio = request.getParameter("id_anuncio");
			String id_denuncia = request.getParameter("id");
			
			String id_adm = request.getParameter("id_adm_2");
			String providencia = request.getParameter("providencia");
			String tituloMensagem = request.getParameter("tituloMensagem");
			String mensagem = request.getParameter("mensagem");
			String id_prestador = request.getParameter("id_prestador");
			
			if(providencia.equals("MensagemAlerta")) {
				
				ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();
				
				modelDenunciaAnuncio.setId(Long.parseLong(id_denuncia));
				modelDenunciaAnuncio.setId_anuncio(Long.parseLong(id_anuncio));
				modelDenunciaAnuncio.setSituacao(providencia);
				
				daoAvaliarRequisicao.providenciaDenunciaAnuncioAtualizar(modelDenunciaAnuncio);
				
				ModelMensagem modelMensagem = new ModelMensagem();
				
				modelMensagem.setId_destinatario(Long.parseLong(id_prestador));
				modelMensagem.setId_remetente(Long.parseLong(id_adm));
				modelMensagem.setMensagem(mensagem);
				modelMensagem.setTitulo(tituloMensagem);
				
				daoAvaliarRequisicao.EnviarMensagem(modelMensagem);
				
				String paginar = "0";
				
				List<ModelDenunciaAnuncio> modelDenunciaAnuncios = daoAvaliarRequisicao
						.lisarDenunciaAnuncioAprovado(Long.parseLong(paginar));

				request.setAttribute("modelDenunciaAnuncios", modelDenunciaAnuncios);
				request.setAttribute("msg", "Operação efetuada com sucesso!");
				request.setAttribute("totalPagina", daoAvaliarRequisicao.totalPaginaDenunciaAnuncioAprovado());
				request.getRequestDispatcher("principal/ProvidenciaDenunciaAnuncio.jsp").forward(request, response);
				
			}else if(providencia.equals("ExcluirAnuncio")) {
				
				ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();
				
				modelDenunciaAnuncio.setId(Long.parseLong(id_denuncia));
				modelDenunciaAnuncio.setId_anuncio(Long.parseLong(id_anuncio));
				modelDenunciaAnuncio.setSituacao(providencia);
				
				daoAvaliarRequisicao.providenciaDenunciaAnuncioAtualizar(modelDenunciaAnuncio);
				
				ModelMensagem modelMensagem = new ModelMensagem();
				
				modelMensagem.setId_destinatario(Long.parseLong(id_prestador));
				modelMensagem.setId_remetente(Long.parseLong(id_adm));
				modelMensagem.setMensagem(mensagem);
				modelMensagem.setTitulo(tituloMensagem);
				
				daoAvaliarRequisicao.EnviarMensagem(modelMensagem);
				
				daoAvaliarRequisicao.desativarAnuncio(Long.parseLong(id_anuncio));
				
				String paginar = "0";
				
				List<ModelDenunciaAnuncio> modelDenunciaAnuncios = daoAvaliarRequisicao
						.lisarDenunciaAnuncioAprovado(Long.parseLong(paginar));

				request.setAttribute("modelDenunciaAnuncios", modelDenunciaAnuncios);
				request.setAttribute("msg", "Operação efetuada com sucesso!");
				request.setAttribute("totalPagina", daoAvaliarRequisicao.totalPaginaDenunciaAnuncioAprovado());
				request.getRequestDispatcher("principal/ProvidenciaDenunciaAnuncio.jsp").forward(request, response);
				
			}else if(providencia.equals("BanirConta")){
				
				ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();
				
				modelDenunciaAnuncio.setId(Long.parseLong(id_denuncia));
				modelDenunciaAnuncio.setId_anuncio(Long.parseLong(id_anuncio));
				modelDenunciaAnuncio.setSituacao(providencia);
				
				daoAvaliarRequisicao.providenciaDenunciaAnuncioAtualizar(modelDenunciaAnuncio);
				
				ModelMensagem modelMensagem = new ModelMensagem();
				
				modelMensagem.setId_destinatario(Long.parseLong(id_prestador));
				modelMensagem.setId_remetente(Long.parseLong(id_adm));
				modelMensagem.setMensagem(mensagem);
				modelMensagem.setTitulo(tituloMensagem);
				
				daoAvaliarRequisicao.EnviarMensagem(modelMensagem);
				
				daoAvaliarRequisicao.desativarAnuncio(Long.parseLong(id_anuncio));
				
				daoAvaliarRequisicao.desativarConta(Long.parseLong(id_prestador));
				
				String paginar = "0";
				
				List<ModelDenunciaAnuncio> modelDenunciaAnuncios = daoAvaliarRequisicao
						.lisarDenunciaAnuncioAprovado(Long.parseLong(paginar));

				request.setAttribute("modelDenunciaAnuncios", modelDenunciaAnuncios);
				request.setAttribute("msg", "Operação efetuada com sucesso!");
				request.setAttribute("totalPagina", daoAvaliarRequisicao.totalPaginaDenunciaAnuncioAprovado());
				request.getRequestDispatcher("principal/ProvidenciaDenunciaAnuncio.jsp").forward(request, response);
				
			}else {
				request.getRequestDispatcher("principal/erro404.jsp").forward(request, response);
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
