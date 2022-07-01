package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOCadastroPrestador;
import Model.ModelLogin;


@WebServlet("/ServletPosLoginPrestador")
public class ServletPosLoginPrestador extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    private DAOCadastroPrestador daoCadastroPrestador = new DAOCadastroPrestador();
       
    
    public ServletPosLoginPrestador() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String acao = request.getParameter("acao");
			
			if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarEditar")) {
				String login = request.getParameter("login");
				
				ModelLogin modelLogin = daoCadastroPrestador.consultaUsuario(login);
				
				request.setAttribute("msg", "Usuario em edição");
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/perfil.jsp").forward(request, response);
			}else if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("editar")) {
				try {
					
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
