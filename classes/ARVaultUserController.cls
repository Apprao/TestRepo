public with sharing class ARVaultUserController {
    
    @AuraEnabled
    public static List<Object> getAllUsers(String txARVault){
        return ARVaultService.getAllUsers(txARVault);
    }

    @AuraEnabled
    public static Map<String, Object> createNewUser(String txARVault, String firstName, String lastName, String middleName, String country, String mobile,
                                       String timeZone, String email, String designation, String description, String roles ){
        return ARVaultService.addNewUser(txARVault, firstName, lastName, middleName, country, mobile, timeZone, email, designation, description,roles);                                         
    }
    
    @AuraEnabled
    public static Map<String, Object> getUserByUserID(String txARVault, String userId) {
        return ARVaultService.getUserObject(txARVault, userId);
    }

    @AuraEnabled
    public static String updateExistingUser(String txARVault, String userID, String firstName, String lastName, String middleName, String country, 
                                            String email, Integer mobile, String designation, String  timezone, String description, String roles) {
        return ARVaultService.saveEditUser(txARVault, userID, firstName, lastName, middleName, country, email, mobile, designation, timezone, description, roles);
    }    
    
    @AuraEnabled
    public static List<Object> getAllRoles(String txARVault){
    	return ARVaultService.getAllRoles(txARVault);
    }
    
    @AuraEnabled
    public static String addNewRole(String txARVault, String roleName, String roleDesc, String permissions) {
        return ARVaultService.addNewRole(txARVault, roleName, roleDesc, permissions);
    }
    
    @AuraEnabled
    public static Map<String, Object> getUserRole(String txARVault, String roleId) {
        return ARVaultService.getUserRole(txARVault, roleId);
    }
    
    @AuraEnabled
    public static String updateExistingRole( String txARVault, String roleId, String roleName, String roleDesc, String permissions) {
        return ARVaultService.saveEditRole( txARVault, roleId, roleName, roleDesc, permissions);
    }
    
    @AuraEnabled
    public static String deleteExistingRole(String txARVault, String roleId) {
        return ARVaultService.deleteRole(txARVault, roleId);
    }
    
    @AuraEnabled
    public static String resendEmail(String txARVault, String userId) {
        return ARVaultService.sendActivationEmail(txARVault, userId);
    }   
}