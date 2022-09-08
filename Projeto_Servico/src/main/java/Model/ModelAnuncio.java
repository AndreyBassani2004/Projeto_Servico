package Model;

import java.util.Objects;

public class ModelAnuncio {

	private static final long serialVersionUID = 1L;

	private Long id;
	private Long id_prestador2;
	private String regiao;
	private String estado;
	private String titulo;
	private String descricao;
	private String situacao;
	private String servico;
	private String email_contato;

	
	//Nome do prestador
	private String nome_prestador;
	private String telefone_prestador;
	private String email_prestador_perfil;
	
	private ModelLogin id_prestador;

	
	//Imagem
	private String foto;
	private String extFoto;
	
	//Pesquisa Dados
	private String categoria_pesquisa;
	private String cidade_pesquisa;
	private String estado_pesquisa;
	
	
	public String getCategoria_pesquisa() {
		return categoria_pesquisa;
	}

	public void setCategoria_pesquisa(String categoria_pesquisa) {
		this.categoria_pesquisa = categoria_pesquisa;
	}

	public String getCidade_pesquisa() {
		return cidade_pesquisa;
	}

	public void setCidade_pesquisa(String cidade_pesquisa) {
		this.cidade_pesquisa = cidade_pesquisa;
	}

	public String getEstado_pesquisa() {
		return estado_pesquisa;
	}

	public void setEstado_pesquisa(String estado_pesquisa) {
		this.estado_pesquisa = estado_pesquisa;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getExtFoto() {
		return extFoto;
	}

	public void setExtFoto(String extFoto) {
		this.extFoto = extFoto;
	}

	public String getEmail_prestador_perfil() {
		return email_prestador_perfil;
	}

	public void setEmail_prestador_perfil(String email_prestador_perfil) {
		this.email_prestador_perfil = email_prestador_perfil;
	}

	public String getNome_prestador() {
		return nome_prestador;
	}

	public void setNome_prestador(String nome_prestador) {
		this.nome_prestador = nome_prestador;
	}

	public String getTelefone_prestador() {
		return telefone_prestador;
	}

	public void setTelefone_prestador(String telefone_prestador) {
		this.telefone_prestador = telefone_prestador;
	}

	public Long getId_prestador2() {
		return id_prestador2;
	}

	public void setId_prestador2(Long id_prestador2) {
		this.id_prestador2 = id_prestador2;
	}

	public String getSituacao() {
		return situacao;
	}

	public void setSituacao(String situacao) {
		this.situacao = situacao;
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
