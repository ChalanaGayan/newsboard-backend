
# [PostgreSQL Database Configuration]
#
public type DBConfig record {|
    # Host of the database server.
    string host;
    # Username for the database connection.
    string userName;
    # Password for the database connection.
    string password;
    # Port of the database server.
    int port;
    # Name of the database to connect to.
    string database;
|};


public type CreateUserPayload record {|
    string name;
    string nic;
    string email;
    string phone;
    string totpSecret;
|};

type CreateEncryptedUser record {|
    string name;
    string nic;
    string email;
    string phone;
    string totpSecret;
|};
