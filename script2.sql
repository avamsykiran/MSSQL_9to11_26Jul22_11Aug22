USE demodbb;

create table depts(  
  deptno     int,  
  dname      nvarchar(14),  
  hq         nvarchar(13),  
  constraint pk_dept primary key (deptno)  
);

create table emps(  
  empno    int,  
  ename    nvarchar(10),  
  job      nvarchar(9),  
  mgr      int,  
  hiredate date,  
  sal      money,  
  comm     money,  
  deptno   int,  
  constraint pk_emp primary key (empno),  
  constraint fk_deptno foreign key (deptno) references depts (deptno)  
);

insert into DEPTs (DEPTNO, DNAME, hq)
values(10, 'ACCOUNTING', 'NEW YORK');
insert into depts  
values(20, 'RESEARCH', 'DALLAS');
insert into depts  
values(30, 'SALES', 'CHICAGO');
insert into depts  
values(40, 'OPERATIONS', 'BOSTON');

insert into emps  
values(7839, 'KING', 'PRESIDENT', null,  '2021-01-01', 5000, null, 10  );

insert into emps  
values(7698, 'BLAKE', 'MANAGER', 7839,'2021-02-01',2850, null, 30  );

insert into emps  
values( 7782, 'CLARK', 'MANAGER', 7839,  '2021-03-01',  2450, null, 10 );

insert into emps  
values( 7566, 'JONES', 'MANAGER', 7839,  '2021-03-03',2975, null, 20  );

insert into emps  
values( 7788, 'SCOTT', 'ANALYST', 7566,  '2021-03-03',  3000, null, 20  );

insert into emps  
values(7902, 'FORD', 'ANALYST', 7566,'2021-04-01',3000, null, 20  );

insert into emps  
values(  7369, 'SMITH', 'CLERK', 7902,'2021-05-01',  800, null, 20 );

insert into emps  
values(  7499, 'ALLEN', 'SALESMAN', 7698,  '2021-06-01',  1600, 300, 30  );

insert into emps  
values(  7521, 'WARD', 'SALESMAN', 7698,'2021-07-01', 1250, 500, 30  );

insert into emps  
values(  7654, 'MARTIN', 'SALESMAN', 7698,  '2021-08-01',1250, 1400, 30  );

insert into emps  
values(  7844, 'TURNER', 'SALESMAN', 7698, '2021-08-01',  1500, 0, 30  );

insert into emps  
values(  7876, 'ADAMS', 'CLERK', 7788, '2021-09-01',  1100, null, 20 );

insert into emps  
values(  7900, 'JAMES', 'CLERK', 7698,  '2021-12-01',  950, null, 30 );

insert into emps  
values(  7934, 'MILLER', 'CLERK', 7782, '2021-12-12',1300, null, 10  );

select ename 
from emps
where ename like '%H';

select ename 
from emps
where ename like 'S%';

select ename 
from emps
where ename like '%A%';

select ename 
from emps
where ename like '%I_';

select depts.deptno,depts.dname,emps.ename,emps.empno from depts inner join emps on depts.deptno=emps.deptno;

SELECT depts.deptno,depts.dname,sum(emps.sal)
FROM depts INNER JOIN emps ON depts.deptno=emps.deptno
GROUP BY depts.deptno,depts.dname;

SELECT job,sum(sal) as total_sal,min(sal) as min_sal,max(sal) as max_sal
FROM emps
GROUP BY job;

SELECT dname, job,sum(sal) as total_sal,min(sal) as min_sal,max(sal) as max_sal
FROM depts INNER JOIN emps ON depts.deptno=emps.deptno
GROUP BY dname,job
ORDER BY dname,job

