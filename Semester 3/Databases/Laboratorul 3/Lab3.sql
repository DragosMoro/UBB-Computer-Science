USE Basketball
GO

CREATE TABLE DatabaseVersion(currentVersion SMALLINT);
INSERT INTO DatabaseVersion(currentVersion) VALUES (0);
GO

CREATE OR ALTER PROCEDURE Procedura1
AS
BEGIN
	ALTER TABLE Coach
	ALTER COLUMN coach_name VARCHAR(100);
END;
GO

CREATE OR ALTER PROCEDURE Procedura2
AS 
BEGIN
		IF (EXISTS (SELECT * FROM sys.default_constraints WHERE name='default_number'))
			RAISERROR ('Constrangerea este deja setata default!',10,1);
		ELSE
			BEGIN
				ALTER TABLE Team
				ADD CONSTRAINT default_number DEFAULT 15 FOR number_of_players
			END;
END;
GO

CREATE OR ALTER PROCEDURE Procedura3
AS 
BEGIN
	IF (NOT EXISTS (SELECT * FROM sys.tables WHERE name='GameReferees'))
		BEGIN
			CREATE TABLE GameReferees(
				referee_id INT,
				game_id INT
			)
		END;
	ELSE
		RAISERROR ('Tabelul GameReferees a fost deja creat!',10,1);
END;
GO

CREATE OR ALTER PROCEDURE Procedura4
AS 
BEGIN
	ALTER TABLE Player
	ADD ppg INT
END;
GO

CREATE OR ALTER PROCEDURE Procedura5
AS 
BEGIN
	IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='fk_ForeignKeyGame'))
		BEGIN
			ALTER TABLE GameReferees
			ADD CONSTRAINT fk_ForeignKeyGame FOREIGN KEY (game_id) REFERENCES Game(game_id) ON UPDATE CASCADE ON DELETE CASCADE
		END;
	ELSE
		RAISERROR ('Foreign Key a fost deja adaugata!',10,1);
	END;
GO

CREATE OR ALTER PROCEDURE ProceduraOpusa1
AS
BEGIN
	ALTER TABLE Coach
	ALTER COLUMN coach_name VARCHAR(200);
END;
GO


CREATE OR ALTER PROCEDURE ProceduraOpusa2
AS 
BEGIN
		IF (NOT EXISTS (SELECT * FROM sys.default_constraints WHERE name='default_number'))
			RAISERROR ('Constrangerea nu e setata default!',10,1);
		ELSE
			BEGIN
				ALTER TABLE Team
				DROP CONSTRAINT default_number
			END;
END;
GO

CREATE OR ALTER PROCEDURE ProceduraOpusa3
AS 
BEGIN
	IF (NOT EXISTS (SELECT * FROM sys.tables WHERE name='GameReferees'))
		RAISERROR ('Tabelul GameReferees nu exista!',10,1);
		ELSE
			BEGIN
			DROP TABLE GameReferees	
		END;
END;		
GO

CREATE OR ALTER PROCEDURE ProceduraOpusa4
AS 
BEGIN
	ALTER TABLE Player
	DROP COLUMN ppg
END;
GO
CREATE OR ALTER PROCEDURE ProceduraOpusa5
AS 
BEGIN
	IF (NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='fk_ForeignKeyGame'))
		BEGIN
		RAISERROR ('Foreign Key nu exista!',10,1);
				END;
	ELSE
	BEGIN
		ALTER TABLE GameReferees
			DROP CONSTRAINT fk_ForeignKeyGame	
			END;

	END;
		GO




CREATE OR ALTER PROCEDURE GetToVersion
@newVersion SMALLINT
AS
BEGIN
	DECLARE @currentVersion SMALLINT;
	DECLARE @procedure VARCHAR(50);
	SET @currentVersion = (SELECT currentVersion FROM DatabaseVersion);

	IF @newVersion = @currentVersion OR @newVersion > 5 OR @newVersion < 0
		RETURN;


		WHILE @newVersion > @currentVersion
		BEGIN
			SET @currentVersion = @currentVersion + 1
			SET @procedure = 'Procedura' + CAST(@currentVersion AS VARCHAR);
			PRINT @procedure;
			EXEC @procedure
		END;

		WHILE @newVersion < @currentVersion
		BEGIN
			SET @procedure = 'ProceduraOpusa' + CAST(@currentVersion AS VARCHAR);
			SET @currentVersion = @currentVersion - 1
			PRINT @procedure;
			EXEC @procedure
		END;

	UPDATE DatabaseVersion SET currentVersion=@newVersion;
END
GO

UPDATE DatabaseVersion SET currentVersion=0
EXEC GetToVersion @newVersion= 0