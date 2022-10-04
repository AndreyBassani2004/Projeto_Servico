package Model;

import java.io.Serializable;
import java.sql.Date;


public class ModelAvaliacao implements Serializable{

	private static final long serialVersionUID = 1L;
	
	//Dados avaliação
	private Long id;	
	private String nome_cliente;
	private String email_cliente;
	private String descricao_cliente;
	private Double nota;
	private String titulo;
	private String descricao;
	private String estado;
	private Long nota_media;
	
	//Dados tabela terceiros
	private Long id_anuncio;
	private Long id_prestador;
	private String nome_prestador;
	private String servico_prestador;
	private String uf;
	private String titulo_anuncio;
	private String descricao_anuncio;
	private String email_prestador;
	private Long id_adm_alterador;
	
	//Imagem
	private String foto;
	private String extfoto;
	
	//Data
	private Date data_prestacao;
	
	
	

	public Date getData_prestacao() {
		return data_prestacao;
	}

	public void setData_prestacao(Date data_prestacao) {
		this.data_prestacao = data_prestacao;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getExtfoto() {
		return extfoto;
	}

	public void setExtfoto(String extfoto) {
		this.extfoto = extfoto;
	}

	public Long getNota_media() {
		return nota_media;
	}

	public void setNota_media(Long nota_media) {
		this.nota_media = nota_media;
	}

	public Long getId_adm_alterador() {
		return id_adm_alterador;
	}

	public void setId_adm_alterador(Long id_adm_alterador) {
		this.id_adm_alterador = id_adm_alterador;
	}

	public String getEmail_prestador() {
		return email_prestador;
	}

	public void setEmail_prestador(String email_prestador) {
		this.email_prestador = email_prestador;
	}

	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescricao_cliente() {
		return descricao_cliente;
	}
	public void setDescricao_cliente(String descricao_cliente) {
		this.descricao_cliente = descricao_cliente;
	}
	public Long getId_prestador() {
		return id_prestador;
	}
	public void setId_prestador(Long id_prestador) {
		this.id_prestador = id_prestador;
	}
	public String getTitulo_anuncio() {
		return titulo_anuncio;
	}
	public void setTitulo_anuncio(String titulo_anuncio) {
		this.titulo_anuncio = titulo_anuncio;
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
	public String getDescricao_anuncio() {
		return descricao_anuncio;
	}
	public void setDescricao_anuncio(String descricao_anuncio) {
		this.descricao_anuncio = descricao_anuncio;
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
	public Double getNota() {
		return nota;
	}
	public void setNota(Double nota) {
		this.nota = nota;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
}
