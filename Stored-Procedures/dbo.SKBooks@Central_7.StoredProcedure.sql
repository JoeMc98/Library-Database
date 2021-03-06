USE [db_LibrarySystem]
GO
/****** Object:  StoredProcedure [dbo].[SKBooks@Central_7]    Script Date: 12/6/2017 9:44:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SKBooks@Central_7]

/* For each book authored (or co-authored) by "Stephen King", retrieve the title 
	and the number of copies owned by the library branch whose name is "Central" */

AS

BEGIN

	/* declare vars */

	DECLARE @errorString VARCHAR(100) = NULL;
	DECLARE @results INT = NULL;

	/* set error message */

	SET @errorString = 'Central branch does not have any books by Stephen King.'

	BEGIN TRY
		
		/* declare table to hold data */

		DECLARE @numCopies TABLE
		(
			id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
			bookId INT NOT NULL,
			numCopies INT NOT NULL
		);

		/* populate table */

		INSERT INTO @numCopies
			SELECT tbl_Books.Book_Id, tbl_NumberOfCopies.NumOfCopies FROM tbl_Authors
						INNER JOIN tbl_Books ON tbl_Authors.Author_Id = tbl_Books.Author_Id
						INNER JOIN tbl_NumberOfCopies ON tbl_Books.Book_Id = tbl_NumberOfCopies.Book_Id
						INNER JOIN tbl_LibraryBranch ON tbl_NumberOfCopies.Branch_Id = tbl_LibraryBranch.Branch_Id
						WHERE tbl_Authors.lName = 'King' AND
							  tbl_LibraryBranch.Branch_Name = 'Central';


		/* books written by Stephen King @ Central */

		SET @results = (SELECT COUNT(tbl_NumberOfCopies.NumOfCopies) FROM tbl_Authors
						INNER JOIN tbl_Books ON tbl_Authors.Author_Id = tbl_Books.Author_Id
						INNER JOIN tbl_NumberOfCopies ON tbl_Books.Book_Id = tbl_NumberOfCopies.Book_Id
						INNER JOIN tbl_LibraryBranch ON tbl_NumberOfCopies.Branch_Id = tbl_LibraryBranch.Branch_Id
						WHERE tbl_Authors.lName = 'King' AND
							  tbl_LibraryBranch.Branch_Name = 'Central');

		/* if none raise error */
		
		IF @results = 0
			BEGIN 
				RAISERROR(@errorString, 16, 1)
				RETURN
			END
		ELSE 

		/* declare vars */

		DECLARE @x INT = 1;
		DECLARE @y INT = (SELECT COUNT(id) FROM @numCopies);
		DECLARE @authorFN VARCHAR(50) = NULL;
		DECLARE @authorLN VARCHAR(50) = NULL;
		DECLARE @title VARCHAR(50) = NULL;
		DECLARE @numOfCopies INT = NULL;
		DECLARE @bookId INT = NULL;
		DECLARE @bookCopies INT = NULL;
		DECLARE @begin VARCHAR(150) = NULL;
		DECLARE @msg VARCHAR(500) = NULL;

		/* while count of SK books @ Central > 0 */

		WHILE @y > 0
		BEGIN
		
			SET @bookId = (SELECT bookId FROM @numCopies WHERE id = @y);
			SET @bookCopies = (SELECT numCopies FROM @numCopies WHERE id = @y);

			/* retrieve data */

			SELECT @authorFN = tbl_Authors.fName, @authorLN = tbl_Authors.lName,
				   @title = tbl_Books.Title, @numOfCopies = tbl_NumberOfCopies.NumOfCopies
			FROM tbl_Authors
			INNER JOIN tbl_Books ON tbl_Authors.Author_Id = tbl_Books.Author_Id
			INNER JOIN tbl_NumberOfCopies ON tbl_Books.Book_Id = tbl_NumberOfCopies.Book_Id
			INNER JOIN tbl_LibraryBranch ON tbl_NumberOfCopies.Branch_Id = tbl_LibraryBranch.Branch_Id
			WHERE tbl_Authors.lName = 'King' AND
				  tbl_LibraryBranch.Branch_Name = 'Central' AND
				  tbl_Books.Book_Id = @bookId;

			/* set messages */

			SET @begin = 'The following books at Central were written by Stephen King...';

			SET @msg = @title + ' -- ' + CONVERT(VARCHAR(10), @numOfCopies) + ' copies';

			/* print @begin once */

			IF @x > 0
			BEGIN
				PRINT @begin;
			END

			/* print @msg */

			PRINT @msg;

			/* decrement and reset @msg */

			SET @x = @x - 1;
			SET @msg = NULL;
			SET @y = @y - 1;
		END
			
	END TRY

	/* send error message */

	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		RAISERROR (@errorString, 10, 1)
	END CATCH

END
GO
