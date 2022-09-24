package Dao;

import java.sql.Connection;

import Connection.SingleConnectionBanco;

public class DAOGerenciarContasRepository {
	
	private Connection connection;
	
	public DAOGerenciarContasRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	
	
}
