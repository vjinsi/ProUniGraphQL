package com.graphqllambda.util;

import com.google.common.base.Charsets;
import com.google.common.io.Resources;
import graphql.ExecutionInput;
import graphql.GraphQL;
import graphql.schema.GraphQLSchema;
import graphql.schema.idl.*;

import java.net.URL;
import java.sql.Connection;
import java.util.Collections;
import java.util.Map;

public class GraphQLUtil {

    static String SCHEMA_FILE_NAME = "schema.graphqls";

    private GraphQL graphQL;
    private JsonConverter jsonConverter;
    private Connection connection;
    private ProuniDataService prouniDataService;

    public GraphQLUtil(JsonConverter jsonConverter, Connection connection) {
        this.connection = connection;
        this.jsonConverter = jsonConverter;
        this.prouniDataService = new ProuniDataService(this.connection);
        this.graphQL = GraphQL.newGraphQL(buildSchema()).build();
    }

    public GraphQL getGraphQL() {
        return this.graphQL;
    }

    private GraphQLSchema buildSchema() {
        try {
            URL url = Resources.getResource(SCHEMA_FILE_NAME);
            String sdl = Resources.toString(url, Charsets.UTF_8);
            TypeDefinitionRegistry typeRegistry = new SchemaParser().parse(sdl);
            RuntimeWiring runtimeWiring = buildWiring();
            SchemaGenerator schemaGenerator = new SchemaGenerator();
            return schemaGenerator.makeExecutableSchema(typeRegistry, runtimeWiring);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    private RuntimeWiring buildWiring() {
        return RuntimeWiring.newRuntimeWiring()
                .type(TypeRuntimeWiring.newTypeWiring("Query")
                        .dataFetcher("getMunicipioBeneficiario", prouniDataService.getMunicipioBeneficiarioFetcher()))
                .type(TypeRuntimeWiring.newTypeWiring("Query")
                        .dataFetcher("getCodigoIES", prouniDataService.getCodigoIESFetcher()))
                .type(TypeRuntimeWiring.newTypeWiring("Query")
                        .dataFetcher("getNumberBolsas", prouniDataService.getNumberBolsasFetcher()))
                .build();
    }

    public String processGraphQlRequest(String query, String operationName, String variablesJson) {

        Map<String, Object> variableMap = convertVariablesJson(variablesJson);
        ExecutionInput executionInput = ExecutionInput.newExecutionInput()
                .query(query)
                .operationName(operationName)
                .variables(variableMap)
                .build();

        Object returnObj = graphQL.execute(executionInput).toSpecification();
        return jsonConverter.toJson(returnObj);
    }

    private Map<String, Object> convertVariablesJson(String jsonMap) {
        if (jsonMap == null) {
            return Collections.emptyMap();
        }
        return jsonConverter.fromJson(jsonMap, Map.class);
    }


}