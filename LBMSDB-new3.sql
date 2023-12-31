USE [LBMSDB]
GO
/****** Object:  Table [dbo].[AuthorTable]    Script Date: 11/16/2023 8:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorTable](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](200) NOT NULL,
	[DateOfBirth] [date] NULL,
	[DateOfDeath] [date] NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_AuthorTable] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookFineTable]    Script Date: 11/16/2023 8:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookFineTable](
	[BookFineID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[FineDate] [date] NOT NULL,
	[FineAmount] [float] NOT NULL,
	[ReceiveAmount] [float] NULL,
	[NoOfDays] [int] NOT NULL,
 CONSTRAINT [PK_BookFineTable] PRIMARY KEY CLUSTERED 
(
	[BookFineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookReturnTable]    Script Date: 11/16/2023 8:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookReturnTable](
	[BookReturnID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[CurrentDate] [date] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_BookReturnTable] PRIMARY KEY CLUSTERED 
(
	[BookReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookTable]    Script Date: 11/16/2023 8:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookTable](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[BookTypeID] [int] NOT NULL,
	[AuthorID] [int] NOT NULL,
	[BookTitle] [nvarchar](200) NOT NULL,
	[ShortDescription] [nvarchar](500) NOT NULL,
	[Author] [nvarchar](150) NOT NULL,
	[BookName] [nvarchar](200) NOT NULL,
	[Edition] [float] NOT NULL,
	[TotalCopies] [int] NOT NULL,
	[RegDate] [date] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[PublisherID] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_BookTable] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookTypeTable]    Script Date: 11/16/2023 8:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookTypeTable](
	[BookTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_BookTypeTable] PRIMARY KEY CLUSTERED 
(
	[BookTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartTable]    Script Date: 11/16/2023 8:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartTable](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[BookName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_CartTable] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeTable]    Script Date: 11/16/2023 8:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeTable](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[ContactNo] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ImageU] [nvarchar](max) NULL,
 CONSTRAINT [PK_EmployeeTable] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IssueBookTable]    Script Date: 11/16/2023 8:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueBookTable](
	[IssueBookID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[IssueCopies] [int] NOT NULL,
	[IssueDate] [date] NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ReserveNoOfCopies] [bit] NOT NULL,
 CONSTRAINT [PK_IssueBookTable] PRIMARY KEY CLUSTERED 
(
	[IssueBookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublisherTable]    Script Date: 11/16/2023 8:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublisherTable](
	[PublisherID] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [nvarchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
	[ContactNo] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](150) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_PublisherTable] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 11/16/2023 8:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[EmployeeID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypeTable]    Script Date: 11/16/2023 8:06:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeTable](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_UserTypeTable] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AuthorTable] ON 

INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (1, N'Stephen King', CAST(N'1947-09-21' AS Date), NULL, N'Stephen_King.jpg')
INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (2, N'Don Norman', CAST(N'1935-12-25' AS Date), NULL, N'Don_Norman.jpg')
INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (3, N'J.K. Rowling', CAST(N'1965-07-31' AS Date), NULL, N'J.K.Rowling.jpg')
INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (4, N'Ernest Hemingway', CAST(N'1899-07-21' AS Date), CAST(N'1961-07-02' AS Date), N'Ernest_Hemingway.jpg')
INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (5, N'Jeffrey Richter', CAST(N'1964-01-01' AS Date), NULL, N'Jeffrey_Richter.jpg')
INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (6, N'Clayton Christen', CAST(N'1925-04-06' AS Date), CAST(N'2020-01-23' AS Date), N'Clayton_Christensen.jpg')
INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (7, N'Tim O''Reilly', CAST(N'1954-06-06' AS Date), NULL, N'Tim_OReilly.jpg')
INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (8, N'Nguyễn Quang Sáng', CAST(N'1932-01-12' AS Date), CAST(N'2014-02-13' AS Date), N'NQS.jpg')
INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (9, N'Haruki Murakami', CAST(N'1949-01-12' AS Date), NULL, N'Haruki_Murakami.jpg')
INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (10, N'Fujiko F. Fujio', CAST(N'1933-12-01' AS Date), CAST(N'1996-09-23' AS Date), N'Fujiko_F_Fujio.jpg')
INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (11, N'Ngo Tat To', CAST(N'1933-11-25' AS Date), CAST(N'2008-11-17' AS Date), N'NgoTatTo.jpg')
INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (12, N'Nam Cao', CAST(N'1915-08-21' AS Date), CAST(N'1951-11-05' AS Date), N'Nam_Cao.jpg')
INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (13, N'Steve McConnell', CAST(N'1962-09-03' AS Date), NULL, N'SteveMcConnell.jpg')
INSERT [dbo].[AuthorTable] ([AuthorID], [AuthorName], [DateOfBirth], [DateOfDeath], [Image]) VALUES (15, N'Eric Topol', CAST(N'1954-06-26' AS Date), NULL, N'Eric_Topol.jpg')
SET IDENTITY_INSERT [dbo].[AuthorTable] OFF
GO
SET IDENTITY_INSERT [dbo].[BookTable] ON 

INSERT [dbo].[BookTable] ([BookID], [UserID], [BookTypeID], [AuthorID], [BookTitle], [ShortDescription], [Author], [BookName], [Edition], [TotalCopies], [RegDate], [Description], [PublisherID], [Image]) VALUES (1, 1, 1, 1, N'The Shining', N'Short Desciption', N'Stephen King', N'The Shining', 1, 8, CAST(N'2019-12-19' AS Date), N'Description', 1, N'Theshining.jpg')
INSERT [dbo].[BookTable] ([BookID], [UserID], [BookTypeID], [AuthorID], [BookTitle], [ShortDescription], [Author], [BookName], [Edition], [TotalCopies], [RegDate], [Description], [PublisherID], [Image]) VALUES (2, 2, 4, 6, N'The Innovator''s Dilemma', N'Short Description for The Innovator''s Dilemma', N'Clayton Christensen', N'The Innovator''s Dilemma', 1, 10, CAST(N'2023-11-10' AS Date), N'Description for The Innovator''s Dilemma', 2, N'The_Innovators_Dilemma.jpg')
INSERT [dbo].[BookTable] ([BookID], [UserID], [BookTypeID], [AuthorID], [BookTitle], [ShortDescription], [Author], [BookName], [Edition], [TotalCopies], [RegDate], [Description], [PublisherID], [Image]) VALUES (3, 1, 3, 3, N'Harry Potter and the Sorcerer''s Stone', N'Short Description for Harry Potter and the Sorcerer''s Stone', N'J.K. Rowling', N'Harry Potter and the Sorcerer''s Stone', 1, 10, CAST(N'2020-12-10' AS Date), N'Description for Harry Potter and the Sorcerer''s Stone', 3, N'HarryPotter.jpg')
INSERT [dbo].[BookTable] ([BookID], [UserID], [BookTypeID], [AuthorID], [BookTitle], [ShortDescription], [Author], [BookName], [Edition], [TotalCopies], [RegDate], [Description], [PublisherID], [Image]) VALUES (4, 1, 5, 10, N'Doraemon', N'Short Description for Doraemon', N'Fujiko F. Fujio', N'Doraemon', 1, 15, CAST(N'2021-11-10' AS Date), N'Description for Doraemon', 1, N'Doraemon.jpg')
INSERT [dbo].[BookTable] ([BookID], [UserID], [BookTypeID], [AuthorID], [BookTitle], [ShortDescription], [Author], [BookName], [Edition], [TotalCopies], [RegDate], [Description], [PublisherID], [Image]) VALUES (5, 1, 1, 2, N'Norwegian Wood', N'Short Description for Norwegian Wood', N'Haruki Murakami', N'Norwegian Wood', 1, 15, CAST(N'2023-11-10' AS Date), N'Description for Norwegian Wood', 2, N'norwegian-wood.jpg')
INSERT [dbo].[BookTable] ([BookID], [UserID], [BookTypeID], [AuthorID], [BookTitle], [ShortDescription], [Author], [BookName], [Edition], [TotalCopies], [RegDate], [Description], [PublisherID], [Image]) VALUES (6, 2, 1, 4, N'The Old Man and the Sea', N'Short Description for The Old Man and the Sea', N'Ernest Hemingway', N'The Old Man and the Sea', 1, 12, CAST(N'2023-11-10' AS Date), N'Description for The Old Man and the Sea', 3, N'TheOldManAndTheSea.jpg')
INSERT [dbo].[BookTable] ([BookID], [UserID], [BookTypeID], [AuthorID], [BookTitle], [ShortDescription], [Author], [BookName], [Edition], [TotalCopies], [RegDate], [Description], [PublisherID], [Image]) VALUES (7, 1, 4, 5, N'WTF, What''s the Future and Why It''s Up to Us', N'Short Description for WTF', N'Tim O''Reilly', N'WTF, What''s the Future and Why It''s Up to Us', 1, 10, CAST(N'2023-11-10' AS Date), N'Description for WTF', 1, N'WTF.jpg')
INSERT [dbo].[BookTable] ([BookID], [UserID], [BookTypeID], [AuthorID], [BookTitle], [ShortDescription], [Author], [BookName], [Edition], [TotalCopies], [RegDate], [Description], [PublisherID], [Image]) VALUES (8, 1, 1, 7, N'Chí Phèo', N'Short Description for Chí Phèo', N'Nam Cao', N'Chí Phèo', 1, 8, CAST(N'2023-11-10' AS Date), N'Description for Chí Phèo', 2, N'Chi_Pheo.jpg')
INSERT [dbo].[BookTable] ([BookID], [UserID], [BookTypeID], [AuthorID], [BookTitle], [ShortDescription], [Author], [BookName], [Edition], [TotalCopies], [RegDate], [Description], [PublisherID], [Image]) VALUES (9, 2, 1, 8, N'Chiếc Lược Ngà', N'Short Description for Chiếc Lược Ngà', N'Nam Cao', N'Chiếc Lược Ngà', 1, 10, CAST(N'2023-11-10' AS Date), N'Description for Chiếc Lược Ngà', 3, N'chiec-luoc-nga.jpg')
INSERT [dbo].[BookTable] ([BookID], [UserID], [BookTypeID], [AuthorID], [BookTitle], [ShortDescription], [Author], [BookName], [Edition], [TotalCopies], [RegDate], [Description], [PublisherID], [Image]) VALUES (10, 1, 3, 9, N'Rashomon and Seventeen Other Stories', N'Short Description for Rashomon', N'Akutagawa Ryunosuke', N'Rashomon and Seventeen Other Stories', 1, 12, CAST(N'2023-11-10' AS Date), N'Description for Rashomon', 1, N'Rashomon.jpg')
INSERT [dbo].[BookTable] ([BookID], [UserID], [BookTypeID], [AuthorID], [BookTitle], [ShortDescription], [Author], [BookName], [Edition], [TotalCopies], [RegDate], [Description], [PublisherID], [Image]) VALUES (11, 1, 4, 11, N'The Design of Everyday Things', N'Short Description for The Design of Everyday Things', N'Don Norman', N'The Design of Everyday Things', 1, 15, CAST(N'2023-11-10' AS Date), N'Description for The Design of Everyday Things', 2, N'The_Design_of_Everyday_Things.jpg')
INSERT [dbo].[BookTable] ([BookID], [UserID], [BookTypeID], [AuthorID], [BookTitle], [ShortDescription], [Author], [BookName], [Edition], [TotalCopies], [RegDate], [Description], [PublisherID], [Image]) VALUES (12, 2, 2, 12, N'Deep Medicine', N'Short Description for Deep Medicine', N'Eric Topol', N'Deep Medicine', 1, 10, CAST(N'2023-11-10' AS Date), N'Description for Deep Medicine', 3, N'Deep-Medicine.png')
INSERT [dbo].[BookTable] ([BookID], [UserID], [BookTypeID], [AuthorID], [BookTitle], [ShortDescription], [Author], [BookName], [Edition], [TotalCopies], [RegDate], [Description], [PublisherID], [Image]) VALUES (13, 2, 4, 13, N'Code Complete', N'Short Description for Code Complete', N'Steve McConnell', N'Code Complete', 1, 20, CAST(N'2023-11-10' AS Date), N'Description for Code Complete', 1, N'Code-Complete.jpeg')
SET IDENTITY_INSERT [dbo].[BookTable] OFF
GO
SET IDENTITY_INSERT [dbo].[BookTypeTable] ON 

INSERT [dbo].[BookTypeTable] ([BookTypeID], [Name]) VALUES (1, N'Horror')
INSERT [dbo].[BookTypeTable] ([BookTypeID], [Name]) VALUES (2, N'Medical')
INSERT [dbo].[BookTypeTable] ([BookTypeID], [Name]) VALUES (3, N'Science Fiction')
INSERT [dbo].[BookTypeTable] ([BookTypeID], [Name]) VALUES (4, N'Information Technology')
INSERT [dbo].[BookTypeTable] ([BookTypeID], [Name]) VALUES (5, N'Comic')
SET IDENTITY_INSERT [dbo].[BookTypeTable] OFF
GO
SET IDENTITY_INSERT [dbo].[CartTable] ON 

INSERT [dbo].[CartTable] ([CartID], [BookID], [BookName]) VALUES (1, 1, N'The Shining')
INSERT [dbo].[CartTable] ([CartID], [BookID], [BookName]) VALUES (2, 4, N'Doraemon')
INSERT [dbo].[CartTable] ([CartID], [BookID], [BookName]) VALUES (3, 2, N'The Innovator Dilemma')
SET IDENTITY_INSERT [dbo].[CartTable] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeTable] ON 

INSERT [dbo].[EmployeeTable] ([EmployeeID], [UserID], [FullName], [ContactNo], [Email], [Address], [IsActive], [Description], [ImageU]) VALUES (1, 2, N'John', N'123-456-7890', N'Steve@example.com', N'Country', 1, N'Nothing special', NULL)
SET IDENTITY_INSERT [dbo].[EmployeeTable] OFF
GO
SET IDENTITY_INSERT [dbo].[PublisherTable] ON 

INSERT [dbo].[PublisherTable] ([PublisherID], [PublisherName], [UserID], [ContactNo], [Email], [Description]) VALUES (1, N'NXB Aoma', 1, N'123-456-7890', N'Aoma@example.com', NULL)
INSERT [dbo].[PublisherTable] ([PublisherID], [PublisherName], [UserID], [ContactNo], [Email], [Description]) VALUES (2, N'NXB Kanada', 1, N'123-456-7890', N'Kanada@example.com', NULL)
INSERT [dbo].[PublisherTable] ([PublisherID], [PublisherName], [UserID], [ContactNo], [Email], [Description]) VALUES (3, N'NXB Ohayo', 1, N'123-456-7890', N'Ohayo@example.com', NULL)
SET IDENTITY_INSERT [dbo].[PublisherTable] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTable] ON 

INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [EmployeeID], [IsActive], [Image]) VALUES (1, 1, N'Admin', N'1', NULL, 1, N'User_1.jpg')
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [EmployeeID], [IsActive], [Image]) VALUES (2, 3, N'Steve', N'1', NULL, 1, N'User_2.jpg')
INSERT [dbo].[UserTable] ([UserID], [UserTypeID], [UserName], [Password], [EmployeeID], [IsActive], [Image]) VALUES (3, 2, N'JohnEmp', N'1', NULL, 1, N'User_3.jpg')
SET IDENTITY_INSERT [dbo].[UserTable] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypeTable] ON 

INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (1, N'Admin')
INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (2, N'Employee')
INSERT [dbo].[UserTypeTable] ([UserTypeID], [UserType]) VALUES (3, N'Reader')
SET IDENTITY_INSERT [dbo].[UserTypeTable] OFF
GO
ALTER TABLE [dbo].[UserTable] ADD  CONSTRAINT [DF_UserTable_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[BookFineTable]  WITH CHECK ADD  CONSTRAINT [FK_BookFineTable_BookTable] FOREIGN KEY([BookID])
REFERENCES [dbo].[BookTable] ([BookID])
GO
ALTER TABLE [dbo].[BookFineTable] CHECK CONSTRAINT [FK_BookFineTable_BookTable]
GO
ALTER TABLE [dbo].[BookFineTable]  WITH CHECK ADD  CONSTRAINT [FK_BookFineTable_EmployeeTable] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeTable] ([EmployeeID])
GO
ALTER TABLE [dbo].[BookFineTable] CHECK CONSTRAINT [FK_BookFineTable_EmployeeTable]
GO
ALTER TABLE [dbo].[BookFineTable]  WITH CHECK ADD  CONSTRAINT [FK_BookFineTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[BookFineTable] CHECK CONSTRAINT [FK_BookFineTable_UserTable]
GO
ALTER TABLE [dbo].[BookReturnTable]  WITH CHECK ADD  CONSTRAINT [FK_BookReturnTable_BookTable] FOREIGN KEY([BookID])
REFERENCES [dbo].[BookTable] ([BookID])
GO
ALTER TABLE [dbo].[BookReturnTable] CHECK CONSTRAINT [FK_BookReturnTable_BookTable]
GO
ALTER TABLE [dbo].[BookReturnTable]  WITH CHECK ADD  CONSTRAINT [FK_BookReturnTable_EmployeeTable] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeTable] ([EmployeeID])
GO
ALTER TABLE [dbo].[BookReturnTable] CHECK CONSTRAINT [FK_BookReturnTable_EmployeeTable]
GO
ALTER TABLE [dbo].[BookReturnTable]  WITH CHECK ADD  CONSTRAINT [FK_BookReturnTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[BookReturnTable] CHECK CONSTRAINT [FK_BookReturnTable_UserTable]
GO
ALTER TABLE [dbo].[BookTable]  WITH CHECK ADD  CONSTRAINT [FK_BookTable_AuthorTable] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[AuthorTable] ([AuthorID])
GO
ALTER TABLE [dbo].[BookTable] CHECK CONSTRAINT [FK_BookTable_AuthorTable]
GO
ALTER TABLE [dbo].[BookTable]  WITH CHECK ADD  CONSTRAINT [FK_BookTable_BookTypeTable] FOREIGN KEY([BookTypeID])
REFERENCES [dbo].[BookTypeTable] ([BookTypeID])
GO
ALTER TABLE [dbo].[BookTable] CHECK CONSTRAINT [FK_BookTable_BookTypeTable]
GO
ALTER TABLE [dbo].[BookTable]  WITH CHECK ADD  CONSTRAINT [FK_BookTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[BookTable] CHECK CONSTRAINT [FK_BookTable_UserTable]
GO
ALTER TABLE [dbo].[CartTable]  WITH CHECK ADD  CONSTRAINT [FK_CartTable_BookTable] FOREIGN KEY([BookID])
REFERENCES [dbo].[BookTable] ([BookID])
GO
ALTER TABLE [dbo].[CartTable] CHECK CONSTRAINT [FK_CartTable_BookTable]
GO
ALTER TABLE [dbo].[IssueBookTable]  WITH CHECK ADD  CONSTRAINT [FK_IssueBookTable_BookTable] FOREIGN KEY([BookID])
REFERENCES [dbo].[BookTable] ([BookID])
GO
ALTER TABLE [dbo].[IssueBookTable] CHECK CONSTRAINT [FK_IssueBookTable_BookTable]
GO
ALTER TABLE [dbo].[IssueBookTable]  WITH CHECK ADD  CONSTRAINT [FK_IssueBookTable_EmployeeTable] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeTable] ([EmployeeID])
GO
ALTER TABLE [dbo].[IssueBookTable] CHECK CONSTRAINT [FK_IssueBookTable_EmployeeTable]
GO
ALTER TABLE [dbo].[IssueBookTable]  WITH CHECK ADD  CONSTRAINT [FK_IssueBookTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[IssueBookTable] CHECK CONSTRAINT [FK_IssueBookTable_UserTable]
GO
ALTER TABLE [dbo].[PublisherTable]  WITH CHECK ADD  CONSTRAINT [FK_PublisherTable_UserTable] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[PublisherTable] CHECK CONSTRAINT [FK_PublisherTable_UserTable]
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_EmployeeTable] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[EmployeeTable] ([EmployeeID])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTable_EmployeeTable]
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_UserTypeTable] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypeTable] ([UserTypeID])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTable_UserTypeTable]
GO
USE [master]
GO
ALTER DATABASE [LBMSDB] SET  READ_WRITE 
GO