package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletMedidasDenunciaAnuncio")
public class ServletMedidasDenunciaAnuncio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ServletMedidasDenunciaAnuncio() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String msg = "Operação realizada com sucesso!";
			
			String id_anuncio = request.getParameter("id_anuncio");
			String id_denuncia = request.getParameter("id");
			
			String id_adm = request.getParameter("id_adm_2");
			String providencia = request.getParameter("providencia");
			String mensagem = request.getParameter("mensagem");
			
			if(providencia.equals("NenhumaMedida")) {
				
				
				
			}
			
			
		} catch (Exception e) {
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		
		
		doGet(request, response);
	}

}
