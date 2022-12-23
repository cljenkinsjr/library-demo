let mysql = require("mysql");
let connection = mysql.createConnection({
  host: "localhost",
  port: "3306",
  user: "root",
  password: "Clj051071!@#",
  database: "library",
  insecureAuth: true,
});

connection.connect(function (error) {
  if (!!error) {
    console.log(error);
  } else {
    console.log("Connected..!");
  }
});

module.exports = connection;
