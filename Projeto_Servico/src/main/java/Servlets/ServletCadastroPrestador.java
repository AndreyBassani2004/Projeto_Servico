package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOCadastroPrestador;
import Model.ModelLogin;


@WebServlet("/ServletCadastroPrestador")
public class ServletCadastroPrestador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private DAOCadastroPrestador daoCadastroPrestador = new DAOCadastroPrestador();
	
    public ServletCadastroPrestador() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
		try {
			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
			String Rsenha = request.getParameter("Rsenha");
			String telefone = request.getParameter("foneContato");
			String uf = request.getParameter("uf");
			String cidade = request.getParameter("cidade");
			String logradouro = request.getParameter("logradouro");
			String perfil = "PRESTADOR";
			
			String msg ="Operacao realizada com sucesso!";
			
			if(nome == null && nome.isEmpty() && email == null && email.isEmpty() && senha == null && senha.isEmpty() && Rsenha == null && Rsenha.isEmpty() && telefone == null && telefone.isEmpty() && uf == null && uf.isEmpty() && cidade == null && cidade.isEmpty() && logradouro == null && logradouro.isEmpty()) {
				
				request.setAttribute("msg", "Preencha todos os campos!");
				
			    request.getRequestDispatcher("cadastrase.jsp").forward(request, response);
			}else {

			ModelLogin modelLogin = new ModelLogin();
			
			if(senha.equals(Rsenha)) {
			modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
			modelLogin.setNome(nome);
			modelLogin.setLogin(email);
			modelLogin.setSenha(senha);
			modelLogin.setEstado(uf);
			modelLogin.setTelefone(telefone);
			modelLogin.setCidade(cidade);
			modelLogin.setLogradouro(logradouro);
			modelLogin.setPerfil(perfil);
			modelLogin.setrSenha(Rsenha);
			
			if(daoCadastroPrestador.validarLogin(modelLogin.getLogin()) && modelLogin.getId() == null) {
				msg = "J� existe usuario com o mesmo login, informe outro login.";
			}else {
				modelLogin = daoCadastroPrestador.gravarUsuario(modelLogin);
			
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("modelLogin", modelLogin);
		    request.getRequestDispatcher("cadastroSucesso.jsp").forward(request, response);
			
			}else {
				request.setAttribute("msg", "Senhas não identicas!");
				request.setAttribute("modelLogin", modelLogin);
			    request.getRequestDispatcher("cadastrase.jsp").forward(request, response);
			}
			
			
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
	}

}
