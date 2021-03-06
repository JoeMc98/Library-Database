USE [db_LibrarySystem]
GO
/****** Object:  StoredProcedure [dbo].[theLostTribe_1]    Script Date: 12/6/2017 9:44:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[theLostTribe_1]

AS

BEGIN

	DECLARE @errorString varchar(100)
	DECLARE @results varchar(5)

	SET @errorString = 'Your book couldn''t be found at that library.'

	/* see if Sharpstown has "The Lost Tribe" */

	BEGIN TRY
		SET @results = (SELECT t3.NumOfCopies
			FROM tbl_Books t1
			INNER JOIN tbl_NumberOfCopies t3 ON t1.Book_Id = t3.Book_Id
			INNER JOIN tbl_LibraryBranch t2 ON t3.Branch_Id = t2.Branch_Id
			WHERE t1.Title = 'The Lost Tribe' AND
			t2.Branch_Name = 'Sharpstown');

		/* Sharpstown doesn't have "The Lost Tribe */
		
		IF @results = 0
			BEGIN 
				RAISERROR(@errorString, 16, 1)
				RETURN
			END
		ELSE

		/* Sharpstown has "The Lost Tribe" so tell me how many copies */

		DECLARE @bookTitle VARCHAR(50) = NULL;
		DECLARE @branchName VARCHAR(50) = NULL;
		DECLARE @numOfCopies INT = NULL;

		BEGIN

			SELECT @bookTitle = tbl_Books.Title, 
				   @branchName = tbl_LibraryBranch.Branch_Name, 
				   @numOfCopies = tbl_NumberOfCopies.NumOfCopies
				FROM tbl_Books
				INNER JOIN tbl_NumberOfCopies ON tbl_Books.Book_Id = tbl_NumberOfCopies.Book_Id
				INNER JOIN tbl_LibraryBranch ON tbl_NumberOfCopies.Branch_Id = tbl_LibraryBranch.Branch_Id
				WHERE tbl_Books.Title = 'The Lost Tribe' AND
					  tbl_LibraryBranch.Branch_Name = 'Sharpstown'; 

				/* user friendly message that Sharpstown has _ copies of "The Lost Tribe" */

				DECLARE @stringMsg VARCHAR(200) = 'The ' + @branchName + ' library has ' + 
						CONVERT(VARCHAR(10), @numOfCopies) + ' copies of ' + @bookTitle + '.';
		
				PRINT @stringMsg;

		END

	END TRY

	/* if Sharpstown doesn't have "The Lost Tribe" print this error message */

	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		RAISERROR (@errorString, 10, 1)
	END CATCH

END
GO
