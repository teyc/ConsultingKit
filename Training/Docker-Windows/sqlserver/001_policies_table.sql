CREATE TABLE policies
(
    PolicyId INTEGER IDENTITY(1,1) NOT NULL PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Destinations NVARCHAR(100) NOT NULL,
    ClientReference NVARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);

GO

INSERT INTO policies (FullName, Destinations, ClientReference, StartDate, EndDate)
VALUES ('Joe Robinson', 'USA', 'WUJR00100381', '2019-11-28', '2020-01-14');

GO
