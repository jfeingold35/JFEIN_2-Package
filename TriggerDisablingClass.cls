global class TriggerDisablingClass {
    global static void insertAccountIfTriggersActive_thenDisableTriggers() {
        if (Package2TriggerControl.isEnabled()) {
            Account[] accts = [SELECT Id FROM Account WHERE Name LIKE 'P2 Acc%'];
            Integer acctsExisting = accts != null && !accts.isEmpty() ? accts.size() : 0;
            
            insert new Account(Name='P2 Acc #' + (acctsExisting + 1));
            Package2TriggerControl.disable();
        }
    }
}