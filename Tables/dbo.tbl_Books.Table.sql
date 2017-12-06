USE [db_LibrarySystem]
GO
/****** Object:  Table [dbo].[tbl_Books]    Script Date: 12/6/2017 9:44:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Books](
	[Book_Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](40) NOT NULL,
	[Publisher_Name] [varchar](50) NOT NULL,
	[Author_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Book_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tbl_Books]  WITH CHECK ADD  CONSTRAINT [fk_Author_Id] FOREIGN KEY([Author_Id])
REFERENCES [dbo].[tbl_Authors] ([Author_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Books] CHECK CONSTRAINT [fk_Author_Id]
GO
ALTER TABLE [dbo].[tbl_Books]  WITH CHECK ADD  CONSTRAINT [fk_Publisher_Name] FOREIGN KEY([Publisher_Name])
REFERENCES [dbo].[tbl_Publishers] ([Name])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Books] CHECK CONSTRAINT [fk_Publisher_Name]
GO
