use demodb;

--Self Join 

SELECT e.empno as EmpId,e.ename as EmpName,m.empno as MgrId,m.ename as MgrName
FROM emps e INNER JOIN  emps m on e.mgr=m.empno;

SELECT m.ename as MgrName,COUNT(*)
FROM emps e INNER JOIN  emps m on e.mgr=m.empno
GROUP BY m.ename;

--Sub Query

SELECT ename FROM emps WHERE sal = (SELECT max(sal) FROM emps);

--Correlated Sub Query

SELECT d.dname,e.ename,e.sal
FROM depts d inner join emps e on d.deptno=e.deptno
WHERE sal = (SELECT max(sal) FROM emps e2 WHERE e2.deptno=e.deptno);

--CASE..WHEN..THEN..ELSE..END 

SELECT empno,ename,sal,
        sal+(sal*(
            CASE deptno
            WHEN 10 THEN 0.10
            WHEN 20 THEN 0.15
            WHEN 30 THEN 0.05
            ELSE 0.0
            END
        )) as ProjectedSal
FROM emps;

SELECT empno,ename,increments.deptno,IncrementPercent,sal,sal +(sal*IncrementPercent) as ProjectedSal
FROM emps inner join 
    (SELECT distinct deptno,
        (
            CASE deptno
            WHEN 10 THEN 0.10
            WHEN 20 THEN 0.15
            WHEN 30 THEN 0.05
            ELSE 0.0
            END
        ) as IncrementPercent
FROM emps) as increments ON emps.deptno=increments.deptno;

-- views 

create view increments
as 
(SELECT deptno,
        (
            CASE deptno
            WHEN 10 THEN 0.10
            WHEN 20 THEN 0.15
            WHEN 30 THEN 0.05
            ELSE 0.0
            END
        ) as IncrementPercent
FROM depts);

SELECT empno,ename,increments.deptno,IncrementPercent,sal,sal +(sal*IncrementPercent) as ProjectedSal
FROM emps inner join increments ON emps.deptno=increments.deptno;
