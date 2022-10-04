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
import Dao.DAOUsuarioPosLogin;
import Model.ModelDenunciaAvaliacao;


@WebServlet("/ServletProvidenciaDenunciaAvaliacao")
public class ServletProvidenciaDenunciaAvaliacao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public DAOAvaliarRequisicao daoAvaliarRequisicao = new DAOAvaliarRequisicao();
	
	public DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();
	
       
    public ServletProvidenciaDenunciaAvaliacao() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
		String msg = "Operação realizada com sucesso!";
		
		String id_denuncia = request.getParameter("id_avaliacao");
		String providencia = request.getParameter("providencia");
		String id_adm = request.getParameter("id_adm");
		String relatorio = request.getParameter("relatorio");
		String id_avaliacao = request.getParameter("id_avaliacao2");
		
		ModelDenunciaAvaliacao modelDenunciaAvaliacao = new ModelDenunciaAvaliacao();
		
		if(!id_denuncia.isEmpty() && !providencia.isEmpty() && !id_adm.isEmpty() && !relatorio.isEmpty()) {
			
			modelDenunciaAvaliacao.setId(id_denuncia != null && !id_denuncia.isEmpty() ? Long.parseLong(id_denuncia) : null);
			modelDenunciaAvaliacao.setEstado_denuncia(providencia);
			modelDenunciaAvaliacao.setId_adm(id_adm != null && !id_adm.isEmpty() ? Long.parseLong(id_adm) : null);
			modelDenunciaAvaliacao.setRelatorio(relatorio);
			
			if(providencia.equals("Aprovar")) {
				
				daoAvaliarRequisicao.providenciaDenunciaAvaliacao(modelDenunciaAvaliacao);
				
				daoAvaliarRequisicao.desativarAvaliacao(Long.parseLong(id_avaliacao));
				
				String paginar = "0";
				
				List<ModelDenunciaAvaliacao> modelDenunciaAvaliacaos = daoAvaliarRequisicao.listarDenunciaAvaliacao(Long.parseLong(paginar));

				request.setAttribute("msg", msg);
				request.setAttribute("modelDenunciaAvaliacaos", modelDenunciaAvaliacaos);
				request.setAttribute("totalPagina", daoAvaliarRequisicao.totalPaginaDenunciaAvaliacao());
				request.getRequestDispatcher("principal/validarDenunciaAvaliacao.jsp").forward(request, response);
				
				
			}else {
					daoAvaliarRequisicao.providenciaDenunciaAvaliacao(modelDenunciaAvaliacao);
				
					String paginar = "0";
					
					List<ModelDenunciaAvaliacao> modelDenunciaAvaliacaos = daoAvaliarRequisicao.listarDenunciaAvaliacao(Long.parseLong(paginar));

					request.setAttribute("msg", msg);
					request.setAttribute("modelDenunciaAvaliacaos", modelDenunciaAvaliacaos);
					request.setAttribute("totalPagina", daoAvaliarRequisicao.totalPaginaDenunciaAvaliacao());
					request.getRequestDispatcher("principal/validarDenunciaAvaliacao.jsp").forward(request, response);

				
			}
			
		}else {
			
		}
		
		}catch (Exception e) {
			e.printStackTrace();
			
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		
		doGet(request, response);
	}

}
