@isTest
public class ARVaultUserControllerTest {		
   
    private static final String txARVault = 'eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJBUlZhdWx0IiwiYXVkIjoid2ViIiwicHJvZHVjdElkIjoxLCJjdXN0b21lcklkIjoiNzc1YjA2YmEtMzZjZi00YzUxLWI2M2UtNmI1MzBhMGEzOTgzIiwidXNlck5hbWUiOiJBUlZhdWx0IiwiZXhwIjoxNTI0OTQzNTI5LCJ1c2VySWQiOiIyNzFiNTEwZi00ZjVkLTRiYjgtOGMzYi1mNjM2ZGVjNTRjZjkiLCJpYXQiOjE1MjQ4NTcxMjl9.WZtndThHHuQoMWBTHvrmpwzS8rcxN2hMQMwZQj-UmnqDkZO7bBnLhzAMAwxfToRgeVISwvx_kadRCHqsTeRbiYOAcExb5C9RrI8jlsdHCjD95LJGYgnP62sUxlcV36i63qH8FALHvbcwmkMMjn4zfaPSrZa2UPh45IR8oFtUyLN0gdMa0O9MCfhjfJoDFP5K0YU8Xt1ZuISy5Q4PCCmTAOpAsidtxfRPBX-pQyp8im30HkbF_NjsyLs3ib_wSRFIIzLfm1_SyLR8uWJFTF7hXEJFKW2qfv1yBl1XXTEx61dH1VrpfIzvadL5XrghVL8Mu2otDjpLx8BU36TzbYLa6Q';
    static testMethod void test_getAllUsers_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        List<Object> users = ARVaultUserController.getAllUsers(txARVault);
        System.assertNotEquals(0, users.size());
    }
    static testMethod void test_createNewUser_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String selRoles='[  "d59519a0-8720-476a-a248-bfbd86f9b73e"     ]';
        Map<String, Object> userObject = ARVaultUserController.createNewUser(txARVault, 'Jack', 'Doe', '', 'USA', '', '', 'jamp_jaya@yahoo.com', '', '', selRoles);
        System.assertNotEquals(0, userObject.size());
    }
    static testMethod void test_getUserByUserID_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Map<String, Object> userObject = ARVaultUserController.getUserByUserID(txARVault, '96629bbe-6ed2-4a91-932d-1725a2334972');
        System.assertNotEquals(0, userObject.size());
    }
    static testMethod void test_updateExistingUser_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String selRoles='[  { "roleId": "d59519a0-8720-476a-a248-bfbd86f9b73e"  }   ]';
        String addSfOrgEnv = ARVaultUserController.updateExistingUser(txARVault, '7a0c21a4-ffa0-4dcc-ba75-3f8b7286b3b7', 'Jane', 'Doe', '', 'USA', 'jamp_jaya@yahoo.net', 0, '', '', '', selRoles);
        System.assertNotEquals('', addSfOrgEnv);
    }
    
    static testMethod void test_getAllRoles_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        List<Object> allRoles = ARVaultUserController.getAllRoles(txARVault);
         System.assertNotEquals(0, allRoles.size());
    }
    static testMethod void test_addNewRole_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String selPermissions='["1" ,"3"]';        
        String addRole = ARVaultUserController.addNewRole(txARVault, 'Test Role', 'Testing from code', selPermissions);
        System.assertEquals('', addRole);
    }
    static testMethod void test_getUserRole_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Map<String, Object> updateSfOrgEnv = ARVaultUserController.getUserRole(txARVault,'61f6d74e-b3ed-4641-adda-0457ee279728');
        System.assertNotEquals(0, updateSfOrgEnv.size());
    }
    static testMethod void test_updateExistingRole_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String selPermissions='[{ "permissionOrder": "1", "permissionName": "Setup"},{ "permissionOrder": "2", "permissionName": "Backup"}, '+ 
        '{ "permissionOrder": "3", "permissionName": "Compare"}, { "permissionOrder": "4", "permissionName": "Restore"}]';                      
        String testSfOrgEnv = ARVaultUserController.updateExistingRole(txARVault, '61f6d74e-b3ed-4641-adda-0457ee279728','Test Role','Added for Testing', selPermissions);
        System.assertEquals('', testSfOrgEnv);
    }
    static testMethod void test_deleteExistingRole_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String deleteRole = ARVaultUserController.deleteExistingRole(txARVault, '61f6d74e-b3ed-4641-adda-0457ee279728' );
        System.assertNotEquals(null, deleteRole);
    }
    static testMethod void test_resendEmail_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());        
        String emailStatus = ARVaultUserController.resendEmail(txARVault, '96629bbe-6ed2-4a91-932d-1725a2334972' );
        System.assertEquals('true', emailStatus);
    }

}