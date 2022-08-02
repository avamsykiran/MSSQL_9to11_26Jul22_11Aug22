CREATE DATABASE [demodb];
GO

USE [demodb]
GO

CREATE TABLE [[depts](
	[deptno] [int] IDENTITY(1,1) NOT NULL,
	[dname] [varchar](50) NULL,
	[hq] [varchar](50) NULL, 
    
    CONSTRAINT [PK_depts] PRIMARY KEY ([deptno])
)
GO

USE [demodb]
GO

INSERT INTO [depts]([dname],[hq]) VALUES('ACCOUNTS','DELHI')
GO
INSERT INTO [depts]([dname],[hq]) VALUES('SALES','BANGLORE')
GO
INSERT INTO [depts]([dname],[hq]) VALUES('OPERATIONS','VIZAG')
GO

SELECT [deptno],[dname],[hq] FROM [depts]
GO

USE [demodb]
GO

/****** Object:  Table [dbo].[emps]    Script Date: 02-08-2022 09:58:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [[emps](
	[empid] [int] IDENTITY(1,1) NOT NULL,
	[ename] [varchar](50) NOT NULL,
	[basic] [money] NULL,
	[joindate] [date] NOT NULL,
	[desg] [varchar](20) NOT NULL,
	[deptid] [int] NULL,
    CONSTRAINT [PK_emps] PRIMARY KEY ([empid])
)
GO

ALTER TABLE [[emps] ADD  CONSTRAINT [DF_emps_basic]  DEFAULT ((0)) FOR [basic]
GO

ALTER TABLE [emps]  WITH CHECK ADD  CONSTRAINT [FK_depts_emps] FOREIGN KEY([deptid])
REFERENCES [dbo].[depts] ([deptno])
GO

ALTER TABLE [dbo].[emps] CHECK CONSTRAINT [FK_depts_emps]
GO
