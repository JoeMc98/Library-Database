USE [db_LibrarySystem]
GO
/****** Object:  Table [dbo].[tbl_NumberOfCopies]    Script Date: 12/6/2017 9:44:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NumberOfCopies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Book_Id] [int] NOT NULL,
	[Branch_Id] [int] NOT NULL,
	[NumOfCopies] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tbl_NumberOfCopies]  WITH CHECK ADD  CONSTRAINT [fk_BookId] FOREIGN KEY([Book_Id])
REFERENCES [dbo].[tbl_Books] ([Book_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_NumberOfCopies] CHECK CONSTRAINT [fk_BookId]
GO
ALTER TABLE [dbo].[tbl_NumberOfCopies]  WITH CHECK ADD  CONSTRAINT [fk_BranchId] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[tbl_LibraryBranch] ([Branch_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_NumberOfCopies] CHECK CONSTRAINT [fk_BranchId]
GO
