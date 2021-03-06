USE [db_LibrarySystem]
GO
/****** Object:  Table [dbo].[tbl_Authors]    Script Date: 12/6/2017 2:09:37 PM ******/
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
/****** Object:  Table [dbo].[tbl_BookLoans]    Script Date: 12/6/2017 2:09:38 PM ******/
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
/****** Object:  Table [dbo].[tbl_Books]    Script Date: 12/6/2017 2:09:38 PM ******/
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
/****** Object:  Table [dbo].[tbl_Borrowers]    Script Date: 12/6/2017 2:09:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Borrowers](
	[Card_Id] [varchar](10) NOT NULL,
	[fName] [varchar](50) NOT NULL,
	[lName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[City] [varchar](25) NOT NULL,
	[State] [varchar](3) NOT NULL,
	[Zip_Code] [varchar](10) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Card_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_LibraryBranch]    Script Date: 12/6/2017 2:09:38 PM ******/
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
/****** Object:  Table [dbo].[tbl_NumberOfCopies]    Script Date: 12/6/2017 2:09:38 PM ******/
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
/****** Object:  Table [dbo].[tbl_Publishers]    Script Date: 12/6/2017 2:09:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Publishers](
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](25) NOT NULL,
	[State] [varchar](3) NOT NULL,
	[Zip_Code] [varchar](10) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Authors] ON 

INSERT [dbo].[tbl_Authors] ([Author_Id], [fName], [lName]) VALUES (1, N'Karilynn', N'Ricciardello')
INSERT [dbo].[tbl_Authors] ([Author_Id], [fName], [lName]) VALUES (2, N'Gayler', N'McGlaughn')
INSERT [dbo].[tbl_Authors] ([Author_Id], [fName], [lName]) VALUES (3, N'Alie', N'Prowse')
INSERT [dbo].[tbl_Authors] ([Author_Id], [fName], [lName]) VALUES (4, N'Stephen', N'King')
INSERT [dbo].[tbl_Authors] ([Author_Id], [fName], [lName]) VALUES (5, N'Kariotta', N'Jankin')
INSERT [dbo].[tbl_Authors] ([Author_Id], [fName], [lName]) VALUES (6, N'Jess', N'Childrens')
INSERT [dbo].[tbl_Authors] ([Author_Id], [fName], [lName]) VALUES (7, N'Di', N'McGuffie')
INSERT [dbo].[tbl_Authors] ([Author_Id], [fName], [lName]) VALUES (8, N'Adham', N'Grioli')
INSERT [dbo].[tbl_Authors] ([Author_Id], [fName], [lName]) VALUES (9, N'Danny', N'Cranmere')
INSERT [dbo].[tbl_Authors] ([Author_Id], [fName], [lName]) VALUES (10, N'Donella', N'Peepall')
INSERT [dbo].[tbl_Authors] ([Author_Id], [fName], [lName]) VALUES (11, N'Nikolos', N'Buchan')
SET IDENTITY_INSERT [dbo].[tbl_Authors] OFF
SET ANSI_PADDING ON
SET IDENTITY_INSERT [dbo].[tbl_BookLoans] ON 

INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (1, 1, 1, N'4926', CAST(N'2017-11-27' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (2, 1, 1, N'6989', CAST(N'2017-11-21' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (3, 1, 1, N'4926', CAST(N'2017-12-01' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (4, 2, 4, N'4926', CAST(N'2017-11-15' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (5, 2, 4, N'4926', CAST(N'2017-11-17' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (6, 3, 3, N'4038', CAST(N'2017-11-26' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (7, 4, 1, N'2809', CAST(N'2017-11-25' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (8, 4, 4, N'4038', CAST(N'2017-12-01' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (9, 5, 1, N'2809', CAST(N'2017-11-27' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (10, 5, 3, N'6989', CAST(N'2017-12-02' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (11, 5, 2, N'1366', CAST(N'2017-11-22' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (12, 5, 1, N'4038', CAST(N'2017-11-19' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (13, 6, 4, N'6989', CAST(N'2017-11-26' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (14, 6, 4, N'4926', CAST(N'2017-11-30' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (15, 7, 4, N'2809', CAST(N'2017-11-16' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (16, 7, 2, N'4038', CAST(N'2017-11-17' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (17, 7, 3, N'2060', CAST(N'2017-11-15' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (18, 7, 4, N'6989', CAST(N'2017-11-15' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (19, 8, 1, N'2684', CAST(N'2017-11-22' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (20, 8, 4, N'2948', CAST(N'2017-12-03' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (21, 9, 3, N'2948', CAST(N'2017-11-26' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (22, 9, 1, N'4038', CAST(N'2017-11-19' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (23, 10, 2, N'2060', CAST(N'2017-11-18' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (24, 12, 4, N'1895', CAST(N'2017-11-22' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (25, 12, 1, N'6989', CAST(N'2017-11-25' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (26, 12, 1, N'2809', CAST(N'2017-11-14' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (27, 12, 2, N'1366', CAST(N'2017-12-01' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (28, 12, 4, N'4926', CAST(N'2017-12-02' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (29, 13, 3, N'1366', CAST(N'2017-11-29' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (30, 13, 2, N'1895', CAST(N'2017-12-02' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (31, 13, 3, N'1895', CAST(N'2017-11-27' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (32, 14, 3, N'2060', CAST(N'2017-11-19' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (33, 15, 2, N'4926', CAST(N'2017-11-15' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (34, 15, 3, N'2060', CAST(N'2017-11-29' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (35, 15, 4, N'1366', CAST(N'2017-11-14' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (36, 15, 2, N'2809', CAST(N'2017-11-28' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (37, 15, 2, N'2809', CAST(N'2017-11-30' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (38, 16, 1, N'1366', CAST(N'2017-11-22' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (39, 16, 1, N'6989', CAST(N'2017-11-14' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (40, 17, 2, N'4926', CAST(N'2017-11-18' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (41, 17, 1, N'2948', CAST(N'2017-11-22' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (42, 17, 2, N'4038', CAST(N'2017-11-23' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (43, 17, 1, N'2809', CAST(N'2017-11-29' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (44, 17, 1, N'2948', CAST(N'2017-11-21' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (45, 19, 4, N'1366', CAST(N'2017-11-27' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (46, 19, 3, N'2684', CAST(N'2017-11-29' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (47, 20, 1, N'4038', CAST(N'2017-11-29' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (48, 20, 4, N'2684', CAST(N'2017-11-28' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (49, 20, 3, N'2809', CAST(N'2017-11-16' AS Date))
INSERT [dbo].[tbl_BookLoans] ([Loan_Id], [Book_Id], [Branch_Id], [Card_Id], [Checkout_Date]) VALUES (50, 20, 2, N'2060', CAST(N'2017-11-20' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_BookLoans] OFF
SET ANSI_PADDING OFF
SET IDENTITY_INSERT [dbo].[tbl_Books] ON 

INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (1, N'Pardes', N'Rowe, Parisian and Green', 1)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (2, N'The Hangover', N'Schneider-Mueller', 2)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (3, N'Jeopardy', N'Ullrich-Farrell', 3)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (4, N'Wild Women', N'Veum Inc', 4)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (5, N'Queen Christina', N'Nikolaus LLC', 5)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (6, N'Savages', N'Friesen-Konopelski', 6)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (7, N'Moulin Rouge', N'Rowe, Parisian and Green', 7)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (8, N'Silent Running', N'Quigley, Nader and Bins', 8)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (9, N'Ponterosa', N'Rowe, Parisian and Green', 9)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (10, N'After Alice', N'Schneider-Mueller', 10)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (11, N'College', N'Spinka, Bashirian and Brakus', 7)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (12, N'Karlsson on the Roof', N'Schneider-Mueller', 11)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (13, N'Best Worst Movie', N'Terry, Greenfelder and Terry', 11)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (14, N'Lucky Number Slevin', N'Ziemann, Ondricka and Howe', 4)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (15, N'Dear John', N'Johnson-Fadel', 11)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (16, N'The Lost Tribe', N'Rowe, Parisian and Green', 1)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (17, N'The Mothman Prophecies', N'Ruecker, Jakubowski and Dibbert', 7)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (18, N'The Sensation of Sight', N'Nienow-Sanford', 1)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (19, N'Meltdown: Days of Destruction', N'Veum Inc', 4)
INSERT [dbo].[tbl_Books] ([Book_Id], [Title], [Publisher_Name], [Author_Id]) VALUES (20, N'A Lawless Street', N'Schneider-Mueller', 3)
SET IDENTITY_INSERT [dbo].[tbl_Books] OFF
INSERT [dbo].[tbl_Borrowers] ([Card_Id], [fName], [lName], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'1366', N'Haily', N'Brand', N'46 Cambridge Center', N'Portland', N'OR', N'97086', N'855-426-5214')
INSERT [dbo].[tbl_Borrowers] ([Card_Id], [fName], [lName], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'1895', N'Wayland', N'Davydychev', N'60 Thackeray Parkway', N'Portland', N'OR', N'97086', N'219-435-2394')
INSERT [dbo].[tbl_Borrowers] ([Card_Id], [fName], [lName], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'2060', N'Wilona', N'Cornels', N'3 American Ash Way', N'Salem', N'OR', N'97301', N'257-852-8122')
INSERT [dbo].[tbl_Borrowers] ([Card_Id], [fName], [lName], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'2618', N'Cherilynn', N'Strong', N'5 Bobwhite Trail', N'Salem', N'OR', N'97301', N'221-572-0367')
INSERT [dbo].[tbl_Borrowers] ([Card_Id], [fName], [lName], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'2684', N'Brad', N'Earwicker', N'136 Clove Pass', N'Portland', N'OR', N'97086', N'308-954-6487')
INSERT [dbo].[tbl_Borrowers] ([Card_Id], [fName], [lName], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'2809', N'Jerrold', N'Danelutti', N'6 Scoville Terrace', N'Salem', N'OR', N'97301', N'205-554-1919')
INSERT [dbo].[tbl_Borrowers] ([Card_Id], [fName], [lName], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'2948', N'Ingrid', N'Stone', N'677 Ohio Court', N'Salem', N'OR', N'97301', N'357-305-1508')
INSERT [dbo].[tbl_Borrowers] ([Card_Id], [fName], [lName], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'4038', N'Charles', N'Caris', N'662 Lien Plaza', N'Portland', N'OR', N'97086', N'338-595-6973')
INSERT [dbo].[tbl_Borrowers] ([Card_Id], [fName], [lName], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'4926', N'Carrie', N'Gooley', N'296 Dexter Plaza', N'Eugene', N'OR', N'97401', N'920-372-5139')
INSERT [dbo].[tbl_Borrowers] ([Card_Id], [fName], [lName], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'6989', N'Rafael', N'Pallaske', N'8 Rowland Point', N'Portland', N'OR', N'97086', N'637-562-2971')
SET IDENTITY_INSERT [dbo].[tbl_LibraryBranch] ON 

INSERT [dbo].[tbl_LibraryBranch] ([Branch_Id], [Branch_Name], [Address], [City], [State], [Zip_Code]) VALUES (1, N'Sharpstown', N'2169 Express Street', N'Portland', N'OR', N'97086')
INSERT [dbo].[tbl_LibraryBranch] ([Branch_Id], [Branch_Name], [Address], [City], [State], [Zip_Code]) VALUES (2, N'Central', N'9 Merchant Trail', N'Eugene', N'OR', N'97401')
INSERT [dbo].[tbl_LibraryBranch] ([Branch_Id], [Branch_Name], [Address], [City], [State], [Zip_Code]) VALUES (3, N'Mangarine', N'43994 Prarieview Place', N'Beaverton', N'OR', N'97003')
INSERT [dbo].[tbl_LibraryBranch] ([Branch_Id], [Branch_Name], [Address], [City], [State], [Zip_Code]) VALUES (4, N'Gombang', N'1 Summit Hill', N'Portland', N'OR', N'97086')
SET IDENTITY_INSERT [dbo].[tbl_LibraryBranch] OFF
SET IDENTITY_INSERT [dbo].[tbl_NumberOfCopies] ON 

INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (1, 1, 1, 6)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (2, 1, 2, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (3, 1, 3, 6)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (4, 1, 4, 2)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (5, 2, 1, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (6, 2, 2, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (7, 2, 3, 6)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (8, 2, 4, 5)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (9, 3, 1, 6)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (10, 3, 2, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (11, 3, 3, 6)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (12, 3, 4, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (13, 4, 1, 6)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (14, 4, 2, 2)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (15, 4, 3, 2)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (16, 4, 4, 6)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (17, 5, 1, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (18, 5, 2, 5)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (19, 5, 3, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (20, 5, 4, 2)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (21, 6, 1, 7)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (22, 6, 2, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (23, 6, 3, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (24, 6, 4, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (25, 7, 1, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (26, 7, 2, 8)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (27, 7, 3, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (28, 7, 4, 8)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (29, 8, 1, 5)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (30, 8, 2, 2)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (31, 8, 3, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (32, 8, 4, 7)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (33, 9, 1, 8)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (34, 9, 2, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (35, 9, 3, 6)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (36, 9, 4, 6)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (37, 10, 1, 2)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (38, 10, 2, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (39, 10, 3, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (40, 10, 4, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (41, 11, 1, 2)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (42, 11, 2, 7)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (43, 11, 3, 8)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (44, 11, 4, 6)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (45, 12, 1, 7)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (46, 12, 2, 6)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (47, 12, 3, 5)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (48, 12, 4, 5)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (49, 13, 1, 7)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (50, 13, 2, 5)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (51, 13, 3, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (52, 13, 4, 8)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (53, 14, 1, 5)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (54, 14, 2, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (55, 14, 3, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (56, 14, 4, 5)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (57, 15, 1, 8)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (58, 15, 2, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (59, 15, 3, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (60, 15, 4, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (61, 16, 1, 6)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (62, 16, 2, 5)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (63, 16, 3, 7)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (64, 16, 4, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (65, 17, 1, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (66, 17, 2, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (67, 17, 3, 2)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (68, 17, 4, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (69, 18, 1, 8)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (70, 18, 2, 2)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (71, 18, 3, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (72, 18, 4, 5)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (73, 19, 1, 5)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (74, 19, 2, 8)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (75, 19, 3, 5)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (76, 19, 4, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (77, 20, 1, 4)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (78, 20, 2, 2)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (79, 20, 3, 3)
INSERT [dbo].[tbl_NumberOfCopies] ([Id], [Book_Id], [Branch_Id], [NumOfCopies]) VALUES (80, 20, 4, 8)
SET IDENTITY_INSERT [dbo].[tbl_NumberOfCopies] OFF
INSERT [dbo].[tbl_Publishers] ([Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'Friesen-Konopelski', N'19 Caliangt Lane', N'Lafayette', N'LA', N'70501', N'464-880-1294')
INSERT [dbo].[tbl_Publishers] ([Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'Johnson-Fadel', N'8048 Beilfuss Center', N'Canton', N'OH', N'44702', N'881-948-1019')
INSERT [dbo].[tbl_Publishers] ([Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'Nienow-Sanford', N'737 Columbus Drive', N'Bryan', N'TX', N'77801', N'745-613-8478')
INSERT [dbo].[tbl_Publishers] ([Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'Nikolaus LLC', N'69 Hazelcrest Avenue', N'Richmond', N'VA', N'23219', N'979-233-1080')
INSERT [dbo].[tbl_Publishers] ([Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'Quigley, Nader and Bins', N'42607 Cascade Street', N'Tallahassee', N'FL', N'32301', N'625-530-2262')
INSERT [dbo].[tbl_Publishers] ([Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'Rowe, Parisian and Green', N'5090 Warner Park', N'Memphis', N'TN', N'38103', N'791-334-1386')
INSERT [dbo].[tbl_Publishers] ([Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'Ruecker, Jakubowski and Dibbert', N'21 Acker Park', N'Aurora', N'IL', N'60502', N'964-521-8370')
INSERT [dbo].[tbl_Publishers] ([Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'Schneider-Mueller', N'366 Northwestern Way', N'Independence', N'MO', N'64050', N'615-442-6322')
INSERT [dbo].[tbl_Publishers] ([Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'Spinka, Bashirian and Brakus', N'83430 Kipling Way', N'Houston', N'TX', N'77002', N'802-594-5480')
INSERT [dbo].[tbl_Publishers] ([Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'Terry, Greenfelder and Terry', N'4447 Annamark Junction', N'Athens', N'GA', N'30601', N'219-636-5155')
INSERT [dbo].[tbl_Publishers] ([Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'Ullrich-Farrell', N'2 Cascade Road', N'Mobile', N'AL', N'36602', N'858-440-3978')
INSERT [dbo].[tbl_Publishers] ([Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'Veum Inc', N'79804 Gateway Road', N'Duluth', N'GA', N'30096', N'333-325-2905')
INSERT [dbo].[tbl_Publishers] ([Name], [Address], [City], [State], [Zip_Code], [Phone]) VALUES (N'Ziemann, Ondricka and Howe', N'36 Fallview Center', N'Lakeland', N'FL', N'33801', N'860-221-3941')
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
