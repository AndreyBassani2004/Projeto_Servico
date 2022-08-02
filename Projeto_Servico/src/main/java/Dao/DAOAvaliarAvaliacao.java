package Dao;

import java.sql.Connection;

import Connection.SingleConnectionBanco;

public class DAOAvaliarAvaliacao {
	
	private Connection connection;
	
	public DAOAvaliarAvaliacao() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	
}
