CREATE TABLE City ( 
	ID INTEGER NOT NULL ,
	Name varchar(30) NOT NULL,
	CountryID INTEGER NOT NULL,
	CONSTRAINT PK_City 
	PRIMARY KEY (ID)
)
;

CREATE TABLE Country ( 
	ID INTEGER NOT NULL ,
	Name varchar(30) NOT NULL,
	CONSTRAINT PK_Country 
	PRIMARY KEY (ID)
)
;

CREATE TABLE Existence ( 
	ID INTEGER NOT NULL,
	Data datetime NOT NULL CONSTRAINT DF_EXISTENCE_DATE DEFAULT (getdate()),
	Price INTEGER NOT NULL,
	Quantity INTEGER NOT NULL,
	ExpirationDate datetime NOT NULL,
	MedicineID INTEGER NOT NULL,
	PharmacyID INTEGER NOT NULL,
	CONSTRAINT PK_Existence 
	PRIMARY KEY (ID)
	
)
;

CREATE TABLE GroupOfMecdicine_Contraindications ( 
	ContraindicationsID INTEGER NOT NULL,
	GroupOfMedicineID INTEGER NOT NULL,
	CONSTRAINT RK_GroupOfMecdicine_Contraindications PRIMARY KEY ( ContraindicationsID ASC, GroupOfMedicineID ASC)

)
;

CREATE TABLE GroupOfMedicine ( 
	ID INTEGER NOT NULL,
	Name varchar(50) NOT NULL,
	CONSTRAINT PK_GroupOfMedicine 
	PRIMARY KEY (ID)
)
;

CREATE TABLE GroupOfMedicine_Indications ( 
	GroupOfMedicineID INTEGER NOT NULL,
	IndicationsID INTEGER NOT NULL,
	CONSTRAINT PR_GroupOfMedicine_Indications PRIMARY KEY ( GroupOfMedicineID ASC, IndicationsID ASC)
)
;

CREATE TABLE Indications ( 
	ID INTEGER NOT NULL,
	Name varchar(50) NOT NULL,
	CONSTRAINT PK_Indications 
	PRIMARY KEY (ID)
)
;

CREATE TABLE Manufacter ( 
	ID INTEGER NOT NULL,
	Name varchar(50) NOT NULL,
	CountryID INTEGER NOT NULL,
	CONSTRAINT PK_Manufacter 
	PRIMARY KEY (ID)
)
;

CREATE TABLE Medicine ( 
	ID INTEGER NOT NULL,
	Name varchar(30) NOT NULL,
	AmountInPackage INTEGER NOT NULL,
	Dosage varchar(50) NOT NULL,
	Description varchar(500) NOT NULL,
	ManufacterID INTEGER NOT NULL,
	ReleaseForm varchar(15) NOT NULL,
	GroupOfMedicineID INTEGER NOT NULL,
	CONSTRAINT PK_Medicine 
	PRIMARY KEY (ID)
)
;

CREATE TABLE Pharmacy ( 
	ID INTEGER NOT NULL,
	Name varchar(50) NOT NULL,
	Address varchar(50) NOT NULL,
	TelephoneNumber varchar(20) NOT NULL,
	CityID INTEGER NOT NULL,
	SpecializationID INTEGER NOT NULL,
	CONSTRAINT PK_Pharmacy 
	PRIMARY KEY (ID)
)
;

CREATE TABLE Specialization ( 
	ID INTEGER NOT NULL,
	Name varchar(30) NOT NULL,
	CONSTRAINT PK_Specialization 
	PRIMARY KEY (ID)
)
;


CREATE TABLE Ñontraindications ( 
	ID INTEGER NOT NULL,
	Name varchar(50) NOT NULL,
	CONSTRAINT PK_Ñontraindications 
	PRIMARY KEY (ID)
)
;

CREATE UNIQUE INDEX IX_Country ON Country	(Name); 
 
CREATE UNIQUE INDEX IX_Specialization ON Specialization (Name);


CREATE UNIQUE INDEX IX_GroupOfMedicine ON GroupOfMedicine (Name);



ALTER TABLE City ADD CONSTRAINT FK_City_Country 
	FOREIGN KEY (CountryID) REFERENCES Country (ID)
;

ALTER TABLE Existence ADD CONSTRAINT FK_Existence_Medicine 
	FOREIGN KEY (MedicineID) REFERENCES Medicine (ID)
