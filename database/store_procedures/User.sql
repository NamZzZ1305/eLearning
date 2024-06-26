create or alter procedure spGetUserByEmail
	@Email varchar(max)
as
begin
	select u.[id], u.[first_name], u.[last_name], u.[gender], u.[date_of_birth], u.[profile_image],
	acc.[id] as [account_id], acc.[email], acc.[password_hash], acc.[activated], acc.[created_at], r.[name] as [role_name]
	from [user] as u
	join [account] as acc on u.[account_id] = acc.[id]
	join [role] as r on acc.[role_id] = r.[id]
	where acc.[email] = @Email;
end
go

create or alter procedure spRegisterAccount
	@Email varchar(max),
	@Password char(69),
	@Role nvarchar(255),
	@Success bit output
as
begin
	select @Success = 0;
	declare @output table (account_id int);
	-- insert unactivated account
	insert into [account]([email], [password_hash], [activated], [role_id])
	output inserted.[id] into @output(account_id)
	values(
		@Email, @Password, 0, (select [id] from [role] where [name] = @Role)
	);
	
	-- insert empty user profile
	declare @account_id int;
	select @account_id = [account_id] from @output;
	if @account_id is not null
	begin
		insert into [user]([account_id]) values(@account_id);
		select @Success = 1;
	end
end
go

create or alter procedure spActivateAccount
	@Email varchar(max),
	@Success bit output
as
begin
	select @Success = 0;
	update [account]
	set [activated] = 1
	where [email] = @Email;

	declare @act bit;
	select @act = [activated] from [account] where [email] = @Email;
	if @act = 1
	begin
		select @Success = 1;
	end
end
go