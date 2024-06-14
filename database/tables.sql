create table [role] (
	[id] int primary key identity,
	[name] nvarchar(255) unique not null
);

create table [account] (
	[id] int primary key identity,
	[email] varchar(255) unique not null,
	[password_hash] char(69),
	[activated] bit not null,
	[role_id] int foreign key references [role]([id]) on delete set null,
	[created_at] datetime2 not null default getutcdate()
);

create table [user] (
	[id] int primary key identity,
	[account_id] int foreign key references [account]([id]) on delete set null,
	[first_name] nvarchar(255),
	[last_name] nvarchar(255),
	[gender] bit default(0), --0 is male, 1 is female
	[date_of_birth] date,
	[profile_image] nvarchar(max)
);

create table [category] (
	[id] int primary key identity,
	[name] nvarchar(255) unique not null
);

create table [manager_details](
	[id] int primary key identity,
	[user_id] int foreign key references [user]([id]),
	[org_name] nvarchar(255) unique not null,
	[description] nvarchar(max),
	[country] nvarchar(255)
);

create table [teacher_details](
	[id] int primary key identity,
	[user_id] int foreign key references [user]([id]),
	[manager_id] int foreign key references [manager_details]([id]) on delete cascade,
	[position] nvarchar(255),
	[bio] nvarchar(max)
);

--TODO: create trigger to cascade course related info when delete course
create table [course] (
	[id] int primary key identity,
	[manager_id] int not null foreign key references [manager_details]([id]) on delete cascade,
	[title] nvarchar(255) not null,
	[description] nvarchar(max),
	[language] nvarchar(255),
	[category_id] int foreign key references [category]([id]) on delete set null,
	[price] decimal(19, 4) not null,
	[active] bit not null default(0),
	[archived] bit not null default(0),
	[created_at] datetime2 not null default getutcdate(),
	[updated_at] datetime2 not null default getutcdate()
);

create table [lesson] (
	[id] int primary key identity,
	[course_id] int not null foreign key references [course]([id]),
	[title] nvarchar(255) not null,
	[content] text not null,
	[created_by] int foreign key references [teacher_details]([id]) on delete set null,
	[created_at] datetime2 not null default getutcdate(),
	[updated_at] datetime2 not null default getutcdate()
);

create table [quiz] (
	[id] int primary key identity,
	[course_id] int not null foreign key references [course]([id]),
	[title] nvarchar(255) not null,
	[description] nvarchar(max),
	[content_file_path] nvarchar(max) not null,
	[pass_grade] int default(0) check([pass_grade] >= 0 and [pass_grade] <= 100),
	[weight] int default(0) check([weight] >= 0 and [weight] <= 100),
	[created_by] int foreign key references [teacher_details]([id]) on delete set null,
	[created_at] datetime2 not null default getutcdate(),
	[updated_at] datetime2 not null default getutcdate()
);

create table [payment](
	[id] int primary key identity,
	[course_id] int foreign key references [course]([id]) on delete set null,
	[student_id] int not null foreign key references [user]([id]) on delete cascade,
	[purchase_price] decimal(19, 4) not null,
	[created_at] datetime2 not null default getutcdate(),
);

create table [enrollment](
	[id] int primary key identity,
	[course_id] int foreign key references [course]([id]) on delete set null,
	[student_id] int not null foreign key references [user]([id]) on delete cascade,
	[grade] decimal(19, 4),
	[passed] bit not null default(0),
);

--TODO: create trigger to cascade this when delete quiz or user
create table [student_quiz_result](
	[quiz_id] int foreign key references [quiz]([id]),
	[student_id] int foreign key references [user]([id]),
	[grade] decimal(19, 4) not null,
	[passed] bit not null,
	primary key([quiz_id], [student_id])
);

--TODO: create trigger to cascade this when delete course or teacher details
create table [teacher_assign_course](
	[course_id] int foreign key references [course]([id]),
	[teacher_id] int foreign key references [teacher_details]([id])
	primary key([course_id], [teacher_id])
);