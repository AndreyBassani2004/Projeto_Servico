package Model;

import java.io.Serializable;
import java.util.Objects;

public class ModelAnuncio implements Serializable{

	private static final long serialVersionUID = 1L;

	private Long id;
	private String regiao;
	private String estado;
	private String titulo;
	private String descricao;
	private boolean situacao;
	private String servico;
	private String email_contato;
	
	private ModelLogin id_prestador;

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

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
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

	public String getServico() {
		return servico;
	}

	public void setServico(String servico) {
		this.servico = servico;
	}

	public String getEmail_contato() {
		return email_contato;
	}

	public void setEmail_contato(String email_contato) {
		this.email_contato = email_contato;
	}

	public ModelLogin getId_prestador() {
		return id_prestador;
	}

	public void setId_prestador(ModelLogin id_prestador) {
		this.id_prestador = id_prestador;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ModelAnuncio other = (ModelAnuncio) obj;
		return Objects.equals(id, other.id);
	}
	
	
	
}
