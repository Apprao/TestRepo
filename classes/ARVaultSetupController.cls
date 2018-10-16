public with sharing class ARVaultSetupController {
            
    @AuraEnabled
    public static Map<String, Object>  getOrgBackupConfig(String txARVault, String sfOrgId, String cfgId){        
        return  ARVaultService.getOrgBackupConfig(txARVault, sfOrgId, cfgId);
    }
    
    @AuraEnabled
    public static List<Object> getOrgsList(String idUser, String txARVault){
    	return ARVaultService.getOrgsList(idUser, txARVault);
    }

    @AuraEnabled
    public static Map<String, Object> getOrgsDetails(String txARVault, String sfOrgId){    	
        return ARVaultService.getOrgsDetails(txARVault, sfOrgId);
    }
    
    @AuraEnabled
    public static Map<String, Object> basicAuthCallout(String idUser, String txARVault, String orgName, String userName, String pwd, String sfSecToken, 
                                          String sfAuthType, String refreshToken, String instanceURL)
    {
        return ARVaultService.basicAuthCallout(idUser, txARVault, orgName, userName, pwd, sfSecToken, sfAuthType, 
                                               refreshToken, instanceURL);
    }
    
    @AuraEnabled
    public static String saveBackupConfig(String idUser, String txARVault, String idSforg, String flScdFrq, String dtScd, String tmScd, String dayScd, String objCriteria, 
                                          String metadataTypes, String isFullDataBackup, String isFullMetaDataBackup, String cfgId){                                              
		return ARVaultService.saveBackupConfig(idUser, txARVault, idSforg, flScdFrq, dtScd, tmScd, dayScd, objCriteria, metadataTypes, isFullDataBackup, isFullMetaDataBackup, cfgId);
    }
    
    @AuraEnabled
    public static String testSfConnection(String txARVault, String sfOrgID){
        return ARVaultService.testSfConnection(txARVault, sfOrgID);
    }
    
    @AuraEnabled
    public static Map<String, Object> updateSfOrg(String idUser, String txARVault, String idSforg, String nmLable, String sfNmUser, String sfTxPwd, 
                                     String sfSecToken, String accessToken, String sfAuthType, String instanceURL)
    {
    	return ARVaultService.updateSfOrg(idUser, txARVault, idSforg, nmLable, sfNmUser, sfTxPwd, sfSecToken, 
                                          accessToken, sfAuthType, instanceURL);
    }
    
    @AuraEnabled
    public static String testNewSfConnection(String txARVault, String userName, String password, String secToken, String authType, String instanceURL){
    	return ARVaultService.testNewSfConnection(txARVault, userName, password, secToken, authType, instanceURL);
    }
    
    @AuraEnabled
    public static Map<String, Object> getOAuthOrg(String idUser, String txARVault, String orgTitle, String userName){         
    	return ARVaultService.fetchOAuthOrg(idUser, txARVault, orgTitle, userName);
    }

    @AuraEnabled
    public static List<Object> getMetadataTypes(String txARVault, String sfOrgId, String metadata){ 
    	return ARVaultService.getMetadataTypes(txARVault, sfOrgId, metadata);
    }
    
    @AuraEnabled
    public static List<Object> getSfObjects(String txARVault, String sfOrgID){
    	return ARVaultService.getSfObjects(txARVault, sfOrgID);
    }
    
    @AuraEnabled
    public static List<Object> getSfFields(String txARVault, String sfOrgID, String sfObjName){
        return ARVaultService.getSfFields(txARVault, sfOrgID, sfObjName);
    }
    
    @AuraEnabled
    public static List<Object> getAllSforgCfgs(String txARVault, String sfOrgID) {
    	return ARVaultService.getAllSforgCfgs(txARVault, sfOrgID);
    }
}