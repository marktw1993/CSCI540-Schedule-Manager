USE [master]
GO
/****** Object:  Database [SchedulingDatabase]    Script Date: 10/25/2016 1:26:16 PM ******/
CREATE DATABASE [SchedulingDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchedulingDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\SchedulingDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchedulingDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\SchedulingDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SchedulingDatabase] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchedulingDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchedulingDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchedulingDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchedulingDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SchedulingDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchedulingDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SchedulingDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [SchedulingDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchedulingDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchedulingDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchedulingDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchedulingDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SchedulingDatabase] SET QUERY_STORE = OFF
GO
USE [SchedulingDatabase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SchedulingDatabase]
GO
/****** Object:  Table [dbo].[Availability]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Availability](
	[AvailabilityID] [int] IDENTITY(1,1) NOT NULL,
	[StartTIme] [int] NOT NULL,
	[EndTime] [int] NOT NULL,
	[DayID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Day]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Day](
	[DayID] [int] NOT NULL,
	[DayName] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[First name] [varchar](50) NOT NULL,
	[Last name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [nchar](10) NOT NULL,
	[Admin] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[getAdmin]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Retrieves the admin status via ID.
-- =============================================
create PROCEDURE [dbo].[getAdmin] 
	-- Add the parameters for the stored procedure here
	@pID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Admin
	FROM Employee
	WHERE EmployeeID = @pID
END
GO
/****** Object:  StoredProcedure [dbo].[getDayID]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Get the DayID from Availability with ID.
-- =============================================
CREATE PROCEDURE [dbo].[getDayID]
	-- Add the parameters for the stored procedure here
	@pID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DayID
	FROM Availability
	WHERE AvailabilityID = @pID
END

GO
/****** Object:  StoredProcedure [dbo].[getDayName]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Get the day name with ID
-- =============================================
CREATE PROCEDURE [dbo].[getDayName]
	-- Add the parameters for the stored procedure here
	@pID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DayName
	FROM Days
	WHERE DayID = @pID
END

GO
/****** Object:  StoredProcedure [dbo].[getEmail]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Get the employee email with ID
-- =============================================
CREATE PROCEDURE [dbo].[getEmail] 
	-- Add the parameters for the stored procedure here
	@pID int = 0 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Email
	FROM Employee
	WHERE EmployeeID = @pID
END

GO
/****** Object:  StoredProcedure [dbo].[getEmployeeID]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Get the EmployeeID from Availability with ID.
-- =============================================
CREATE PROCEDURE [dbo].[getEmployeeID]
	-- Add the parameters for the stored procedure here
	@pID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT EmployeeID
	FROM Availability
	WHERE AvailabilityID = @pID
END

GO
/****** Object:  StoredProcedure [dbo].[getEndTime]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Get the End Time from Availability with ID.
-- =============================================
CREATE PROCEDURE [dbo].[getEndTime]
	-- Add the parameters for the stored procedure here
	@pID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT EndTime
	FROM Availability
	WHERE AvailabilityID = @pID
END

GO
/****** Object:  StoredProcedure [dbo].[getFirstName]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Retrieves the first name via ID.
-- =============================================
CREATE PROCEDURE [dbo].[getFirstName] 
	-- Add the parameters for the stored procedure here
	@pID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [First Name]
	FROM Employee
	WHERE EmployeeID = @pID
END

GO
/****** Object:  StoredProcedure [dbo].[getLastName]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Get the employee last name via ID
-- =============================================
CREATE PROCEDURE [dbo].[getLastName] 
	-- Add the parameters for the stored procedure here
	@pID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Last Name]
	FROM Employee
	WHERE EmployeeID = @pID

END

GO
/****** Object:  StoredProcedure [dbo].[getPassword]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Get the employee password with ID
-- =============================================
CREATE PROCEDURE [dbo].[getPassword]
	-- Add the parameters for the stored procedure here
	@pID int = 0 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Password
	FROM Employee
	WHERE EmployeeID = @pID
END

GO
/****** Object:  StoredProcedure [dbo].[getStartTime]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Get the Start Time from Availability with ID.
-- =============================================
CREATE PROCEDURE [dbo].[getStartTime]
	-- Add the parameters for the stored procedure here
	@pID int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT StartTime
	FROM Availability
	WHERE AvailabilityID = @pID
END

GO
/****** Object:  StoredProcedure [dbo].[setEmailName]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Set the employee's email with ID.
-- =============================================
CREATE PROCEDURE [dbo].[setEmailName]
	-- Add the parameters for the stored procedure here
	@pID int = 0,
	@pNewEmail varchar(50) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE EMPLOYEE
	SET Email = @pNewEmail
	WHERE EmployeeID = @pID;
END

GO
/****** Object:  StoredProcedure [dbo].[setFirstName]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Set employee first name with ID.
-- =============================================
CREATE PROCEDURE [dbo].[setFirstName]
	-- Add the parameters for the stored procedure here
	@pID int = 0,
	@pNewFirstName varchar(50) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE EMPLOYEE
	SET [First Name] = @pNewFirstName
	WHERE EmployeeID = @pID;
END

GO
/****** Object:  StoredProcedure [dbo].[setLastName]    Script Date: 10/25/2016 1:26:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Set the employee's last name with ID.
-- =============================================
CREATE PROCEDURE [dbo].[setLastName]
	-- Add the parameters for the stored procedure here
	@pID int = 0,
	@pNewLastName varchar(50) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE EMPLOYEE
	SET [Last Name] = @pNewLastName
	WHERE EmployeeID = @pID;
END

GO
USE [master]
GO
ALTER DATABASE [SchedulingDatabase] SET  READ_WRITE 
GO