;

ALTER TABLE Existence ADD CONSTRAINT FK_Existence_Pharmacy 
	FOREIGN KEY (PharmacyID) REFERENCES Pharmacy (ID)
;

ALTER TABLE GroupOfMecdicine_Contraindications ADD CONSTRAINT FK_GroupOfMecdicine_Contraindications_GroupOfMedicine 
	FOREIGN KEY (GroupOfMedicineID) REFERENCES GroupOfMedicine (ID)
;

ALTER TABLE GroupOfMecdicine_Contraindications ADD CONSTRAINT FK_Medicine_Contraindications_Ñontraindications 
	FOREIGN KEY (ContraindicationsID) REFERENCES Ñontraindications (ID)
;

ALTER TABLE GroupOfMedicine_Indications ADD CONSTRAINT FK_GroupOfMedicine_Indications_GroupOfMedicine 
	FOREIGN KEY (GroupOfMedicineID) REFERENCES GroupOfMedicine (ID)
;

ALTER TABLE GroupOfMedicine_Indications ADD CONSTRAINT FK_Medicine_Indications_Indications 
	FOREIGN KEY (IndicationsID) REFERENCES Indications (ID)
;

ALTER TABLE Manufacter ADD CONSTRAINT FK_Manufacter_Country 
	FOREIGN KEY (CountryID) REFERENCES Country (ID)
;

ALTER TABLE Medicine ADD CONSTRAINT FK_Medicine_GroupOfMedicine 
	FOREIGN KEY (GroupOfMedicineID) REFERENCES GroupOfMedicine (ID)
;

ALTER TABLE Medicine ADD CONSTRAINT FK_Medicine_Manufacter 
	FOREIGN KEY (ManufacterID) REFERENCES Manufacter (ID)
;

ALTER TABLE Pharmacy ADD CONSTRAINT FK_Pharmacy_City 
	FOREIGN KEY (CityID) REFERENCES City (ID)
;

ALTER TABLE Pharmacy ADD CONSTRAINT FK_Pharmacy_Specialization 
	FOREIGN KEY (SpecializationID) REFERENCES Specialization (ID)
;

ALTER TABLE Medicine ADD CONSTRAINT CK_Medicine_ReleaseForm CHECK (ReleaseForm IN 
('Tablets','Powder','Capsules','Dragees','Granules','Ointment','Cream','Paste','Gel','Solution',
'Tincture','Suspension','Emulsion','Drops','Syrup','Mixture','Spray can'));

ALTER TABLE Medicine ADD CONSTRAINT CK_Medicine_AmountInPackage CHECK (AmountInPackage >0);

ALTER TABLE Existence ADD CONSTRAINT CK_Existence_Quantity CHECK (Quantity >0);

ALTER TABLE Existence ADD CONSTRAINT CK_Existence_ExpirationDate CHECK ((YEAR(ExpirationDate) > YEAR(getdate())) OR (YEAR(ExpirationDate) = YEAR(getdate()) AND MONTH(ExpirationDate) >= MONTH(getdate()) AND DAY(ExpirationDate) > DAY(getdate()) ));



INSERT INTO Country (ID, Name) VALUES (1, 'Kazakhstan');
INSERT INTO Country (ID, Name) VALUES (2, 'Russia');
INSERT INTO Country (ID, Name) VALUES (3, 'Kyrgyzstan');
INSERT INTO Country (ID, Name) VALUES (4, 'Ukraine');
INSERT INTO Country (ID, Name) VALUES (5, 'Germany');
INSERT INTO Country (ID, Name) VALUES (6, 'France');
INSERT INTO Country (ID, Name) VALUES (7, 'Denmark');
INSERT INTO Country (ID, Name) VALUES (8, 'Hungary');
INSERT INTO Country (ID, Name) VALUES (9, 'Ireland');
INSERT INTO Country (ID, Name) VALUES (10, 'United States');
INSERT INTO Country (ID, Name) VALUES (11, 'Poland');
INSERT INTO Country (ID, Name) VALUES (12, 'India');
INSERT INTO Country (ID, Name) VALUES (13, 'China');
INSERT INTO Country (ID, Name) VALUES (14, 'Mongolian');
INSERT INTO Country (ID, Name) VALUES (15, 'Spain');
INSERT INTO Country (ID, Name) VALUES (16, 'Egypt');
INSERT INTO Country (ID, Name) VALUES (17, 'Finland');
INSERT INTO Country (ID, Name) VALUES (18, 'Canada');
INSERT INTO Country (ID, Name) VALUES (19, 'Italy');
INSERT INTO Country (ID, Name) VALUES (20, 'Belarus');

