package Model;

import java.io.Serializable;

public class ModelDenunciaAnuncio implements Serializable {

	private static final long serialVersionUID = 1L;
	
	//Dados tabela denuncia anuncio
	private Long id;
	private String nome_cliente;
	private String email_cliente;
	private String descricao_denuncia;
	private String situacao;
	private String relatorio;
	private String motivo;
	
	
	// Dados tabela terceiros
	private Long id_anuncio;
	private Long id_prestador;
	private String nome_prestador;
	private String servico_prestador;
	private String uf;
	private String titulo_anuncio;
	private String descricao_anuncio;
	

	
	public String getMotivo() {
		return motivo;
	}
	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome_cliente() {
		return nome_cliente;
	}
	public void setNome_cliente(String nome_cliente) {
		this.nome_cliente = nome_cliente;
	}
	public String getEmail_cliente() {
		return email_cliente;
	}
	public void setEmail_cliente(String email_cliente) {
		this.email_cliente = email_cliente;
	}
	public String getDescricao_denuncia() {
		return descricao_denuncia;
	}
	public void setDescricao_denuncia(String descricao_denuncia) {
		this.descricao_denuncia = descricao_denuncia;
	}
	public String getSituacao() {
		return situacao;
	}
	public void setSituacao(String situacao) {
		this.situacao = situacao;
	}
	public String getRelatorio() {
		return relatorio;
	}
	public void setRelatorio(String relatorio) {
		this.relatorio = relatorio;
	}
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
