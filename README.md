# ProUni GraphQL

This repository contains code necessary download data about scholarships offered through the Brazilian Government's "ProUni" program, and make it available through a GraphQL API running on AWS.

In order to run it, simply execute the terraform scripts, then source the loadDB.sh file.

The API can then be called from the CLI, using commands in the form:

curl -X POST https://\<API Gateway ID\>.execute-api.eu-central-1.amazonaws.com/prouni-demo/LambdaGraphQL2 -H "Content-Type: application/json" -d "{ \\"query\": \\" { \<queryName\> (\<filter1\>:\\\\\\"\<filter_value1\>\\\\\\", \<filter2\>: \\\\\\"\<filter_value2\>\\\\\\") { \<desired_field\> }} \\" }"

such as:

curl -X POST https://\<API Gateway ID\>.execute-api.eu-central-1.amazonaws.com/prouni-demo/LambdaGraphQL2 -H "Content-Type: application/json" -d "{ \\"query\\": \\" { getMunicipioBeneficiario(nomeCursoBolsa:\\\\\\"Enfermagem\\\\\\", racaBeneficiarioBolsa: \\\\\\"Parda\\\\\", sexoBeneficiarioBolsa: \\\\\\"Masculino\\\\\\") { nomeCursoBolsa }} \\" }"

It is important to note that this is meant only as a demo, and ccertain modifications would have to be made before putting it into production. They include:

- Setting the "Publicly Accessible" field for the DB instance to "False", after loading the Database with data
- Restricting access to the DB on the Security Group Inbound Rules
- Replace the DB Username and Password in the terraform script with environment variables, and also change their values