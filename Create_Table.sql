/* DỰ ÁN DATA WAREHOUSE: MOVIES 
Mô tả: Khởi tạo cấu trúc Snowflake Schema
*/

--CREATE DATABASE Movies_DWH;
USE Movies_DWH;
GO


--Nhóm 1: Tạo bảng DIMENSION
CREATE TABLE Dim_Date (
	Date_key INT PRIMARY KEY
	, Full_date DATE
	, Day INT
	, Month INT
	, Quarter INT
	, Year INT
);
GO

CREATE TABLE Dim_Country (
	Country_key INT PRIMARY KEY IDENTITY (1,1)
	, Country_id INT
	, Country_name VARCHAR(255) NOT NULL
);
GO

CREATE TABLE Dim_Language (
	Language_key INT PRIMARY KEY IDENTITY (1,1)
	, Language_id INT
	, Language_name VARCHAR(255) 
);
GO

CREATE TABLE Dim_Company (
	Company_id INT PRIMARY KEY IDENTITY(1,1)
	, Company_name VARCHAR(255)
);

CREATE TABLE Dim_Department (
	Department_id INT PRIMARY KEY IDENTITY(1,1)
	, Department_name VARCHAR(255)
);
GO

CREATE TABLE Dim_Genre (
	Genre_id INT PRIMARY KEY IDENTITY (1,1)
	, Genre_name VARCHAR(255)
);
GO

CREATE TABLE Dim_Person (
	Person_id INT PRIMARY KEY IDENTITY(1,1)
	, Person_name NVARCHAR(255)
);
GO

CREATE TABLE Dim_Keyword (
	Keyword_id INT PRIMARY KEY IDENTITY(1,1)
	, Keyword_name NVARCHAR(255)
);
GO

--Nhóm 2: Tạo bảng Fact_movie
CREATE TABLE Fact_movie (
    movie_id INT PRIMARY KEY  
    , release_date INT             
    , language_key INT          
    , Country_key INT             
    , Company_id INT               
    , budget BIGINT                 
    , revenue BIGINT
    , runtime INT
    , popularity FLOAT
    , vote_average FLOAT
    , vote_count INT
    , tagline NVARCHAR(MAX)       
    
    -- Thiết lập các ràng buộc khóa ngoại (Foreign Keys)
    CONSTRAINT FK_Fact_Date FOREIGN KEY (release_date) REFERENCES Dim_date(Date_Key)
    , CONSTRAINT FK_Fact_Country FOREIGN KEY (Country_key) REFERENCES Dim_Country(Country_key)
	, CONSTRAINT FK_Fact_Language FOREIGN KEY (language_key) REFERENCES Dim_Language(Language_key)
	, CONSTRAINT FK_Fact_Company FOREIGN KEY (Company_id) REFERENCES Dim_Company(Company_id)
);
GO

--Nhóm 3: Tạo bảng Bridge
CREATE TABLE Bridge_movie_genre (
	movie_id INT
	, genre_id INT
	
	-- Tạo khóa chính cho bảng
	CONSTRAINT PK_Brigde_Genre PRIMARY KEY (movie_id, genre_id)

	--Tạo liên kết khóa ngoại
	, CONSTRAINT FK_Genre_Movie FOREIGN KEY (movie_id) REFERENCES Fact_movie(movie_id)
	, CONSTRAINT FK_Genre_Dim FOREIGN KEY (genre_id) REFERENCES Dim_Genre(genre_id)
);
GO

CREATE TABLE Bridge_movie_cast (
	movie_id INT
	, person_id INT
	, character_name NVARCHAR(255) NOT NULL
	, cast_order INT

	CONSTRAINT PK_Bridge_Cast PRIMARY KEY (movie_id, person_id, character_name)

	, CONSTRAINT FK_Cast_Movie FOREIGN KEY (movie_id) REFERENCES Fact_movie(movie_id)
	, CONSTRAINT FK_Cast_Person FOREIGN KEY (person_id) REFERENCES Dim_Person(person_id)
);
GO

CREATE TABLE Bridge_movie_keyword (
	movie_id INT
	, keyword_id INT
	
	CONSTRAINT PK_Bridge_keyword PRIMARY KEY (movie_id, keyword_id)

	, CONSTRAINT FK_Keyword_movie FOREIGN KEY (movie_id) REFERENCES Fact_movie(movie_id)
	, CONSTRAINT FK_Keyword_Dim FOREIGN KEY (keyword_id) REFERENCES Dim_Keyword(keyword_id)
)
GO

CREATE TABLE Bridge_movie_crew (
	movie_id INT
	, person_id INT
	, department_id INT
	, job VARCHAR(255)

	CONSTRAINT PK_Bridge_crew PRIMARY KEY (movie_id, department_id, person_id, job)

	, CONSTRAINT FK_Crew_movie FOREIGN KEY (movie_id) REFERENCES Fact_movie(movie_id)
	, CONSTRAINT FK_Crew_Department FOREIGN KEY (department_id) REFERENCES Dim_Department(department_id)
)
GO