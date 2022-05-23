USE [master]
GO
/****** Object:  Database [DynamicQuestionnaire]    Script Date: 2022/05/23 12:55:31 ******/
CREATE DATABASE [DynamicQuestionnaire]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DynamicQuestionnaire', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DynamicQuestionnaire.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DynamicQuestionnaire_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DynamicQuestionnaire_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DynamicQuestionnaire].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DynamicQuestionnaire] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET ARITHABORT OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DynamicQuestionnaire] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DynamicQuestionnaire] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DynamicQuestionnaire] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DynamicQuestionnaire] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET RECOVERY FULL 
GO
ALTER DATABASE [DynamicQuestionnaire] SET  MULTI_USER 
GO
ALTER DATABASE [DynamicQuestionnaire] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DynamicQuestionnaire] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DynamicQuestionnaire] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DynamicQuestionnaire] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DynamicQuestionnaire', N'ON'
GO
USE [DynamicQuestionnaire]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2022/05/23 12:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [uniqueidentifier] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[CommonQuestionID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommonQuestions]    Script Date: 2022/05/23 12:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommonQuestions](
	[CommonQuestionID] [uniqueidentifier] NOT NULL,
	[CommonQuestionName] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CommonQuestions] PRIMARY KEY CLUSTERED 
(
	[CommonQuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questionnaires]    Script Date: 2022/05/23 12:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questionnaires](
	[QuestionnaireID] [uniqueidentifier] NOT NULL,
	[Caption] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[IsEnable] [bit] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Questionnaires] PRIMARY KEY CLUSTERED 
