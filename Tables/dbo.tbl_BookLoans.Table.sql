USE [db_LibrarySystem]
GO
/****** Object:  Table [dbo].[tbl_BookLoans]    Script Date: 12/6/2017 9:44:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_BookLoans](
	[Loan_Id] [int] IDENTITY(1,1) NOT NULL,
	[Book_Id] [int] NOT NULL,
	[Branch_Id] [int] NOT NULL,
	[Card_Id] [varchar](10) NOT NULL,
	[Checkout_Date] [date] NOT NULL,
	[Due_Date]  AS (dateadd(day,(21),[tbl_BookLoans].[Checkout_Date])) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[Loan_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tbl_BookLoans]  WITH CHECK ADD  CONSTRAINT [fk_Book_Id] FOREIGN KEY([Book_Id])
REFERENCES [dbo].[tbl_Books] ([Book_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_BookLoans] CHECK CONSTRAINT [fk_Book_Id]
GO
ALTER TABLE [dbo].[tbl_BookLoans]  WITH CHECK ADD  CONSTRAINT [fk_Branch_Id] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[tbl_LibraryBranch] ([Branch_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_BookLoans] CHECK CONSTRAINT [fk_Branch_Id]
GO
ALTER TABLE [dbo].[tbl_BookLoans]  WITH CHECK ADD  CONSTRAINT [fk_Card_Id] FOREIGN KEY([Card_Id])
REFERENCES [dbo].[tbl_Borrowers] ([Card_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_BookLoans] CHECK CONSTRAINT [fk_Card_Id]
GO
