trigger AccountAsyncTrigger on AccountChangeEvent (after insert) {
	System.debug('Inside AccountAsyncTrigger');
    for (AccountChangeEvent cdc : Trigger.new) {
        System.debug('cdc.ChangeEventHeader.getChangeType() = ' + cdc.ChangeEventHeader.getChangeType());
        System.debug('cdc.ChangeEventHeader.getChangedFields() = ' + cdc.ChangeEventHeader.getChangedFields());
        System.debug(JSON.serializePretty(cdc));
	}               
}