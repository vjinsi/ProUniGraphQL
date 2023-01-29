CREATE TABLE prouni.prouni AS
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NULL AS NOME_TURNO_CURSO_BOLSA, NULL AS CPF_BENEFICIARIO_BOLSA, NULL AS SEXO_BENEFICIARIO_BOLSA, NULL AS RACA_BENEFICIARIO_BOLSA, NULL AS DT_NASCIMENTO_BENEFICIARIO, NULL AS BENEFICIARIO_DEFICIENTE_FISICO, NULL AS REGIAO_BENEFICIARIO_BOLSA, NULL AS SIGLA_UF_BENEFICIARIO_BOLSA, NULL AS MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni2.pda_prouni_2005 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2006 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2007 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2008 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2009 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2010 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2011 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2012 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2013 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2014 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2015 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2016 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2017 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2018 UNION
SELECT ANO_CONCESSAO_BOLSA, CODIGO_EMEC_IES_BOLSA, NOME_IES_BOLSA, NULL AS MUNICIPIO, NULL AS CAMPUS, TIPO_BOLSA, MODALIDADE_ENSINO_BOLSA, NOME_CURSO_BOLSA, NOME_TURNO_CURSO_BOLSA, CPF_BENEFICIARIO_BOLSA, SEXO_BENEFICIARIO_BOLSA, RACA_BENEFICIARIO_BOLSA, DT_NASCIMENTO_BENEFICIARIO, BENEFICIARIO_DEFICIENTE_FISICO, REGIAO_BENEFICIARIO_BOLSA, SIGLA_UF_BENEFICIARIO_BOLSA, MUNICIPIO_BENEFICIARIO_BOLSA FROM prouni.pda_prouni_2019 UNION
SELECT * FROM prouni.pda_prouni_2020;