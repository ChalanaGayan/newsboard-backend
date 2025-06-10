
import ballerina/sql;
import ballerinax/postgresql;

# Description.
# + return - return value description
public isolated function getDBClient() returns postgresql:Client|error {
    if dbClient is postgresql:Client {
        return dbClient;
    }
}

public isolated function insertUser(CreateUserPayload User) returns sql:ExecutionResult|sql:Error|error {
    CreateEncryptedUser encryptedUser = {
        name: User.name,
        nic: User.nic,
        email: User.email,
        totpSecret: User.totpSecret,
        phone: User.phone
    };
    return dbClient->execute(
        insertUserQuery(encryptedUser)
    );
}