INSERT INTO Specialization (ID, Name) VALUES (1, 'Community pharmacy');
INSERT INTO Specialization (ID, Name) VALUES (2, 'Hospital pharmacy');
INSERT INTO Specialization (ID, Name) VALUES (3, 'Clinical pharmacy');
INSERT INTO Specialization (ID, Name) VALUES (4, 'Industrial pharmacy');
INSERT INTO Specialization (ID, Name) VALUES (5, 'Compounding pharmacy');
INSERT INTO Specialization (ID, Name) VALUES (6, 'Consulting pharmacy');
INSERT INTO Specialization (ID, Name) VALUES (7, 'Ambulatory care pharmacy');
INSERT INTO Specialization (ID, Name) VALUES (8, 'Regulatory pharmacy');
INSERT INTO Specialization (ID, Name) VALUES (9, 'Home care pharmacy');

INSERT INTO Ñontraindications (ID, Name) VALUES (1, 'Severe renal impairment');
INSERT INTO Ñontraindications (ID, Name) VALUES (2, 'Concomitant use with insulin');
INSERT INTO Ñontraindications (ID, Name) VALUES (3, 'Hypersensitivity');
INSERT INTO Ñontraindications (ID, Name) VALUES (4, 'Senile dementia');
INSERT INTO Ñontraindications (ID, Name) VALUES (5, 'Lactation');
INSERT INTO Ñontraindications (ID, Name) VALUES (6, 'Diseases of calcium metabolism;');
INSERT INTO Ñontraindications (ID, Name) VALUES (7, 'Stomach ulcer');
INSERT INTO Ñontraindications (ID, Name) VALUES (8, 'Ulcerative colitis');
INSERT INTO Ñontraindications (ID, Name) VALUES (9, 'Severe renal failure');
INSERT INTO Ñontraindications (ID, Name) VALUES (10, 'Bleeding');
INSERT INTO Ñontraindications (ID, Name) VALUES (11, 'Intestinal obstruction');
INSERT INTO Ñontraindications (ID, Name) VALUES (12, 'fructose intolerance');
INSERT INTO Ñontraindications (ID, Name) VALUES (13, 'severe hepatic or renal failure');
INSERT INTO Ñontraindications (ID, Name) VALUES (14, 'severe heart failure');
INSERT INTO Ñontraindications (ID, Name) VALUES (15, 'pregnancy');
INSERT INTO Ñontraindications (ID, Name) VALUES (16, 'stomach ulcer');


INSERT INTO Indications (ID, Name) VALUES (1, 'Diabetes');
INSERT INTO Indications (ID, Name) VALUES (2, 'Arterial hypertension');
INSERT INTO Indications (ID, Name) VALUES (3, 'Bronchitis');
INSERT INTO Indications (ID, Name) VALUES (4, 'Tracheitis');
INSERT INTO Indications (ID, Name) VALUES (5, 'Schizophrenia');
INSERT INTO Indications (ID, Name) VALUES (6, 'Psoriasis vulgar');
INSERT INTO Indications (ID, Name) VALUES (7, 'Bacterial vaginosis.');
INSERT INTO Indications (ID, Name) VALUES (8, 'Rheumatoid arthritis');
INSERT INTO Indications (ID, Name) VALUES (9, 'Deforming osteoarthrosis');
INSERT INTO Indications (ID, Name) VALUES (10, 'Pain in the spine');
INSERT INTO Indications (ID, Name) VALUES (11, 'Established magnesium deficiency');
INSERT INTO Indications (ID, Name) VALUES (12, 'Colds');
INSERT INTO Indications (ID, Name) VALUES (13, 'Angina');
INSERT INTO Indications (ID, Name) VALUES (14, 'Flu');
INSERT INTO Indications (ID, Name) VALUES (15, 'Purulent wounds');
INSERT INTO Indications (ID, Name) VALUES (16, 'Conjunctivitis');
INSERT INTO Indications (ID, Name) VALUES (17, 'Stomatitis');
INSERT INTO Indications (ID, Name) VALUES (18, 'Pressure sores');
INSERT INTO Indications (ID, Name) VALUES (19, 'Chronic respiratory diseases');
INSERT INTO Indications (ID, Name) VALUES (20, 'acute and chronic diarrhea');
INSERT INTO Indications (ID, Name) VALUES (21, 'smooth muscle spasms');
INSERT INTO Indications (ID, Name) VALUES (22, 'stomach ulcer');
INSERT INTO Indications (ID, Name) VALUES (23, 'Contraception');



