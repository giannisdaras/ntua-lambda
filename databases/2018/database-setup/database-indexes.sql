use ntua_db;
create index reserves_date_index on reserves (start_date, finish_date);
create index rents_date_index on rents (start_date, finish_date);
create index works_history_date_index on works_history (start_date, finish_date);
create index booking_history_index on booking_history (start_date,finish_date,payment_method);