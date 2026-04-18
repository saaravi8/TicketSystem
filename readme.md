# Database Connection Setup

This project connects to a PostgreSQL database using the `Connect` class.

## File to edit
Open the `Connect.java` file and update these three values:

```java
private static final String URL = "jdbc:postgresql://localhost:5432/your_db";
private static final String USER = "postgres";
private static final String PASS = "your_password";
```

## What to change

### 1. Database address and name
Update the `URL` value.

Format:

```java
jdbc:postgresql://<host>:<port>/<database_name>
```

Example:

```java
private static final String URL = "jdbc:postgresql://localhost:5432/library_db";
```

- `localhost` = the database server address
- `5432` = the default PostgreSQL port
- `library_db` = your database name

If the database is on another machine, replace `localhost` with that server address.

Example:

```java
private static final String URL = "jdbc:postgresql://192.168.1.50:5432/library_db";
```

### 2. Username
Replace:

```java
private static final String USER = "postgres";
```

with your PostgreSQL username.

Example:

```java
private static final String USER = "my_user";
```

### 3. Password
Replace:

```java
private static final String PASS = "your_password";
```

with your PostgreSQL password.

Example:

```java
private static final String PASS = "mypassword123";
```

## Full example

```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
    private static final String URL = "jdbc:postgresql://localhost:5432/library_db";
    private static final String USER = "postgres";
    private static final String PASS = "mypassword123";

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            throw new SQLException("PostgreSQL Driver not found", e);
        }
    }
}
```

