trigger AccountTrigger on Account (After insert)
{
	if(Trigger.isAfter && Trigger.isInsert)
    {
        AccountShareHandler.AccountShareObject(Trigger.New);
    }
}