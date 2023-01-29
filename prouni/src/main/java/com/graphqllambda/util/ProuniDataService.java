package com.graphqllambda.util;

import graphql.schema.DataFetcher;
import java.sql.Connection;

public class ProuniDataService {

    private ProuniDao prouniDao;

    public ProuniDataService(Connection connection) {
        this.prouniDao = new ProuniDao(connection);
    }

    public DataFetcher getMunicipioBeneficiarioFetcher() {
        return dataFetchingEnvironment -> {
            String nomeCursoBolsa = dataFetchingEnvironment.getArgument("nomeCursoBolsa");
            String racaBeneficiarioBolsa = dataFetchingEnvironment.getArgument("racaBeneficiarioBolsa");
            String sexoBeneficiarioBolsa = dataFetchingEnvironment.getArgument("sexoBeneficiarioBolsa");

            return prouniDao.getMunicipioBeneficiario(nomeCursoBolsa, racaBeneficiarioBolsa, sexoBeneficiarioBolsa);
        };
    }

    public DataFetcher getCodigoIESFetcher() {
        return dataFetchingEnvironment -> {
            Integer anoConcessaoBolsa = dataFetchingEnvironment.getArgument("anoConcessaoBolsa");
            String racaBeneficiarioBolsa = dataFetchingEnvironment.getArgument("racaBeneficiarioBolsa");
            String sexoBeneficiarioBolsa = dataFetchingEnvironment.getArgument("sexoBeneficiarioBolsa");

            return prouniDao.getCodigoIES(anoConcessaoBolsa, racaBeneficiarioBolsa, sexoBeneficiarioBolsa);
        };
    }

    public DataFetcher getNumberBolsasFetcher() {
        return dataFetchingEnvironment -> {
            String nomeCursoBolsa = dataFetchingEnvironment.getArgument("nomeCursoBolsa");
            String racaBeneficiarioBolsa = dataFetchingEnvironment.getArgument("racaBeneficiarioBolsa");
            String sexoBeneficiarioBolsa = dataFetchingEnvironment.getArgument("sexoBeneficiarioBolsa");

            return prouniDao.getNumberBolsas(nomeCursoBolsa, racaBeneficiarioBolsa, sexoBeneficiarioBolsa);
        };
    }

}