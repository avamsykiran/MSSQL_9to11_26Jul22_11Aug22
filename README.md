Ms SQL Server
---------------------------------------------------------------
    Agenda
        Introduction to sql server
        Create, Alter and Dropping a Database
        Creating Table
        Foreign to primary key referencing
        Cascading Referential Integrity constraints
        Check Constraints in SQL
        Unique key Constraints
        Using the Select clause
        Clauses, Operators and conditions
        Aggregate Functions with group by
        Where and Having clauses in sql
        Joins in SQL
        Outer Joins, Inner Join, Equi Join, Self-Join etc.,
        Full and Cross Joins in SQL
        Stored Procedures in SQL
        Output parameters
        Output parameters vs return values
        Indexes
        Clustered and non-clustered indexes
        Unique indexes
        Views in SQL
        Updating views and base tables
        Triggers in SQL
        Instead of triggers
        Subqueries in SQL
        DCL commands in SQL
        Database backup for SQL server
        Dynamic Query
        Cursors

        Performance
            Query Analysis
            Generate an Actual Execution Plan (Optimization)
            Monitor Resource Usage
            Identify Suspect Queries
            Fine Tuning Queries
            Partitioned table
            Indexing - Types & Concep

    Lab Setup
    
        Ms SQL Server Express 2018
        Ms SQL Management Studio 2018

    SQL

        RDBMS   <------------SQL--------------------->  Client

        DDL     Data Definition Language

                    CREATE
                    ALTER
                    DROP

        DML     Data Manipulation Language

                    INSERT
                    UPDATE
                    DELETE

        DRL     Data Retrival Language

                    SELECT                          projection
                    FROM                            data source / joins
                    WHERE                           pre-aggregate filtering
                    GROUP BY                        aggregation
                    HAVING                          post-aggregate filtering
                    ORDER BY                        sorting

        DCL     Data Control Language

                    GRANT
                    REVOKE

        TCL     Transaction Control Language        ACID        Atomicity, Consistency, Isolation, Durability

                    SAVEPOINT
                    ROLLBACK
                    COMMIT

        Constraints     ensures     Consistency and Integrity

                    Domain Level Constraints

                        Not Null
                        Default
                        Check

                    Entity Level Constraints

                        Unique
                        Primary Key
                        Foreign Key
                        Check
        T-SQL

    Ms SQL Server Database Objects

        Schemas
        Database
        Tables
        Views
        Triggers
        Indexes
        Stored Procdures
        Functions
        Cursors
        Synonyms
        Users
        Roles

    T-SQL Data Types

        Exact numerics
            bigint  numeric bit smallint    decimal smallmoney  int tinyint money
        
        Approximate numerics
            float   real

        Date and time   
            date    datetimeoffset  datetime2   smalldatetime   datetime    time

        ASCII Character strings
            char    varchar         text

        Unicode character strings
            nchar   nvarchar        ntext

        Binary strings
            binary  varbinary       image

        Other data types
            cursor  rowversion      hierarchyid uniqueidentifier    sql_variant 
            xml     table

    