create table stock_prices_daily (
	trade_date datetime,
	symbol varchar(10),
	opens float,
	high float,
	closes float,
	volume bigint,
	close_change float,
	close_pct_change float
);