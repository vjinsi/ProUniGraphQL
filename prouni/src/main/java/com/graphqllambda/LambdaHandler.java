package com.graphqllambda;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.lambda.runtime.events.APIGatewayV2HTTPEvent;
import com.amazonaws.services.lambda.runtime.events.APIGatewayV2HTTPResponse;

import com.graphqllambda.util.InitDB;
import com.graphqllambda.util.GraphQLUtil;
import com.graphqllambda.util.JsonConverter;

import org.json.JSONObject;

public class LambdaHandler implements RequestHandler<APIGatewayV2HTTPEvent, APIGatewayV2HTTPResponse> {

    private final JsonConverter jsonConverter;
    private final GraphQLUtil graphQLUtil;


    public LambdaHandler() {
        this.jsonConverter = new JsonConverter();
        InitDB initDB = new InitDB();
        this.graphQLUtil = new GraphQLUtil(jsonConverter, initDB.getConnection());
    }


    @Override
    public APIGatewayV2HTTPResponse handleRequest(APIGatewayV2HTTPEvent event, Context context) {
        try {

            return APIGatewayV2HTTPResponse.builder()
                    .withIsBase64Encoded(true)
                    .withBody(handlePostRequest(event))
                    .withStatusCode(200)
                    .build();
        } catch (IllegalArgumentException e) {
            return APIGatewayV2HTTPResponse.builder()
                    .withBody(e.getMessage())
                    .withStatusCode(400)
                    .build();
        }
    }

    public String handlePostRequest(APIGatewayV2HTTPEvent event) {

        JSONObject jsonObject = new JSONObject(event.getBody());

        String queryStr = jsonObject.get("query").toString();
        
        String operationName = null;
        String variablesJson = null;
        
        return graphQLUtil.processGraphQlRequest(queryStr, operationName == null ? null : operationName.toString(), variablesJson == null ? null : variablesJson.toString());
    }


}