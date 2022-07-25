package Model;

import java.io.Serializable;

import javax.xml.crypto.Data;

public class ModelAvaliacao implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private Long id_anuncio;
	private String nome_cliente;
	private String email_cliente;
	private String descricao_denuncia;
	private Data data_prestacao;
	private Double nota;
	private String Titulo;
	private String descricao;
	private String estado;
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
	public String getDescricao_denuncia() {
		return descricao_denuncia;
	}
	public void setDescricao_denuncia(String descricao_denuncia) {
		this.descricao_denuncia = descricao_denuncia;
	}
	public Data getData_prestacao() {
		return data_prestacao;
	}
	public void setData_prestacao(Data data_prestacao) {
		this.data_prestacao = data_prestacao;
	}
	public Double getNota() {
		return nota;
	}
	public void setNota(Double nota) {
		this.nota = nota;
	}
	public String getTitulo() {
		return Titulo;
	}
	public void setTitulo(String titulo) {
		Titulo = titulo;
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
