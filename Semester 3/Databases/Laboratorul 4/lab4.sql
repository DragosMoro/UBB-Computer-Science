--FUNCTII DE VALIDARE A DATELOR DIN TABELUI PLAYER
Use Basketball;
GO
CREATE OR ALTER FUNCTION validarePrenume (@player_first_name NVARCHAR(50))
RETURNS BIT
AS
BEGIN 
	IF @player_first_name IS NULL --sir vid
		RETURN 1;
	IF LTRIM(@player_first_name) = '' --contine doar spatii
		RETURN 0;
	IF LEN(@player_first_name) < 3 --lungime mai mica decat 3
		RETURN 0;
	IF NOT LEFT(@player_first_name, 1) = UPPER(LEFT(@player_first_name, 1)) Collate SQL_Latin1_General_CP1_CS_AS -- trebuie sa inceapa cu litera mare
		RETURN 0;
	RETURN 1;
END
GO

CREATE OR ALTER FUNCTION validareNume (@player_last_name NVARCHAR(50))
RETURNS BIT
AS
BEGIN 
	IF @player_last_name IS NULL --sir vid
		RETURN 1;
	IF LTRIM(@player_last_name) = '' --contine doar spatii
		RETURN 0;
	IF LEN(@player_last_name) < 3 --lungime mai mica decat 3
		RETURN 0;
	IF NOT LEFT(@player_last_name, 1) = UPPER(LEFT(@player_last_name, 1)) Collate SQL_Latin1_General_CP1_CS_AS -- trebuie sa inceapa cu litera mare
		RETURN 0;
	RETURN 1;
END
GO


CREATE OR ALTER FUNCTION validarePozitie (@player_position NVARCHAR(20))
RETURNS BIT
AS
BEGIN 
	IF @player_position IS NULL --sir vid
		RETURN 1;
	IF LTRIM(@player_position) = '' --contine doar spatii
		RETURN 0;
	IF LEN(@player_position) > 2 --lungime mai mare decat 2
		RETURN 0;
	RETURN 1;
END
GO



CREATE OR ALTER FUNCTION validareVarsta (@player_age INT)
RETURNS BIT
AS
BEGIN 
	IF @player_age >= 18 and @player_age<=65
		RETURN 1
	RETURN 0
END
GO


--validare tabela Country

CREATE OR ALTER FUNCTION validareNumeTara (@country_name NVARCHAR(50))
RETURNS BIT
AS
BEGIN 
	IF @country_name IS NULL --sir vid
		RETURN 1;
	IF LTRIM(@country_name) = '' --contine doar spatii
		RETURN 0;
	IF LEN(@country_name) < 3 --lungime mai mica decat 3
		RETURN 0;

	DECLARE @lungime INT
	SET @lungime = LEN(@country_name);

	DECLARE @contor INT
	SET @contor = 1;
	
	WHILE @contor <= @lungime --parcurg tot sirul
	BEGIN
		IF NOT SUBSTRING(@country_name, @contor, 1) LIKE '%[A-Za-z]' --nu vreau sa am altceva in afara de litere
			RETURN 0;
		SET @contor = @contor + 1;
	END
	RETURN 1;
END
GO

CREATE OR ALTER FUNCTION validareNumeContinent (@continent NVARCHAR(50))
RETURNS BIT
AS
BEGIN 
	IF @continent IS NULL --sir vid
		RETURN 1;
	IF LTRIM(@continent) = '' --contine doar spatii
		RETURN 0;
	IF LEN(@continent) < 3 --lungime mai mica decat 3
		RETURN 0;

	DECLARE @lungime INT
	SET @lungime = LEN(@continent);

	DECLARE @contor INT
	SET @contor = 1;
	
	WHILE @contor <= @lungime --parcurg tot sirul
	BEGIN
		IF NOT SUBSTRING(@continent, @contor, 1) LIKE '%[A-Za-z]' --nu vreau sa am altceva in afara de litere
			RETURN 0;
		SET @contor = @contor + 1;
	END
	RETURN 1;
END
GO


---rel many to many
CREATE OR ALTER FUNCTION validareLeaguePtStandings (@idLeague INT)
RETURNS BIT
AS
BEGIN 
	IF NOT EXISTS (SELECT * FROM League WHERE league_id=@idLeague)
		RETURN 0;
	RETURN 1;
END
GO

CREATE OR ALTER FUNCTION validareTeamPtStandings (@idTeam INT)
RETURNS BIT
AS
BEGIN 
	IF NOT EXISTS (SELECT * FROM Team WHERE team_id=@idTeam)
		RETURN 0;
	RETURN 1;
END
GO


CREATE OR ALTER FUNCTION validareRanking (@ranking INT)
RETURNS BIT
AS
BEGIN 
	IF @ranking >=1 and @ranking<=20
		RETURN 1
	RETURN 0
END
GO

GO
CREATE OR ALTER PROCEDURE CRUDOnPlayer 
	@flag BIT OUTPUT,
	@actiune VARCHAR(20),
	@player_first_name NVARCHAR(50), 
	@player_last_name NVARCHAR(50), 
	@player_position NVARCHAR(20), 
	@player_age INT,
	@player_id INT
