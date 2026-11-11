🔑 What is a Transaction?
- A transaction is a sequence of one or more SQL operations (INSERT, UPDATE, DELETE) that are executed as a single unit of work.
- Either all operations succeed (COMMIT) or none of them take effect (ROLLBACK).
- This ensures data integrity — especially in banking, e‑commerce, or any critical system.

🔑 What is Rollback?
- ROLLBACK undoes all changes made in the current transaction if something goes wrong.
- It returns the database to the state before the transaction began.


-- -----------------------------------------------------------------------------------------

-- Start the transaction
BEGIN TRANSACTION;

-- Deduct 500 from Account A
UPDATE accounts
SET balance = balance - 500
WHERE account_id = 101;

-- Add 500 to Account B
UPDATE accounts
SET balance = balance + 500
WHERE account_id = 202;

-- Check if both updates succeeded
-- If yes, commit the changes
COMMIT;

-- If something fails (e.g., Account B doesn’t exist),
-- rollback will undo both updates
ROLLBACK;


-- ---------------------------------------------------------------------------------------

🔎 Explanation
- BEGIN TRANSACTION → starts the unit of work.
- Two updates happen: money deducted from Account A, added to Account B.
- If both succeed → COMMIT saves changes permanently.
- If any error occurs → ROLLBACK cancels everything, so Account A’s money isn’t lost.

✅ Real-Life Analogy
Think of it like sending a parcel with cash:
- You only want the money deducted from your wallet if the parcel is successfully delivered.
- If delivery fails, rollback ensures the money stays with you.
