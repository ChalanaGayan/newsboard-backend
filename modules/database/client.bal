import ballerinax/postgresql;


configurable DBConfig dbConfig = ?;
configurable string encryptionKey = ?;

public final postgresql:Client dbClient = check new(
    host = dbConfig.host,
    username = dbConfig.userName,
    password = dbConfig.password,
    port = dbConfig.port,
    database = dbConfig.database
);
