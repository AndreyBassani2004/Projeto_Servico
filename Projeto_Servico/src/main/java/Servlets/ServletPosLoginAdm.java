package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOCadastroAdm;
import Model.ModelLogin;


@WebServlet("/ServletPosLoginAdm")
public class ServletPosLoginAdm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private DAOCadastroAdm daoCadastroAdm = new DAOCadastroAdm();
	
    public ServletPosLoginAdm() {
       
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String acao = request.getParameter("acao");
			
			if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarEditar")) {
				String login = request.getParameter("login");
			
				ModelLogin modelLogin = daoCadastroAdm.consultaUsuario(login);
				
				request.setAttribute("msg", "Usuario em edição");
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/perfilAdm2.jsp").forward(request, response);
			}else {
				
			}
			
		}catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}

	
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
			
			String msg ="Alteração realizada com sucesso!";

			ModelLogin modelLogin = new ModelLogin();
			
			if(senha.equals(Rsenha)) {
			modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
			modelLogin.setNome(nome);
			modelLogin.setLogin(email);
			modelLogin.setSenha(senha);
			modelLogin.setEstado(uf);
			modelLogin.setTelefone_adm(telefone);
			modelLogin.setCidade_adm(cidade);
			modelLogin.setLogradouro_adm(logradouro);
			modelLogin.setPerfil(perfil);
			modelLogin.setrSenha(Rsenha);
			
			
			
			daoCadastroAdm.atualizaUsuario(modelLogin);

			request.setAttribute("msg", msg);
			request.setAttribute("modelLogin", modelLogin);
		    request.getRequestDispatcher("/principal/perfilAdm2.jsp").forward(request, response);
			
			}else {
				request.setAttribute("msg", "Senhas não identicas!");
				request.setAttribute("modelLogin", modelLogin);
			    request.getRequestDispatcher("/principal/perfilAdm2.jsp").forward(request, response);
			}
			
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
			
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		
	}

}
