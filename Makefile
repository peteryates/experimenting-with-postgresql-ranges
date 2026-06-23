up:
	createdb experimenting_with_ranges
	psql experimenting_with_ranges < build.sql

down:
	dropdb experimenting_with_ranges

query:
	psql experimenting_with_ranges < query.sql

refresh: down up query
