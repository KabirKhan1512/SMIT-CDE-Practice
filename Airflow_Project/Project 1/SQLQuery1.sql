create database airflowProject

use airflowProject


create table stock_prices (
		trade_date DATETIME,
        close_price FLOAT,
        high_price FLOAT,
        low_price FLOAT,
        open_price FLOAT,
        volume BIGINT,
        symbol VARCHAR(10),
        close_change FLOAT,
        close_pct_change FLOAT
);

