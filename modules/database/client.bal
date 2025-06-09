import ballerina/jdbc;

jdbc:Client|sql:Error dbClient = new (
   url =  "jdbc:h2:~/path/to/database",
   user = "root", password = "root",
   options = {
       datasourceName: "org.h2.jdbcx.JdbcDataSource"
   },
   connectionPool = {
       maxOpenConnections: 5
   }
);
