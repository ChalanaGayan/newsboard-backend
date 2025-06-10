import ballerina/http;

import ballerinax/postgresql;
import newsboard_backend.database;
import ballerina/sql;
import ballerina/log;

service / on new http:Listener(9093) {

    resource function get details() returns http:Created|error {
        postgresql:Client|error response = database:getDBClient();
        if response is error {
            return response;
        }
        return <http:Created> {
            body:  {
                message: "Database client is ready."
            }
        };
    }
    
    resource function post register(@http:Payload database:CreateUserPayload payload) 
        returns http:Created|http:InternalServerError|error {
        sql:ExecutionResult|sql:Error|error result = database:insertUser(payload);
        if result is sql:Error || result is error {
            string customErr = "error occurred while inserting user";
            log:printError(customErr, result);
            return <http:InternalServerError> {
                body:  {
                    message: "Failed to register user."
                }
            };
        }

        return <http:Created> {
            body:  {
                message: "User registered successfully."
            }
        };
    }
}
