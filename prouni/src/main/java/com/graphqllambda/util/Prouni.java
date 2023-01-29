package com.graphqllambda.util;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Prouni {

    Integer anoConcessaoBolsa;
    Integer codigoEMECIESBolsa;
    String nomeIESBolsa;
    String municipio;
    String campus;
    String tipoBolsa;
    String modalidadeEnsinoBolsa;
    String nomeCursoBolsa;
    String nomeTurnoCursoBolsa;
    String CPFBeneficiarioBolsa;
    String sexoBeneficiarioBolsa;
    String racaBeneficiarioBolsa;
    String dtNascimentoBeneficiario;
    String beneficiarioDeficienteFisico;
    String regiaoBeneficiarioBolsa;
    String siglaUFBeneficiarioBolsa;
    String municipioBeneficiarioBolsa;

}
