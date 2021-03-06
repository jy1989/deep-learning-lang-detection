CREATE TABLE dmFlash(
flashWidth decimal(10,2) NULL DEFAULT 0 ,
catFlash nvarchar(250) NULL DEFAULT NULL ,
datetimelastupdated datetime NOT NULL ,
flashURL nvarchar(250) NULL DEFAULT NULL ,
status nvarchar(250) NULL DEFAULT NULL ,
flashMovie nvarchar(250) NULL DEFAULT NULL ,
displayMethod nvarchar(250) NOT NULL DEFAULT 'displayPageStandard' ,
createdby nvarchar(250) NOT NULL DEFAULT '' ,
flashQuality nvarchar(250) NULL DEFAULT 'high' ,
flashLoop bit NOT NULL DEFAULT 0 ,
flashHeight decimal(10,2) NULL DEFAULT 0 ,
flashMenu bit NOT NULL DEFAULT 0 ,
bLibrary bit NULL DEFAULT 1 ,
ObjectID nvarchar(50) NOT NULL DEFAULT '' ,
ownedby nvarchar(250) NULL DEFAULT NULL ,
lastupdatedby nvarchar(250) NOT NULL DEFAULT '' ,
teaser ntext NULL ,
label nvarchar(250) NULL DEFAULT NULL ,
flashPlay bit NOT NULL DEFAULT 1 ,
flashAlign nvarchar(250) NULL DEFAULT 'center' ,
flashVersion nvarchar(250) NULL DEFAULT '8,0,0,0' ,
flashParams nvarchar(250) NULL DEFAULT NULL ,
datetimecreated datetime NOT NULL ,
lockedBy nvarchar(250) NULL DEFAULT NULL ,
flashBgcolor nvarchar(250) NULL DEFAULT '#FFFFFF' ,
locked bit NOT NULL DEFAULT 0 ,
metaKeywords nvarchar(250) NULL DEFAULT NULL ,
title nvarchar(250) NULL DEFAULT NULL 
);
