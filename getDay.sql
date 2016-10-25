SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mason Hardy
-- Create date: 10-16-16
-- Description:	Get the day name with ID
-- =============================================
CREATE PROCEDURE setLastName
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