(
	[QuestionnaireID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2022/05/23 12:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionID] [uniqueidentifier] NOT NULL,
	[QuestionnaireID] [uniqueidentifier] NOT NULL,
	[QuestionCategory] [nvarchar](50) NOT NULL,
	[QuestionTyping] [nvarchar](50) NOT NULL,
	[QuestionName] [nvarchar](50) NOT NULL,
	[QuestionRequired] [bit] NOT NULL,
	[QuestionAnswer] [nvarchar](500) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[CommonQuestionID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Problems] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Typings]    Script Date: 2022/05/23 12:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Typings](
	[TypingID] [uniqueidentifier] NOT NULL,
	[TypingName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Typings] PRIMARY KEY CLUSTERED 
(
	[TypingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAnswers]    Script Date: 2022/05/23 12:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAnswers](
	[QuestionnaireID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[QuestionID] [uniqueidentifier] NOT NULL,
	[QuestionTyping] [nvarchar](50) NOT NULL,
	[AnswerNum] [int] NOT NULL,
	[Answer] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2022/05/23 12:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [uniqueidentifier] NOT NULL,
	[QuestionnaireID] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](24) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Age] [int] NOT NULL,
	[AnswerDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CommonQuestionID]) VALUES (N'0d078c4a-e9c9-41e5-bdb7-4216c529373e', N'CommonQuestion2', N'4c2f68ee-9ea8-4284-b319-22427e22c8c7')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CommonQuestionID]) VALUES (N'1046ebc0-a390-4dc8-b552-770f691182ea', N'CommonQuestion1', N'e5f98cba-078e-4699-b1b9-4e3c9aeaa4b2')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CommonQuestionID]) VALUES (N'93ffb6d8-2023-4171-a890-957a28549b48', N'常用問題', NULL)
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CommonQuestionID]) VALUES (N'03e572e9-35b1-4083-b963-b2ba9545988b', N'自訂問題', NULL)
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CommonQuestionID]) VALUES (N'064ae897-8432-41d4-9405-cae6d2070595', N'CommonQuestion3', N'05ce1d22-cf4d-4ea5-b05c-dae25dbb543b')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [CommonQuestionID]) VALUES (N'4f0ef00a-acec-4071-a85c-e819cae29100', N'CommonQuestion4', N'e8eb86c6-addb-4206-8069-6d5c04ab4a9e')
GO
INSERT [dbo].[CommonQuestions] ([CommonQuestionID], [CommonQuestionName], [CreateDate], [UpdateDate]) VALUES (N'4c2f68ee-9ea8-4284-b319-22427e22c8c7', N'CommonQuestion2', CAST(N'2022-05-14T18:25:28.187' AS DateTime), CAST(N'2022-05-14T18:25:28.187' AS DateTime))
GO
INSERT [dbo].[CommonQuestions] ([CommonQuestionID], [CommonQuestionName], [CreateDate], [UpdateDate]) VALUES (N'e5f98cba-078e-4699-b1b9-4e3c9aeaa4b2', N'CommonQuestion1', CAST(N'2022-05-13T01:55:17.107' AS DateTime), CAST(N'2022-05-13T05:25:25.077' AS DateTime))
GO
INSERT [dbo].[CommonQuestions] ([CommonQuestionID], [CommonQuestionName], [CreateDate], [UpdateDate]) VALUES (N'e8eb86c6-addb-4206-8069-6d5c04ab4a9e', N'CommonQuestion4', CAST(N'2022-05-16T17:37:13.130' AS DateTime), CAST(N'2022-05-16T21:01:46.237' AS DateTime))
GO
INSERT [dbo].[CommonQuestions] ([CommonQuestionID], [CommonQuestionName], [CreateDate], [UpdateDate]) VALUES (N'05ce1d22-cf4d-4ea5-b05c-dae25dbb543b', N'CommonQuestion3', CAST(N'2022-05-16T08:36:03.067' AS DateTime), CAST(N'2022-05-16T08:36:03.067' AS DateTime))
GO
INSERT [dbo].[Questionnaires] ([QuestionnaireID], [Caption], [Description], [IsEnable], [StartDate], [EndDate], [CreateDate], [UpdateDate]) VALUES (N'c99cef93-ea75-4d6c-bebc-6407a129f84e', N'questionnaire2', N'questionnaire2Des', 0, CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-15T17:28:46.567' AS DateTime), CAST(N'2022-05-15T18:03:35.693' AS DateTime))
GO
INSERT [dbo].[Questionnaires] ([QuestionnaireID], [Caption], [Description], [IsEnable], [StartDate], [EndDate], [CreateDate], [UpdateDate]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'questionnaire1', N'questionnaire1Des', 1, CAST(N'2022-05-14T00:00:00.000' AS DateTime), NULL, CAST(N'2022-05-14T04:26:28.150' AS DateTime), CAST(N'2022-05-14T12:43:30.870' AS DateTime))
GO
INSERT [dbo].[Questionnaires] ([QuestionnaireID], [Caption], [Description], [IsEnable], [StartDate], [EndDate], [CreateDate], [UpdateDate]) VALUES (N'd82d556e-c54b-401b-a587-ee76b9b3d81d', N'questionnaire4', N'questionnaire4Des', 1, CAST(N'2022-05-16T00:00:00.000' AS DateTime), NULL, CAST(N'2022-05-16T21:02:23.457' AS DateTime), CAST(N'2022-05-16T21:02:23.457' AS DateTime))
GO
INSERT [dbo].[Questionnaires] ([QuestionnaireID], [Caption], [Description], [IsEnable], [StartDate], [EndDate], [CreateDate], [UpdateDate]) VALUES (N'95679f8e-d2a6-488a-85cc-faf77a18d8f1', N'questionnaire3', N'questionnaire3Des', 1, CAST(N'2022-05-16T00:00:00.000' AS DateTime), NULL, CAST(N'2022-05-16T01:27:00.227' AS DateTime), CAST(N'2022-05-16T01:52:54.273' AS DateTime))
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'e261c254-8e16-488f-8923-0994d7a65a25', N'e39e5ee5-00bd-4139-8339-868f9ad61040', N'常用問題', N'複選方塊', N'cQuestion3', 1, N'cQuestion3-answer1;cQuestion3-answer2;cQuestion3-answer3', CAST(N'2022-05-14T18:24:32.010' AS DateTime), CAST(N'2022-05-14T18:24:32.010' AS DateTime), N'4c2f68ee-9ea8-4284-b319-22427e22c8c7')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'72ea86a0-14ea-4ebd-9ab3-0ad4311c778b', N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'自訂問題', N'單選方塊', N'question5', 0, N'question5-answer1;question5-answer2;question5-answer3', CAST(N'2022-05-14T12:43:11.353' AS DateTime), CAST(N'2022-05-14T12:43:11.353' AS DateTime), NULL)
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'7328d922-6888-4ef8-8f66-28bef6be601c', N'95679f8e-d2a6-488a-85cc-faf77a18d8f1', N'常用問題', N'文字', N'cQuestion4', 0, N'cQuestion4-answer1;cQuestion4-answer2;cQuestion4-answer3', CAST(N'2022-05-16T01:52:45.240' AS DateTime), CAST(N'2022-05-16T01:52:45.240' AS DateTime), NULL)
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'0fe946f7-697d-4629-a8ea-2df3a448e501', N'd82d556e-c54b-401b-a587-ee76b9b3d81d', N'常用問題', N'文字', N'cQuestion2', 1, N'cQuestion2-answer1;cQuestion2-answer2;cQuestion2-answer3', CAST(N'2022-05-16T21:02:16.120' AS DateTime), CAST(N'2022-05-16T21:02:16.120' AS DateTime), NULL)
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'8e6289e7-6301-4619-b9ed-31dc52a1bc83', N'284320ef-900c-4386-b7b3-8295254f07b7', N'常用問題', N'文字', N'cQuestion2', 1, N'cQuestion2-answer1;cQuestion2-answer2;cQuestion2-answer3', CAST(N'2022-05-16T21:01:44.817' AS DateTime), CAST(N'2022-05-16T21:01:44.817' AS DateTime), N'e8eb86c6-addb-4206-8069-6d5c04ab4a9e')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'06c61dfd-0bde-47e7-9b6a-4ade3839873c', N'95679f8e-d2a6-488a-85cc-faf77a18d8f1', N'常用問題', N'複選方塊', N'cQuestion5', 0, N'cQuestion5-answer1;cQuestion5-answer2;cQuestion5-answer3', CAST(N'2022-05-16T01:52:45.240' AS DateTime), CAST(N'2022-05-16T01:52:45.240' AS DateTime), NULL)
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'07db909f-1cd3-4767-b18a-583941a0b0f5', N'e39e5ee5-00bd-4139-8339-868f9ad61040', N'常用問題', N'複選方塊', N'cQuestion5', 0, N'cQuestion5-answer1;cQuestion5-answer2;cQuestion5-answer3', CAST(N'2022-05-14T18:25:09.490' AS DateTime), CAST(N'2022-05-14T18:25:09.490' AS DateTime), N'4c2f68ee-9ea8-4284-b319-22427e22c8c7')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'ee2f155a-0a55-48f8-8894-7889d9ca030a', N'95679f8e-d2a6-488a-85cc-faf77a18d8f1', N'常用問題', N'複選方塊', N'cQuestion3', 1, N'cQuestion3-answer1;cQuestion3-answer2;cQuestion3-answer3', CAST(N'2022-05-16T01:52:45.240' AS DateTime), CAST(N'2022-05-16T01:52:45.240' AS DateTime), NULL)
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'49d73086-a504-4732-9125-7ab2ab76086d', N'5414cd26-e80f-498e-8be5-322e911a1c5c', N'常用問題', N'文字', N'cQuestion33', 0, N'cQuestion33-answer1', CAST(N'2022-05-13T01:54:15.903' AS DateTime), CAST(N'2022-05-13T05:25:09.763' AS DateTime), N'e5f98cba-078e-4699-b1b9-4e3c9aeaa4b2')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'caf6b276-d71f-4758-98e6-8517ce22181e', N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'自訂問題', N'單選方塊', N'question1', 1, N'question1-answer1;question1-answer2;question1-answer3', CAST(N'2022-05-14T12:42:11.550' AS DateTime), CAST(N'2022-05-14T12:42:11.550' AS DateTime), NULL)
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'95ee6703-2f7b-4913-bfd6-9732c1080da8', N'c99cef93-ea75-4d6c-bebc-6407a129f84e', N'自訂問題', N'複選方塊', N'question4', 1, N'question4-answer1;question4-answer2;question4-answer3', CAST(N'2022-05-15T18:01:53.993' AS DateTime), CAST(N'2022-05-15T18:01:53.993' AS DateTime), NULL)
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'c4ba4f02-7aa4-43f7-9788-9fbdeb6e3b60', N'c99cef93-ea75-4d6c-bebc-6407a129f84e', N'自訂問題', N'單選方塊', N'question3', 1, N'question3-answer1;question3-answer2;question3-answer3', CAST(N'2022-05-15T17:28:09.483' AS DateTime), CAST(N'2022-05-15T18:03:14.553' AS DateTime), NULL)
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'33a1eed2-f16c-4b56-821e-b04affdcf605', N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'自訂問題', N'複選方塊', N'question4', 0, N'question4-answer1;question4-answer2;question4-answer3', CAST(N'2022-05-14T12:42:59.897' AS DateTime), CAST(N'2022-05-14T12:42:59.897' AS DateTime), NULL)
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'a93768a5-6891-4b59-9a95-b0ef7eb02771', N'5414cd26-e80f-498e-8be5-322e911a1c5c', N'常用問題', N'單選方塊', N'cQuestion44', 0, N'cQuestion44-answer1;cQuestion44-answer2;cQuestion44-answer3', CAST(N'2022-05-13T01:58:23.153' AS DateTime), CAST(N'2022-05-13T05:25:04.063' AS DateTime), N'e5f98cba-078e-4699-b1b9-4e3c9aeaa4b2')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'a0990911-9423-46ff-b3ba-b7e497192d68', N'e39e5ee5-00bd-4139-8339-868f9ad61040', N'常用問題', N'文字', N'cQuestion4', 0, N'cQuestion4-answer1;cQuestion4-answer2;cQuestion4-answer3', CAST(N'2022-05-14T18:24:49.583' AS DateTime), CAST(N'2022-05-14T18:24:49.583' AS DateTime), N'4c2f68ee-9ea8-4284-b319-22427e22c8c7')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'20a1ace4-1939-4954-a53c-ceb969c2ab7e', N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'自訂問題', N'文字', N'question3', 1, N'question3-answer1;question3-answer2;question3-answer3', CAST(N'2022-05-14T12:42:46.360' AS DateTime), CAST(N'2022-05-14T12:42:46.360' AS DateTime), NULL)
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'cabe900d-698f-4089-9686-d2e18d3a3180', N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'自訂問題', N'複選方塊', N'question2', 1, N'question2-answer1;question2-answer2;question2-answer3', CAST(N'2022-05-14T12:42:31.460' AS DateTime), CAST(N'2022-05-14T12:42:31.460' AS DateTime), NULL)
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'813c76a1-11a4-4c47-82e1-d3c37c0b1683', N'284320ef-900c-4386-b7b3-8295254f07b7', N'常用問題', N'文字', N'cQuestion1', 0, N'cQuestion1-answer1;cQuestion1-answer2;cQuestion1-answer3', CAST(N'2022-05-16T17:37:09.327' AS DateTime), CAST(N'2022-05-16T17:37:09.327' AS DateTime), N'e8eb86c6-addb-4206-8069-6d5c04ab4a9e')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'daef5089-0221-488f-af6b-f7be52f501c0', N'cdc2dc1b-3a93-4145-a917-1cd28ee37152', N'常用問題', N'單選方塊', N'cQuestion1', 0, N'cQuestion1-answer1;cQuestion1-answer2;cQuestion1-answer3', CAST(N'2022-05-16T08:35:55.910' AS DateTime), CAST(N'2022-05-16T08:35:55.910' AS DateTime), N'05ce1d22-cf4d-4ea5-b05c-dae25dbb543b')
GO
INSERT [dbo].[Questions] ([QuestionID], [QuestionnaireID], [QuestionCategory], [QuestionTyping], [QuestionName], [QuestionRequired], [QuestionAnswer], [CreateDate], [UpdateDate], [CommonQuestionID]) VALUES (N'efc18330-b59b-43df-b371-fe606ca48162', N'd82d556e-c54b-401b-a587-ee76b9b3d81d', N'常用問題', N'文字', N'cQuestion1', 0, N'cQuestion1-answer1;cQuestion1-answer2;cQuestion1-answer3', CAST(N'2022-05-16T21:02:16.120' AS DateTime), CAST(N'2022-05-16T21:02:16.120' AS DateTime), NULL)
GO
INSERT [dbo].[Typings] ([TypingID], [TypingName]) VALUES (N'3b03634a-2475-47bd-be20-167e16a40188', N'文字')
GO
INSERT [dbo].[Typings] ([TypingID], [TypingName]) VALUES (N'e4485cfa-95d2-4675-b463-dcfe3aa743a1', N'單選方塊')
GO
INSERT [dbo].[Typings] ([TypingID], [TypingName]) VALUES (N'c915f189-6eaa-45a5-bb68-e8e91d08530f', N'複選方塊')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'359de82c-7bab-4edd-ace1-a468c5d440c9', N'20a1ace4-1939-4954-a53c-ceb969c2ab7e', N'文字', 1, N't31')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'359de82c-7bab-4edd-ace1-a468c5d440c9', N'20a1ace4-1939-4954-a53c-ceb969c2ab7e', N'文字', 2, N't32')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'359de82c-7bab-4edd-ace1-a468c5d440c9', N'20a1ace4-1939-4954-a53c-ceb969c2ab7e', N'文字', 3, N't33')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'359de82c-7bab-4edd-ace1-a468c5d440c9', N'33a1eed2-f16c-4b56-821e-b04affdcf605', N'複選方塊', 2, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'359de82c-7bab-4edd-ace1-a468c5d440c9', N'72ea86a0-14ea-4ebd-9ab3-0ad4311c778b', N'單選方塊', 3, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'359de82c-7bab-4edd-ace1-a468c5d440c9', N'cabe900d-698f-4089-9686-d2e18d3a3180', N'複選方塊', 1, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'359de82c-7bab-4edd-ace1-a468c5d440c9', N'cabe900d-698f-4089-9686-d2e18d3a3180', N'複選方塊', 2, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'359de82c-7bab-4edd-ace1-a468c5d440c9', N'cabe900d-698f-4089-9686-d2e18d3a3180', N'複選方塊', 3, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'359de82c-7bab-4edd-ace1-a468c5d440c9', N'caf6b276-d71f-4758-98e6-8517ce22181e', N'單選方塊', 1, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'049d7adb-f779-4a20-acc8-981128cce750', N'20a1ace4-1939-4954-a53c-ceb969c2ab7e', N'文字', 1, N't31')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'049d7adb-f779-4a20-acc8-981128cce750', N'20a1ace4-1939-4954-a53c-ceb969c2ab7e', N'文字', 2, N't32')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'049d7adb-f779-4a20-acc8-981128cce750', N'20a1ace4-1939-4954-a53c-ceb969c2ab7e', N'文字', 3, N't33')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'049d7adb-f779-4a20-acc8-981128cce750', N'33a1eed2-f16c-4b56-821e-b04affdcf605', N'複選方塊', 1, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'049d7adb-f779-4a20-acc8-981128cce750', N'33a1eed2-f16c-4b56-821e-b04affdcf605', N'複選方塊', 3, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'049d7adb-f779-4a20-acc8-981128cce750', N'72ea86a0-14ea-4ebd-9ab3-0ad4311c778b', N'單選方塊', 1, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'049d7adb-f779-4a20-acc8-981128cce750', N'cabe900d-698f-4089-9686-d2e18d3a3180', N'複選方塊', 2, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'049d7adb-f779-4a20-acc8-981128cce750', N'cabe900d-698f-4089-9686-d2e18d3a3180', N'複選方塊', 3, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'049d7adb-f779-4a20-acc8-981128cce750', N'caf6b276-d71f-4758-98e6-8517ce22181e', N'單選方塊', 2, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'95679f8e-d2a6-488a-85cc-faf77a18d8f1', N'4913ab3d-cd17-45f2-addc-2f0f840090e0', N'06c61dfd-0bde-47e7-9b6a-4ade3839873c', N'複選方塊', 1, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'95679f8e-d2a6-488a-85cc-faf77a18d8f1', N'4913ab3d-cd17-45f2-addc-2f0f840090e0', N'06c61dfd-0bde-47e7-9b6a-4ade3839873c', N'複選方塊', 2, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'95679f8e-d2a6-488a-85cc-faf77a18d8f1', N'4913ab3d-cd17-45f2-addc-2f0f840090e0', N'7328d922-6888-4ef8-8f66-28bef6be601c', N'文字', 1, N't41')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'95679f8e-d2a6-488a-85cc-faf77a18d8f1', N'4913ab3d-cd17-45f2-addc-2f0f840090e0', N'7328d922-6888-4ef8-8f66-28bef6be601c', N'文字', 2, N't42')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'95679f8e-d2a6-488a-85cc-faf77a18d8f1', N'4913ab3d-cd17-45f2-addc-2f0f840090e0', N'7328d922-6888-4ef8-8f66-28bef6be601c', N'文字', 3, N't43')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'95679f8e-d2a6-488a-85cc-faf77a18d8f1', N'4913ab3d-cd17-45f2-addc-2f0f840090e0', N'ee2f155a-0a55-48f8-8894-7889d9ca030a', N'複選方塊', 1, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'95679f8e-d2a6-488a-85cc-faf77a18d8f1', N'4913ab3d-cd17-45f2-addc-2f0f840090e0', N'ee2f155a-0a55-48f8-8894-7889d9ca030a', N'複選方塊', 3, N'on')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'd82d556e-c54b-401b-a587-ee76b9b3d81d', N'd755c620-49c9-4379-89ec-f52c9e8a4040', N'0fe946f7-697d-4629-a8ea-2df3a448e501', N'文字', 1, N't21')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'd82d556e-c54b-401b-a587-ee76b9b3d81d', N'd755c620-49c9-4379-89ec-f52c9e8a4040', N'0fe946f7-697d-4629-a8ea-2df3a448e501', N'文字', 2, N't22')
GO
INSERT [dbo].[UserAnswers] ([QuestionnaireID], [UserID], [QuestionID], [QuestionTyping], [AnswerNum], [Answer]) VALUES (N'd82d556e-c54b-401b-a587-ee76b9b3d81d', N'd755c620-49c9-4379-89ec-f52c9e8a4040', N'0fe946f7-697d-4629-a8ea-2df3a448e501', N'文字', 3, N't23')
GO
INSERT [dbo].[Users] ([UserID], [QuestionnaireID], [UserName], [Phone], [Email], [Age], [AnswerDate]) VALUES (N'4913ab3d-cd17-45f2-addc-2f0f840090e0', N'95679f8e-d2a6-488a-85cc-faf77a18d8f1', N'user1', N'0987654321', N't@T.com', 11, CAST(N'2022-05-16T01:54:01.827' AS DateTime))
GO
INSERT [dbo].[Users] ([UserID], [QuestionnaireID], [UserName], [Phone], [Email], [Age], [AnswerDate]) VALUES (N'049d7adb-f779-4a20-acc8-981128cce750', N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'user2', N'0987654322', N't2@T.com', 22, CAST(N'2022-05-15T18:22:16.200' AS DateTime))
GO
INSERT [dbo].[Users] ([UserID], [QuestionnaireID], [UserName], [Phone], [Email], [Age], [AnswerDate]) VALUES (N'359de82c-7bab-4edd-ace1-a468c5d440c9', N'485ea379-7917-4c9a-a0df-ad2c2181f8d0', N'user1', N'0987654321', N't@T.com', 11, CAST(N'2022-05-14T19:45:03.757' AS DateTime))
GO
INSERT [dbo].[Users] ([UserID], [QuestionnaireID], [UserName], [Phone], [Email], [Age], [AnswerDate]) VALUES (N'd755c620-49c9-4379-89ec-f52c9e8a4040', N'd82d556e-c54b-401b-a587-ee76b9b3d81d', N'user1', N'0987654321', N't@T.com', 11, CAST(N'2022-05-16T21:04:23.413' AS DateTime))
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_CategoryID]  DEFAULT (newid()) FOR [CategoryID]
GO
ALTER TABLE [dbo].[Typings] ADD  CONSTRAINT [DF_Types_TypeID]  DEFAULT (newid()) FOR [TypingID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Questionnaires_QuestionnaireID] FOREIGN KEY([QuestionnaireID])
REFERENCES [dbo].[Questionnaires] ([QuestionnaireID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Questionnaires_QuestionnaireID]
GO
USE [master]
GO
ALTER DATABASE [DynamicQuestionnaire] SET  READ_WRITE 
GO
