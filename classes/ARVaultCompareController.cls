public with sharing class ARVaultCompareController {
    
    @AuraEnabled
    public static List<Object> getListOfCompareBackups (String txARVault, String sfOrgID, String cfgIds) {        
        return ARVaultService.getListOfCompareBackups(txARVault, sfOrgID, cfgIds);        
    }
    
    @AuraEnabled
    public static List<Object> getCompareBackups(String txARVault, Integer fbackupID, Integer sbackupID){
        return ARVaultService.getMultipleBackupObjects(txARVault, fbackupID, sbackupID);
    }
    
    @AuraEnabled
    public static List<Object> getCompareChangeView (String snapshotRec1, String snapshotRec2, String objName, List<Object> recordColumns) {
    	return ARVaultService.getCompareChangeView(snapshotRec1, snapshotRec2, objName, recordColumns);
    }    
    
    @AuraEnabled
    public static List<Object> getRecordsForCompare (String txARVault, Integer fbackupID, Integer sbackupID, String objName) {
    	return ARVaultService.getRecordsForCompare(txARVault, fbackupID, sbackupID, objName);
    }   
    
    @AuraEnabled
    public static List<Object> fetchTypeMembers(String metadata1, String metadata2, String typeName){        
        return ARVaultService.loadTypeMembers(metadata1, metadata2, typeName);
    } 
    
    @AuraEnabled
    public static List<Object> getCompareMembers(String txARVault, Integer fbackupID,Integer sbackupID, String memType, String memName){        
        return ARVaultService.getCompareMembers(txARVault, fbackupID, sbackupID, memType, memName);
    } 
    
    @AuraEnabled
    public static List<Object> getAllSforgCfgs(String txARVault, String sfOrgID) {
        return ARVaultService.getAllSforgCfgs(txARVault, sfOrgID);
    }
}