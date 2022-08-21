package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOAvaliarRequisicao;


@WebServlet("/ServletProvidenciaDenunciaAvaliacao")
public class ServletProvidenciaDenunciaAvaliacao extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DAOAvaliarRequisicao daoAvaliarRequisicao = new DAOAvaliarRequisicao();
       
    public ServletProvidenciaDenunciaAvaliacao() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id_denuncia = request.getParameter("id_avaliacao");
		String providencia = request.getParameter("providencia");
		String id_adm = request.getParameter("id_adm");
		String relatorio = request.getParameter("relatorio");
		
		doGet(request, response);
	}

}
