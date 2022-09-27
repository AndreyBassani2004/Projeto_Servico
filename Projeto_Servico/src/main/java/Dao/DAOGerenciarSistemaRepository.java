package Dao;

import java.sql.Connection;

import Connection.SingleConnectionBanco;

public class DAOGerenciarSistemaRepository {
	
	private Connection connection;
	
	public DAOGerenciarSistemaRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	
	
}
