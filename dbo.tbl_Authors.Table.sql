USE [db_LibrarySystem]
GO
/****** Object:  Table [dbo].[tbl_Authors]    Script Date: 12/6/2017 9:44:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Authors](
	[Author_Id] [int] IDENTITY(1,1) NOT NULL,
	[fName] [varchar](30) NOT NULL,
	[lName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Author_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
