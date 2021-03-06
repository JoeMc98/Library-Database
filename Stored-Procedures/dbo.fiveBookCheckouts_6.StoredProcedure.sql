USE [db_LibrarySystem]
GO
/****** Object:  StoredProcedure [dbo].[fiveBookCheckouts_6]    Script Date: 12/6/2017 9:44:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[fiveBookCheckouts_6]

/* Retrieve the names, addresses, and number of books 
	checked out for all borrowers who have more than five books checked out. */

AS

BEGIN

	/* declare vars */

	DECLARE @errorString VARCHAR(100) = NULL;
	DECLARE @results INT = NULL;

	/* set error message */

	SET @errorString = 'No current borrowers have more than 5 books.'

	BEGIN TRY
		
		/* declare table to hold values */

		DECLARE @borrowerInfo TABLE
			(
				id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
				cardId VARCHAR(10) NOT NULL,
				loanCount INT NOT NULL
			);

		/* insert values into table */

			INSERT INTO @borrowerInfo
				SELECT tbl_Borrowers.Card_Id, COUNT(tbl_BookLoans.Loan_Id)
				FROM tbl_Borrowers
				INNER JOIN tbl_BookLoans ON tbl_Borrowers.Card_Id = tbl_BookLoans.Card_Id
				GROUP BY tbl_Borrowers.Card_Id
				ORDER BY Card_Id DESC;

		/* check for 5 book checkout-ees */

		SET @results = (SELECT COUNT(loanCount) FROM @borrowerInfo WHERE loanCount >= 5);

		/* if none raise error */
		
		IF @results = 0
			BEGIN 
				RAISERROR(@errorString, 16, 1)
				RETURN
			END
		ELSE 

		/* declare more vars */

			DECLARE @counter INT = (SELECT COUNT(id) FROM @borrowerInfo);
			DECLARE @cardId VARCHAR(10) = NULL;
			DECLARE @fName VARCHAR(50) = NULL;
			DECLARE @lName VARCHAR(50) = NULL;
			DECLARE @borCardId VARCHAR(10) = NULL;
			DECLARE @address VARCHAR(100) = NULL;
			DECLARE @city VARCHAR(50) = NULL;
			DECLARE @state VARCHAR(3) = NULL;
			DECLARE @zip VARCHAR(10) = NULL;
			DECLARE @phone VARCHAR(20) = NULL;
			DECLARE @bookCount INT = NULL;
			DECLARE @begin VARCHAR(200) = NULL;
			DECLARE @msg VARCHAR(1000) = NULL;
			DECLARE @x INT = 1;

			/* while number of checkout-ees > 0 */

			WHILE @counter > 0
			BEGIN
				
				/* @cardId = cardId @ index @counter AND
					@bookCount = # books @ index @counter */

				SET @cardId = (SELECT cardId FROM @borrowerInfo WHERE id = @counter);
				SET @bookCount = (SELECT loanCount FROM @borrowerInfo WHERE id = @counter);

				/* check if checkout-ee has 5+ books */

				IF @bookCount >= 5
				BEGIN
					SELECT @fName = tbl_Borrowers.fName, @lName = tbl_Borrowers.lName, @borCardId = tbl_Borrowers.Card_Id,
						   @address = tbl_Borrowers.Address, @city = tbl_Borrowers.City, @state = tbl_Borrowers.State, 
						   @zip = tbl_Borrowers.Zip_Code, @phone = tbl_Borrowers.Phone
						   FROM tbl_Borrowers
						   WHERE tbl_Borrowers.Card_Id = @cardId;

					/* set messages */

					SET @begin = 'The following borrowers have 5+ books checked out' + CHAR(13) +
								 '-------------------------------------------------';

					SET @msg = @fName + ' ' + @lName + CHAR(13) + @address + CHAR(13) + @city + ', ' + @state + 
							   ' ' + @zip + CHAR(13) + @phone + CHAR(13) + 'Number of checked out books - ' +
							   CONVERT(VARCHAR(10), @bookCount) + CHAR(13);

					/* print @begin once */

					IF @x > 0
					BEGIN
						PRINT @begin;
					END

					/* print @msg then clear it */

					PRINT @msg;

					SET @msg = NULL;

					/* decrement @counter and @x */

					SET @counter = @counter - 1;
					SET @x = @x - 1;
				END
				ELSE
				BEGIN
					SET @counter = @counter - 1;
				END
			END
	END TRY

	/* send error message */

	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		RAISERROR (@errorString, 10, 1)
	END CATCH

END
GO
