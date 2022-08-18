
create procedure about_emps
as
begin
    declare @ename as varchar(50);
    declare @sal as money;
    declare @deptno as int;

    DECLARE emps_cursor CURSOR
    FOR select ename,sal,deptno from emps;

    OPEN emps_cursor;

    FETCH NEXT FROM emps_cursor INTO @ename,@sal,@deptno;

    WHILE @@FETCH_STATUS = 0  
    BEGIN
        PRINT @ename + ' earns a salary of ' + cast(@sal as varchar) + ' and works for dept#' + cast(@deptno as varchar);
        FETCH NEXT FROM emps_cursor INTO @ename,@sal,@deptno;
    END;

    CLOSE emps_cursor;

    DEALLOCATE emps_cursor;
end;