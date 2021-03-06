USE [db_LibrarySystem]
GO
/****** Object:  StoredProcedure [dbo].[booksCheckedOut_5]    Script Date: 12/6/2017 9:44:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[booksCheckedOut_5]

/* For each library branch, retrieve the branch name and the total number of books loaned out from that branch. */

AS

BEGIN

	/* declare vars */

	DECLARE @errorString VARCHAR(100) = NULL;
	DECLARE @results INT = NULL;

	/* error message */

	SET @errorString = 'No current borrowers with a book from Sharpstown that is due today.'

	BEGIN TRY

		/* get count of loans/checkouts */

		SET @results = (SELECT COUNT(Loan_Id) FROM tbl_BookLoans);

		/* if none raise error */
		
		IF @results = 0
			BEGIN 
				RAISERROR(@errorString, 16, 1)
				RETURN
			END
		ELSE 

		/* create table to query data from more easily */

		DECLARE @sumBooks TABLE
			(
				id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
				branchName VARCHAR(50) NOT NULL,
				sumBooks INT NOT NULL
			);

		/* insert data into that table */

		INSERT INTO @sumBooks
			SELECT tbl_LibraryBranch.Branch_Name, COUNT(tbl_BookLoans.Loan_Id)
			FROM tbl_LibraryBranch
			INNER JOIN tbl_BookLoans ON tbl_LibraryBranch.Branch_Id = tbl_BookLoans.Branch_Id
			GROUP BY tbl_LibraryBranch.Branch_Name;

		/* declare vars */

		DECLARE @count INT = (SELECT COUNT(id) FROM @sumBooks);
		DECLARE @libraryName VARCHAR(50) = NULL;
		DECLARE @bookCount INT = NULL;
		DECLARE @libName VARCHAR(50) = NULL;
		DECLARE @x INT = 1;
		DECLARE @begin VARCHAR(150) = NULL;
		DECLARE @msg VARCHAR(150) = NULL;

		/* while number of libraries > 0 */

		WHILE @count > 0
		BEGIN

				/* set @libName to branchName @ @count index */

				SELECT @libName = branchName
				FROM @sumBooks
				WHERE id = @count;

				/* query data */
			
				SELECT @libraryName = tbl_LibraryBranch.Branch_Name, @bookCount = COUNT(tbl_BookLoans.Loan_Id)
				FROM tbl_LibraryBranch
				INNER JOIN tbl_BookLoans ON tbl_LibraryBranch.Branch_Id = tbl_BookLoans.Branch_Id
				WHERE tbl_LibraryBranch.Branch_Name = @libName
				GROUP BY tbl_LibraryBranch.Branch_Name;

				/* set string messages */

				SET @begin = 'Number of books checked out by library' + CHAR(13) +
							 '--------------------------------------';

				IF @msg IS NULL
				BEGIN
					SET @msg = @libraryName + ' ' + CONVERT(VARCHAR(10), @bookCount);
				END
				ELSE
				BEGIN
					SET @msg = @msg + CHAR(13) + @libraryName + ' ' + CONVERT(VARCHAR(10), @bookCount);
				END

				/* print @begin once */

				IF @x = 1
				BEGIN
					PRINT @begin;
				END
				
				/* decrement @count */
					
				SET @count = @count - 1;

				/* print @msg when done compiling it */

				IF @count = 0
				BEGIN
					PRINT @msg;
				END

				/* decrement @x */

				SET @x = @x - 1;
				
		END
	END TRY

	/* send error message */

	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		RAISERROR (@errorString, 10, 1)
	END CATCH

END
GO
