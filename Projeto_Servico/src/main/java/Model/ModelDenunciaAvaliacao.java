package Model;

import java.io.Serializable;

public class ModelDenunciaAvaliacao implements Serializable{

	private static final long serialVersionUID = 1L;
	
	//Dados tabela
	private Long id;
	private Long id_anuncio;
	private Long id_prestador;
	private Long id_avaliacao;
	private String descricao;
	private String estado_denuncia;
	private String relatorio;
	private String motivo;
	
	//Dados tabela terceiro
	private String nome_cliente;
	private String email_cliente;
	private String data_prestacao;
	private String email_prestador;
	private Long nota;
	private String titulo;
	private String descricao_avaliacao;
	private Long id_adm;
	 
	
	public Long getId_adm() {
		return id_adm;
	}
	public void setId_adm(Long id_adm) {
		this.id_adm = id_adm;
	}
	public String getMotivo() {
		return motivo;
	}
	public void setMotivo(String motivo) {
		this.motivo = motivo;
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
	public String getData_prestacao() {
		return data_prestacao;
	}
	public void setData_prestacao(String data_prestacao) {
		this.data_prestacao = data_prestacao;
	}
	public String getEmail_prestador() {
		return email_prestador;
	}
	public void setEmail_prestador(String email_prestador) {
		this.email_prestador = email_prestador;
	}
	public Long getNota() {
		return nota;
	}
	public void setNota(Long nota) {
		this.nota = nota;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescricao_avaliacao() {
		return descricao_avaliacao;
	}
	public void setDescricao_avaliacao(String descricao_avaliacao) {
		this.descricao_avaliacao = descricao_avaliacao;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public Long getId_avaliacao() {
		return id_avaliacao;
	}
	public void setId_avaliacao(Long id_avaliacao) {
		this.id_avaliacao = id_avaliacao;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getEstado_denuncia() {
		return estado_denuncia;
	}
	public void setEstado_denuncia(String estado_denuncia) {
		this.estado_denuncia = estado_denuncia;
	}
	public String getRelatorio() {
		return relatorio;
	}
	public void setRelatorio(String relatorio) {
		this.relatorio = relatorio;
	}
	
}
