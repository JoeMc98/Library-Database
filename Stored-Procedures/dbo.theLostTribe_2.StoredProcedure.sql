USE [db_LibrarySystem]
GO
/****** Object:  StoredProcedure [dbo].[theLostTribe_2]    Script Date: 12/6/2017 9:44:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[theLostTribe_2]

/* tells user how many copies of "The Lost Tribe" each library branch has */

AS

BEGIN
	DECLARE @errorString varchar(100)
	DECLARE @results varchar(5)

	SET @errorString = 'No libraries in this database.'

	BEGIN TRY

	/* check for libraries in database */

		SET @results = (SELECT Count(Branch_Name)
			FROM tbl_LibraryBranch);
		
		IF @results = 0
			BEGIN 
				RAISERROR(@errorString, 16, 1)
				RETURN
			END
		ELSE

		/* how many copies of "The Lost Tribe" (TLT) does each library branch have */

		DECLARE @branchName VARCHAR(50) = NULL;
		DECLARE @bookCopies INT = NULL;
		DECLARE @libCount INT = 1;

		BEGIN

			/* for each library branch */

			WHILE @libCount <= (SELECT COUNT(Branch_Name) FROM tbl_LibraryBranch)
			BEGIN

			/* grab branch name and # of "TLT" copies */

				SELECT @branchName = tbl_LibraryBranch.Branch_Name, 
					   @bookCopies = tbl_NumberOfCopies.NumOfCopies
					FROM tbl_Books
					INNER JOIN tbl_NumberOfCopies ON tbl_Books.Book_Id = tbl_NumberOfCopies.Book_Id
					INNER JOIN tbl_LibraryBranch ON tbl_NumberOfCopies.Branch_Id = tbl_LibraryBranch.Branch_Id
					WHERE tbl_Books.Title = 'The Lost Tribe' AND
						  tbl_LibraryBranch.Branch_Id = @libCount;

					DECLARE @msg VARCHAR(50) = '"The Lost Tribe" Copies' + CHAR(13);
					DECLARE @msg2 VARCHAR(50) = convert(VARCHAR(10), @bookCopies) + ' -- ' + @branchName;
					
					/* print @msg once */

					IF @libCount = 1
					BEGIN
						PRINT @msg;
					END

					/* increment @libCount by 1 and tell user how many "TLT" copies library 
						branch has */
					
					SET @libCount = @libCount + 1;
					PRINT @msg2;
			END

		END

	END TRY

	/* if no libraries */

	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		RAISERROR (@errorString, 10, 1)
	END CATCH

END
GO
