package Model;

import java.io.Serializable;

public class ModelLogin implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String login;
	private String senha;
	
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
	
}
