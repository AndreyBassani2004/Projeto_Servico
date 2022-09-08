package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.DAOCarregarPublicoRepository;
import Model.ModelAnuncio;

@MultipartConfig
@WebServlet("/ServletPesquisaPrestadorPublic")
public class ServletPesquisaPrestadorPublic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DAOCarregarPublicoRepository daoCarregarPublicoRepository = new DAOCarregarPublicoRepository();
       
    
    public ServletPesquisaPrestadorPublic() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		try {
		String acao = request.getParameter("acao");
		
		if(acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("pesquisa")) {
			
			String categoria = request.getParameter("categoria");
			String cidade = request.getParameter("cidade");
			String estado = request.getParameter("uf");
			
			ModelAnuncio modelAnuncio = new ModelAnuncio();
			
			modelAnuncio.setCategoria_pesquisa(categoria);
			modelAnuncio.setCidade_pesquisa(cidade);
			modelAnuncio.setEstado_pesquisa(estado);
			
			Integer offset = 0;

			List<ModelAnuncio> modelAnuncios = daoCarregarPublicoRepository.listAnuncioPaginadaPesquisa(categoria, offset, cidade, estado);

			request.setAttribute("modelAnuncio", modelAnuncio);
			request.setAttribute("modelAnuncios", modelAnuncios);
			request.setAttribute("totalPagina", daoCarregarPublicoRepository.totalPaginaPesquisa(categoria, cidade, estado));
			request.getRequestDispatcher("/alvenariaPesquisa.jsp").forward(request, response);
			
		}else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("pagina")) {
			
			String categoria = request.getParameter("categoria");
			String cidade = request.getParameter("cidade");
			String estado = request.getParameter("uf");
			
			ModelAnuncio modelAnuncio = new ModelAnuncio();
			
			modelAnuncio.setCategoria_pesquisa(categoria);
			modelAnuncio.setCidade_pesquisa(cidade);
			modelAnuncio.setEstado_pesquisa(estado);
			
			Integer offset = Integer.parseInt(request.getParameter("paginar"));

			List<ModelAnuncio> modelAnuncios = daoCarregarPublicoRepository.listAnuncioPaginadaPesquisa(categoria, offset, cidade, estado);

			request.setAttribute("modelAnuncio", modelAnuncio);
			request.setAttribute("modelAnuncios", modelAnuncios);
			request.setAttribute("totalPagina", daoCarregarPublicoRepository.totalPaginaPesquisa(categoria, cidade, estado));
			request.getRequestDispatcher("/alvenariaPesquisa.jsp").forward(request, response);
			
			
		}else {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		}catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("/erro.jsp").forward(request, response);
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
