-- Triggers: The manual way to maintain constraints

-- 1. Trigger allow for event-driven active databases

-- 1.1 Triggers are activated by database events
-- e.g. changes due to INSERT, UPDATE or DELETE

-- 1.2 Triggers can specify an optional condition under which they are executed.

-- 1.3 Triggers can perform an action that performs arbitrary operations on the database.

-- Triggers are typically very low-level and can be written in DBSMs-specific languages

-- Can be used to implement constraints, but are hard to decipher and debug

-- Trigger development is tricky: recursive triggers -> triggers can activate other triggers