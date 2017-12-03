

CREATE TRIGGER ArtistInsertTrigger BEFORE INSERT ON Songs
FOR EACH ROW
BEGIN
IF (NEW.artist NOT IN (SELECT name FROM Artists)) THEN
INSERT INTO Artists (name) VALUES(NEW.artist);
END IF;
END;//

CREATE TRIGGER AlbumInsertTrigger BEFORE INSERT ON Songs
FOR EACH ROW
BEGIN
IF (NEW.album NOT IN (SELECT name FROM Albums)) THEN
INSERT INTO Albums (name) VALUES(NEW.album);
END IF;
END;//

CREATE TRIGGER SongDuplicate BEFORE INSERT ON Songs
FOR EACH ROW
BEGIN
IF(NEW.name IN (SELECT name FROM Songs WHERE name = NEW.name AND artist = NEW.artist)) THEN
DELETE FROM Songs WHERE name = NEW.name AND artist = NEW.artist;
END IF;
END;//
