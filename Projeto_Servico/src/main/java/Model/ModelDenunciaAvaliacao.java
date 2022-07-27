package Model;

import java.io.Serializable;

public class ModelDenunciaAvaliacao implements Serializable {

	private static final long serialVersionUID = 1L;
	
	
	// Dados tabela terceiros
	private Long id_anuncio;
	private Long id_prestador;
	private String nome_prestador;
	private String servico_prestador;
	private String uf;
	private String titulo_anuncio;
	private String descricao_anuncio;
	

	public Long getId_anuncio() {
		return id_anuncio;
	}
	public void setId_anuncio(Long id_anuncio) {
		this.id_anuncio = id_anuncio;
	}
	public Long getId_prestador() {
		return id_prestador;
	}
	public void setId_prestador(Long id_prestador) {
		this.id_prestador = id_prestador;
	}
	public String getNome_prestador() {
		return nome_prestador;
	}
	public void setNome_prestador(String nome_prestador) {
		this.nome_prestador = nome_prestador;
	}
	public String getServico_prestador() {
		return servico_prestador;
	}
	public void setServico_prestador(String servico_prestador) {
		this.servico_prestador = servico_prestador;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public String getTitulo_anuncio() {
		return titulo_anuncio;
	}
	public void setTitulo_anuncio(String titulo_anuncio) {
		this.titulo_anuncio = titulo_anuncio;
	}
	public String getDescricao_anuncio() {
		return descricao_anuncio;
	}
	public void setDescricao_anuncio(String descricao_anuncio) {
		this.descricao_anuncio = descricao_anuncio;
	}

}
