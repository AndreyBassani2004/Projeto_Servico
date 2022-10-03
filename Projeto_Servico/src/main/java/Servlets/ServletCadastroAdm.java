package Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOCadastroAdm;
import Model.ModelLogin;

@WebServlet("/ServletCadastroAdm")
public class ServletCadastroAdm extends ServletGenericUtil {
	private static final long serialVersionUID = 1L;

	private DAOCadastroAdm daoCadastroAdm = new DAOCadastroAdm();

	public ServletCadastroAdm() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
			String telefone = request.getParameter("foneContato");
			String uf = request.getParameter("uf");
			String cidade = request.getParameter("cidade");
			String logradouro = request.getParameter("logradouro");
			String perfil = "ADMIN";

			String msg = "Operacao realizada com sucesso!";

			if (nome == null || nome.isEmpty() || email == null || email.isEmpty() || senha == null || senha.isEmpty()
					|| telefone == null || telefone.isEmpty() || uf == null || uf.isEmpty() || cidade == null
					|| cidade.isEmpty() || logradouro == null || logradouro.isEmpty()) {

				request.setAttribute("msg", "Preencha todos os campos!");

				request.getRequestDispatcher("cadastrase.jsp").forward(request, response);
			} else {

				ModelLogin modelLogin = new ModelLogin();

				modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
				modelLogin.setNome(nome);
				modelLogin.setLogin(email);
				modelLogin.setSenha(senha);
				modelLogin.setEstado(uf);
				modelLogin.setTelefone(telefone);
				modelLogin.setCidade(cidade);
				modelLogin.setLogradouro(logradouro);
				modelLogin.setPerfil(perfil);

				if (daoCadastroAdm.validarLogin(modelLogin.getLogin()) && modelLogin.getId() == null) {
					msg = "Já existe usuario com o mesmo login, informe outro login.";

					request.setAttribute("msg", msg);
					request.setAttribute("modelLogin", modelLogin);
					request.getRequestDispatcher("/principal/cadastroUser.jsp").forward(request, response);
				} else {
					modelLogin = daoCadastroAdm.gravarUsuario(modelLogin, super.getUserLogado(request));
					request.setAttribute("modelLogin", modelLogin);
					request.getRequestDispatcher("/principal/relatorioCriarAdm.jsp").forward(request, response);
				}

			}

		} catch (Exception e) {
			e.printStackTrace();

			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		doGet(request, response);
	}

}
