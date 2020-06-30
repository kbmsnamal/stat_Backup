USE [master]
GO
/****** Object:  Database [AgentHistoryLogNew]    Script Date: 6/25/2020 6:01:04 PM ******/
CREATE DATABASE [AgentHistoryLogNew]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AgentLog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AgentHistoryLogNew.mdf' , SIZE = 71996928KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AgentLog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AgentHistoryLogNew_1.LDF' , SIZE = 388544KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [AgentHistoryLogNew] ADD FILEGROUP [Log]
GO
ALTER DATABASE [AgentHistoryLogNew] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AgentHistoryLogNew].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AgentHistoryLogNew] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET ARITHABORT OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AgentHistoryLogNew] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [AgentHistoryLogNew] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AgentHistoryLogNew] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AgentHistoryLogNew] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AgentHistoryLogNew] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AgentHistoryLogNew] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AgentHistoryLogNew] SET  RESTRICTED_USER 
GO
ALTER DATABASE [AgentHistoryLogNew] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AgentHistoryLogNew] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AgentHistoryLogNew] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AgentHistoryLogNew] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AgentHistoryLog', N'ON'
GO
USE [AgentHistoryLogNew]
GO
/****** Object:  StoredProcedure [dbo].[cacheproce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cacheproce] 
@FILE_PATH varchar(1000),
@BeginDATE varchar(50)
 AS
DECLARE  @Query as  varchar(2000)
--SET @Query = 'DELETE  FROM Cache where Begindate between '''+ @BeginDATE+''' and '''+@BeginDATE+' 23:59:59'''
--print @Query
--EXEC(@Query)
SET @Query = 'BULK INSERT Cache FROM ''' + @FILE_PATH + ''''
SET @Query = @Query + 'WITH ('
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[DC2XML01proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DC2XML01proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM DC2XML01'
EXEC(@Query)
SET @Query = 'BULK INSERT DC2XML01 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[DC2XML02proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DC2XML02proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM DC2XML02'
EXEC(@Query)
SET @Query = 'BULK INSERT DC2XML02 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[DC2XML05proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DC2XML05proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM DC2XML05'
EXEC(@Query)
SET @Query = 'BULK INSERT DC2XML05 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[DC2XML06proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DC2XML06proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM DC2XML06'
EXEC(@Query)
SET @Query = 'BULK INSERT DC2XML06 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[DC2XML07proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DC2XML07proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM DC2XML07'
EXEC(@Query)
SET @Query = 'BULK INSERT DC2XML07 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[DC2XML08proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DC2XML08proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM DC2XML08'
EXEC(@Query)
SET @Query = 'BULK INSERT DC2XML08 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[DC2XML09proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DC2XML09proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM DC2XML09'
EXEC(@Query)
SET @Query = 'BULK INSERT DC2XML09 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[ForeingCache1proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[ForeingCache1proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM ForeingCache1'
EXEC(@Query)
SET @Query = 'BULK INSERT ForeingCache1 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[ForeingCache2proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[ForeingCache2proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM ForeingCache2'
EXEC(@Query)
SET @Query = 'BULK INSERT ForeingCache2 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[ForeingCache3proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[ForeingCache3proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM ForeingCache3'
EXEC(@Query)
SET @Query = 'BULK INSERT ForeingCache3 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[InsertSuccessProc]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[InsertSuccessProc]
	-- Add the parameters for the stored procedure here
	@agentcode varchar(255),
	@Location varchar(3),
	@MachineName varchar(15),
	@BeginDate smalldatetime,
	@HA int,
	@AE int,
	@BE int,
	@HDR int,
	@HDFGCR int,
	@COR int,
	@HSR int,
	@CAD int,
	@HCAD int,
	@HB int,
	@BEAD int,
	@XMLRequest int,
	@CIR int,
	@HRR int,
	@VERSION int,
	@BeginHour int
	
AS
BEGIN
	INSERT INTO SuccessfulData(agentcode,Location,MachineName,BeginDate,HA,AE,BE,HDR,HDFGCR,COR,HSR,CAD,HCAD,HB,BEAD,XMLRequest,CIR,HRR,VERSION,BeginHour) VALUES(@agentcode,@Location,@MachineName,@BeginDate,@HA,@AE,@BE,@HDR,@HDFGCR,@COR,@HSR,@CAD,@HCAD,@HB,@BEAD,@XMLRequest,@CIR,@HRR,@VERSION,@BeginHour)
END

GO
/****** Object:  StoredProcedure [dbo].[OBX1proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[OBX1proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM OBX1'
EXEC(@Query)
SET @Query = 'BULK INSERT OBX1 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[OBX2AEproce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[OBX2AEproce] 
	@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM OBX2ae'
EXEC(@Query)
SET @Query = 'BULK INSERT OBX2ae FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[OBX2proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[OBX2proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM OBX2'
EXEC(@Query)
SET @Query = 'BULK INSERT OBX2 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[successproce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[successproce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'BULK INSERT SuccessfulData FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + ' MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[trlinkjws2proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[trlinkjws2proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM trlinkjws2'
EXEC(@Query)
SET @Query = 'BULK INSERT trlinkjws2 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[trlinkjws3proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[trlinkjws3proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM trlinkjws3'
EXEC(@Query)
SET @Query = 'BULK INSERT trlinkjws3 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[trlinkjws4proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[trlinkjws4proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM trlinkjws4'
EXEC(@Query)
SET @Query = 'BULK INSERT trlinkjws4 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)



GO
/****** Object:  StoredProcedure [dbo].[trlinkjwsproce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[trlinkjwsproce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM trlinkjws'
EXEC(@Query)
SET @Query = 'BULK INSERT trlinkjws FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[xmlv5live1proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[xmlv5live1proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv5live1'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv5live1 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + ' MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[xmlv5live8proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[xmlv5live8proce]
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv5live8'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv5live8 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
--SET @Query = @Query +' DATAFILETYPE = ''char'','
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + ' MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[xmlv5live9proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[xmlv5live9proce]
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv5live9'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv5live9 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + ' MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[xmlv6live10AEproce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[xmlv6live10AEproce] 
	@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live10ae'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live10ae FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[xmlv6live10proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[xmlv6live10proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live10'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live10 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + ' MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[xmlv6live3AEproce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[xmlv6live3AEproce] 
	@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live3ae'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live3ae FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[xmlv6live3newproce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[xmlv6live3newproce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)

SET @Query = 'BULK INSERT xmlv6live3new FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[xmlv6live3proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[xmlv6live3proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live3'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live3 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[xmlv6live5AEproce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[xmlv6live5AEproce] 
	@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live5ae'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live5ae FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[xmlv6live5proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[xmlv6live5proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live5'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live5 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[xmlv6live6AEproce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[xmlv6live6AEproce] 
	@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live6AE'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live6AE FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[xmlv6live6proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[xmlv6live6proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live6'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live6 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[xmlv6live7AEproce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[xmlv6live7AEproce] 
	@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live7ae'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live7ae FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[xmlv6live7proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[xmlv6live7proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live7'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live7 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query +' ROWS_PER_BATCH = 30000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[xmlv6live8AEproce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[xmlv6live8AEproce] 
	@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live8ae'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live8ae FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[xmlv6live8proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[xmlv6live8proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live8'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live8 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  StoredProcedure [dbo].[xmlv6live9AEproce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[xmlv6live9AEproce] 
	@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live9ae'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live9ae FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + ' ROWTERMINATOR = ''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)


GO
/****** Object:  StoredProcedure [dbo].[xmlv6live9proce]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[xmlv6live9proce] 
@FILE_PATH varchar(2000)
 AS
DECLARE  @Query as  varchar(2000)
SET @Query = 'DELETE  FROM xmlv6live9'
EXEC(@Query)
SET @Query = 'BULK INSERT xmlv6live9 FROM "' + @FILE_PATH + '"'
SET @Query = @Query + 'WITH ('
SET @Query = @Query +' ROWS_PER_BATCH = 10000,'
SET @Query = @Query +' TABLOCK,'
SET @Query = @Query + ' FIELDTERMINATOR =''\t'' ,'
SET @Query = @Query + 'ROWTERMINATOR=''\n'','
SET @Query = @Query + 'MAXERRORS=10000000'
SET @Query = @Query + ')'
print @@ERROR
EXEC(@Query)

GO
/****** Object:  Table [dbo].[=xmlv6live7]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[=xmlv6live7](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AECount]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AECount](
	[AgentCode] [nvarchar](50) NOT NULL,
	[MachineName] [nvarchar](50) NOT NULL,
	[BeginTime] [smalldatetime] NOT NULL,
	[hits] [int] NOT NULL,
 CONSTRAINT [PK_AECount] PRIMARY KEY CLUSTERED 
(
	[AgentCode] ASC,
	[MachineName] ASC,
	[BeginTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AEGroupCount]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AEGroupCount](
	[AgentCode] [nvarchar](50) NOT NULL,
	[MachineName] [nvarchar](50) NOT NULL,
	[ArrivalDate] [nvarchar](50) NOT NULL,
	[BeginTime] [smalldatetime] NOT NULL,
	[seqno] [int] NOT NULL,
	[hits] [int] NOT NULL,
 CONSTRAINT [PK_AEGroupCount] PRIMARY KEY CLUSTERED 
(
	[AgentCode] ASC,
	[MachineName] ASC,
	[ArrivalDate] ASC,
	[BeginTime] ASC,
	[seqno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AESummary]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AESummary](
	[AgentCode] [nvarchar](50) NOT NULL,
	[MachineName] [nvarchar](50) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[ArrivalDate] [nvarchar](50) NOT NULL,
	[HotelCode] [nvarchar](50) NOT NULL,
	[hits] [bigint] NOT NULL,
 CONSTRAINT [PK_AESummary] PRIMARY KEY CLUSTERED 
(
	[AgentCode] ASC,
	[MachineName] ASC,
	[BeginDate] ASC,
	[Location] ASC,
	[ArrivalDate] ASC,
	[HotelCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Agent-del]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent-del](
	[AgentCode] [nvarchar](255) NOT NULL,
	[AgentName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[AgentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AgentStat]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentStat](
	[AgentCode] [nchar](30) NULL,
	[less1000] [int] NULL,
	[from1000to2000] [int] NULL,
	[from2000to3000] [int] NULL,
	[from3000to4000] [int] NULL,
	[from4000to5000] [int] NULL,
	[from5000to6000] [int] NULL,
	[from6000to7000] [int] NULL,
	[greater7000] [int] NULL,
	[MachineName] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AgentSummary]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AgentSummary](
	[Agentcode] [varchar](10) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[HA] [bigint] NOT NULL,
	[AE] [bigint] NOT NULL,
	[HB] [bigint] NOT NULL,
 CONSTRAINT [PK_AgentSummary] PRIMARY KEY CLUSTERED 
(
	[Agentcode] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArrivalDate]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArrivalDate](
	[AgentCode] [varchar](50) NOT NULL,
	[Location] [varchar](10) NOT NULL,
	[ArrivalDate] [varchar](50) NOT NULL,
	[HotelCode] [varchar](10) NOT NULL,
	[MachineName] [varchar](50) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[HA] [int] NOT NULL,
	[AE] [int] NOT NULL,
	[HB] [int] NOT NULL,
 CONSTRAINT [PK_ArrivalDate] PRIMARY KEY CLUSTERED 
(
	[AgentCode] ASC,
	[Location] ASC,
	[ArrivalDate] ASC,
	[HotelCode] ASC,
	[MachineName] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArrivalDateSummary]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArrivalDateSummary](
	[AgentCode] [varchar](50) NOT NULL,
	[Location] [varchar](10) NOT NULL,
	[ArrivalDate] [varchar](50) NOT NULL,
	[HotelCode] [varchar](10) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[HA] [int] NOT NULL,
	[AE] [int] NOT NULL,
	[HB] [int] NOT NULL,
 CONSTRAINT [PK_ArrivalDateSummary] PRIMARY KEY CLUSTERED 
(
	[AgentCode] ASC,
	[Location] ASC,
	[ArrivalDate] ASC,
	[HotelCode] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BOX2]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BOX2](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cache]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cache](
	[AgentCode] [varchar](6) NULL,
	[BeginDate] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[TrLinkType] [varchar](50) NULL,
	[CacheGroup] [varchar](50) NULL,
	[MachineName] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cache.log]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cache.log](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CheckinDate]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CheckinDate](
	[AgentCode] [varchar](255) NOT NULL,
	[hits] [int] NULL,
	[MachineName] [varchar](15) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_CheckinDate] PRIMARY KEY CLUSTERED 
(
	[AgentCode] ASC,
	[MachineName] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CnxData]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CnxData](
	[InsertDate] [datetime] NOT NULL,
	[AgentCode] [varchar](100) NOT NULL,
	[BRef] [varchar](100) NOT NULL,
	[BookingStatus] [varchar](50) NOT NULL,
	[CnxDate] [datetime] NOT NULL,
	[HotelCode] [varchar](10) NOT NULL,
	[ClerkCode] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DC2XML01]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DC2XML01](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DC2XML02]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DC2XML02](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DC2XML05]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DC2XML05](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DC2XML06]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DC2XML06](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DC2XML07]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DC2XML07](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DC2XML08]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DC2XML08](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DC2XML09]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DC2XML09](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ErrorAgent]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorAgent](
	[agentcode] [varchar](10) NOT NULL,
	[MachineName] [varchar](150) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[YS] [int] NULL,
	[AC] [int] NULL,
	[AP] [int] NULL,
	[InD] [int] NULL,
	[PiT] [int] NULL,
	[SB] [int] NULL,
	[InE] [int] NULL,
	[UA] [int] NULL,
	[InR] [int] NULL,
	[NC] [int] NULL,
	[MD] [int] NULL,
	[InC] [int] NULL,
	[NDF] [int] NULL,
	[Other] [int] NULL,
 CONSTRAINT [PK_ErrorAgent] PRIMARY KEY CLUSTERED 
(
	[agentcode] ASC,
	[MachineName] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ErrorData]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorData](
	[agentcode] [varchar](255) NOT NULL,
	[MachineName] [varchar](15) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[BeginHour] [int] NOT NULL,
	[HA] [int] NULL,
	[AE] [int] NULL,
	[BE] [int] NULL,
	[HDR] [int] NULL,
	[HDFGCR] [int] NULL,
	[COR] [int] NULL,
	[HSR] [int] NULL,
	[CAD] [int] NULL,
	[HCAD] [int] NULL,
	[HB] [int] NULL,
	[BEAD] [int] NULL,
	[XMLRequest] [int] NULL,
	[CIR] [int] NULL,
	[HRR] [int] NULL,
 CONSTRAINT [PK_ErrorData] PRIMARY KEY CLUSTERED 
(
	[agentcode] ASC,
	[MachineName] ASC,
	[BeginDate] ASC,
	[BeginHour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ForeignCache]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ForeignCache](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ForeignCache1]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ForeignCache1](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ForeignCache2]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ForeignCache2](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ForeignCache3]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ForeignCache3](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ForeingCache1]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ForeingCache1](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ForeingCache2]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ForeingCache2](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ForeingCache3]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ForeingCache3](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HotelResort]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelResort](
	[HotelCode] [nvarchar](255) NULL,
	[F2] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvalidCityCode]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvalidCityCode](
	[MachineName] [varchar](15) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[AgentCode] [varchar](255) NOT NULL,
	[hits] [int] NULL,
 CONSTRAINT [PK_InvalidCityCode] PRIMARY KEY CLUSTERED 
(
	[MachineName] ASC,
	[BeginDate] ASC,
	[AgentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvalidHotelCode]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvalidHotelCode](
	[AgentCode] [varchar](255) NOT NULL,
	[hits] [int] NULL,
	[MachineName] [varchar](15) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_InvalidHotelCode] PRIMARY KEY CLUSTERED 
(
	[AgentCode] ASC,
	[MachineName] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LanguageData]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LanguageData](
	[MachineName] [varchar](15) NOT NULL,
	[agentcode] [varchar](255) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[ReqLanguage] [varchar](10) NOT NULL,
	[HA] [int] NULL,
	[AE] [int] NULL,
	[BE] [int] NULL,
	[HDR] [int] NULL,
	[HDFGCR] [int] NULL,
	[COR] [int] NULL,
	[HSR] [int] NULL,
	[CAD] [int] NULL,
	[HCAD] [int] NULL,
	[HB] [int] NULL,
	[BEAD] [int] NULL,
	[XMLRequest] [int] NULL,
	[CIR] [int] NULL,
	[HRR] [int] NULL,
 CONSTRAINT [PK_LanguageData] PRIMARY KEY CLUSTERED 
(
	[MachineName] ASC,
	[agentcode] ASC,
	[BeginDate] ASC,
	[ReqLanguage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LocationAgentSummary]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocationAgentSummary](
	[AgentCode] [varchar](255) NOT NULL,
	[Location] [varchar](10) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[HA] [bigint] NOT NULL,
	[AE] [bigint] NOT NULL,
	[HB] [bigint] NOT NULL,
 CONSTRAINT [PK_LocationAgentSummary1] PRIMARY KEY CLUSTERED 
(
	[AgentCode] ASC,
	[Location] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LocationSummary]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocationSummary](
	[Location] [varchar](10) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[HA] [bigint] NOT NULL,
	[AE] [bigint] NOT NULL,
	[HB] [bigint] NOT NULL,
 CONSTRAINT [PK_LocationAgentSummary] PRIMARY KEY CLUSTERED 
(
	[Location] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MachineErrorData]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MachineErrorData](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MachineErrorVersion5]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MachineErrorVersion5](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MaxDuration]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MaxDuration](
	[MachineName] [varchar](15) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[AgentCode] [varchar](255) NOT NULL,
	[hits] [int] NULL,
	[InquiryType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MaxDuration] PRIMARY KEY CLUSTERED 
(
	[MachineName] ASC,
	[BeginDate] ASC,
	[AgentCode] ASC,
	[InquiryType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OBX]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OBX](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OBX1-del]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OBX1-del](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](3) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [text] NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OBX2]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OBX2](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OBX2AE]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OBX2AE](
	[BeginTime] [smalldatetime] NULL,
	[AgentCode] [nvarchar](50) NULL,
	[seqno] [nvarchar](50) NULL,
	[FirstHotelCode] [nvarchar](50) NULL,
	[NoOfAdults] [nvarchar](10) NULL,
	[NoOfChildren] [nvarchar](10) NULL,
	[ArrivalDate] [nvarchar](50) NULL,
	[Duration] [nvarchar](10) NULL,
	[PaxInRoom] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OtherErrorsAgent]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OtherErrorsAgent](
	[agentcode] [varchar](10) NOT NULL,
	[MachineName] [varchar](150) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[XPER] [int] NULL,
	[HCnD] [int] NULL,
	[PBS] [int] NULL,
	[InCC] [int] NULL,
	[InDR] [int] NULL,
	[InPW] [int] NULL,
	[SeTO] [int] NULL,
	[REUM] [int] NULL,
	[InRD] [int] NULL,
	[DSNR] [int] NULL,
	[InCOD] [int] NULL,
	[MNDE] [int] NULL,
	[SCRE] [int] NULL,
	[NHHN] [int] NULL,
	[ECRE] [int] NULL,
	[ErTC] [int] NULL,
	[InAG] [int] NULL,
	[InDF] [int] NULL,
	[ICIR] [int] NULL,
	[InI2] [int] NULL,
	[NSDA] [int] NULL,
	[SCDA] [int] NULL,
	[ErCM] [int] NULL,
	[CFCC] [int] NULL,
	[CRNF] [int] NULL,
	[ErCV] [int] NULL,
	[ErBR] [int] NULL,
	[HNID] [int] NULL,
	[InFD] [int] NULL,
	[InTD] [int] NULL,
	[PEBV] [int] NULL,
	[PEMA] [int] NULL,
	[YACI] [int] NULL,
	[SREE] [int] NULL,
	[CBPD] [int] NULL,
	[NCEB] [int] NULL,
	[ETNM] [int] NULL,
	[ENIO] [int] NULL,
	[MLCF] [int] NULL,
	[PNTA] [int] NULL,
	[BSAS] [int] NULL,
	[Other] [int] NULL,
 CONSTRAINT [PK_OtherErrorsAgent] PRIMARY KEY CLUSTERED 
(
	[agentcode] ASC,
	[MachineName] ASC,
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PICKProcessingTime]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PICKProcessingTime](
	[MachineName] [varchar](15) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[BeginHour] [int] NOT NULL,
	[less1000] [int] NULL,
	[from1000to2000] [int] NULL,
	[from2000to3000] [int] NULL,
	[from3000to4000] [int] NULL,
	[from4000to5000] [int] NULL,
	[from5000to6000] [int] NULL,
	[from6000to7000] [int] NULL,
	[greater7000] [int] NULL,
 CONSTRAINT [PK_PICKProcessingTime] PRIMARY KEY CLUSTERED 
(
	[MachineName] ASC,
	[BeginDate] ASC,
	[BeginHour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProcessingTime]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProcessingTime](
	[MachineName] [varchar](15) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[BeginHour] [int] NOT NULL,
	[less1000] [int] NOT NULL,
	[from1000to2000] [int] NOT NULL,
	[from2000to3000] [int] NOT NULL,
	[from3000to4000] [int] NOT NULL,
	[from4000to5000] [int] NOT NULL,
	[from5000to6000] [int] NOT NULL,
	[from6000to7000] [int] NOT NULL,
	[from7000to8000] [int] NOT NULL,
	[from8000to9000] [int] NOT NULL,
	[from9000to10000] [int] NOT NULL,
	[from10000to15000] [int] NOT NULL,
	[from15000to20000] [int] NOT NULL,
	[from20000to25000] [int] NOT NULL,
	[from25000to30000] [int] NOT NULL,
	[greater30000] [int] NOT NULL,
 CONSTRAINT [PK_ProcessingTime] PRIMARY KEY CLUSTERED 
(
	[MachineName] ASC,
	[BeginDate] ASC,
	[BeginHour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Res68]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Res68](
	[HotelCode] [nvarchar](255) NULL,
	[Resort] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Res71]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Res71](
	[HotelCode] [nvarchar](255) NULL,
	[Resort] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Res822]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Res822](
	[HotelCode] [nvarchar](255) NULL,
	[Resort] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResortDetail]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResortDetail](
	[ResortCode] [varchar](50) NOT NULL,
	[ResortName] [varchar](100) NULL,
	[CountryName] [varchar](100) NULL,
 CONSTRAINT [PK_ResortDetail] PRIMARY KEY CLUSTERED 
(
	[ResortCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Result2]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result2](
	[HotelCode] [nvarchar](255) NULL,
	[Resort] [nvarchar](255) NULL,
	[Active] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResultLog]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResultLog](
	[HotelCode] [varchar](3) NOT NULL,
	[CityCode] [varchar](3) NULL,
	[IsActivate] [bit] NOT NULL,
 CONSTRAINT [PK_ResultLog] PRIMARY KEY CLUSTERED 
(
	[HotelCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Results]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Results](
	[HotelCode] [varchar](50) NULL,
	[HotelCity] [varchar](50) NULL,
	[IsActivate] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Results_OLD]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Results_OLD](
	[HotelCode] [varchar](50) NULL,
	[HotelCity] [varchar](50) NULL,
	[IsActivate] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Results3]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Results3](
	[HotelCode] [varchar](3) NOT NULL,
	[HotelCity] [varchar](3) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Results5]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Results5](
	[HotelCode] [varchar](50) NOT NULL,
	[HotelCity] [varchar](50) NULL,
 CONSTRAINT [PK_Results5] PRIMARY KEY CLUSTERED 
(
	[HotelCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Results6]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Results6](
	[HotelCode] [varchar](50) NULL,
	[HotelCity] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Results7]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Results7](
	[HotelCode] [varchar](50) NULL,
	[HotelCity] [varchar](50) NULL,
	[IsActivate] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServerBusy]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServerBusy](
	[BeginDate] [smalldatetime] NOT NULL,
	[MachineName] [varchar](50) NOT NULL,
	[AgentCode] [varchar](10) NOT NULL,
	[Hits] [int] NOT NULL,
 CONSTRAINT [PK_ServerBusy] PRIMARY KEY CLUSTERED 
(
	[BeginDate] ASC,
	[MachineName] ASC,
	[AgentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServerTimeOut]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServerTimeOut](
	[BeginDate] [smalldatetime] NOT NULL,
	[MachineName] [varchar](50) NOT NULL,
	[AgentCode] [varchar](10) NOT NULL,
	[Hits] [int] NOT NULL,
 CONSTRAINT [PK_ServerTimeOut] PRIMARY KEY CLUSTERED 
(
	[BeginDate] ASC,
	[MachineName] ASC,
	[AgentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SuccessfulData]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SuccessfulData](
	[agentcode] [varchar](255) NOT NULL,
	[Location] [varchar](3) NOT NULL,
	[MachineName] [varchar](15) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[BeginHour] [int] NOT NULL,
	[HA] [int] NULL,
	[AE] [int] NULL,
	[BE] [int] NULL,
	[HDR] [int] NULL,
	[HDFGCR] [int] NULL,
	[COR] [int] NULL,
	[HSR] [int] NULL,
	[CAD] [int] NULL,
	[HCAD] [int] NULL,
	[HB] [int] NULL,
	[BEAD] [int] NULL,
	[XMLRequest] [int] NULL,
	[CIR] [int] NULL,
	[HRR] [int] NULL,
	[VERSION] [int] NULL,
 CONSTRAINT [PK_SuccessfulData] PRIMARY KEY CLUSTERED 
(
	[agentcode] ASC,
	[Location] ASC,
	[MachineName] ASC,
	[BeginDate] ASC,
	[BeginHour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempHBRecords20102014]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempHBRecords20102014](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](3) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [text] NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempSumHotelsLive]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempSumHotelsLive](
	[HotelCode] [varchar](3) NOT NULL,
	[CityCode] [varchar](3) NULL,
	[IsActivate] [bit] NOT NULL,
 CONSTRAINT [PK_TempSumHotelsLive] PRIMARY KEY CLUSTERED 
(
	[HotelCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TotalHits]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TotalHits](
	[MachineName] [varchar](15) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[BeginHour] [int] NOT NULL,
	[Hits] [int] NULL,
 CONSTRAINT [PK_TotalHits] PRIMARY KEY CLUSTERED 
(
	[MachineName] ASC,
	[BeginDate] ASC,
	[BeginHour] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRLINKJW2S]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRLINKJW2S](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRLINKJWS]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRLINKJWS](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRLINKJWS1]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRLINKJWS1](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRLINKJWS2]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRLINKJWS2](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRLINKJWS3]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRLINKJWS3](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRLINKJWS4]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRLINKJWS4](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TRLINKJWS44S]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRLINKJWS44S](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv5live1]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv5live1](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv5live8]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv5live8](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv5live9]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv5live9](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv6liv10]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv6liv10](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv6live10]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv6live10](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv6live10AE]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xmlv6live10AE](
	[BeginTime] [smalldatetime] NULL,
	[AgentCode] [nvarchar](50) NULL,
	[seqno] [nvarchar](50) NULL,
	[FirstHotelCode] [nvarchar](50) NULL,
	[NoOfAdults] [nvarchar](10) NULL,
	[NoOfChildren] [nvarchar](10) NULL,
	[ArrivalDate] [nvarchar](50) NULL,
	[Duration] [nvarchar](10) NULL,
	[PaxInRoom] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[xmlv6live3]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv6live3](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv6live3AE]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xmlv6live3AE](
	[BeginTime] [smalldatetime] NULL,
	[AgentCode] [nvarchar](50) NULL,
	[seqno] [nvarchar](50) NULL,
	[FirstHotelCode] [nvarchar](50) NULL,
	[NoOfAdults] [nvarchar](10) NULL,
	[NoOfChildren] [nvarchar](10) NULL,
	[ArrivalDate] [nvarchar](50) NULL,
	[Duration] [nvarchar](10) NULL,
	[PaxInRoom] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[xmlv6live3New]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv6live3New](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [varchar](255) NULL,
	[PickProcessTime] [varchar](255) NULL,
	[FirstHotelCode] [varchar](3) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](10) NULL,
	[BeginTime] [varchar](255) NULL,
	[EndTime] [varchar](255) NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv6live3temp]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv6live3temp](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](3) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [text] NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv6live5]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv6live5](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv6live5AE]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xmlv6live5AE](
	[BeginTime] [smalldatetime] NULL,
	[AgentCode] [nvarchar](50) NULL,
	[seqno] [nvarchar](50) NULL,
	[FirstHotelCode] [nvarchar](50) NULL,
	[NoOfAdults] [nvarchar](10) NULL,
	[NoOfChildren] [nvarchar](10) NULL,
	[ArrivalDate] [nvarchar](50) NULL,
	[Duration] [nvarchar](10) NULL,
	[PaxInRoom] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[xmlv6live6]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv6live6](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv6live6AE]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xmlv6live6AE](
	[BeginTime] [smalldatetime] NULL,
	[AgentCode] [nvarchar](50) NULL,
	[seqno] [nvarchar](50) NULL,
	[FirstHotelCode] [nvarchar](50) NULL,
	[NoOfAdults] [nvarchar](10) NULL,
	[NoOfChildren] [nvarchar](10) NULL,
	[ArrivalDate] [nvarchar](50) NULL,
	[Duration] [nvarchar](10) NULL,
	[PaxInRoom] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[xmlv6live7]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv6live7](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv6live7AE]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xmlv6live7AE](
	[BeginTime] [smalldatetime] NULL,
	[AgentCode] [nvarchar](50) NULL,
	[seqno] [nvarchar](50) NULL,
	[FirstHotelCode] [nvarchar](50) NULL,
	[NoOfAdults] [nvarchar](10) NULL,
	[NoOfChildren] [nvarchar](10) NULL,
	[ArrivalDate] [nvarchar](50) NULL,
	[Duration] [nvarchar](10) NULL,
	[PaxInRoom] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[xmlv6live8]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv6live8](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv6live8AE]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xmlv6live8AE](
	[BeginTime] [smalldatetime] NULL,
	[AgentCode] [nvarchar](50) NULL,
	[seqno] [nvarchar](50) NULL,
	[FirstHotelCode] [nvarchar](50) NULL,
	[NoOfAdults] [nvarchar](10) NULL,
	[NoOfChildren] [nvarchar](10) NULL,
	[ArrivalDate] [nvarchar](50) NULL,
	[Duration] [nvarchar](10) NULL,
	[PaxInRoom] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[xmlv6live8xmlv6live8]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv6live8xmlv6live8](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv6live9]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xmlv6live9](
	[Agentcode] [varchar](255) NULL,
	[ProcessTime] [decimal](18, 0) NULL,
	[PickProcessTime] [decimal](18, 0) NULL,
	[FirstHotelCode] [varchar](4) NULL,
	[Resort] [varchar](3) NULL,
	[ArrivalDate] [varchar](50) NULL,
	[BeginTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[InquiryType] [varchar](10) NULL,
	[Version] [varchar](10) NULL,
	[ScehmaType] [varchar](3) NULL,
	[ReqMachine] [varchar](50) NULL,
	[Status] [nvarchar](2000) NULL,
	[ProjectName] [varchar](20) NULL,
	[SessionID] [text] NULL,
	[RequestType] [varchar](20) NULL,
	[ErrorSendingXML] [text] NULL,
	[ReqLanguage] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xmlv6live9AE]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xmlv6live9AE](
	[BeginTime] [smalldatetime] NULL,
	[AgentCode] [nvarchar](50) NULL,
	[seqno] [nvarchar](50) NULL,
	[FirstHotelCode] [nvarchar](50) NULL,
	[NoOfAdults] [nvarchar](10) NULL,
	[NoOfChildren] [nvarchar](10) NULL,
	[ArrivalDate] [nvarchar](50) NULL,
	[Duration] [nvarchar](10) NULL,
	[PaxInRoom] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YourSelection]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[YourSelection](
	[BeginTime] [datetime] NOT NULL,
	[AgentCode] [varchar](20) NOT NULL,
	[ArrivalDate] [datetime] NOT NULL,
	[Resort] [varchar](3) NOT NULL,
	[SingleRooms] [tinyint] NOT NULL,
	[DoubleRooms] [tinyint] NOT NULL,
	[TripleRooms] [tinyint] NOT NULL,
	[ExtraBeds] [tinyint] NOT NULL,
	[Duration] [tinyint] NOT NULL,
	[FirstHotelCode] [varchar](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[YourSelectionData]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[YourSelectionData](
	[ArrivalDate] [nvarchar](10) NOT NULL,
	[Location] [varchar](3) NOT NULL,
	[BeginDate] [smalldatetime] NOT NULL,
	[MachineName] [varchar](15) NOT NULL,
	[hits] [int] NULL,
 CONSTRAINT [PK_YourSelectionData] PRIMARY KEY CLUSTERED 
(
	[ArrivalDate] ASC,
	[Location] ASC,
	[BeginDate] ASC,
	[MachineName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VW_ARRIVALDATEBYAGENT]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[VW_ARRIVALDATEBYAGENT] AS
 select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live3]
  where InquiryType in ('ha','AE') and Status='Successfull' 
  UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live5]
  where InquiryType in ('ha','AE') and Status='Successfull' 
  UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live6]
  where InquiryType in ('ha','AE') and Status='Successfull' 
    UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live7]
  where InquiryType in ('ha','AE') and Status='Successfull' 
      UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live8]
  where InquiryType in ('ha','AE') and Status='Successfull' 
      UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live9]
  where InquiryType in ('ha','AE') and Status='Successfull' 
        UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live10]
  where InquiryType in ('ha','AE') and Status='Successfull' 
  
         UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv5live1]
  where InquiryType in ('ha','AE') and Status='Successfull' 
           UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv5live8]
  where InquiryType in ('ha','AE') and Status='Successfull' 
             UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv5live9]
  where InquiryType in ('ha','AE') and Status='Successfull' 
                UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[ForeignCache1]
  where InquiryType in ('ha','AE') and Status='Successfull' 
                 UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[ForeignCache2]
  where InquiryType in ('ha','AE') and Status='Successfull' 
                 UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[ForeignCache3]
  where InquiryType in ('ha','AE') and Status='Successfull' 
                   UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[OBX2]
  where InquiryType in ('ha','AE') and Status='Successfull' 
                     UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[TRLINKJWS]
  where InquiryType in ('ha','AE') and Status='Successfull' 
                       UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[TRLINKJWS2]
  where InquiryType in ('ha','AE') and Status='Successfull'
                       UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[TRLINKJWS3]
  where InquiryType in ('ha','AE') and Status='Successfull'  
                       UNION ALL
   select [InquiryType]
     ,[Agentcode],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[TRLINKJWS4]
  where InquiryType in ('ha','AE') and Status='Successfull' 
GO
/****** Object:  View [dbo].[VW_AGETWISEARRIVAL]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_AGETWISEARRIVAL] AS
SELECT [Agentcode],
         month([ArrivalDate]) AS ArrivalMonth ,
          Year([ArrivalDate]) AS ArrivalYear ,  
         COUNT(month([ArrivalDate])) AS AGETWISECOUNT
  FROM [AgentHistoryLogNew].[dbo].[VW_ARRIVALDATEBYAGENT] 
  GROUP BY [Agentcode],Year([ArrivalDate]), month([ArrivalDate]) 
GO
/****** Object:  View [dbo].[VW_ARRIVALDATEBYRESORT]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[VW_ARRIVALDATEBYRESORT] AS
 select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live3]
  where InquiryType in ('ha') and Resort is not null and  Status='Successfull'
  UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live5]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull'
  UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live6]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull' 
    UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live7]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull'
      UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live8]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull'
      UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live9]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull'
        UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv6live10]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull'
         UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv5live1]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull' 
           UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv5live8]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull' 
             UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[xmlv5live9]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull' 
                UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[ForeignCache1]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull'
                 UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[ForeignCache2]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull' 
                 UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[ForeignCache3]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull' 
                   UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[OBX2]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull'
                     UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[TRLINKJWS]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull' 
                       UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[TRLINKJWS2]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull'
                       UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[TRLINKJWS3]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull' 
                       UNION ALL
   select [InquiryType]
     ,[Resort],[ArrivalDate] from [AgentHistoryLogNew].[dbo].[TRLINKJWS4]
  where  InquiryType in ('ha') and Resort is not null and  Status='Successfull' 
GO
/****** Object:  View [dbo].[VW_RESORTWISEARRIVAL]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_RESORTWISEARRIVAL] AS
SELECT [Resort],
         month([ArrivalDate]) AS ArrivalMonth ,
          Year([ArrivalDate]) AS ArrivalYear ,  
         COUNT(month([ArrivalDate])) AS RESORTWISECOUNT
  FROM [AgentHistoryLogNew].[dbo].[VW_ARRIVALDATEBYRESORT]
  GROUP BY [Resort],Year([ArrivalDate]), month([ArrivalDate]) 
GO
/****** Object:  View [dbo].[VW_HABYHOTELCODE]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[VW_HABYHOTELCODE]  AS
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM xmlv6live3
WHERE InquiryType='HA' and Status like '%Successfull%' and FirstHotelCode is not NULL
Union All
SELECT Convert(Date, EndTime ) AS RequestDate , Agentcode,FirstHotelCode FROM xmlv6live5
WHERE InquiryType='HA' and Status like '%Successfull%' and FirstHotelCode is not NULL
Union All
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM xmlv6live6
WHERE InquiryType='HA' and Status like '%Successfull%' and FirstHotelCode is not NULL
Union All
SELECT Convert(Date, EndTime)  AS RequestDate, Agentcode,FirstHotelCode FROM xmlv6live7
WHERE InquiryType='HA' and Status like '%Successfull%' and FirstHotelCode is not NULL
Union All
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM xmlv6live8
WHERE InquiryType='HA' and Status like '%Successfull%' and FirstHotelCode is not NULL
Union All
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM xmlv6live9
WHERE InquiryType='HA' and Status like '%Successfull%' and FirstHotelCode is not NULL
Union All
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM xmlv6live10
WHERE InquiryType='HA' and Status like '%Successfull%' and FirstHotelCode is not NULL
Union All
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM OBX2
WHERE InquiryType='HA' and Status like '%Successfull%' and FirstHotelCode is not NULL
Union All
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM TRLINKJWS
WHERE InquiryType='HA' and Status like '%Successfull%' and FirstHotelCode is not NULL
Union All
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM TRLINKJWS2
WHERE InquiryType='HA' and Status like '%Successfull%' and FirstHotelCode is not NULL

GO
/****** Object:  View [dbo].[VW_HADETAILS]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_HADETAILS] AS
select RequestDate,FirstHotelCode,Agentcode,count(Agentcode) AS HA_COUNT from VW_HABYHOTELCODE
group by FirstHotelCode,Agentcode,RequestDate
GO
/****** Object:  View [dbo].[VW_HBBYHOTELCODE]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[VW_HBBYHOTELCODE]  AS  
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM xmlv6live3  
WHERE InquiryType='HB'  and sessionID  like '%STATUS="B"%' and FirstHotelCode is not NULL  
Union All  
SELECT Convert(Date, EndTime ) AS RequestDate , Agentcode,FirstHotelCode FROM xmlv6live5  
WHERE InquiryType='HB'  and sessionID  like '%STATUS="B"%' and FirstHotelCode is not NULL    
Union All  
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM xmlv6live6  
WHERE InquiryType='HB'  and sessionID  like '%STATUS="B"%' and FirstHotelCode is not NULL    
Union All  
SELECT Convert(Date, EndTime)  AS RequestDate, Agentcode,FirstHotelCode FROM xmlv6live7  
WHERE InquiryType='HB'  and sessionID  like '%STATUS="B"%' and FirstHotelCode is not NULL    
Union All  
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM xmlv6live8  
WHERE InquiryType='HB'  and sessionID  like '%STATUS="B"%' and FirstHotelCode is not NULL    
Union All  
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM xmlv6live9  
WHERE InquiryType='HB'  and sessionID  like '%STATUS="B"%'  and FirstHotelCode is not NULL   
Union All  
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM xmlv6live10  
WHERE InquiryType='HB'  and sessionID  like '%STATUS="B"%'  and FirstHotelCode is not NULL   
Union All  
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM OBX2  
WHERE InquiryType='HB'  and sessionID  like '%STATUS="B"%'   and FirstHotelCode is not NULL  
Union All  
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM TRLINKJWS  
WHERE InquiryType='HB'  and sessionID  like '%STATUS="B"%'  
Union All  
SELECT Convert(Date, EndTime ) AS RequestDate, Agentcode,FirstHotelCode FROM TRLINKJWS2  
WHERE InquiryType='HB'  and sessionID  like '%STATUS="B"%'   and FirstHotelCode is not NULL  
  
GO
/****** Object:  View [dbo].[VW_HBDETAILS]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_HBDETAILS] AS
select RequestDate,FirstHotelCode,Agentcode,count(Agentcode) AS HB_COUNT from VW_HBBYHOTELCODE
group by FirstHotelCode,Agentcode,RequestDate
GO
/****** Object:  View [dbo].[VW_PIVOT]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[VW_PIVOT] AS
SELECT H.RequestDate,H.FirstHotelCode,H.Agentcode,H.HA_COUNT,B.HB_COUNT FROM VW_HADETAILS  H
LEFT OUTER JOIN
VW_HBDETAILS B
ON H.Agentcode=B.Agentcode and H.FirstHotelCode=B.FirstHotelCode
GO
/****** Object:  View [dbo].[VW_HBWITHOUTHA]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_HBWITHOUTHA] AS
SELECT H.RequestDate,H.FirstHotelCode,H.Agentcode,H.HB_COUNT,B.HA_COUNT FROM VW_HBDETAILS  H
Left OUTER Join
VW_HADETAILS B
ON H.Agentcode=B.Agentcode and H.FirstHotelCode=B.FirstHotelCode
GO
/****** Object:  View [dbo].[DC2XML01view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DC2XML01view]		with SCHEMABINDING		AS		SELECT     dbo.DC2XML01.FirstHotelCode AS Expr1, dbo.DC2XML01.Agentcode, dbo.DC2XML01.ProcessTime, dbo.DC2XML01.PickProcessTime, dbo.DC2XML01.FirstHotelCode, dbo.DC2XML01.Resort,		                      dbo.DC2XML01.ArrivalDate, dbo.DC2XML01.BeginTime, dbo.DC2XML01.EndTime, dbo.DC2XML01.InquiryType, dbo.DC2XML01.Version, dbo.DC2XML01.ScehmaType, dbo.DC2XML01.ReqMachine, 		                      dbo.DC2XML01.Status, dbo.DC2XML01.ProjectName, dbo.DC2XML01.SessionID, dbo.DC2XML01.RequestType, dbo.DC2XML01.ErrorSendingXML, dbo.DC2XML01.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.DC2XML01 LEFT OUTER JOIN		                      dbo.Results ON dbo.DC2XML01.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[DC2XML02view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DC2XML02view]		with SCHEMABINDING		AS		SELECT     dbo.DC2XML02.FirstHotelCode AS Expr1, dbo.DC2XML02.Agentcode, dbo.DC2XML02.ProcessTime, dbo.DC2XML02.PickProcessTime, dbo.DC2XML02.FirstHotelCode, dbo.DC2XML02.Resort,		                      dbo.DC2XML02.ArrivalDate, dbo.DC2XML02.BeginTime, dbo.DC2XML02.EndTime, dbo.DC2XML02.InquiryType, dbo.DC2XML02.Version, dbo.DC2XML02.ScehmaType, dbo.DC2XML02.ReqMachine, 		                      dbo.DC2XML02.Status, dbo.DC2XML02.ProjectName, dbo.DC2XML02.SessionID, dbo.DC2XML02.RequestType, dbo.DC2XML02.ErrorSendingXML, dbo.DC2XML02.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.DC2XML02 LEFT OUTER JOIN		                      dbo.Results ON dbo.DC2XML02.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[DC2XML05view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DC2XML05view]		with SCHEMABINDING		AS		SELECT     dbo.DC2XML05.FirstHotelCode AS Expr1, dbo.DC2XML05.Agentcode, dbo.DC2XML05.ProcessTime, dbo.DC2XML05.PickProcessTime, dbo.DC2XML05.FirstHotelCode, dbo.DC2XML05.Resort,		                      dbo.DC2XML05.ArrivalDate, dbo.DC2XML05.BeginTime, dbo.DC2XML05.EndTime, dbo.DC2XML05.InquiryType, dbo.DC2XML05.Version, dbo.DC2XML05.ScehmaType, dbo.DC2XML05.ReqMachine, 		                      dbo.DC2XML05.Status, dbo.DC2XML05.ProjectName, dbo.DC2XML05.SessionID, dbo.DC2XML05.RequestType, dbo.DC2XML05.ErrorSendingXML, dbo.DC2XML05.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.DC2XML05 LEFT OUTER JOIN		                      dbo.Results ON dbo.DC2XML05.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[DC2XML06view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DC2XML06view]		with SCHEMABINDING		AS		SELECT     dbo.DC2XML06.FirstHotelCode AS Expr1, dbo.DC2XML06.Agentcode, dbo.DC2XML06.ProcessTime, dbo.DC2XML06.PickProcessTime, dbo.DC2XML06.FirstHotelCode, dbo.DC2XML06.Resort,		                      dbo.DC2XML06.ArrivalDate, dbo.DC2XML06.BeginTime, dbo.DC2XML06.EndTime, dbo.DC2XML06.InquiryType, dbo.DC2XML06.Version, dbo.DC2XML06.ScehmaType, dbo.DC2XML06.ReqMachine, 		                      dbo.DC2XML06.Status, dbo.DC2XML06.ProjectName, dbo.DC2XML06.SessionID, dbo.DC2XML06.RequestType, dbo.DC2XML06.ErrorSendingXML, dbo.DC2XML06.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.DC2XML06 LEFT OUTER JOIN		                      dbo.Results ON dbo.DC2XML06.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[DC2XML07view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DC2XML07view]		with SCHEMABINDING		AS		SELECT     dbo.DC2XML07.FirstHotelCode AS Expr1, dbo.DC2XML07.Agentcode, dbo.DC2XML07.ProcessTime, dbo.DC2XML07.PickProcessTime, dbo.DC2XML07.FirstHotelCode, dbo.DC2XML07.Resort,		                      dbo.DC2XML07.ArrivalDate, dbo.DC2XML07.BeginTime, dbo.DC2XML07.EndTime, dbo.DC2XML07.InquiryType, dbo.DC2XML07.Version, dbo.DC2XML07.ScehmaType, dbo.DC2XML07.ReqMachine, 		                      dbo.DC2XML07.Status, dbo.DC2XML07.ProjectName, dbo.DC2XML07.SessionID, dbo.DC2XML07.RequestType, dbo.DC2XML07.ErrorSendingXML, dbo.DC2XML07.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.DC2XML07 LEFT OUTER JOIN		                      dbo.Results ON dbo.DC2XML07.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[DC2XML08view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DC2XML08view]		with SCHEMABINDING		AS		SELECT     dbo.DC2XML08.FirstHotelCode AS Expr1, dbo.DC2XML08.Agentcode, dbo.DC2XML08.ProcessTime, dbo.DC2XML08.PickProcessTime, dbo.DC2XML08.FirstHotelCode, dbo.DC2XML08.Resort,		                      dbo.DC2XML08.ArrivalDate, dbo.DC2XML08.BeginTime, dbo.DC2XML08.EndTime, dbo.DC2XML08.InquiryType, dbo.DC2XML08.Version, dbo.DC2XML08.ScehmaType, dbo.DC2XML08.ReqMachine, 		                      dbo.DC2XML08.Status, dbo.DC2XML08.ProjectName, dbo.DC2XML08.SessionID, dbo.DC2XML08.RequestType, dbo.DC2XML08.ErrorSendingXML, dbo.DC2XML08.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.DC2XML08 LEFT OUTER JOIN		                      dbo.Results ON dbo.DC2XML08.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[DC2XML09view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DC2XML09view]		with SCHEMABINDING		AS		SELECT     dbo.DC2XML09.FirstHotelCode AS Expr1, dbo.DC2XML09.Agentcode, dbo.DC2XML09.ProcessTime, dbo.DC2XML09.PickProcessTime, dbo.DC2XML09.FirstHotelCode, dbo.DC2XML09.Resort,		                      dbo.DC2XML09.ArrivalDate, dbo.DC2XML09.BeginTime, dbo.DC2XML09.EndTime, dbo.DC2XML09.InquiryType, dbo.DC2XML09.Version, dbo.DC2XML09.ScehmaType, dbo.DC2XML09.ReqMachine, 		                      dbo.DC2XML09.Status, dbo.DC2XML09.ProjectName, dbo.DC2XML09.SessionID, dbo.DC2XML09.RequestType, dbo.DC2XML09.ErrorSendingXML, dbo.DC2XML09.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.DC2XML09 LEFT OUTER JOIN		                      dbo.Results ON dbo.DC2XML09.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[ForeingCache1view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ForeingCache1view]		with SCHEMABINDING		AS		SELECT     dbo.ForeingCache1.FirstHotelCode AS Expr1, dbo.ForeingCache1.Agentcode, dbo.ForeingCache1.ProcessTime, dbo.ForeingCache1.PickProcessTime, dbo.ForeingCache1.FirstHotelCode, dbo.ForeingCache1.Resort,		                      dbo.ForeingCache1.ArrivalDate, dbo.ForeingCache1.BeginTime, dbo.ForeingCache1.EndTime, dbo.ForeingCache1.InquiryType, dbo.ForeingCache1.Version, dbo.ForeingCache1.ScehmaType, dbo.ForeingCache1.ReqMachine, 		                      dbo.ForeingCache1.Status, dbo.ForeingCache1.ProjectName, dbo.ForeingCache1.SessionID, dbo.ForeingCache1.RequestType, dbo.ForeingCache1.ErrorSendingXML, dbo.ForeingCache1.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.ForeingCache1 LEFT OUTER JOIN		                      dbo.Results ON dbo.ForeingCache1.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[ForeingCache2view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ForeingCache2view]		with SCHEMABINDING		AS		SELECT     dbo.ForeingCache2.FirstHotelCode AS Expr1, dbo.ForeingCache2.Agentcode, dbo.ForeingCache2.ProcessTime, dbo.ForeingCache2.PickProcessTime, dbo.ForeingCache2.FirstHotelCode, dbo.ForeingCache2.Resort,		                      dbo.ForeingCache2.ArrivalDate, dbo.ForeingCache2.BeginTime, dbo.ForeingCache2.EndTime, dbo.ForeingCache2.InquiryType, dbo.ForeingCache2.Version, dbo.ForeingCache2.ScehmaType, dbo.ForeingCache2.ReqMachine, 		                      dbo.ForeingCache2.Status, dbo.ForeingCache2.ProjectName, dbo.ForeingCache2.SessionID, dbo.ForeingCache2.RequestType, dbo.ForeingCache2.ErrorSendingXML, dbo.ForeingCache2.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.ForeingCache2 LEFT OUTER JOIN		                      dbo.Results ON dbo.ForeingCache2.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[ForeingCache3view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ForeingCache3view]		with SCHEMABINDING		AS		SELECT     dbo.ForeingCache3.FirstHotelCode AS Expr1, dbo.ForeingCache3.Agentcode, dbo.ForeingCache3.ProcessTime, dbo.ForeingCache3.PickProcessTime, dbo.ForeingCache3.FirstHotelCode, dbo.ForeingCache3.Resort,		                      dbo.ForeingCache3.ArrivalDate, dbo.ForeingCache3.BeginTime, dbo.ForeingCache3.EndTime, dbo.ForeingCache3.InquiryType, dbo.ForeingCache3.Version, dbo.ForeingCache3.ScehmaType, dbo.ForeingCache3.ReqMachine, 		                      dbo.ForeingCache3.Status, dbo.ForeingCache3.ProjectName, dbo.ForeingCache3.SessionID, dbo.ForeingCache3.RequestType, dbo.ForeingCache3.ErrorSendingXML, dbo.ForeingCache3.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.ForeingCache3 LEFT OUTER JOIN		                      dbo.Results ON dbo.ForeingCache3.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[OBX2view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[OBX2view]		with SCHEMABINDING		AS		SELECT     dbo.OBX2.FirstHotelCode AS Expr1, dbo.OBX2.Agentcode, dbo.OBX2.ProcessTime, dbo.OBX2.PickProcessTime, dbo.OBX2.FirstHotelCode, dbo.OBX2.Resort,		                      dbo.OBX2.ArrivalDate, dbo.OBX2.BeginTime, dbo.OBX2.EndTime, dbo.OBX2.InquiryType, dbo.OBX2.Version, dbo.OBX2.ScehmaType, dbo.OBX2.ReqMachine, 		                      dbo.OBX2.Status, dbo.OBX2.ProjectName, dbo.OBX2.SessionID, dbo.OBX2.RequestType, dbo.OBX2.ErrorSendingXML, dbo.OBX2.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.OBX2 LEFT OUTER JOIN		                      dbo.Results ON dbo.OBX2.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[TRLINKJWS2view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TRLINKJWS2view]		with SCHEMABINDING		AS		SELECT     dbo.TRLINKJWS2.FirstHotelCode AS Expr1, dbo.TRLINKJWS2.Agentcode, dbo.TRLINKJWS2.ProcessTime, dbo.TRLINKJWS2.PickProcessTime, dbo.TRLINKJWS2.FirstHotelCode, dbo.TRLINKJWS2.Resort,		                      dbo.TRLINKJWS2.ArrivalDate, dbo.TRLINKJWS2.BeginTime, dbo.TRLINKJWS2.EndTime, dbo.TRLINKJWS2.InquiryType, dbo.TRLINKJWS2.Version, dbo.TRLINKJWS2.ScehmaType, dbo.TRLINKJWS2.ReqMachine, 		                      dbo.TRLINKJWS2.Status, dbo.TRLINKJWS2.ProjectName, dbo.TRLINKJWS2.SessionID, dbo.TRLINKJWS2.RequestType, dbo.TRLINKJWS2.ErrorSendingXML, dbo.TRLINKJWS2.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.TRLINKJWS2 LEFT OUTER JOIN		                      dbo.Results ON dbo.TRLINKJWS2.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[TRLINKJWS3view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TRLINKJWS3view]		with SCHEMABINDING		AS		SELECT     dbo.TRLINKJWS3.FirstHotelCode AS Expr1, dbo.TRLINKJWS3.Agentcode, dbo.TRLINKJWS3.ProcessTime, dbo.TRLINKJWS3.PickProcessTime, dbo.TRLINKJWS3.FirstHotelCode, dbo.TRLINKJWS3.Resort,		                      dbo.TRLINKJWS3.ArrivalDate, dbo.TRLINKJWS3.BeginTime, dbo.TRLINKJWS3.EndTime, dbo.TRLINKJWS3.InquiryType, dbo.TRLINKJWS3.Version, dbo.TRLINKJWS3.ScehmaType, dbo.TRLINKJWS3.ReqMachine, 		                      dbo.TRLINKJWS3.Status, dbo.TRLINKJWS3.ProjectName, dbo.TRLINKJWS3.SessionID, dbo.TRLINKJWS3.RequestType, dbo.TRLINKJWS3.ErrorSendingXML, dbo.TRLINKJWS3.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.TRLINKJWS3 LEFT OUTER JOIN		                      dbo.Results ON dbo.TRLINKJWS3.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[TRLINKJWS4view]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TRLINKJWS4view]		with SCHEMABINDING		AS		SELECT     dbo.TRLINKJWS4.FirstHotelCode AS Expr1, dbo.TRLINKJWS4.Agentcode, dbo.TRLINKJWS4.ProcessTime, dbo.TRLINKJWS4.PickProcessTime, dbo.TRLINKJWS4.FirstHotelCode, dbo.TRLINKJWS4.Resort,		                      dbo.TRLINKJWS4.ArrivalDate, dbo.TRLINKJWS4.BeginTime, dbo.TRLINKJWS4.EndTime, dbo.TRLINKJWS4.InquiryType, dbo.TRLINKJWS4.Version, dbo.TRLINKJWS4.ScehmaType, dbo.TRLINKJWS4.ReqMachine, 		                      dbo.TRLINKJWS4.Status, dbo.TRLINKJWS4.ProjectName, dbo.TRLINKJWS4.SessionID, dbo.TRLINKJWS4.RequestType, dbo.TRLINKJWS4.ErrorSendingXML, dbo.TRLINKJWS4.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.TRLINKJWS4 LEFT OUTER JOIN		                      dbo.Results ON dbo.TRLINKJWS4.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[TRLINKJWSview]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TRLINKJWSview]		with SCHEMABINDING		AS		SELECT     dbo.TRLINKJWS.FirstHotelCode AS Expr1, dbo.TRLINKJWS.Agentcode, dbo.TRLINKJWS.ProcessTime, dbo.TRLINKJWS.PickProcessTime, dbo.TRLINKJWS.FirstHotelCode, dbo.TRLINKJWS.Resort,		                      dbo.TRLINKJWS.ArrivalDate, dbo.TRLINKJWS.BeginTime, dbo.TRLINKJWS.EndTime, dbo.TRLINKJWS.InquiryType, dbo.TRLINKJWS.Version, dbo.TRLINKJWS.ScehmaType, dbo.TRLINKJWS.ReqMachine, 		                      dbo.TRLINKJWS.Status, dbo.TRLINKJWS.ProjectName, dbo.TRLINKJWS.SessionID, dbo.TRLINKJWS.RequestType, dbo.TRLINKJWS.ErrorSendingXML, dbo.TRLINKJWS.ReqLanguage, 		                      dbo.Results.HotelCity		FROM         dbo.TRLINKJWS LEFT OUTER JOIN		                      dbo.Results ON dbo.TRLINKJWS.FirstHotelCode = dbo.Results.HotelCode
GO
/****** Object:  View [dbo].[vw_Agent_Details]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_Agent_Details] AS
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status,SessionID,ErrorSendingXML from xmlv6live3
where   InquiryType in ('HA','HB')
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status,SessionID,ErrorSendingXML from xmlv6live5
where   InquiryType in ('HA','HB')
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status,SessionID,ErrorSendingXML from xmlv6live6
where   InquiryType in ('HA','HB')
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status,SessionID,ErrorSendingXML from xmlv6live7
where   InquiryType in ('HA','HB')
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status,SessionID,ErrorSendingXML from xmlv6live8
where   InquiryType in ('HA','HB')
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status,SessionID,ErrorSendingXML from xmlv6live9
where   InquiryType in ('HA','HB')
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status,SessionID,ErrorSendingXML from xmlv6live10
where   InquiryType in ('HA','HB')
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status,SessionID,ErrorSendingXML from xmlv5live1
where   InquiryType in ('HA','HB')
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status,SessionID,ErrorSendingXML from xmlv5live8
where   InquiryType in ('HA','HB')
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status,SessionID,ErrorSendingXML from xmlv5live9
where   InquiryType in ('HA','HB')
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status,SessionID,ErrorSendingXML from TRLINKJWS2
where   InquiryType in ('HA','HB')
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status,SessionID,ErrorSendingXML from TRLINKJWS
where   InquiryType in ('HA','HB')
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status,SessionID,ErrorSendingXML from OBX2
where   InquiryType in ('HA','HB')


GO
/****** Object:  View [dbo].[vw_AgentDetails]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_AgentDetails] AS
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live3
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live5
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live6
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live7
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live8
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live9
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live10
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv5live1
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv5live8
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv5live9
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from TRLINKJWS2
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from TRLINKJWS
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from OBX2
where Status like '%Successful%' and InquiryType='HA'

GO
/****** Object:  View [dbo].[vw_AgentDetailsNew]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_AgentDetailsNew] AS
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live3
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live5
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live6
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live7
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live8
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live9
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live10
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv5live1
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv5live8
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv5live9
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from TRLINKJWS2
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from TRLINKJWS
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from OBX2
where Status like '%Successful%' and InquiryType='HA'

GO
/****** Object:  View [dbo].[VW_AGENTSTATUSREPORT]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_AGENTSTATUSREPORT] AS
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from OBX2
where Status like '%Successful%' and InquiryType='HA'
UNION ALL
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from TRLINKJWS
where Status like '%Successful%' and InquiryType='HA'
UNION ALL
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from TRLINKJWS2
where Status like '%Successful%' and InquiryType='HA'
UNION ALL
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live3
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live5
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live6
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live7
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live8
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live9
where Status like '%Successful%' and InquiryType='HA'
UNION ALL 
select Agentcode,Resort,FirstHotelCode,InquiryType,ProcessTime,Status from xmlv6live10
where Status like '%Successful%' and InquiryType='HA'
GO
/****** Object:  View [dbo].[WE_INSERT]    Script Date: 6/25/2020 6:01:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE VIEW [dbo].[WE_INSERT] AS
   select SUBSTRING([HotelCode],1,CHARINDEX(',',[HotelCode])-1) as HotelCode,
  SUBSTRING([HotelCode],CHARINDEX(',',[HotelCode])+1,LEN([HotelCode])) as Resort
    FROM [HotelResort]   
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[=xmlv6live7]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[BOX2]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[cache.log]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[DC2XML01]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[DC2XML02]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[DC2XML05]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[DC2XML06]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[DC2XML07]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[DC2XML08]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[DC2XML09]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [agentcodeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [agentcodeindex] ON [dbo].[ErrorData]
(
	[agentcode] ASC
)
INCLUDE ( 	[HA],
	[AE],
	[BE],
	[HDR],
	[HDFGCR],
	[COR],
	[HSR],
	[CAD],
	[HCAD],
	[HB],
	[BEAD],
	[XMLRequest],
	[CIR],
	[HRR]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[ForeignCache]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[ForeignCache1]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[ForeignCache2]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[ForeignCache3]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[ForeingCache1]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[ForeingCache2]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[ForeingCache3]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[OBX]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[OBX2]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [agentcodeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [agentcodeindex] ON [dbo].[SuccessfulData]
(
	[agentcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begindate_machinename]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begindate_machinename] ON [dbo].[SuccessfulData]
(
	[BeginDate] ASC,
	[MachineName] ASC
)
INCLUDE ( 	[agentcode],
	[HA],
	[AE],
	[BE],
	[HDR],
	[HDFGCR],
	[COR],
	[HSR],
	[CAD],
	[HCAD],
	[HB],
	[BEAD],
	[XMLRequest],
	[CIR],
	[HRR],
	[VERSION]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [beginindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [beginindex] ON [dbo].[SuccessfulData]
(
	[BeginDate] ASC
)
INCLUDE ( 	[agentcode],
	[Location],
	[HA],
	[AE],
	[HB]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SuccessfulData_BeginDate]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [IX_SuccessfulData_BeginDate] ON [dbo].[SuccessfulData]
(
	[BeginDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[TRLINKJW2S]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[TRLINKJWS]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[TRLINKJWS1]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[TRLINKJWS2]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[TRLINKJWS3]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[TRLINKJWS4]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[TRLINKJWS44S]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[xmlv5live1]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[xmlv5live8]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[xmlv5live9]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[xmlv6liv10]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[xmlv6live10]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[xmlv6live3]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[xmlv6live5]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[xmlv6live6]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[xmlv6live7]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[xmlv6live8]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[xmlv6live8xmlv6live8]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begintimeindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begintimeindex] ON [dbo].[xmlv6live9]
(
	[BeginTime] ASC
)
INCLUDE ( 	[Agentcode],
	[ProcessTime],
	[PickProcessTime],
	[FirstHotelCode],
	[Resort],
	[ArrivalDate],
	[InquiryType],
	[ReqMachine],
	[ReqLanguage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [arrivaldateindex]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [arrivaldateindex] ON [dbo].[YourSelectionData]
(
	[ArrivalDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [begindate_machine]    Script Date: 6/25/2020 6:01:05 PM ******/