INSERT INTO GroupOfMedicine (ID, Name) VALUES (1, 'Hypoglycemic agent');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (2, 'Expectorant Mucolytic');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (3, 'Antipsychotic');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (4, 'Psoriasis remedy');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (5, 'Lincosamides');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (6, 'NSAIDs');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (7, 'Magnesium drug');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (8, 'Antibacterial agents');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (9, 'Vegetotropic drugs');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (10, 'Narcotic drugs');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (11, 'Antipsychotics');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (12, 'Nootropics');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (13, 'Adsorbents');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (14, 'Antispasmodic');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (15, 'Stomach Jelly Reducing Agent');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (16, 'Mucolytic agent');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (17, 'Gestagen');
INSERT INTO GroupOfMedicine (ID, Name) VALUES (18, 'Stimulant');

INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (1,1);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (2,1);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (3,2);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (3,6);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (3,8);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (3,5);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (4,3);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (5,3);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (6,4);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (7,6);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (8,6);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (9,7);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (10,8);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (10,16);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (11,13);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (12,13);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (13,17);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (13,14);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (14,14);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (15,15);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (15,16);
INSERT INTO GroupOfMecdicine_Contraindications (ContraindicationsID, GroupOfMedicineID) VALUES (16,16);


INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (1,1);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (1,2);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (2,3);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (2,4);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (3,5);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (4,6);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (5,7);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (6,8);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (6,9);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (6,10);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (7,11);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (6,12);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (6,13);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (6,14);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (8,15);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (8,16);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (8,17);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (8,18);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (2,19);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (13,20);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (14,21);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (15,22);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (17,23);
INSERT INTO GroupOfMedicine_Indications (GroupOfMedicineID, IndicationsID) VALUES (16,19);



INSERT INTO City (ID, Name, CountryID) VALUES (1, 'Astana', 1);
INSERT INTO City (ID, Name, CountryID) VALUES (2, 'Almaty', 1);
INSERT INTO City (ID, Name, CountryID) VALUES (3, 'Semey', 1);
INSERT INTO City (ID, Name, CountryID) VALUES (4, 'Karaganda', 1);
INSERT INTO City (ID, Name, CountryID) VALUES (5, 'Moscow', 2);
INSERT INTO City (ID, Name, CountryID) VALUES (6, 'Novosibirsk', 2);
INSERT INTO City (ID, Name, CountryID) VALUES (7, 'Bishkek', 3);
INSERT INTO City (ID, Name, CountryID) VALUES (8, 'Kiev', 4);
INSERT INTO City (ID, Name, CountryID) VALUES (9, 'Berlin', 5);
INSERT INTO City (ID, Name, CountryID) VALUES (10, 'Paris', 6);
INSERT INTO City (ID, Name, CountryID) VALUES (11, 'Copenhagen', 7);
INSERT INTO City (ID, Name, CountryID) VALUES (12, 'Budapest', 8);
INSERT INTO City (ID, Name, CountryID) VALUES (13, 'Dublin', 9);
INSERT INTO City (ID, Name, CountryID) VALUES (14, 'Washington', 10);
INSERT INTO City (ID, Name, CountryID) VALUES (15, 'Warsaw', 11);
INSERT INTO City (ID, Name, CountryID) VALUES (16, 'New Delhi', 12);
INSERT INTO City (ID, Name, CountryID) VALUES (17, 'Ulan Bator', 13);
INSERT INTO City (ID, Name, CountryID) VALUES (18, 'Madrid', 14);
INSERT INTO City (ID, Name, CountryID) VALUES (19, 'Helsinki', 15);
INSERT INTO City (ID, Name, CountryID) VALUES (20, 'Cairo', 16);

