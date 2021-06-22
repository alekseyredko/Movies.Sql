create table Person(
	PersonId int Primary key identity,
	Occupation varchar(255) not null
)

create table Genre(
	GenreId int Primary key identity,
	GenreName varchar(255) not null,
)

create table Movie (
	MovieId int Primary key identity,
	MovieName varchar(255) not null,
	Duration Time not null,
	Rate float
)

create table Actor(
	ActorId int Primary key foreign key references Person(PersonId),
	Age int check (Age >= 0 and Age <= 200)
)

create table Producer(
	ProducerId int Primary key foreign key references Person(PersonId),
	MovieId int foreign key references Movie(MovieId)
)

create table Reviewer(
	ReviewerId int Primary key foreign key references Person(PersonId),
	PersonRate float check (PersonRate >= 1 and PersonRate <= 5)
)

create table Review(
	ReviewId int Primary key identity,
	RevievText varchar(1024) not null,
	Rate float default 5 check (Rate >=1 and Rate <=10),
	MovieId int foreign key references Movie(MovieId) not null,
	ReviewerID int foreign key references Reviewer(ReviewerId) not null
)


create table MovieGenres(
	GenreId int foreign key references Genre(GenreId),
	MovieId int foreign key references Movie(MovieId),
)

create table MoviesActors(
	ActorId int foreign key references Actor(ActorId),
	MovieId int foreign key references Movie(MovieId),
)

create table ReviewerWatchHistory(
	MovieId int foreign key references Movie(MovieId),
	ReviewerID int foreign key references Reviewer(ReviewerId) not null
)
