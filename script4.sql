use demodb;

select deptno,job,sum(sal) from emps group by deptno,job;

select job,[10],[20],[30] from
(SELECT job,sal,deptno
FROM emps) emp1
 PIVOT  (   
        sum(sal)  
        FOR deptno IN ([10],[20],[30])  
        ) AS dept_job_salSum;

create index emps_job on emps(job);

drop index emps.emps_jobs;

create procedure add_emp (@empno  int,@ename  varchar(50),@job  varchar(50),@mgr  int,@hiredate  date,@sal  money,@deptno  int)
as
begin
    declare @comm as money

    if @job='SALESMAN' and @deptno<>30 
     begin
        print 'Not an allowed record';
     end
    else
     begin
        if @deptno=30 and @job='SALESMAN'
            set @comm = @sal*0.30;

        insert into emps values(@empno,@ename,@job,@mgr,@hiredate,@sal,@comm,@deptno);
        print 'record inserted'
     end
end;

exec add_emp 102,'Vamsy','SALESMAN',7499,'2022-01-01',567,30

drop procedure add_emp;

create function get_exp(@empno int) returns decimal as
begin
    declare @hiredate as date

    select @hiredate=hiredate
    from emps
    where empno=@empno;

    return  datediff(yyyy,getdate(),@hiredate)
end;

drop function get_exp;


create function get_all_exps() returns table as
    return (
        select empno,ename,hiredate,datediff(yyyy,hiredate,getdate()) as experience
        from emps
    );

select * from dbo.get_all_exps()