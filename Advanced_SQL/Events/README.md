# Events

## Explanation
- An **event** is a scheduled task in MySQL, similar to cron jobs.
- They are useful for automation, like deleting old data or archiving.

## Key Takeaways
- Events can run at fixed intervals or specific times.
- Require enabling the event scheduler: `SET GLOBAL event_scheduler = ON;`
- Ideal for cleanup, scheduling reports, or background tasks.