CREATE NONCLUSTERED INDEX [begindate_machine] ON [dbo].[YourSelectionData]
(
	[BeginDate] ASC,
	[MachineName] ASC
)
INCLUDE ( 	[ArrivalDate],
	[hits]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArrivalDate] ADD  CONSTRAINT [DF_ArrivalDate_MachineName]  DEFAULT ('') FOR [MachineName]
GO
ALTER TABLE [dbo].[ArrivalDate] ADD  CONSTRAINT [DF_ArrivalDate_HA]  DEFAULT ((0)) FOR [HA]
GO
ALTER TABLE [dbo].[ArrivalDate] ADD  CONSTRAINT [DF_ArrivalDate_AE]  DEFAULT ((0)) FOR [AE]
GO
ALTER TABLE [dbo].[ArrivalDate] ADD  CONSTRAINT [DF_ArrivalDate_HB]  DEFAULT ((0)) FOR [HB]
GO
ALTER TABLE [dbo].[ArrivalDateSummary] ADD  CONSTRAINT [DF_ArrivalDateSummary_HA]  DEFAULT ((0)) FOR [HA]
GO
ALTER TABLE [dbo].[ArrivalDateSummary] ADD  CONSTRAINT [DF_ArrivalDateSummary_AE]  DEFAULT ((0)) FOR [AE]
GO
ALTER TABLE [dbo].[ArrivalDateSummary] ADD  CONSTRAINT [DF_ArrivalDateSummary_HB]  DEFAULT ((0)) FOR [HB]
GO
ALTER TABLE [dbo].[CnxData] ADD  CONSTRAINT [DF_CnxData_BookingStatus]  DEFAULT ('C') FOR [BookingStatus]
GO
ALTER TABLE [dbo].[OBX1-del] ADD  CONSTRAINT [DF_OBX1_ReqLanguage]  DEFAULT ('en-GB') FOR [ReqLanguage]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_less1000]  DEFAULT ((0)) FOR [less1000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_from1000to2000]  DEFAULT ((0)) FOR [from1000to2000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_from2000to3000]  DEFAULT ((0)) FOR [from2000to3000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_from3000to4000]  DEFAULT ((0)) FOR [from3000to4000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_from4000to5000]  DEFAULT ((0)) FOR [from4000to5000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_from5000to6000]  DEFAULT ((0)) FOR [from5000to6000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_from6000to7000]  DEFAULT ((0)) FOR [from6000to7000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_from7000to8000]  DEFAULT ((0)) FOR [from7000to8000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_from8000to9000]  DEFAULT ((0)) FOR [from8000to9000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_from9000to10000]  DEFAULT ((0)) FOR [from9000to10000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_from10000to15000]  DEFAULT ((0)) FOR [from10000to15000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_from15000to20000]  DEFAULT ((0)) FOR [from15000to20000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_from20000to25000]  DEFAULT ((0)) FOR [from20000to25000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_from25000to30000]  DEFAULT ((0)) FOR [from25000to30000]
GO
ALTER TABLE [dbo].[ProcessingTime] ADD  CONSTRAINT [DF_ProcessingTime_greaterthan30000]  DEFAULT ((0)) FOR [greater30000]
GO
ALTER TABLE [dbo].[SuccessfulData] ADD  CONSTRAINT [DF_SuccessfulData_Location]  DEFAULT ('') FOR [Location]
GO
ALTER TABLE [dbo].[YourSelection] ADD  CONSTRAINT [DF_Your Selection_SingleRooms]  DEFAULT ((0)) FOR [SingleRooms]
GO
ALTER TABLE [dbo].[YourSelection] ADD  CONSTRAINT [DF_Your Selection_DoubleRooms]  DEFAULT ((0)) FOR [DoubleRooms]
GO
ALTER TABLE [dbo].[YourSelection] ADD  CONSTRAINT [DF_Your Selection_TripleRooms]  DEFAULT ((0)) FOR [TripleRooms]
GO
ALTER TABLE [dbo].[YourSelection] ADD  CONSTRAINT [DF_Your Selection_ExtraBeds]  DEFAULT ((0)) FOR [ExtraBeds]
GO
ALTER TABLE [dbo].[YourSelection] ADD  CONSTRAINT [DF_YourSelection_Duration]  DEFAULT ((1)) FOR [Duration]
GO
ALTER TABLE [dbo].[YourSelection] ADD  CONSTRAINT [DF_YourSelection_FirstHotelCode]  DEFAULT ('') FOR [FirstHotelCode]
GO
USE [master]
GO
ALTER DATABASE [AgentHistoryLogNew] SET  READ_WRITE 
GO
