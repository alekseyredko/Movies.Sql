insert into Movie (	MovieName,
					Duration,
					Rate) 
values 
(
	'�����',
	'01:32',
	7.7
),
(
	'����� ����� 2',
	'1:37',
	7.2
),
(
	'���� ������������',
	'1:59',
	7.5
),
(
	'������������',
	'1:57',
	8.5
)

insert into Genre (GenreName) values
(
	'������'
),
(
	'�������'
),
(
	'�������'
),
(
	'��������'
),
(
	'�����'
),
(
	'�����'
)

insert into MovieGenres (MovieId, GenreId) values
(
	1,
	1
),
(
	1,
	2
),
(
	1,
	4
),
(
	2,
	2
),
(
	2,
	5
),
(
	2,
	6
),
(
	3,
	1
),
(
	3,
	2
),
(
	4,
	1
),
(
	4,
	3
),
(
	4,
	4
)

insert into Person (PersonName) values
(
	'��� �������'
),
(
	'������� ����������'
),
(
	'����� �������'
),
(
	'���� ���������'
),
(
	'����� �����'
),
(
	'���� ���������'
),
(
	'����� ��������'
),
(
	'������� �������'
),
(
	'���� ����������'
),
(
	'��� ����'
),
(
	'������ ���������'
),
(
	'����� ������'
),
(
	'����� �������'
)

insert into Actor (ActorId, Age) values
(
	1, 
	45
),
(
	2, 
	56
),
(
	3, 
	55
),
(
	5, 
	45
),
(
	6, 
	56
),
(
	7, 
	55
),
(
	8, 
	37
),
(
	9, 
	45
),
(
	11, 
	56
),
(
	12, 
	55
)

insert into ProducerMovies (ProducerId, MovieId) values
(
	4,
	1
),
(
	6,
	2
),
(
	10,
	3
),
(
	10,
	4
)

insert into MoviesActors (ActorId, MovieId) values
(
	1,
	1
), 
(
	2,
	1
),
(
	3,
	1
), 
(
	5,
	2
), 
(
	6,
	2
),
(
	7,
	2
), 
(
	8,
	3
), 
(
	9,
	3
),
(
	11,
	4
),
(
	12,
	4
)

insert into ProducerMovies (ProducerId, MovieId) values
(
	4,
	1
),
(
	6,
	2
),
(
	10,
	3
),
(
	10,
	4
)

insert into Reviewer (ReviewerId, PersonRate) 
values
(
	1,
	8
),
(
	5,
	6
),
(
	3,
	9
),
(
	9,
	4
)

insert into Review( RevievText, 
					Rate,
					MovieId,
					ReviewerId) 
values
(
	'����� ���������!',
	8,
	1,
	1
),
(
	'����� �� �������!',
	10,
	2,
	5
),
(
	'������� ��� ������ ����',
	10,
	3,
	9
),
(
	'������������� �����',
	10,
	3,
	3
)

insert into ReviewerWatchHistory (MovieId, ReviewerID)
values
(
	1,
	1
),
(
	2,
	5
),
(
	3,
	3
),
(
	3,
	9
)