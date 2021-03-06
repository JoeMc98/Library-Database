USE [db_LibrarySystem]
GO
/****** Object:  StoredProcedure [dbo].[nonCheckoutBorrowers_3]    Script Date: 12/6/2017 9:44:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[nonCheckoutBorrowers_3]

/* borrowers with no checkouts */

AS

BEGIN
	DECLARE @errorString VARCHAR(100) = NULL;
	DECLARE @results INT = NULL;

	SET @errorString = 'No current borrowers without a checkout.'

	BEGIN TRY

		/* check if there are any borrowers with a checkout */

		SET @results = (SELECT  COUNT(tbl_Borrowers.lName)
				FROM tbl_Borrowers
				LEFT JOIN tbl_BookLoans ON tbl_Borrowers.Card_Id = tbl_BookLoans.Card_Id
				WHERE tbl_BookLoans.Card_Id IS NULL);
		
		IF @results = 0
			BEGIN 
				RAISERROR(@errorString, 16, 1)
				RETURN
			END
		ELSE

		DECLARE @fName VARCHAR(50) = NULL;
		DECLARE @lName VARCHAR(50) = NULL;
		DECLARE @x INT = 1;

		BEGIN

		/* if there are non-checkout borrowers
			@results takes the count and retrieve the borrowers' first and last names */

			WHILE @results > 0
			BEGIN
				SELECT  @fName = tbl_Borrowers.fName, @lName = tbl_Borrowers.lName
					FROM tbl_Borrowers
					LEFT JOIN tbl_BookLoans ON tbl_Borrowers.Card_Id = tbl_BookLoans.Card_Id
					WHERE tbl_BookLoans.Card_Id IS NULL;

					DECLARE @begin VARCHAR(100) = 'The following borrowers do not have any books checked out currently...'

					/* print @begin once */

					IF @x > 0
					BEGIN
						PRINT @begin
					END

					/* print non-checkout borrowers' name(s) */

					DECLARE @msg VARCHAR(100) = @fName + ' ' + @lName + CHAR(13);
					PRINT @msg

					/* decrement @results, @x by one */

					SET @x = @x - 1;
					SET @results = @results - 1;
			END
			

		END

	END TRY

	/* send message that no non-checkout borrowers found */

	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		RAISERROR (@errorString, 10, 1)
	END CATCH

END
GO
