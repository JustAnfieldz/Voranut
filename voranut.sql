-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE,
SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;
-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
	`AddressID` INT NOT NULL,
	`Country` VARCHAR(25) NOT NULL,
	`State` VARCHAR(25) NULL DEFAULT NULL,
	`City` VARCHAR(25) NOT NULL,
	`District` VARCHAR(25) NOT NULL,
	`PostalCode` VARCHAR(10) NOT NULL,
	`AddressDesc` VARCHAR(100) NULL DEFAULT NULL,
	PRIMARY KEY (`AddressID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;
-- -----------------------------------------------------
-- Table `mydb`.`Game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Game` (
	`GameID` INT NOT NULL,
	`GameName` VARCHAR(25) NOT NULL,
	`GameType` VARCHAR(25) NULL DEFAULT NULL,
	`NumMajorPlayer` INT NOT NULL,
	`NumMinorPlayer` INT NOT NULL,
PRIMARY KEY (`GameID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;
-- -----------------------------------------------------
-- Table `mydb`.`Team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Team` (
	`TeamID` INT NOT NULL,
	`TeamName` VARCHAR(25) NOT NULL,
	`TeamContact` VARCHAR(50) NOT NULL,
	`GameID` INT NOT NULL,
	PRIMARY KEY (`TeamID`),
	INDEX `fk_Team_Game1_idx` (`GameID` ASC) VISIBLE,
	CONSTRAINT `fk_Team_Game1`
	FOREIGN KEY (`GameID`)
	REFERENCES `mydb`.`Game` (`GameID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;
-- -----------------------------------------------------
-- Table `mydb`.`Organizer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Organizer` (
	`OrganizerID` INT NOT NULL,
	`OrganizerName` VARCHAR(25) NOT NULL,
	`Telephone` VARCHAR(10) NOT NULL,
	PRIMARY KEY (`OrganizerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;
-- -----------------------------------------------------
-- Table `mydb`.`Tournament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tournament` (
	`TourID` INT NOT NULL,
	`TourName` VARCHAR(50) NOT NULL,
	`TourType` VARCHAR(25) NOT NULL,
	`TourContact1` VARCHAR(100) NOT NULL,
	`TourContact2` VARCHAR(45) NULL DEFAULT NULL,
	`TourRules` VARCHAR(999) NOT NULL,
	`TourDesc` VARCHAR(999) NOT NULL,
	`AddressID` INT NULL DEFAULT NULL,
	`OrganizerID` INT NOT NULL,
	`GameID` INT NOT NULL,
	PRIMARY KEY (`TourID`),
	INDEX `fk_Tournament_Game1_idx` (`GameID` ASC) VISIBLE,
	INDEX `fk_Tournament_Organizer1_idx` (`OrganizerID` ASC) VISIBLE,
	INDEX `fk_Tournament_Address1_idx` (`AddressID` ASC) VISIBLE,
	CONSTRAINT `fk_Tournament_Address1`
	FOREIGN KEY (`AddressID`)
	REFERENCES `mydb`.`Address` (`AddressID`),
	CONSTRAINT `fk_Tournament_Game1`
	FOREIGN KEY (`GameID`)
	REFERENCES `mydb`.`Game` (`GameID`),
	CONSTRAINT `fk_Tournament_Organizer1`
	FOREIGN KEY (`OrganizerID`)
	REFERENCES `mydb`.`Organizer` (`OrganizerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;
-- -----------------------------------------------------
-- Table `mydb`.`EnrollTeam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EnrollTeam` (
	`JoinedTeamID` INT NOT NULL,
	`TeamID` INT NOT NULL,
	`TourID` INT NOT NULL,
	`TourRanking` INT NULL,
	PRIMARY KEY (`JoinedTeamID`),
	INDEX `fk_EnrollTeam_Team1_idx` (`TeamID` ASC) VISIBLE,
	INDEX `fk_EnrollTeam_Tournament1_idx` (`TourID` ASC) VISIBLE,
	CONSTRAINT `fk_EnrollTeam_Team1`
	FOREIGN KEY (`TeamID`)
	REFERENCES `mydb`.`Team` (`TeamID`),
	CONSTRAINT `fk_EnrollTeam_Tournament1`
	FOREIGN KEY (`TourID`)
	REFERENCES `mydb`.`Tournament` (`TourID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;
-- -----------------------------------------------------
-- Table `mydb`.`MatchCompetition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MatchCompetition` (
	`MatchID` INT NOT NULL,
	`TourID` INT NOT NULL,
	`Schedule` DATETIME NOT NULL,
	`TeamID1` INT NOT NULL,
	`TeamID2` INT NOT NULL,
	`MatchDesc` VARCHAR(999) NULL DEFAULT NULL,
	PRIMARY KEY (`MatchID`),
	INDEX `fk_MatchCompetition_Tournament1_idx` (`TourID` ASC) VISIBLE,
	INDEX `fk_MatchCompetition_EnrollTeam1_idx` (`TeamID1` ASC) VISIBLE,
	INDEX `fk_MatchCompetition_EnrollTeam2_idx` (`TeamID2` ASC) VISIBLE,
	CONSTRAINT `fk_MatchCompetition_EnrollTeam1`
	FOREIGN KEY (`TeamID1`)
	REFERENCES `mydb`.`EnrollTeam` (`JoinedTeamID`),
	CONSTRAINT `fk_MatchCompetition_EnrollTeam2`
	FOREIGN KEY (`TeamID2`)
	REFERENCES `mydb`.`EnrollTeam` (`JoinedTeamID`),
	CONSTRAINT `fk_MatchCompetition_Tournament1`
	FOREIGN KEY (`TourID`)
	REFERENCES `mydb`.`Tournament` (`TourID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;
-- -----------------------------------------------------
-- Table `mydb`.`MatchHistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MatchHistory` (
	`MatchID` INT NOT NULL,
	`MatchScore` VARCHAR(200) NOT NULL,
	`WinnerTeamID` INT NOT NULL,
	INDEX `fk_MatchHistory_MatchCompetition1_idx` (`MatchID` ASC) VISIBLE,
	CONSTRAINT `fk_MatchHistory_MatchCompetition1`
	FOREIGN KEY (`MatchID`)
	REFERENCES `mydb`.`MatchCompetition` (`MatchID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;
-- -----------------------------------------------------
-- Table `mydb`.`Prize`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Prize` (
	`TourID` INT NOT NULL,
	`Ranking` INT NOT NULL,
	`Prize` INT NOT NULL,
	`PrizeDesc` VARCHAR(999) NOT NULL,
	INDEX `fk_prize_tournament1_idx` (`TourID` ASC) VISIBLE,
	CONSTRAINT `fk_prize_tournament1`
	FOREIGN KEY (`TourID`)
	REFERENCES `mydb`.`Tournament` (`TourID`)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;
-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
	`UserID` INT NOT NULL,
	`Firstname` VARCHAR(25) NOT NULL,
	`Lastname` VARCHAR(25) NOT NULL,
	`Telephone` VARCHAR(10) NULL DEFAULT NULL,
	PRIMARY KEY (`UserID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;
-- -----------------------------------------------------
-- Table `mydb`.`TeamMember`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TeamMember` (
	`UserID` INT NOT NULL,
	`TeamID` INT NOT NULL,
	`InGameName` VARCHAR(25) NOT NULL,
	`MemberPosition` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`TeamID`, `UserID`),
	INDEX `fk_TeamMember_Team1_idx` (`TeamID` ASC) VISIBLE,
	CONSTRAINT `fk_TeamMember_Team1`
	FOREIGN KEY (`TeamID`)
	REFERENCES `mydb`.`Team` (`TeamID`),
	CONSTRAINT `fk_TeamMember_User1`
	FOREIGN KEY (`UserID`)
	REFERENCES `mydb`.`User` (`UserID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;