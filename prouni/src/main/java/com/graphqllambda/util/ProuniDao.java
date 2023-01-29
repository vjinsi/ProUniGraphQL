package com.graphqllambda.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProuniDao {

    private Connection connection;

    public ProuniDao(Connection connection) {
        this.connection = connection;
    }

    public List<Prouni> getMunicipioBeneficiario(String nomeCursoBolsa, String racaBeneficiarioBolsa, String sexoBeneficiarioBolsa) throws SQLException {

        String query = "select * from prouni "
                + "where NOME_CURSO_BOLSA = ? and RACA_BENEFICIARIO_BOLSA = ? and SEXO_BENEFICIARIO_BOLSA = ?";

        List<Prouni> prouni = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, nomeCursoBolsa);
        preparedStatement.setString(2, racaBeneficiarioBolsa);
        preparedStatement.setString(3, sexoBeneficiarioBolsa);

        ResultSet results = preparedStatement.executeQuery();

        while (results.next()) {
            prouni.add(Prouni.builder()
                    .anoConcessaoBolsa(results.getInt("ANO_CONCESSAO_BOLSA"))
                    .codigoEMECIESBolsa(results.getInt("CODIGO_EMEC_IES_BOLSA"))
                    .nomeIESBolsa(results.getString("NOME_IES_BOLSA"))
                    .municipio(results.getString("MUNICIPIO"))
                    .campus(results.getString("CAMPUS"))
                    .tipoBolsa(results.getString("TIPO_BOLSA"))
                    .modalidadeEnsinoBolsa(results.getString("MODALIDADE_ENSINO_BOLSA"))
                    .nomeCursoBolsa(results.getString("NOME_CURSO_BOLSA"))
                    .nomeTurnoCursoBolsa(results.getString("NOME_TURNO_CURSO_BOLSA"))
                    .CPFBeneficiarioBolsa(results.getString("CPF_BENEFICIARIO_BOLSA"))
                    .sexoBeneficiarioBolsa(results.getString("SEXO_BENEFICIARIO_BOLSA"))
                    .racaBeneficiarioBolsa(results.getString("RACA_BENEFICIARIO_BOLSA"))
                    .dtNascimentoBeneficiario(results.getString("DT_NASCIMENTO_BENEFICIARIO"))
                    .beneficiarioDeficienteFisico(results.getString("BENEFICIARIO_DEFICIENTE_FISICO"))
                    .regiaoBeneficiarioBolsa(results.getString("REGIAO_BENEFICIARIO_BOLSA"))
                    .siglaUFBeneficiarioBolsa(results.getString("SIGLA_UF_BENEFICIARIO_BOLSA"))
                    .municipioBeneficiarioBolsa(results.getString("MUNICIPIO_BENEFICIARIO_BOLSA"))
                    .build());
        }

        if (prouni.size() == 0) {
            return null;
        }
        return prouni;
    }

    public List<Prouni> getCodigoIES(Integer anoConcessaoBolsa, String racaBeneficiarioBolsa, String sexoBeneficiarioBolsa) throws SQLException {

        String query = "select * from prouni "
                + "where ANO_CONCESSAO_BOLSA = ? and RACA_BENEFICIARIO_BOLSA = ? and SEXO_BENEFICIARIO_BOLSA = ?";

        List<Prouni> prouni = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, anoConcessaoBolsa);
        preparedStatement.setString(2, racaBeneficiarioBolsa);
        preparedStatement.setString(3, sexoBeneficiarioBolsa);

        ResultSet results = preparedStatement.executeQuery();

        while (results.next()) {
            prouni.add(Prouni.builder()
                    .anoConcessaoBolsa(results.getInt("ANO_CONCESSAO_BOLSA"))
                    .codigoEMECIESBolsa(results.getInt("CODIGO_EMEC_IES_BOLSA"))
                    .nomeIESBolsa(results.getString("NOME_IES_BOLSA"))
                    .municipio(results.getString("MUNICIPIO"))
                    .campus(results.getString("CAMPUS"))
                    .tipoBolsa(results.getString("TIPO_BOLSA"))
                    .modalidadeEnsinoBolsa(results.getString("MODALIDADE_ENSINO_BOLSA"))
                    .nomeCursoBolsa(results.getString("NOME_CURSO_BOLSA"))
                    .nomeTurnoCursoBolsa(results.getString("NOME_TURNO_CURSO_BOLSA"))
                    .CPFBeneficiarioBolsa(results.getString("CPF_BENEFICIARIO_BOLSA"))
                    .sexoBeneficiarioBolsa(results.getString("SEXO_BENEFICIARIO_BOLSA"))
                    .racaBeneficiarioBolsa(results.getString("RACA_BENEFICIARIO_BOLSA"))
                    .dtNascimentoBeneficiario(results.getString("DT_NASCIMENTO_BENEFICIARIO"))
                    .beneficiarioDeficienteFisico(results.getString("BENEFICIARIO_DEFICIENTE_FISICO"))
                    .regiaoBeneficiarioBolsa(results.getString("REGIAO_BENEFICIARIO_BOLSA"))
                    .siglaUFBeneficiarioBolsa(results.getString("SIGLA_UF_BENEFICIARIO_BOLSA"))
                    .municipioBeneficiarioBolsa(results.getString("MUNICIPIO_BENEFICIARIO_BOLSA"))
                    .build());
        }

        if (prouni.size() == 0) {
            return null;
        }
        return prouni;
    }
    
    public Integer getNumberBolsas(String nomeCursoBolsa, String racaBeneficiarioBolsa, String sexoBeneficiarioBolsa) throws SQLException {

        String query = "select COUNT(*) AS NUMERO_BOLSISTAS from prouni "
                + "where NOME_CURSO_BOLSA = ? and RACA_BENEFICIARIO_BOLSA = ? and SEXO_BENEFICIARIO_BOLSA = ?";

        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, nomeCursoBolsa);
        preparedStatement.setString(2, racaBeneficiarioBolsa);
        preparedStatement.setString(3, sexoBeneficiarioBolsa);

        ResultSet results = preparedStatement.executeQuery();

        Integer result = null;

        while (results.next()){
            result = results.getInt("NUMERO_BOLSISTAS");
        }

        return result;
    }
}