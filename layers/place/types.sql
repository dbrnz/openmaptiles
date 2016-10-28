DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'place_subclass') THEN
		CREATE TYPE place_subclass AS ENUM ('city', 'town', 'village', 'hamlet', 'suburb', 'neighbourhood', 'isolated_dwelling');
    END IF;
END
$$;

ALTER TABLE osm_place_point ALTER COLUMN place TYPE place_subclass USING place::place_subclass;
