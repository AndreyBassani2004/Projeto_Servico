package Model;

import java.io.Serializable;
import java.util.Objects;

public class ModelLogin implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String login;
	private String senha;
	private String nome;
	private String estado;
	private String perfil;
	private String telefone;
	private String cidade;
	private String logradouro;
	private String rSenha;
	
	private String telefone_adm;
	private String cidade_adm;
	private String logradouro_adm;
	
	private boolean Useradmin;
	
	
	public String getTelefone_adm() {
		return telefone_adm;
	}

	public void setTelefone_adm(String telefone_adm) {
		this.telefone_adm = telefone_adm;
	}

	public String getCidade_adm() {
		return cidade_adm;
	}

	public void setCidade_adm(String cidade_adm) {
		this.cidade_adm = cidade_adm;
	}

	public String getLogradouro_adm() {
		return logradouro_adm;
	}

	public void setLogradouro_adm(String logradouro_adm) {
		this.logradouro_adm = logradouro_adm;
	}

	public boolean getUseradmin() {
		return Useradmin;
	}
	
	public void setUseradmin(boolean useradmin) {
		Useradmin = useradmin;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getrSenha() {
		return rSenha;
	}
	public void setrSenha(String rSenha) {
		this.rSenha = rSenha;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getPerfil() {
		return perfil;
	}
	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getLogin() {
		return login;
	}
	public String getSenha() {
		return senha;
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
		ModelLogin other = (ModelLogin) obj;
		return Objects.equals(id, other.id);
	}
	
}
