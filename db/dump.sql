USE [TaskManager]
GO
/****** Object:  Table [dbo].[tm_actions]    Script Date: 02.11.2018 3:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tm_actions](
	[action_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[action_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tm_history]    Script Date: 02.11.2018 3:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tm_history](
	[history_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[task_id] [int] NOT NULL,
	[action] [int] NOT NULL,
	[comment] [nvarchar](255) NOT NULL,
	[datestamp] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tm_locale]    Script Date: 02.11.2018 3:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tm_locale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[key] [nvarchar](255) NOT NULL,
	[lang] [nvarchar](2) NOT NULL,
	[value] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tm_task]    Script Date: 02.11.2018 3:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tm_task](
	[task_id] [int] IDENTITY(1,1) NOT NULL,
	[date_created] [datetime] NOT NULL,
	[task_name] [nvarchar](40) NOT NULL,
	[description] [nvarchar](1000) NOT NULL,
	[owner] [int] NOT NULL,
	[importance] [bit] NOT NULL,
	[urgency] [bit] NOT NULL,
	[status] [bit] NOT NULL,
	[last_modify] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[task_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tm_user]    Script Date: 02.11.2018 3:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tm_user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](30) NOT NULL,
	[password] [nvarchar](40) NOT NULL,
	[name] [nvarchar](32) NOT NULL,
	[surname] [nvarchar](32) NOT NULL,
	[lang] [nvarchar](2) NOT NULL,
	[theme] [nvarchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tm_actions] ON 

INSERT [dbo].[tm_actions] ([action_id], [name]) VALUES (1, N'create')
INSERT [dbo].[tm_actions] ([action_id], [name]) VALUES (2, N'close')
INSERT [dbo].[tm_actions] ([action_id], [name]) VALUES (3, N'change_urgency')
INSERT [dbo].[tm_actions] ([action_id], [name]) VALUES (4, N'change_importance')
INSERT [dbo].[tm_actions] ([action_id], [name]) VALUES (5, N'change_description')
INSERT [dbo].[tm_actions] ([action_id], [name]) VALUES (6, N'reopen')
INSERT [dbo].[tm_actions] ([action_id], [name]) VALUES (7, N'unknown')
SET IDENTITY_INSERT [dbo].[tm_actions] OFF
SET IDENTITY_INSERT [dbo].[tm_history] ON 

INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (1, 1, 1, 1, N'', CAST(N'2018-11-02T02:27:23.880' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (2, 1, 2, 1, N'', CAST(N'2018-11-02T02:28:55.430' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (3, 1, 3, 1, N'', CAST(N'2018-11-02T02:30:07.260' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (4, 1, 4, 1, N'', CAST(N'2018-11-02T02:31:05.847' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (5, 1, 3, 5, N'Перенос на 06.11', CAST(N'2018-11-02T02:32:44.620' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (6, 1, 4, 5, N'Перенос на 18.11', CAST(N'2018-11-02T02:33:16.690' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (7, 1, 2, 5, N'Ждет срочно 02.11', CAST(N'2018-11-02T02:34:09.787' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (8, 1, 2, 3, N'Быть без опозданий', CAST(N'2018-11-02T02:34:29.390' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (9, 1, 5, 1, N'', CAST(N'2018-11-02T02:36:29.827' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (10, 1, 6, 1, N'', CAST(N'2018-11-02T02:38:24.380' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (11, 1, 7, 1, N'', CAST(N'2018-11-02T02:40:15.713' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (12, 1, 8, 1, N'', CAST(N'2018-11-02T02:42:00.720' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (13, 1, 9, 1, N'', CAST(N'2018-11-02T02:43:30.923' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (14, 1, 10, 1, N'', CAST(N'2018-11-02T02:45:50.590' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (15, 1, 11, 1, N'', CAST(N'2018-11-02T02:47:22.153' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (16, 1, 11, 4, N'Бюджет 65000. ', CAST(N'2018-11-02T02:47:34.880' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (17, 1, 11, 5, N'', CAST(N'2018-11-02T02:47:38.310' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (18, 1, 12, 1, N'', CAST(N'2018-11-02T02:49:07.140' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (19, 1, 13, 1, N'', CAST(N'2018-11-02T02:51:39.993' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (20, 1, 13, 5, N'', CAST(N'2018-11-02T02:52:17.690' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (21, 1, 13, 2, N'Закрыта на 11300', CAST(N'2018-11-02T02:52:25.420' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (22, 1, 14, 1, N'', CAST(N'2018-11-02T02:54:23.210' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (23, 1, 14, 5, N'', CAST(N'2018-11-02T02:54:51.343' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (24, 1, 14, 2, N'Закрыта на 16200', CAST(N'2018-11-02T02:54:53.890' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (25, 1, 15, 1, N'', CAST(N'2018-11-02T02:56:39.180' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (26, 1, 15, 5, N'', CAST(N'2018-11-02T02:56:59.607' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (27, 1, 15, 2, N'Закрыто на 7700', CAST(N'2018-11-02T02:57:04.397' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (28, 1, 16, 1, N'', CAST(N'2018-11-02T03:11:40.737' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (29, 1, 16, 5, N'', CAST(N'2018-11-02T03:12:15.193' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (30, 1, 16, 3, N'Требуется визит 01.11', CAST(N'2018-11-02T03:12:17.670' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (31, 1, 16, 5, N'', CAST(N'2018-11-02T03:12:31.700' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (32, 1, 16, 2, N'Закрыто на 9800', CAST(N'2018-11-02T03:12:35.230' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (33, 1, 16, 6, N'', CAST(N'2018-11-02T03:13:38.590' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (34, 1, 16, 5, N'Новое обращение: дополнительно требуется установка аудио адаптера.', CAST(N'2018-11-02T03:14:50.297' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (35, 1, 16, 4, N'', CAST(N'2018-11-02T03:15:00.597' AS DateTime))
INSERT [dbo].[tm_history] ([history_id], [user_id], [task_id], [action], [comment], [datestamp]) VALUES (36, 1, 16, 3, N'', CAST(N'2018-11-02T03:15:01.400' AS DateTime))
SET IDENTITY_INSERT [dbo].[tm_history] OFF
SET IDENTITY_INSERT [dbo].[tm_locale] ON 

INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (1, N'home', N'ru', N'Главная')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (2, N'settings', N'ru', N'Настройки')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (3, N'task', N'ru', N'Задачи')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (4, N'active', N'ru', N'Активные')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (5, N'closed', N'ru', N'Закрытые')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (6, N'new', N'ru', N'Новая')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (7, N'user', N'ru', N'Пользователь')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (8, N'profile', N'ru', N'Профиль')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (9, N'signout', N'ru', N'Выход')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (10, N'signin', N'ru', N'Вход')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (11, N'signup', N'ru', N'Регистрация')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (12, N'loginPage', N'ru', N'Вход')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (13, N'registrationPage', N'ru', N'Регистрация')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (14, N'succesRegistration', N'ru', N'Успешная регистрация')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (15, N'loggedIn', N'ru', N'Вход выполнен')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (16, N'profileUpdated', N'ru', N'Профиль обновлен')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (17, N'profilePage', N'ru', N'Профиль')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (18, N'editProfile', N'ru', N'Изменить профиль')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (19, N'editPassword', N'ru', N'Изменить пароль')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (20, N'newTask', N'ru', N'Новая задача')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (21, N'taskDetail', N'ru', N'Обзор задачи')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (22, N'taskUpdate', N'ru', N'Редактировать задачу')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (23, N'taskChange', N'ru', N'Изменить задачу')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (24, N'closedTasks', N'ru', N'Закрытые задачи')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (25, N'showTasks', N'ru', N'Показать задачи')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (26, N'activeTasks', N'ru', N'Активные задачи')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (27, N'login', N'ru', N'Логин')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (28, N'password', N'ru', N'Пароль')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (29, N'repeatPassword', N'ru', N'Повторите пароль')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (30, N'fullName', N'ru', N'Полное имя')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (31, N'name', N'ru', N'Имя')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (32, N'surname', N'ru', N'Фамилия')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (33, N'no_acc', N'ru', N'Все еще нет аккаунта')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (34, N'have_acc', N'ru', N'Уже есть аккаунт')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (35, N'new_pass', N'ru', N'Новый пароль')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (36, N'repeat_new_pass', N'ru', N'Повторите новый пароль')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (37, N'valid_old_pass', N'ru', N'Подтвердите старый пароль')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (38, N'submit', N'ru', N'Отправить')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (39, N'search', N'ru', N'Поиск')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (40, N'task_name', N'ru', N'Название')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (41, N'history_log', N'ru', N'История изменений')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (42, N'description', N'ru', N'Описание')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (43, N'from', N'ru', N'От')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (44, N'to', N'ru', N'До')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (45, N'important', N'ru', N'Важная')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (46, N'unimportant', N'ru', N'Неважная')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (47, N'any_importance', N'ru', N'Любая важность')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (48, N'urgent', N'ru', N'Срочная')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (49, N'non_urgent', N'ru', N'Несрочная')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (50, N'any_urgency', N'ru', N'Любая срочность')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (51, N'active_status', N'ru', N'Активная')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (52, N'closed_status', N'ru', N'Закрытая')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (53, N'any_status', N'ru', N'Любой статус')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (54, N'task_edit', N'ru', N'Изменить задачу')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (55, N'task_detail', N'ru', N'Обзор')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (56, N'comment_for_upd', N'ru', N'Комментарий к изменению')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (57, N'change_description_action', N'ru', N'Изменить описание')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (58, N'create', N'ru', N'Создание')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (59, N'close', N'ru', N'Закрытие')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (60, N'change_urgency', N'ru', N'Изменение срочности')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (61, N'change_importance', N'ru', N'Изменение важности')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (62, N'change_description', N'ru', N'Изменение описания')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (63, N'reopen', N'ru', N'Возобновление')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (64, N'new_task', N'ru', N'Новая задача')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (65, N'unknown', N'ru', N'Неизвестно')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (66, N'language', N'ru', N'Язык')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (67, N'task_view', N'ru', N'Внешний вид задачи')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (68, N'en', N'ru', N'Английский')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (69, N'ru', N'ru', N'Русский')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (70, N'Minimal', N'ru', N'Минимализм')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (71, N'LongLine', N'ru', N'Полная строка')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (72, N'old_first', N'ru', N'Со старых')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (73, N'new_first', N'ru', N'С новых')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (74, N'errOccur', N'ru', N'Возникли ошибки')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (75, N'error_change_close', N'ru', N'Нельзя редактировать закрытую задачу')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (76, N'error_comment_length', N'ru', N'Комментарий должен содержать не более 255 символов')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (77, N'error_description_length', N'ru', N'Описание должно содержать не более 1000 символов')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (78, N'error_taskname_length', N'ru', N'Название задачи должно содержать не более 40 символов')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (79, N'error_change_active', N'ru', N'Задача активна')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (80, N'error_login_exists', N'ru', N'Такой логин уже существует')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (81, N'error_user_exists', N'ru', N'Такой пользователь уже существует')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (82, N'error_pair_loging_password', N'ru', N'Не найдена пара логин : пароль')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (83, N'error_only_latin_digits_underscore', N'ru', N'Логин должен содержать только латинские символы, цифры и символы подчеркивания')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (84, N'error_login_3_to_30_symbols', N'ru', N'Логин должен содержать не менее 3 и не более 30 символов')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (85, N'error_password_3_to_30_symbols', N'ru', N'Пароль должен содержать не менее 3 и не более 30 символов')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (86, N'error_repeat_password', N'ru', N'Поля пароль и повторите пароль отличаются')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (87, N'error_name_max_32_symbols', N'ru', N'Имя должно содержать не более 32 символов')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (88, N'error_surname_max_32_symbols', N'ru', N'Фамилия должна содержать не более 32 символов')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (89, N'error_valid_old_pass', N'ru', N'Ошибка подтверждения старого пароля')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (90, N'theme', N'ru', N'Оформление')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (91, N'dark', N'ru', N'Темное')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (92, N'light', N'ru', N'Светлое')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (93, N'msg_thx_for_reg', N'ru', N'Спасибо за регистрацию')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (94, N'msg_hello', N'ru', N'Добро пожаловать')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (95, N'msg_logged_in', N'ru', N'Вход выполнен')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (96, N'msg_profile_upd', N'ru', N'Ваш профиль был обновлен')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (97, N'home', N'en', N'Home')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (98, N'settings', N'en', N'Settings')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (99, N'task', N'en', N'Task')
GO
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (100, N'active', N'en', N'Active')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (101, N'closed', N'en', N'Closed')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (102, N'new', N'en', N'New')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (103, N'user', N'en', N'User')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (104, N'profile', N'en', N'Profile')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (105, N'signout', N'en', N'Sign Out')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (106, N'signin', N'en', N'Sign in')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (107, N'signup', N'en', N'Sign up')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (108, N'loginPage', N'en', N'Login Page')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (109, N'registrationPage', N'en', N'Registration Page')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (110, N'succesRegistration', N'en', N'Successful Registration')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (111, N'loggedIn', N'en', N'Logged in')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (112, N'profileUpdated', N'en', N'Profile Updated')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (113, N'profilePage', N'en', N'Profile Page')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (114, N'editProfile', N'en', N'Edit Profile')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (115, N'editPassword', N'en', N'Edit Password')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (116, N'newTask', N'en', N'New Task')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (117, N'taskDetail', N'en', N'Task Detail')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (118, N'taskUpdate', N'en', N'TaskUpdate')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (119, N'taskChange', N'en', N'TaskChange')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (120, N'closedTasks', N'en', N'Closed Tasks')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (121, N'showTasks', N'en', N'Show Tasks')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (122, N'activeTasks', N'en', N'Active Tasks')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (123, N'login', N'en', N'Login')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (124, N'password', N'en', N'Password')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (125, N'repeatPassword', N'en', N'Repeat password')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (126, N'fullName', N'en', N'Full Name')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (127, N'name', N'en', N'Name')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (128, N'surname', N'en', N'Surname')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (129, N'no_acc', N'en', N'No account yet')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (130, N'have_acc', N'en', N'Already have an account')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (131, N'new_pass', N'en', N'New password')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (132, N'repeat_new_pass', N'en', N'Repeat new password')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (133, N'valid_old_pass', N'en', N'Validate old password')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (134, N'submit', N'en', N'Submit')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (135, N'search', N'en', N'Search')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (136, N'task_name', N'en', N'Task Name')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (137, N'history_log', N'en', N'History Log')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (138, N'description', N'en', N'Description')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (139, N'from', N'en', N'From')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (140, N'to', N'en', N'To')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (141, N'important', N'en', N'Important')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (142, N'unimportant', N'en', N'Unimportant')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (143, N'any_importance', N'en', N'Any importance')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (144, N'urgent', N'en', N'Urgent')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (145, N'non_urgent', N'en', N'Non-urgent')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (146, N'any_urgency', N'en', N'Any urgency')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (147, N'active_status', N'en', N'Active')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (148, N'closed_status', N'en', N'Closed')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (149, N'any_status', N'en', N'Any status')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (150, N'task_edit', N'en', N'Edit Task')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (151, N'task_detail', N'en', N'Task Detail')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (152, N'comment_for_upd', N'en', N'Comment for update')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (153, N'change_description_action', N'en', N'Change description')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (154, N'create', N'en', N'Create')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (155, N'close', N'en', N'Close')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (156, N'change_urgency', N'en', N'Change urgency')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (157, N'change_importance', N'en', N'Change importance')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (158, N'change_description', N'en', N'Change description')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (159, N'reopen', N'en', N'Reopen')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (160, N'new_task', N'en', N'New task')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (161, N'unknown', N'en', N'unknown')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (162, N'language', N'en', N'Language')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (163, N'task_view', N'en', N'Task pattern')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (164, N'en', N'en', N'English')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (165, N'ru', N'en', N'Russian')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (166, N'Minimal', N'en', N'Minimal')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (167, N'LongLine', N'en', N'Long line')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (168, N'old_first', N'en', N'By oldest')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (169, N'new_first', N'en', N'By newest')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (170, N'errOccur', N'en', N'Errors occured')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (171, N'error_change_close', N'en', N'Can not change Closed Tasks')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (172, N'error_comment_length', N'en', N'Comment must contain not more than 255 symbols')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (173, N'error_description_length', N'en', N'Description must contain not more than 1000 symbols')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (174, N'error_taskname_length', N'en', N'Task name must contain not more than 40 symbols')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (175, N'error_change_active', N'en', N'Task is Active')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (176, N'error_login_exists', N'en', N'Such login exists')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (177, N'error_user_exists', N'en', N'Such user exists')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (178, N'error_pair_loging_password', N'en', N'No such pair User : Password found')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (179, N'error_only_latin_digits_underscore', N'en', N'Login must contain only latin letters, digits and underscore')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (180, N'error_login_3_to_30_symbols', N'en', N'Login must contain not less than 3 and not more than 30 symbols')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (181, N'error_password_3_to_30_symbols', N'en', N'Password must contain not less than 3 and not more than 30 symbols')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (182, N'error_repeat_password', N'en', N'Fields Password and Reapeat Password are not the same')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (183, N'error_name_max_32_symbols', N'en', N'Name must contain not more than 32 symbols')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (184, N'error_surname_max_32_symbols', N'en', N'Surname must contain not more than 32 symbols')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (185, N'error_valid_old_pass', N'en', N'Validation Old Password is not correct')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (186, N'theme', N'en', N'Theme')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (187, N'dark', N'en', N'Dark')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (188, N'light', N'en', N'Light')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (189, N'msg_thx_for_reg', N'en', N'Thanks for Registration')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (190, N'msg_hello', N'en', N'Hello')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (191, N'msg_logged_in', N'en', N'You are already Logged in')
INSERT [dbo].[tm_locale] ([id], [key], [lang], [value]) VALUES (192, N'msg_profile_upd', N'en', N'Your Profile was Updated')
SET IDENTITY_INSERT [dbo].[tm_locale] OFF
SET IDENTITY_INSERT [dbo].[tm_task] ON 

INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (1, CAST(N'2018-11-02T02:27:23.877' AS DateTime), N'12768 Елизавета Нарвская', N'ПК новый, установить windows. Требуется диск на x64. Озвученная цена 470.', 1, 1, 0, 0, CAST(N'2018-11-02T02:27:23.877' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (2, CAST(N'2018-11-02T02:28:55.430' AS DateTime), N'12792 Петр Василеостровская', N'Ноутбук Acer. ОС win10. Автоматически перезагружается сам произвольно. Цен не спрашивал. Ждет срочно 02.11.', 1, 1, 1, 0, CAST(N'2018-11-02T02:34:29.387' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (3, CAST(N'2018-11-02T02:30:07.260' AS DateTime), N'12801 Николай Академическая', N'Ноутбук win10, 1 год. Хочет переустановить win10. Знает цену установки 470. Отложенный на 06.11.', 1, 1, 0, 0, CAST(N'2018-11-02T02:32:44.617' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (4, CAST(N'2018-11-02T02:31:05.837' AS DateTime), N'12897 Василий Чкаловская', N'Ноутбук Asus. Требуется удалить Linux и установить win10. Цена озвучена 470. Отложенный на 18.11.', 1, 1, 0, 0, CAST(N'2018-11-02T02:33:16.690' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (5, CAST(N'2018-11-02T02:36:29.823' AS DateTime), N'12902 Екатерина Крестовский', N'ПК win10 x64. Не получается восстановить ОС. Ранее, когда ОС работала, постоянно проявлялись ошибки при распаковывании архивов. Подозрение на повреждение HDD. Озвучена цена за установку HDD 670 и новый HDD от 2000.', 1, 1, 0, 0, CAST(N'2018-11-02T02:36:29.823' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (6, CAST(N'2018-11-02T02:38:24.377' AS DateTime), N'11202 Нина Ветеранов', N'Через 3 месяца после устранения поломки пошел дым из системного блока. Запускать оборудование больше не пыталась. Требуется гарантийный ремонт. Ждет до 03.11', 1, 0, 1, 0, CAST(N'2018-11-02T02:38:24.377' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (7, CAST(N'2018-11-02T02:40:15.710' AS DateTime), N'12907 Иван Владимирская', N'ПК 1 год. Питание есть, экран не запускается. Подозрение на видеокарту. Цена за ремонт видеокарты озвучена: от 2500. Ждет 02.11', 1, 1, 1, 0, CAST(N'2018-11-02T02:40:15.710' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (8, CAST(N'2018-11-02T02:42:00.717' AS DateTime), N'10372 Лейла Академическая', N'Ноутбук Lenovo. Сильно греется и выключается произвольно. Цена за профилактическую чистку озвучена: 1680. Связаться после 20.11', 1, 0, 0, 0, CAST(N'2018-11-02T02:42:00.717' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (9, CAST(N'2018-11-02T02:43:30.920' AS DateTime), N'10827 Геннадий Девяткино', N'Требуется восстановление данных со старого HDD. Связаться после 15.11', 1, 0, 0, 0, CAST(N'2018-11-02T02:43:30.920' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (10, CAST(N'2018-11-02T02:45:50.587' AS DateTime), N'11342 Валентин Приморская', N'После переустановки ОС начались проблемы. Медленно работает оборудование. До этого проблему устранял сервисный инженер Максим Пешков 18.10.', 1, 0, 0, 0, CAST(N'2018-11-02T02:45:50.587' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (11, CAST(N'2018-11-02T02:47:22.150' AS DateTime), N'11180 Владимир Гатчина', N'Требуется собрать новый ПК. Бюджет 65000. ', 1, 1, 0, 0, CAST(N'2018-11-02T02:47:38.307' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (12, CAST(N'2018-11-02T02:49:07.137' AS DateTime), N'11820 Сергей Ленина', N'Хочет восстановить старый ПК. ', 1, 0, 0, 0, CAST(N'2018-11-02T02:49:07.137' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (13, CAST(N'2018-11-02T02:51:39.990' AS DateTime), N'10581 Владислав Лесная', N'Ноутбук HP, 6 лет. Требуется чистка и удаление вирусов. Настроить маршрутизатор. Озвучены цены: чистка - 1680, удаление вирусов - 390. Закрыта на 11300.', 1, 1, 0, 1, CAST(N'2018-11-02T02:52:25.417' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (14, CAST(N'2018-11-02T02:54:23.207' AS DateTime), N'10927 Валентин Обводный', N'Mac Book Pro, 6 лет. Поменял накопитель, жесткий диск, был установлен win7. Требуется восстановить win. Цены не озвучены. Закрыта на 16200.', 1, 1, 0, 1, CAST(N'2018-11-02T02:54:53.887' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (15, CAST(N'2018-11-02T02:56:39.180' AS DateTime), N'10320 Денис Ладожская', N'Ноутбук Lenovo, 3 года. Win7, отсутствует загрузка. Работает лишь Boot-меню. Ранее сам производил установку, подозревает, что возникли какие-то внешние проблемы. Знает, что согласование стоимости только после диагностики. Закрыто на 7700.', 1, 1, 0, 1, CAST(N'2018-11-02T02:57:04.393' AS DateTime))
INSERT [dbo].[tm_task] ([task_id], [date_created], [task_name], [description], [owner], [importance], [urgency], [status], [last_modify]) VALUES (16, CAST(N'2018-11-02T03:11:40.710' AS DateTime), N'12918 Мальвина Пушкин', N'ПК, 3 года. Проблемы с win. Тяжело запускается. Требуется настройка WiFi. Цены не озвучены. Требуется визит 01.11. Закрыто на 9800. Новое обращение: дополнительно требуется установка аудио адаптера.', 1, 0, 0, 0, CAST(N'2018-11-02T03:15:01.400' AS DateTime))
SET IDENTITY_INSERT [dbo].[tm_task] OFF
SET IDENTITY_INSERT [dbo].[tm_user] ON 

INSERT [dbo].[tm_user] ([user_id], [login], [password], [name], [surname], [lang], [theme]) VALUES (1, N'Сервис', N'211945AB6ADA5C2798C3EA95B5683CBD4377DC26', N'Николай', N'Думский', N'ru', N'light-theme')
SET IDENTITY_INSERT [dbo].[tm_user] OFF
ALTER TABLE [dbo].[tm_actions] ADD  DEFAULT ('') FOR [name]
GO
ALTER TABLE [dbo].[tm_history] ADD  DEFAULT ('') FOR [comment]
GO
ALTER TABLE [dbo].[tm_history] ADD  DEFAULT (getdate()) FOR [datestamp]
GO
ALTER TABLE [dbo].[tm_task] ADD  DEFAULT (getdate()) FOR [date_created]
GO
ALTER TABLE [dbo].[tm_task] ADD  DEFAULT ('new task') FOR [task_name]
GO
ALTER TABLE [dbo].[tm_task] ADD  DEFAULT ('') FOR [description]
GO
ALTER TABLE [dbo].[tm_task] ADD  DEFAULT ('0') FOR [importance]
GO
ALTER TABLE [dbo].[tm_task] ADD  DEFAULT ('0') FOR [urgency]
GO
ALTER TABLE [dbo].[tm_task] ADD  DEFAULT ('0') FOR [status]
GO
ALTER TABLE [dbo].[tm_task] ADD  DEFAULT (getdate()) FOR [last_modify]
GO
ALTER TABLE [dbo].[tm_user] ADD  DEFAULT ('') FOR [name]
GO
ALTER TABLE [dbo].[tm_user] ADD  DEFAULT ('') FOR [surname]
GO
ALTER TABLE [dbo].[tm_user] ADD  DEFAULT ('en') FOR [lang]
GO
ALTER TABLE [dbo].[tm_user] ADD  DEFAULT ('light-theme') FOR [theme]
GO
ALTER TABLE [dbo].[tm_history]  WITH CHECK ADD FOREIGN KEY([action])
REFERENCES [dbo].[tm_actions] ([action_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tm_history]  WITH CHECK ADD FOREIGN KEY([task_id])
REFERENCES [dbo].[tm_task] ([task_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tm_history]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[tm_user] ([user_id])
GO
ALTER TABLE [dbo].[tm_task]  WITH CHECK ADD FOREIGN KEY([owner])
REFERENCES [dbo].[tm_user] ([user_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
