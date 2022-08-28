package Model;

import java.io.Serializable;

import javax.xml.crypto.Data;

public class ModelMensagem implements Serializable{

	private static final long serialVersionUID = 1L;
	
	//Dados tabela
	private Long id;
	private Long id_remetente;
	private Long id_destinatario;
	private String titulo;
	private String mensagem;
	private Data data;
	
	
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getId_remetente() {
		return id_remetente;
	}
	public void setId_remetente(Long id_remetente) {
		this.id_remetente = id_remetente;
	}
	public Long getId_destinatario() {
		return id_destinatario;
	}
	public void setId_destinatario(Long id_destinatario) {
		this.id_destinatario = id_destinatario;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getMensagem() {
		return mensagem;
	}
	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	public Data getData() {
		return data;
	}
	public void setData(Data data) {
		this.data = data;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}	

}
