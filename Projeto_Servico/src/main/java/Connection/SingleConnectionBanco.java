package Connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco {
	private static String banco = "jdbc:postgresql://localhost:5432/projeto_servico?autoReconnect=true";
	private static String user = "postgres";
	private static String senha = "admin";
	private static Connection connection = null;


	public static Connection getConnection() {
		return connection;
	}


	static {
		conectar();
	}


	public SingleConnectionBanco() {//Quando tiver uma instancia vai conectar
		conectar();
	}


	private static void conectar() {
		try {

			if(connection == null) {
				Class.forName("org.postgresql.Driver");//Carrega drive de conexao do banco
				connection = DriverManager.getConnection(banco, user, senha);
				connection.setAutoCommit(false);//para nao efetuar alteracao no banco sem o nosso comando
			}

		} catch (Exception e) {
			e.printStackTrace();//Mostrar erro no momento de conectar
		}
	}
}
