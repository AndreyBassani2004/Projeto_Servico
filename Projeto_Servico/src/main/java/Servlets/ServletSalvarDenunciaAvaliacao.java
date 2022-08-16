package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.DAOUsuarioPosLogin;
import Model.ModelAnuncio;
import Model.ModelDenunciaAvaliacao;


@WebServlet(urlPatterns = {"/ServletSDenunciaAvaliacao"})
public class ServletSalvarDenunciaAvaliacao extends ServletGenericUtil {
	private static final long serialVersionUID = 1L;
    
	private DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();
	
	ModelDenunciaAvaliacao modelDenunciaAvaliacao = new ModelDenunciaAvaliacao();
	
    public ServletSalvarDenunciaAvaliacao() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			
			String usuarioLogado = (String) session.getAttribute("usuario");

			Long id_usuario = daoUsuarioPosLogin.consultaUsuarioLogado(usuarioLogado).getId();
	
			String id_avaliacao = request.getParameter("id_avaliacao");
			String id_anuncio = request.getParameter("id_anuncio");
			String descricao_denuncia = request.getParameter("descricao_denuncia");
			String motivo = request.getParameter("motivo");
			
			String msg = "Cadastrado com sucesso!";
			
			
			if(id_avaliacao.isEmpty()) {
				ModelAnuncio modelAnuncio = new ModelAnuncio();
				
				modelDenunciaAvaliacao.setId_prestador(id_usuario);
				modelDenunciaAvaliacao.setId_avaliacao(Long.parseLong(id_avaliacao));
				modelDenunciaAvaliacao.setId_anuncio(Long.parseLong(id_anuncio));
				modelDenunciaAvaliacao.setDescricao(descricao_denuncia);
				modelDenunciaAvaliacao.setMotivo(motivo);
			}else {
				
			}
			
			
		}catch (Exception e) {
			request.getRequestDispatcher("principal/principal.jsp").forward(request, response);
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
