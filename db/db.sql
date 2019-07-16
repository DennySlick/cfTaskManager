CREATE TABLE [tm_user](
	[user_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[login] [nvarchar](30) NOT NULL,
	[password] [nvarchar](40) NOT NULL,
	[name] [nvarchar](32) NOT NULL default '',
	[surname] [nvarchar](32) NOT NULL default '',
	[lang] [nvarchar](2) NOT NULL default 'en',
	[theme] [nvarchar](32) NOT NULL default 'light-theme'
);

CREATE TABLE [tm_task](
	[task_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[date_created] [datetime] NOT NULL DEFAULT GETDATE(),
	[task_name] [nvarchar](40) NOT NULL default 'new task',
	[description] [nvarchar](1000) NOT NULL default '',
	[owner] [int] FOREIGN KEY REFERENCES [tm_user]([user_id]) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	[importance] [bit] NOT NULL default '0',
	[urgency] [bit] NOT NULL default '0',
	[status] [bit] NOT NULL default '0',
	[last_modify] [datetime] NOT NULL DEFAULT GETDATE()
);

CREATE TABLE [tm_actions](
	[action_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[name] [nvarchar](32) NOT NULL default ''
);

CREATE TABLE [tm_history](
	[history_id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[user_id] [int] FOREIGN KEY REFERENCES [tm_user]([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION NOT NULL,
	[task_id] [int] FOREIGN KEY REFERENCES [tm_task]([task_id]) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	[action] [int] FOREIGN KEY REFERENCES [tm_actions]([action_id]) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	[comment] [nvarchar](255) NOT NULL default '',
	[datestamp] [datetime] NOT NULL DEFAULT GETDATE()
);

GO

INSERT INTO [tm_actions]([name])
VALUES
('create'),
('close'),
('change_urgency'),
('change_importance'),
('change_description'),
('reopen'),
('unknown');
