create table teachers (
  id integer primary key,
  name text
);

create table training_periods (
  id serial primary key,
  teacher_id integer references teachers(id),
  started_on date not null,
  finished_on date null,
  range daterange generated always as (daterange(started_on, finished_on, '[]'::text)) stored
);

create table holidays (
  id serial primary key,
  teacher_id integer references teachers(id),
  started_on date not null,
  finished_on date null,
  range daterange generated always as (daterange(started_on, finished_on, '[]'::text)) stored
);

insert into teachers(id, name) values (1, 'John'), (2, 'Rita'), (3, 'Sue'), (4, 'Bobby');

insert into training_periods(teacher_id, started_on, finished_on)
values
  (1, '2024-01-01', '2024-12-12'),
  (1, '2025-01-01', '2025-04-03'),
  (2, '2024-01-01', '2024-12-12'),
  (3, '2024-01-01', '2024-12-12'),
  (4, '2025-03-06', '2025-05-09'),
  (4, '2025-05-15', '2025-08-20');

insert into holidays(teacher_id, started_on, finished_on)
values
  (1, '2024-07-01', '2024-07-20'),
  (2, '2024-08-30', '2024-09-12'),
  (3, '2023-12-15', '2024-01-20'),
  (4, '2025-05-05', '2025-08-30');
