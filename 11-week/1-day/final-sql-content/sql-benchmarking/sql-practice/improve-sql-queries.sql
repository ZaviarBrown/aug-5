.mode table

----------
-- Step 0 - Create a Query 
----------
-- Query: Select all cats that have a toy with an id of 5

-- -- ! Double Join
-- select cats.name
--   from cats
--        join cat_toys
--            on cats.id = cat_toys.cat_id
--        join toys
--            on cat_toys.toy_id = toys.id
--   where toys.id = 5;

-- -- * Single Join w/out ON
-- SELECT cats.name FROM cats
-- JOIN cat_toys
-- WHERE cats.id = cat_toys.cat_id
-- AND toy_id = 5;

-- -- * Single Join w/ ON
-- SELECT cats.name FROM cats
-- JOIN cat_toys ON cats.id = cat_toys.cat_id
-- WHERE cat_toys.toy_id = 5;

-- -- ? Sub query
-- SELECT name FROM cats
-- WHERE id IN (
--     SELECT cat_id FROM cat_toys
--     WHERE toy_id = 5
-- );




----------
-- Step 1 - Analyze the Query
----------
-- Query:

-- -- ! Double Join
-- EXPLAIN QUERY PLAN select cats.name
--   from cats
--        join cat_toys
--            on cats.id = cat_toys.cat_id
--        join toys
--            on cat_toys.toy_id = toys.id
--   where toys.id = 5;

-- -- * Single Join w/out ON
-- EXPLAIN QUERY PLAN SELECT cats.name FROM cats
-- JOIN cat_toys
-- WHERE cats.id = cat_toys.cat_id
-- AND toy_id = 5;

-- -- * Single Join w/ ON
-- EXPLAIN QUERY PLAN SELECT cats.name FROM cats
-- JOIN cat_toys ON cats.id = cat_toys.cat_id
-- WHERE cat_toys.toy_id = 5;

-- -- ? Sub query
-- EXPLAIN QUERY PLAN SELECT name FROM cats
-- WHERE id IN (
--     SELECT cat_id FROM cat_toys
--     WHERE toy_id = 5
-- );

-- Paste your results below (as a comment):

-- -- ! Double Join
-- QUERY PLAN
-- |--SEARCH toys USING INTEGER PRIMARY KEY (rowid=?)
-- |--SCAN cat_toys
-- `--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)

-- -- * Single Join w/out ON
-- QUERY PLAN
-- |--SCAN cat_toys
-- `--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)

-- -- * Single Join w/ ON
-- QUERY PLAN
-- |--SCAN cat_toys
-- `--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)

-- -- ? Sub query
-- QUERY PLAN
-- |--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)
-- `--LIST SUBQUERY 1
--    `--SCAN cat_toys


-- What do your results mean?

    -- Was this a SEARCH or SCAN?

        --! It was BOTH!!!

    -- What does that mean?

        --! We are optimized a bit, but we can optimize MORE!!!!


----------
-- Step 2 - Time the Query to get a baseline
----------
-- Query (to be used in the sqlite CLI):

.timer on

-- -- ! Double Join
-- select cats.name
--   from cats
--        join cat_toys
--            on cats.id = cat_toys.cat_id
--        join toys
--            on cat_toys.toy_id = toys.id
--   where toys.id = 5;

-- --! Run Time: real 0.004 user 0.001559 sys 0.000674
-- --? Run Time: real 0.001 user 0.001475 sys 0.000072

-- -- * Single Join w/out ON
-- SELECT cats.name FROM cats
-- JOIN cat_toys
-- WHERE cats.id = cat_toys.cat_id
-- AND toy_id = 5;

-- --! Run Time: real 0.002 user 0.001311 sys 0.000501
-- --? Run Time: real 0.000 user 0.000766 sys 0.000100

-- -- * Single Join w/ ON
-- SELECT cats.name FROM cats
-- JOIN cat_toys ON cats.id = cat_toys.cat_id
-- WHERE cat_toys.toy_id = 5;

-- --! Run Time: real 0.003 user 0.001307 sys 0.000437
-- --? Run Time: real 0.001 user 0.001291 sys 0.000188

-- -- ? Sub query
-- SELECT name FROM cats
-- WHERE id IN (
--     SELECT cat_id FROM cat_toys
--     WHERE toy_id = 5
-- );

-- --! Run Time: real 0.003 user 0.000854 sys 0.000412
-- --? Run Time: real 0.001 user 0.001269 sys 0.000117



----------
-- Step 3 - Add an index and analyze how the query is executing
----------

-- Create index:

-- CREATE INDEX idx_cat_toys_toy_id ON cat_toys(toy_id);

-- Analyze Query:
-- -- ! Double Join
-- EXPLAIN QUERY PLAN select cats.name
--   from cats
--        join cat_toys
--            on cats.id = cat_toys.cat_id
--        join toys
--            on cat_toys.toy_id = toys.id
--   where toys.id = 5;

-- --! Run Time: real 0.000 user 0.000146 sys 0.000104
-- --? Run Time: real 0.000 user 0.000071 sys 0.000101


-- -- * Single Join w/out ON
-- SELECT cats.name FROM cats
-- JOIN cat_toys
-- WHERE cats.id = cat_toys.cat_id
-- AND toy_id = 5;

-- --! Run Time: real 0.001 user 0.000082 sys 0.000239
-- --? Run Time: real 0.000 user 0.000086 sys 0.000057


-- -- * Single Join w/ ON
-- SELECT cats.name FROM cats
-- JOIN cat_toys ON cats.id = cat_toys.cat_id
-- WHERE cat_toys.toy_id = 5;

-- --! Run Time: real 0.002 user 0.000142 sys 0.000438
-- --? Run Time: real 0.000 user 0.000083 sys 0.000088


-- -- ? Sub query
-- SELECT name FROM cats
-- WHERE id IN (
--     SELECT cat_id FROM cat_toys
--     WHERE toy_id = 5
-- );

-- --! Run Time: real 0.002 user 0.000196 sys 0.000584
-- --? Run Time: real 0.000 user 0.000133 sys 0.000078



-- Analyze Results:

    -- Is the new index being applied in this query?

        --! Yes! And it's much faster


----------
-- Step 4 - Re-time the query using the new index
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here 

-- Paste your results below (as a comment):


-- Analyze Results:
    -- Are you still getting the correct query results?


    -- Did the execution time improve (decrease)?


    -- Do you see any other opportunities for making this query more efficient?


---------------------------------
-- Notes From Further Exploration
---------------------------------
