package Filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import Connection.SingleConnectionBanco;


@WebFilter(urlPatterns = { "/principal/*" })
public class FilterAutenticar extends HttpFilter implements Filter {
       

	private static final long serialVersionUID = 1L;
	
	private static Connection connection;
    
    public FilterAutenticar() {
       
    }

	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();

			String usuarioLogado = (String) session.getAttribute("usuario");

			String urlParaAutenticar = req.getServletPath();// url sendo acessada

			// Validar se estar logado, se nao redirecionar para tela de login
			if (usuarioLogado == null && !urlParaAutenticar.equalsIgnoreCase("/principal/ServletLogin")) {// Nao Logado

				RequestDispatcher redireciona = request.getRequestDispatcher("/login.jsp?url=" + urlParaAutenticar);
				request.setAttribute("msg", "Por favor realize o login");
				redireciona.forward(request, response);
				return;// Para a execucao e direciona para o login
			} else {

				chain.doFilter(request, response);
			}
			connection.commit();//deu certo, commit no banco de dados
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				 RequestDispatcher redirecionar = request.getRequestDispatcher("/erro.jsp");
				 redirecionar.forward(request, response);
			}
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnectionBanco.getConnection();
	}

}
