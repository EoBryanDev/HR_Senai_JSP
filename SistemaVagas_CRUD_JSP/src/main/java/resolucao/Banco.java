package resolucao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class Banco {
	
	public Connection getConexao() {

		Connection connection = null;
		try {
			//Instalando o .jar no projeto
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		} catch (ClassNotFoundException e) {
			System.out.println("Driver não encontrado!" + e);
		}

		try {
			String url = "jdbc:mysql://localhost:3306/appvagas";
			String user = "root";
			String pwd = "senaisp";

			connection = DriverManager.getConnection(url, user, pwd);

		} catch (Exception e) {
			System.out.println("Driver não encontrado!" + e);
		}

		return connection;

	}
	
public String listar(int aberta) {
		
		String linha="";
		
		try {
			Connection conn = getConexao();

			
			String sql = "SELECT * FROM tb_vagas";
			
			if(aberta==1)
				sql = sql + " where aberta=1";
			else if(aberta==0)
				sql = sql + " where aberta=0";
			
			
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				
				long idaux = rs.getInt(1);
				String descricaoaux = rs.getString(2);
				String requisitosObrigatoriosaux = rs.getString(3);
				String requisitosDesejaveisaux = rs.getString(4);
				String remuneracaoaux = rs.getString(5);
				String beneficiosaux = rs.getString(6);
				String localDeTrabalhoaux = rs.getString(7);
				String abertaaux = rs.getString(8);
				
				
				/*linha = linha + 
						"<br>"+ 
						"Código:" + idaux + 
						"- Descrição: " + descricaoaux + 
						"- Requisitos Obrigatorios:" + requisitosObrigatoriosaux +
						"- Requisitos Desejaveis:" + requisitosDesejaveisaux + 
						"- Remuneração: " + remuneracaoaux + 
						"- Beneficios: " + beneficiosaux + 
						"- Local de Trabalho:" + localDeTrabalhoaux +
						"- Aberta:" + abertaaux+
						" - <a href='./excluir.jsp?id="+idaux+"'>Excluir</a>"+
						" - <a href='./editar.jsp?id="+idaux+"'>Editar</a>";*/
				
				linha = linha + 
				            
				            "<tbody>"+
				              "<tr>"+
				                "<th scope="+"row"+">"+idaux+"</th>"+
				                "<td> "+ descricaoaux+ " + </td>"+
				                "<td>"+ requisitosObrigatoriosaux +"</td>"+
				                "<td>"+ requisitosDesejaveisaux +"</td>"+
				                "<td>"+ remuneracaoaux +"</td>"+
				                "<td>"+ beneficiosaux + "</td>"+
				                "<td>"+ localDeTrabalhoaux +"</td>"+
				                "<td>"+ abertaaux+"</td>"+
				                "<td><a href='excluir.jsp?id="+idaux+"'>Excluir</a></td>"+
				                "<td><a href='editar.jsp?id="+idaux+"'>Editar</a></td>"+
				              "</tr>"+
							
				            "</tbody>";
		}
			
			

		} catch (Exception e) {
			System.out.println("Erro em Listar:" + e);
		}
		
		return linha;
	}

public void inserir(Vaga vg){
		try {
			Connection conn = getConexao();
	
			String sql = 
					"Insert into tb_vagas ("			
					+"descricao, requisitosObrigatorios,"
					+"requisitosDesejaveis, remuneracao, beneficios ,"
					+ "localTrabalho"
					+ ") values(?,?,?,?,?,?)";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, vg.getDescricao());
			ps.setString(2, vg. getRequisitosObrigatorios()); 
			ps.setString(3, vg.getRequisitosDesejaveis());
			String rem = Float.toString(vg.getRemuneracao());
			ps.setString(4, rem);
			ps.setString(5, vg.getBeneficios());
			ps.setString(6, vg.getLocalTrabalho()); 
						
			ps.execute();		
	
		} catch (Exception e) {
			System.out.println("Erro ao Inserir :" + e);
		}
		
	}

public void excluir(int idaux){
	try {
		Connection conn = getConexao();

		 String query = "delete from tb_vagas where id ="+idaux;
	      PreparedStatement ps = conn.prepareStatement(query);
	         
	      ps.execute();

	} catch (Exception e) {
		System.out.println("Erro ao Excluir:" + e);
	}	
}

public Vaga buscar(int idaux) {
	
	Vaga vg=new Vaga();
	try {
		Connection conn = getConexao();

		
		String sql = "SELECT * FROM tb_vagas where id="+idaux;
		PreparedStatement ps = conn.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {				
			vg.setDescricao(rs.getString(2));
			vg.setRequisitosObrigatorios(rs.getString(3)); 
			vg.setRequisitosDesejaveis(rs.getString(4));
			vg.setRemuneracao(Float.parseFloat(rs.getString(5)));
			vg.setBeneficios(rs.getString(6));
			vg.setLocalTrabalho(rs.getString(7)); 
			vg.setAberta(rs.getInt(8));
			vg.setId(rs.getInt(1));
		}

	} catch (Exception e) {
		System.out.println("Erro em Listar:" + e);
	}
	
	return vg;
}

public void editar(Vaga vg)
{
try {
	Connection conn = getConexao();
	
	String sql = 
			"Update tb_vagas set "					
			+ "descricao=?,"
			+ "requisitosObrigatorios=?,"
			+ "requisitosDesejaveis=?,"
			+ "remuneracao=?,"
			+ "beneficios=?,"
			+ "localTrabalho=?,"
			+ "aberta=?"										
			+ " where id=? ;";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ps.setString(1, vg.getDescricao());
	ps.setString(2, vg. getRequisitosObrigatorios()); 
	ps.setString(3, vg.getRequisitosDesejaveis());
	String rem = Float.toString(vg.getRemuneracao());
	ps.setString(4, rem);
	ps.setString(5, vg.getBeneficios());
	ps.setString(6, vg.getLocalTrabalho()); 
	ps.setInt(7, vg.getAberta());
	ps.setInt(8, vg.getId());
	
	 ps.execute();	

} catch (Exception e) {
	System.out.println("Erro ao Editar:" + e);
}

}


}

