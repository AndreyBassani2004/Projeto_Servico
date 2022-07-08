package Model;

import java.io.Serializable;

public class ModelAnuncio implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String regiao;
	private String estdado;
	private String titulo;
	private String descricao;
	private boolean situacao;
	private String email_user;
	private String servico;
	private String emailContato;
	
	
	
	public String getEmailContato() {
		return emailContato;
	}
	public void setEmailContato(String emailContato) {
		this.emailContato = emailContato;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getRegiao() {
		return regiao;
	}
	public void setRegiao(String regiao) {
		this.regiao = regiao;
	}
	public String getEstdado() {
		return estdado;
	}
	public void setEstdado(String estdado) {
		this.estdado = estdado;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public boolean isSituacao() {
		return situacao;
	}
	public void setSituacao(boolean situacao) {
		this.situacao = situacao;
	}
	public String getEmail_user() {
		return email_user;
	}
	public void setEmail_user(String email_user) {
		this.email_user = email_user;
	}
	public String getServico() {
		return servico;
	}
	public void setServico(String servico) {
		this.servico = servico;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
