package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletDenunciaAvaliacao")
public class ServletDenunciaAvaliacao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletDenunciaAvaliacao() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String acao =  request.getParameter("acao");
		
		if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarPagina")) {
			
			String id_usuario = request.getParameter("id_user");
			
			
			request.getRequestDispatcher("principal/validarDenunciaAvaliação.jsp").forward(request, response);

		}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("carregarDenuncia")) {
			
			String id_usuario = request.getParameter("id_user");
			
			String id_denuncia = request.getParameter("id_denuncia");
			
			request.getRequestDispatcher("/principal/carregarDenunciaAnuncio.jsp").forward(request, response);
		}
		
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
