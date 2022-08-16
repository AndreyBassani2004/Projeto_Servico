package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DAOAvaliarRequisicao;
import Dao.DAOUsuarioPosLogin;
import Model.ModelAnuncio;
import Model.ModelDenunciaAvaliacao;


@WebServlet(urlPatterns = {"/ServletSDenunciaAvaliacao"})
public class ServletSalvarDenunciaAvaliacao extends ServletGenericUtil {
	private static final long serialVersionUID = 1L;
    
	private DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();
	
	private DAOAvaliarRequisicao daoAvaliarRequisicao = new DAOAvaliarRequisicao();
	
	ModelDenunciaAvaliacao modelDenunciaAvaliacao = new ModelDenunciaAvaliacao();
	
    public ServletSalvarDenunciaAvaliacao() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			
			String usuarioLogado = (String) session.getAttribute("usuario");

			Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();
	
			String id_avaliacao = request.getParameter("id_avaliacao");
			String id_anuncio = request.getParameter("id_anuncio");
			String descricao_denuncia = request.getParameter("descricao_denuncia");
			String motivo = request.getParameter("motivo");
			
			String msg = "Cadastrado com sucesso!";
			
			
			if(id_avaliacao.isEmpty()) {
				ModelDenunciaAvaliacao modelDenunciaAvaliacao = new ModelDenunciaAvaliacao();
				
				modelDenunciaAvaliacao.setId_prestador(id_usuario);
				modelDenunciaAvaliacao.setId_avaliacao(Long.parseLong(id_avaliacao));
				modelDenunciaAvaliacao.setId_anuncio(Long.parseLong(id_anuncio));
				modelDenunciaAvaliacao.setDescricao(descricao_denuncia);
				modelDenunciaAvaliacao.setMotivo(motivo);
				
				
				request.setAttribute("msg", "Preencha todos os campos !");
				request.setAttribute("modelDenunciaAvaliacao", modelDenunciaAvaliacao);
				request.getRequestDispatcher("/principal/criarAnuncio.jsp").forward(request, response);
			}else {
				
				ModelDenunciaAvaliacao modelDenunciaAvaliacao = new ModelDenunciaAvaliacao();
				
				modelDenunciaAvaliacao.setId_prestador(id_usuario);
				modelDenunciaAvaliacao.setId_avaliacao(Long.parseLong(id_avaliacao));
				modelDenunciaAvaliacao.setId_anuncio(Long.parseLong(id_anuncio));
				modelDenunciaAvaliacao.setDescricao(descricao_denuncia);
				modelDenunciaAvaliacao.setMotivo(motivo);
				
				daoUsuarioPosLogin.gravarDenunciaAvaliacao(modelDenunciaAvaliacao);
				
				msg = "Cadastrado com sucesso !";

				request.setAttribute("msg", msg);
				request.getRequestDispatcher("/principal/cadastroAvlDenSuc.jsp").forward(request, response);
			}
			
			
		}catch (Exception e) {
			request.getRequestDispatcher("/principal/erro.jsp").forward(request, response);
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
