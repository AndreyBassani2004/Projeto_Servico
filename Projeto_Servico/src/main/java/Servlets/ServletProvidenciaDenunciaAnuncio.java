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

@WebServlet("/ServletProvidenciaDenunciaAnuncio")
public class ServletProvidenciaDenunciaAnuncio extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	public DAOAvaliarRequisicao daoAvaliarRequisicao = new DAOAvaliarRequisicao();
    
    public ServletProvidenciaDenunciaAnuncio() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String msg = "<b>Operação realizada com sucesso!</b>";
			
			String id_denuncia = request.getParameter("id");
			String id_adm = request.getParameter("id_adm");
			String providencia = request.getParameter("providencia");
			String relatorio = request.getParameter("relatorio");
			
			ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();
			
			if( !id_denuncia.isEmpty() && !id_adm.isEmpty() && !providencia.isEmpty() && !relatorio.isEmpty()) {
				
				String paginar = "0";
				
				modelDenunciaAnuncio.setId(Long.parseLong(id_denuncia));
				modelDenunciaAnuncio.setId_adm(Long.parseLong(id_adm));
				modelDenunciaAnuncio.setSituacao(providencia);
				modelDenunciaAnuncio.setRelatorio(relatorio);
				
				daoAvaliarRequisicao.providenciaDenunciaAnuncio(modelDenunciaAnuncio);
				
				List<ModelDenunciaAnuncio> modelDenunciaAnuncios = daoAvaliarRequisicao.lisarDenunciaAnuncio(Long.parseLong(paginar));

				request.setAttribute("msg", msg);
				request.setAttribute("modelDenunciaAnuncios", modelDenunciaAnuncios);
				request.setAttribute("totalPagina", daoAvaliarRequisicao.totalPaginaDenunciaAnuncio());
				request.getRequestDispatcher("principal/validarDenunciaAnuncio.jsp").forward(request, response);
			}else {
				RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
				redirecionar.forward(request, response);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
