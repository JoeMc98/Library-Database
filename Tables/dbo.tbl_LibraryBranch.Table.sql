USE [db_LibrarySystem]
GO
/****** Object:  Table [dbo].[tbl_LibraryBranch]    Script Date: 12/6/2017 9:44:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_LibraryBranch](
	[Branch_Id] [int] IDENTITY(1,1) NOT NULL,
	[Branch_Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](3) NOT NULL,
	[Zip_Code] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Branch_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
