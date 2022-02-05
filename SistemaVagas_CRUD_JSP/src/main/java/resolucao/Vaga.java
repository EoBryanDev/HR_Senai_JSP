package resolucao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Vaga {

	private int id;
	private String descricao;
	private String requisitosObrigatorios;
	private String requisitosDesejaveis;
	private float remuneracao;
	private String beneficios;
	private String localTrabalho;
	private int aberta;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getRequisitosObrigatorios() {
		return requisitosObrigatorios;
	}

	public void setRequisitosObrigatorios(String requisitosObrigatorios) {
		this.requisitosObrigatorios = requisitosObrigatorios;
	}

	public String getRequisitosDesejaveis() {
		return requisitosDesejaveis;
	}

	public void setRequisitosDesejaveis(String requisitosDesejaveis) {
		this.requisitosDesejaveis = requisitosDesejaveis;
	}

	public float getRemuneracao() {
		return remuneracao;
	}

	public void setRemuneracao(float remuneracao) {
		this.remuneracao = remuneracao;
	}

	public String getBeneficios() {
		return beneficios;
	}

	public void setBeneficios(String beneficios) {
		this.beneficios = beneficios;
	}

	public String getLocalTrabalho() {
		return localTrabalho;
	}

	public void setLocalTrabalho(String localTrabalho) {
		this.localTrabalho = localTrabalho;
	}

	
	public int getAberta() {
		return aberta;
	}

	public void setAberta(int aberta) {
		this.aberta = aberta;
	}

	public boolean vazio() {
		if (this.descricao != null && this.requisitosObrigatorios != null && this.requisitosDesejaveis != null
				&& this.remuneracao != 0 && this.beneficios != null && this.localTrabalho != null) {

			return false;

		} else {
			return true;
		}

	}

	public void cadastrarVaga() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String user = "root";
			String pwd = "senaisp";
			String url = "jdbc:mysql://localhost/appvagas";
			java.sql.Connection conn = DriverManager.getConnection(url, user, pwd);
			// query de adição no banco
			String Sql = "insert into "
					+ "tb_vagas(descricao, requisitosObrigatorios, requisitosDesejaveis, remuneracao, beneficios, localTrabalho)"
					+ "values(?,?,?,?,?,?)";
			PreparedStatement cmd = (PreparedStatement) conn.prepareStatement(Sql);
			// mask
			String desc = getDescricao();
			String ro = getRequisitosObrigatorios();
			String rd = getRequisitosDesejaveis();
			String rem = Float.toString(getRemuneracao());
			String ben = getBeneficios();
			String lt = getLocalTrabalho();

			cmd.setString(1, desc);
			cmd.setString(2, ro);
			cmd.setString(3, rd);
			cmd.setString(4, rem);
			cmd.setString(5, ben);
			cmd.setString(6, lt);

			// execution
			cmd.execute();
			cmd.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
}