AS 
BEGIN
	SET NOCOUNT ON;
	SET @flag = 1;

	IF dbo.validareNume(@player_last_name) = 0 
		OR dbo.validarePrenume(@player_first_name) = 0 
		OR dbo.validarePozitie(@player_position) = 0 
		OR dbo.validareVarsta(@player_age) = 0 
		SET @flag = 0;

	IF @flag = 1
	BEGIN
		IF @actiune = 'insert'
			INSERT INTO Player (player_first_name,player_last_name, player_position, player_age) VALUES (@player_first_name,@player_last_name, @player_position, @player_age)
			PRINT 'Inserare in tabelul Players pe: '+@player_first_name+' '+@player_last_name
		END
		ELSE IF @actiune = 'delete'
		BEGIN
			IF NOT EXISTS (SELECT * FROM Player WHERE player_id = @player_id) OR @player_id IS NULL
			BEGIN
				PRINT 'Nu se poate sterge din tabelul Players pentru id = '+CAST( @player_id AS VARCHAR)
				SET @flag = 0;
				RETURN
			END
			DELETE  FROM Player WHERE player_id = @player_id
			PRINT 'Stergere din tabelul Players pe: '+@player_first_name+' '+@player_last_name
		END
		ELSE IF @actiune = 'update'
		BEGIN
			IF NOT EXISTS (SELECT * FROM Player WHERE player_id = @player_id) OR @player_id IS NULL
			BEGIN
				PRINT 'Nu se poate face update in tabelul Players pentru id = '+CAST(@player_id AS VARCHAR)
				SET @flag = 0;
				RETURN
			END
			UPDATE Player SET player_first_name = @player_first_name,player_last_name=@player_last_name, player_position=@player_position, player_age =@player_age WHERE player_id=@player_id
			PRINT 'Update in tabelul Players pentru id = '+CAST(@player_id AS VARCHAR)
		END
		ELSE IF @actiune = 'select'
		BEGIN 
			SELECT * FROM Player WHERE player_id=@player_id
			PRINT 'Select facut pe tabelul Players'
		END
		ELSE
			PRINT 'Actiune inexistenta'
END;
GO

GO
CREATE OR ALTER PROCEDURE CRUDOnCountry 

	@actiune VARCHAR(20), 
	@continent NVARCHAR(50), 
	@country_name NVARCHAR(50), 
	@country_id INT
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @ok BIT = 1;

	IF dbo.validareNumeTara(@country_name) = 0 OR dbo.validareNumeContinent(@continent)= 0
		SET @ok = 0;

	IF @ok = 1
	BEGIN
		IF @actiune = 'insert'
		BEGIN
			INSERT INTO Country(country_name, continent) VALUES (@country_name, @continent)
			PRINT 'Inserare in tabelul Country pe: '+@country_name
		END
		ELSE IF @actiune = 'delete'
		BEGIN
			IF NOT EXISTS (SELECT * FROM Country WHERE country_id = @country_id) OR @country_id IS NULL
			BEGIN
				PRINT 'Nu se poate sterge din tabelul Country pentru id = '+CAST(@country_id AS VARCHAR)
				RETURN
			END
			DELETE FROM Country WHERE country_id = @country_id
			PRINT 'Stergere din tabelul Country pe: '+@country_name
		END
		ELSE IF @actiune = 'update'
		BEGIN
			IF NOT EXISTS (SELECT * FROM Country WHERE country_id = @country_id) OR @country_id IS NULL
			BEGIN
				PRINT 'Nu se poate face update in tabelul Country pentru id = '+CAST(@country_id AS VARCHAR)
				RETURN
			END
			UPDATE Country SET country_name=@country_name, continent=@continent WHERE country_id = @country_id
			PRINT 'Update in tabelul Country pentru id = '+CAST(@country_id AS VARCHAR)
		END
		ELSE IF @actiune = 'select'
		BEGIN 
			SELECT * FROM Country WHERE country_id = @country_id
			PRINT 'Select facut pe tabelul Country'
		END
		ELSE
			PRINT 'Actiune inexistenta'
	END
	ELSE 
		PRINT 'Eroare la validare'
END;
GO

