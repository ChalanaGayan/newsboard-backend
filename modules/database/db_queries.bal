import ballerina/sql;

isolated function insertUserQuery(CreateEncryptedUser user) returns sql:ParameterizedQuery =>
    `
    INSERT INTO users (
        nic,
        email,
        phone,
        totp_secret
    ) VALUES (
        ${user.nic},
        ${user.email},
        ${user.phone},
        ${user.totpSecret}
    )`;
