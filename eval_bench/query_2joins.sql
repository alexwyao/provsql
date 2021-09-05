-- Q2
SET search_path TO public, provsql;

-- Q4
SELECT add_provenance('clients');

SELECT create_provenance_mapping('clients_mapping','clients','present');

CREATE TABLE clients_left AS
SELECT * from clients WHERE gnum = 0;
CREATE TABLE clients_right AS 
SELECT * from clients WHERE gnum = 1;
CREATE TABLE clients_mid AS
SELECT * from clients WHERE gnum = 2;

--CREATE TABLE joined AS
--	SELECT DISTINCT p1.sales FROM clients p1 JOIN clients p2 ON p1.region_id = p2.region_id WHERE p1.id < p2.id;

	--SELECT * FROM filtered;
--SELECT *,formula(provenance(),'clients_mapping') FROM joined;

CREATE TABLE joined AS
SELECT DISTINCT p1.zipf FROM clients_left p1 JOIN clients_right p2 ON p1.zipf = p2.zipf JOIN clients_mid p3 ON p2.zipf = p3.zipf;
-- Q11
\timing
SELECT *,counting(provenance(),'clients_mapping')
		FROM joined;
