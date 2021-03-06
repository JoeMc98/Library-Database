USE [db_LibrarySystem]
GO
/****** Object:  StoredProcedure [dbo].[dueAtSharpstown_4]    Script Date: 12/6/2017 9:44:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dueAtSharpstown_4]

/* info of borrowers who have books due @date from Sharpstown branch */

@date DATE

AS

BEGIN

	/* declare vars */

	DECLARE @errorString VARCHAR(100) = NULL;
	DECLARE @results INT = NULL;

	/* error message */

	SET @errorString = 'No current borrowers who have a book that is due at Sharpstown today.'

	BEGIN TRY

		/* get count of unique cardId's */

		SET @results = (SELECT  COUNT(DISTINCT tbl_BookLoans.Card_Id)
						FROM tbl_Borrowers
						INNER JOIN tbl_BookLoans ON tbl_Borrowers.Card_Id = tbl_BookLoans.Card_Id
						INNER JOIN tbl_LibraryBranch ON tbl_BookLoans.Branch_Id = tbl_LibraryBranch.Branch_Id
						INNER JOIN tbl_Books ON tbl_BookLoans.Book_Id = tbl_Books.Book_Id
						WHERE tbl_LibraryBranch.Branch_Name = 'Sharpstown' AND
						  tbl_BookLoans.Due_Date = @date);

		/* if none raise error */
		
		IF @results = 0
			BEGIN 
				RAISERROR(@errorString, 16, 1)
				RETURN
			END
		ELSE 

		/* declare and populate a table to hold the individual loanId and cardId for later access */

		DECLARE @selectId TABLE
		(
			id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
			loanId VARCHAR(10) NOT NULL,
			cardId VARCHAR(10) NOT NULL
		);

		INSERT INTO @selectId 
			SELECT Loan_Id, Card_Id
			FROM tbl_BookLoans
			INNER JOIN tbl_LibraryBranch ON tbl_BookLoans.Branch_Id = tbl_LibraryBranch.Branch_Id
			WHERE tbl_LibraryBranch.Branch_Name = 'Sharpstown'
				  AND tbl_Bookloans.Due_Date = @date
			ORDER BY Card_Id;

		/* vars to hold count of loans, cardId and count of cardId's */

		DECLARE @numLoans INT = (SELECT COUNT(loanId) FROM @selectId);
		DECLARE @sIdCardId VARCHAR(10) = NULL;
		DECLARE @sIdCountId INT = NULL;

		/* more vars */

		DECLARE @fName VARCHAR(50) = NULL;
		DECLARE @lName VARCHAR(50) = NULL;
		DECLARE @address VARCHAR(50) = NULL;
		DECLARE @city VARCHAR(50) = NULL;
		DECLARE @state VARCHAR(3) = NULL;
		DECLARE @zip VARCHAR(10) = NULL;
		DECLARE @phone VARCHAR(20) = NULL;
		DECLARE @cardId VARCHAR(10) = NULL;
		DECLARE @title VARCHAR(50) = NULL;
		DECLARE @msgTitles VARCHAR(200) = NULL;
		DECLARE @z INT = 1;
		DECLARE @y INT = 1;
		
		/* while count of unique cardId's > 0 */

		WHILE @results > 0
		BEGIN

			/* while count of loans that match criteria of @results > 0 */

			WHILE @numLoans > 0	
			BEGIN

				DECLARE @x INT = 1;
				SET @msgTitles = NULL;

				/* set @sIdCardId to the cardId at index @y 
					and @sIdCountId to count of cardId */

				SET @sIdCardId = (SELECT cardId FROM @selectId WHERE id = @y);
				SET @sIdCountId = (SELECT COUNT(cardId) FROM @selectId WHERE cardId = @sIdCardId);
				
					/* while count of cardId's that match @sIdCardId > 0 */

					WHILE @sIdCountId > 0
					BEGIN

						/* retrieve data and set vars where matches 'Sharpstown', @date, @sIdCardId */

						SELECT  @fName =  tbl_Borrowers.fName, @lName = tbl_Borrowers.lName, @address = tbl_Borrowers.Address, 
								@city = tbl_Borrowers.City, @state = tbl_Borrowers.State, @zip = tbl_Borrowers.Zip_Code,
								@phone = tbl_Borrowers.Phone, @cardId = tbl_Borrowers.Card_Id, @title = tbl_Books.Title
							FROM tbl_Borrowers
							INNER JOIN tbl_BookLoans ON tbl_Borrowers.Card_Id = tbl_BookLoans.Card_Id
							INNER JOIN tbl_LibraryBranch ON tbl_BookLoans.Branch_Id = tbl_LibraryBranch.Branch_Id
							INNER JOIN tbl_Books ON tbl_BookLoans.Book_Id = tbl_Books.Book_Id
							WHERE tbl_LibraryBranch.Branch_Name = 'Sharpstown' AND
								  tbl_BookLoans.Due_Date = @date AND
								  tbl_BookLoans.Card_Id = @sIdCardId;

							/* set @msgTitles */

							IF @msgTitles IS NULL
							BEGIN
								SET @msgTitles = @title;
							END
							ELSE
							BEGIN
								SET @msgTitles = @msgTitles + ', ' + @title
							END

						/* delete data at index @y */
					
						DELETE FROM @selectId WHERE id = @y;
					
						/* declare and set more strings */
					
						DECLARE @begin VARCHAR(100) = CHAR(13) + 'Books Due at Sharpstown' + CHAR(13) + 'on ' + 
													 CONVERT(VARCHAR(20),@date) +  CHAR(13) +
													 '-----------------------';

						DECLARE @msg VARCHAR(1000) = 'Name: ' + @fName + ' ' + @lName + CHAR(13) +
													 'Address: ' + @address + CHAR(13) +
													 'City: ' + @city + CHAR(13) +
													 'State: ' + @state + CHAR(13) +
													 'Zip: ' + @zip + CHAR(13) +
													 'Phone: ' + @phone + CHAR(13) + 
													 'Books Due: ' + @msgTitles;

						/* determine whether to print strings */

						IF @z > 0
						BEGIN
							PRINT @begin
							SET @z = @z - 1;
						END

						IF @x > 0
						BEGIN
							PRINT @msg
						END

						/* perform increments and decrements */

						SET @x = @x - 1;
						SET @y = @y + 1;
						SET @results = @results - 1;
						SET @numLoans = @numLoans - 1;
						SET @sIdCountId = @sIdCountId - 1;

					END
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
