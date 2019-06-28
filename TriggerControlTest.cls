@IsTest
private class TriggerControlTest {
    testMethod static void doTest() {
        Package2TriggerControl.disable();
        Package2TriggerControl.enable();
        Package2TriggerControl.isEnabled();
        
        Package2TriggerControl.CrossPackageEnableHook h = new Package2TriggerControl.CrossPackageEnableHook();
        TriggerDisablingClass.insertAccountIfTriggersActive_thenDisableTriggers();
    }
}