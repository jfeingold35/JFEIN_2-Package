global class Package2TriggerControl {
	private static final Package2TriggerControl INSTANCE = new Package2TriggerControl();
    
    global static Package2TriggerControl getInstance() {
        return INSTANCE;
    }
    
    private Boolean disabled = false;
    
    global static void disable() {
        String hook = 'JOSH1.Package1TriggerControl.CrossPackageDisableHook';
        if (Type.forName(hook) != null) {
            Type.forName(hook).newInstance();
        }
        getInstance().disabled = true;
    }
    
    global static void enable() {
        String hook = 'JOSH1.Package1TriggerControl.CrossPackageEnableHook';
        if (Type.forName(hook) != null) {
            Type.forName(hook).newInstance();
        }
        getInstance().disabled = false;
    }
    
    global static Boolean isEnabled() {
        return !getInstance().disabled;
    }
    
    global class CrossPackageEnableHook {
        public CrossPackageEnableHook() {
            INSTANCE.disabled = false;
        }
    }
    
    global class CrossPackageDisableHook {
        public CrossPackageDisableHook() {
            INSTANCE.disabled = true;
        }
    }
}