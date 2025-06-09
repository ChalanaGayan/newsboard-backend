
import ballerinax/postgresql;

public type DBConfig record {|
    string url;
    string user;
    string password;
|};

type DBConnection record {|
    *DBConfig;
    postgresql:Options? options;
|};
