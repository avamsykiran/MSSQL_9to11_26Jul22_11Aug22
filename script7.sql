CREATE TRIGGER dept_del_avoid_trigger
ON depts
INSTEAD OF DELETE
AS
BEGIN
    declare @deptno as int;

    select @deptno=d.deptno
    from DELETED d;

    UPDATE depts
    SET isactive=0
    WHERE deptno=@deptno;
END;