public with sharing class ARVaultBackupController {
    
    @AuraEnabled
    public static String startBackup (String idUser, String txARVault, String sfOrgID, String backupType, String metadataBackup, String dataBackup, String bkpLabel, String cfgId) {
    	return ARVaultService.startBackup(idUser, txARVault, sfOrgID, backupType, metadataBackup, dataBackup, bkpLabel, cfgId);
    }
    
    @AuraEnabled
    public static List<Object> getListOfBackups (String txARVault, String sfOrgID, String cfgIds) {
    	return ARVaultService.getListOfBackups(txARVault, sfOrgID, cfgIds);
    }
	
    @AuraEnabled
    public static Map<String, Object> getBackupObject (String txARVault, Integer backupID) {
    	return ARVaultService.getBackupObject(txARVault, backupID);
    }
    
    @AuraEnabled
    public static List<String> getBackupsLog (String txARVault, Integer backupID) {
    	return ARVaultService.getBackupsLog(txARVault, backupID);
    }
    
    @AuraEnabled
    public static String sendEmailNotification(String sfOrgId, String objects, String mMail, String subject){
        return ARVaultService.sendEmailNotification(sfOrgId, objects, mMail, subject);
    }
    
    @AuraEnabled 
    public static boolean isEmailAttachment(String sfOrgId, String objects, String subject){
        return ARVaultService.isEmailAttachment(sfOrgId, objects, subject);
    }

    @AuraEnabled
    public static List<Object> getAllSforgCfgs(String txARVault, String sfOrgID) {
    	return ARVaultService.getAllSforgCfgs(txARVault, sfOrgID);
    }
}