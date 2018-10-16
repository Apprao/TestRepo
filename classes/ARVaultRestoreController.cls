public with sharing class ARVaultRestoreController {

    @AuraEnabled
    public static List<Object> getCompletedBackups (String txARVault, String sfOrgID, String cfgIds) {
    	return ARVaultService.getCompletedBackups(txARVault, sfOrgID, cfgIds);
    }
    
    @AuraEnabled
    public static List<Object> getBackupsForDates (String backupObjects, String sFromDate, String sToDate) {
    	return ARVaultService.getBackupsForDates(backupObjects, sFromDate, sToDate);
    }
    
    @AuraEnabled
    public static List<Object> getRecordsFromBackup (String txARVault, Integer backupID, String objName) {         
    	return ARVaultService.getRecordsFromBackup(txARVault, backupID, objName);        
    }
    
    @AuraEnabled
    public static List<Object> getChangeViewRecords (String txARVault, Integer backupID, String objName, List<Object> recordColumns) {
    	return ARVaultService.getChangeViewRecords(txARVault, backupID, objName, recordColumns);
    }
    
    @AuraEnabled
    public static Map<String, Object> getBackupObject (String txARVault, Integer backupID)  {
    	return ARVaultService.getBackupObject(txARVault, backupID);
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
    public static List<Object> getListOfRestores (String txARVault, String sfOrgId) {
        return ARVaultService.getListOfRestores(txARVault,sfOrgId);
    }
    
    @AuraEnabled
    public static Map<String, Object> getRestoreObject (String txARVault, Integer restoreID) {
        return ARVaultService.getRestoreObject(txARVault, restoreID);
    }
    
    @AuraEnabled
    public static String startRestore (String idUser, String txARVault, Integer backupId, String srcSfOrgId, String destSfOrgId, 
                                       String metadataTypes, String metadata, String dataObjects, String data, String backupLabel, String cfgIds) 
    {
        return ARVaultService.startRestore(idUser, txARVault, backupId, srcSfOrgId, destSfOrgId, metadataTypes, metadata, dataObjects, data, backupLabel, cfgIds);
    }
    
     @AuraEnabled
    public static String startBackupRestore (String idUser, String txARVault, Integer backupId, String srcSfOrgId, String destSfOrgId, 
                                       String metadataTypes, String dataObjects, String backupLabel, String cfgIds) 
    {
        return ARVaultService.startBackupRestore(idUser, txARVault, backupId, srcSfOrgId, destSfOrgId, metadataTypes, dataObjects, backupLabel, cfgIds);
    }

    @AuraEnabled
    public static List<Object> getAllSforgCfgs(String txARVault, String sfOrgID) {
        return ARVaultService.getAllSforgCfgs(txARVault, sfOrgID);
    }

    
}