GO
CREATE OR ALTER PROCEDURE CRUDOnStandings
	@actiune VARCHAR(20),
	@ranking INT,
	@league_id INT,
	@team_id INT
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @ok BIT = 1;

	IF dbo.validareLeaguePtStandings(@league_id) = 0 OR dbo.validareTeamPtStandings(@team_id) = 0
		OR dbo.validareranking(@ranking) = 0 
		SET @ok = 0;

	IF @ok = 1
	BEGIN
		IF @actiune = 'insert'
		BEGIN
			IF EXISTS (SELECT * FROM Standings WHERE team_id = @team_id AND league_id = @league_id)
			BEGIN
				PRINT 'Nu se poate face insert in tabelul Standings pentru ca deja exista cheia'
				RETURN
			END
			INSERT INTO Standings (ranking,league_id, team_id) 
			VALUES (@ranking,@league_id, @team_id)
			PRINT 'Inserare in tabelul Standings'
		END
		ELSE IF @actiune = 'delete'
		BEGIN
			DELETE FROM Standings WHERE team_id = @team_id AND league_id = @league_id
			PRINT 'Stergere din tabelul Standings'
		END
		ELSE IF @actiune = 'update'
		BEGIN
			IF NOT EXISTS (SELECT * FROM Standings WHERE team_id = @team_id AND league_id = @league_id) 
			BEGIN
				PRINT 'Nu se poate face update in tabelul Standings pentru league_id = '+
				CAST(@league_id AS VARCHAR)+' si team_id = '+CAST(@team_id AS VARCHAR)
				RETURN
			END
			UPDATE Standings SET ranking=@ranking
			WHERE team_id = @team_id AND league_id = @league_id
			PRINT 'Update in tabelul Standings'
		END
		ELSE IF @actiune = 'select'
		BEGIN 
			SELECT * FROM Standings WHERE  team_id = @team_id AND league_id = @league_id
			PRINT 'Select facut pe tabelul Standings'
		END
		ELSE
			PRINT 'Actiune inexistenta'
	END
	ELSE 
		PRINT 'Eroare la validare'
END;
GO

GO
CREATE OR ALTER PROCEDURE mainCRUD 
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM Player  
	DELETE FROM Standings  
	DELETE FROM Country  
	
	 
	DBCC CHECKIDENT (Player, RESEED, 0);
	DBCC CHECKIDENT (Standings, RESEED, 0);
	DBCC CHECKIDENT (Country, RESEED, 0);

	PRINT 'OPERATII CRUD PE TABELUL Player'

	DECLARE @flag BIT
	EXEC CRUDOnPlayer @flag OUTPUT, 'insert','Damian','Lillard','PG',30,1
	IF @flag = 0 PRINT '         Nu s-a intamplat nimic'
	EXEC CRUDOnPlayer @flag OUTPUT, 'insert','Sotropa','David','C',22,2
	IF @flag = 0 PRINT '         Nu s-a intamplat nimic'
	EXEC CRUDOnPlayer @flag OUTPUT, 'insert','Baciu','Rares','SG',22,3
	IF @flag = 0 PRINT '         Nu s-a intamplat nimic'
	EXEC CRUDOnPlayer @flag OUTPUT,'insert','Damian','Lillard','PG',79,4
	IF @flag = 0 PRINT '         Nu s-a intamplat nimic'
	EXEC CRUDOnPlayer @flag OUTPUT, 'insert','Damian','Lillard','PGdqd',30,14 
	IF @flag = 0 PRINT '         Nu s-a intamplat nimic'
	EXEC CRUDOnPlayer @flag OUTPUT, 'delete','Damian','Lillard','PG',30,14
	IF @flag = 0 PRINT '         Nu s-a intamplat nimic'
	EXEC CRUDOnPlayer @flag OUTPUT, 'select','Sotropa','David','C',22,2
	IF @flag = 0 PRINT '         Nu s-a intamplat nimic'
	EXEC CRUDOnPlayer @flag OUTPUT, 'select','Anghel','David','PF',26,3
	IF @flag = 0 PRINT '         Nu s-a intamplat nimic'
	
	PRINT ''
	PRINT 'OPERATII CRUD PE TABELUL Country'
	EXEC CRUDOnCountry 'insert','Africa','Burundi',1
	EXEC CRUDOnCountry 'insert','Africa','Botswana',2
	EXEC CRUDOnCountry 'insert','Africa','Togo',3
	EXEC CRUDOnCountry 'insert','Africa','B',12
	EXEC CRUDOnCountry 'select','Africa','Burkina-Faso',12
	EXEC CRUDOnCountry 'select','Africa','Botswana',2
	EXEC CRUDOnCountry 'update','Asia','Buthan',1

	PRINT ''
	PRINT 'OPERATII CRUD PE TABELUL Standings'
	EXEC CRUDOnStandings'insert',10,1,2
	EXEC CRUDOnStandings'insert',14,3,7
	EXEC CRUDOnStandings'insert',2,6,2
	EXEC CRUDOnStandings'insert',21,8,3
	EXEC CRUDOnStandings'update',45,5,3
	EXEC CRUDOnStandings'update',31,12,2


END;
EXEC mainCRUD
SELECT * FROM Player
SELECT * FROM Standings  
SELECT * FROM Country
GO
CREATE or alter view ViewPlayer
as 
	select player_last_name from Player
	where player_last_name = 'Damian'
go

CREATE or alter view ViewCountries
as 
	select country_name, continent from Country
go

create Index IX_NumePlayer_asc on Player (player_last_name asc)
alter index IX_NumePlayer_asc on Player disable
alter index IX_NumePlayer_asc on Player rebuild

create Index IX_NumeCountry_asc on Country (country_name asc)
alter index IX_NumeCountry_asc on Country disable
alter index IX_NumeCountry_asc on Country rebuild

Select * from ViewPlayer