INSERT INTO Pharmacy (ID, Name, Address, TelephoneNumber, CityID, SpecializationID) VALUES (1, 'Biosfera', 'Zheltoksan St 144', '87272611387', 2, 1);
INSERT INTO Pharmacy (ID, Name, Address, TelephoneNumber, CityID, SpecializationID) VALUES (2, 'Europharma', 'Abay ave 60', '87273122220', 2, 4);
INSERT INTO Pharmacy (ID, Name, Address, TelephoneNumber, CityID, SpecializationID) VALUES (3, 'Sotsialnaya Sadykhan', 'Auezova St 3', '87272775331', 2, 2);
INSERT INTO Pharmacy (ID, Name, Address, TelephoneNumber, CityID, SpecializationID) VALUES (4, 'Dobraya-Apteka', 'Zharokov St 286', '87273931191', 2, 1);
INSERT INTO Pharmacy (ID, Name, Address, TelephoneNumber, CityID, SpecializationID) VALUES (5, 'Gippokrat', 'Sauran St 9', '87172500999', 1, 1);
INSERT INTO Pharmacy (ID, Name, Address, TelephoneNumber, CityID, SpecializationID) VALUES (6, 'Maksima Farm', 'Respublika Ave 7', '87172322640', 1, 3);
INSERT INTO Pharmacy (ID, Name, Address, TelephoneNumber, CityID, SpecializationID) VALUES (7, 'Apteka 99', 'Amangeldi Imanov St 20', '87172274699', 1, 1);
INSERT INTO Pharmacy (ID, Name, Address, TelephoneNumber, CityID, SpecializationID) VALUES (8, 'Tsvetnaya', 'Tauelsizdil Ave 34', '87172527337', 1, 2);
INSERT INTO Pharmacy (ID, Name, Address, TelephoneNumber, CityID, SpecializationID) VALUES (9, 'Apteka Alfamed', 'Uranzaeva St 58', '87475319967', 3, 1);
INSERT INTO Pharmacy (ID, Name, Address, TelephoneNumber, CityID, SpecializationID) VALUES (10, 'Alyans Farm', 'Naimanbaev St', '87222563278', 3, 1);


INSERT INTO Manufacter (ID, Name, CountryID) VALUES (1, 'Novo Nordisk', 7);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (2, 'Pharmaceutical Plant EGIS', 8);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (3, 'Gideon Richter-RUS', 2);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (4, 'LEO Lababoratory Limited', 9);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (5, 'Pharmacy and Upjon Campani', 10);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (6, 'KRKA-RUS', 2);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (7, 'Cooperation Pharmaceutical Frances', 6);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (8, 'MEDANA FARMA', 11);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (9, 'Anzhero-Sudzhensk Chemical', 2);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (10, 'Merkle GmbH', 5);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (11, 'Bofur Ipsen Industry', 6);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (12, 'Quinoin Plant', 8);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (13, 'Dr. Reddys Laboratories Ltd.', 12);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (14, 'Hermes Pharma', 2);
INSERT INTO Manufacter (ID, Name, CountryID) VALUES (15, 'Gideon Richter', 17);

INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (1 ,'Saxenda' ,5 , '0.6 mg/day' ,'Transparent, colorless or almost colorless solution' ,1 ,'Solution',1);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (2 ,'Ambrosan' ,10 , '30 mg (1 tablet) 2-3 times a day' ,'Oval, waxy, white.' ,2 ,'Tablets',2);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (3 ,'Amdoal' ,10 , '10-15 mg 1 time per day' ,'White or almost white tablets, round, biconvex, engraved on one side' ,3 ,'Tablets',3);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (4 ,'Dayvonex' ,15 , '19 ml 2 times a day' ,'Translucent ointment from white to white with a yellowish tint.' ,4 ,'Ointment',4);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (5 ,'Dalacin' ,20 , '1 full applicator per day' ,'White cream' ,5 ,'Cream',5);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (6 ,'Ibuprofen' ,100 , '0.8 g 3 times a day' ,'In dark glass jars' ,6 ,'Tablets',6);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (7 ,'Magne B6' ,1 , '3-4 amp. / Day' ,'Transparent brown liquid with a caramel smell.' ,7 ,'Solution',7);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (8 ,'Ibufen' ,1 , '5-10 mg / kg of body weight 3-4 times a day' ,'Suspension of orange color with an orange smell and sweet taste, with a tangible burning taste. There may be separation into a liquid layer and a precipitate, which, after mixing, form a homogeneous suspension.' ,8 ,'Suspension',6);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (9 ,'Furatsilin' ,10 , '0.1 g per day' ,'Yellow or greenish-yellow tablets with uneven surface color.' ,9 ,'Tablets',8);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (10 ,'Ambrobene' ,12 , '10 ml 3 times a day' ,'Clear, colorless to slightly yellow solution with a raspberry smell.' ,10 ,'Syrup',2);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (11 ,'Smecta' ,12 , '6 sachets / day' ,'grayish-white to light grayish-yellow in color, with a slight nonspecific to weak vanilla odor.' ,11 ,'Powder',13);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (12 ,'No-Spa' ,15 , '1-2 tab. at one time 2-3 times a day' ,'Round, biconvex, yellow with a greenish or orangeish tint, engraved with spa on one side.' ,12 ,'Tablets',14);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (13 ,'Razo' ,5 , '10 mg (1 tablet) 1 time per day' ,'rounded, biconvex, covered with a pink to brownish-pink sheath with black marking “RB10” on one side.' ,13 ,'Tablets',15);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (14 ,'ACC' ,2 , '0.1 g per day' ,'round flat cylindrical white, with the smell of blackberries. May have a slight sulfuric odor.' ,14 ,'Tablets',16);
INSERT INTO Medicine (ID, Name, AmountInPackage, Dosage, Description, ManufacterID, ReleaseForm, GroupOfMedicineID) VALUES (15 ,'Lactinette' ,12 , '1 tab. in a day' ,'round, biconvex, covered with a film membrane of white or almost white color, with the marking "D" on one side and "75" on the other.' ,15 ,'Tablets',17);

INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (1,convert(datetime,'2019-10-11',102), 2000, 30,convert(datetime,'2022-05-05',102) , 1, 1);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (2,convert(datetime,'2019-10-15',102), 200, 10,convert(datetime,'2023-10-10',102) , 1, 5);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (3,convert(datetime,'2019-11-11',102), 1300, 20, convert(datetime,'2023-05-15',102), 2, 3);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (4,convert(datetime,'2019-11-12',102), 550, 50, convert(datetime,'2030-06-05',102), 3, 3);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (5,convert(datetime,'2019-10-19',102), 1100, 33,convert(datetime,'2025-07-03',102) , 4, 1);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (6,convert(datetime,'2019-09-11',102), 2200, 11,convert(datetime,'2025-08-02',102) , 5, 3);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (7,convert(datetime,'2019-09-12',102), 5000, 40,convert(datetime,'2022-09-01',102) , 5, 4);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (8,convert(datetime,'2019-10-13',102), 800, 30, convert(datetime,'2022-10-06',102), 6, 6);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (9,convert(datetime,'2019-11-12',102), 300, 30,convert(datetime,'2022-04-11',102) , 7, 1);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (10,convert(datetime,'2019-11-11',102), 1001, 10,convert(datetime,'2022-11-08',102), 7, 2);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (11,convert(datetime,'2019-10-25',102), 2200, 25, convert(datetime,'2021-06-15',102), 7, 3);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (12,convert(datetime,'2019-09-22',102), 1020, 40, convert(datetime,'2022-02-25',102), 10, 2);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (13,convert(datetime,'2019-08-11',102), 1050, 15, convert(datetime,'2022-01-12',102), 11, 10);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (14,convert(datetime,'2019-10-01',102), 1200, 20,convert(datetime,'2022-06-22',102) , 12, 9);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (15,convert(datetime,'2019-02-22',102), 1400, 33,convert(datetime,'2024-07-11',102) , 13, 5);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (16,convert(datetime,'2019-11-11',102), 1000, 20,convert(datetime,'2025-09-24',102), 8, 8);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (17,convert(datetime,'2019-08-11',102), 3000, 20,convert(datetime,'2022-05-20',102) , 9, 9);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (18,convert(datetime,'2019-10-11',102), 4000, 10,convert(datetime,'2022-04-17',102), 10, 9);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (19,convert(datetime,'2019-01-28',102), 900, 20, convert(datetime,'2022-03-19',102), 15, 1);
INSERT INTO Existence (ID, Data, Price, Quantity, ExpirationDate, MedicineID, PharmacyID) VALUES (20,convert(datetime,'2019-10-25',102), 1000, 5, convert(datetime,'2022-05-22',102), 4, 7);
