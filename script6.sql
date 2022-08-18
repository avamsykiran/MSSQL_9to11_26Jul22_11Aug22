CREATE TRIGGER dept_insert_trigger
ON depts
AFTER INSERT  AS
    BEGIN
        declare @deptno as int;
        declare @dname as varchar(50);
        declare @hq as varchar(50);

        SET NOCOUNT ON;
        
        select @deptno = i.deptno,@dname=i.dname,@hq=i.hq
        from INSERTED i;

        PRINT 'RECORD SAVED ' + cast(@deptno as varchar) + ',' + @dname + ',' + @hq;
    END;