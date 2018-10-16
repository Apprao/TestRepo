@isTest
public class ARVaultSetupControllerTest {
    
    private static final String txARVault = 'eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJBUlZhdWx0IiwiYXVkIjoid2ViIiwicHJvZHVjdElkIjoxLCJjdXN0b21lcklkIjoiMTcyNWFiYzItNjY3ZS00ZDE1LTlmNGUtNDY5MjJhODBkZWUzIiwidXNlck5hbWUiOiJBUlZhdWx0IiwiZXhwIjoxNTI0Njg4ODI3LCJ1c2VySWQiOiIwZjkxM2E5Yy1hOTllLTQ1ZmItYWRjMi1kN2M0YTk3MTNkY2UiLCJpYXQiOjE1MjQ2MDI0Mjd9.XlDo5nw0RM5R6nPpDzqdXoD0qTAf7YLPL4Q8S490WP9Pi3Vh0Ajh3iToulGixbTCQrc9_1PqrUcKu7pH6I6bw9Ka47JFsk-vSIAM3kAuNrr7CiQw5Gk9ufrLG3UerRlphiRFa_TAwwIl9V79ZKTci3SEzGpjs-U21fOaWVQmdTkSHieZlYMBIS2xEy3LD2xnG9okXfA5zLsWGndkhE1l2E_Fffj-rdAeCdYfv2L-NuVnsZc6i2LvN0qOoJRB951Afub5X2axGJvPKeZBQDGlAApw6nh-xhp3zhc1GxGGRljti7UNvFhTFlb6eUty5-34X2sBCTaYeo-NtCASEXycFg';
    static testMethod void test_getOrgBackupConfig_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Map<String, Object> backupConfig = ARVaultSetupController.getOrgBackupConfig(txARVault,'00D1I000000kyuFUAQ', '30c86e1c-2503-4c07-bebd-d7c2e04406dc');
        System.assertNotEquals(0, backupConfig.size());
    }
    static testMethod void test_getOrgsList_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        List<Object> orgList = ARVaultSetupController.getOrgsList('0f913a9c-a99e-45fb-adc2-d7c4a9713dce', txARVault);
        System.assertNotEquals(0, orgList.size());
    }
    static testMethod void test_getOrgsDetails_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Map<String, Object> orgConfig = ARVaultSetupController.getOrgsDetails(txARVault,'00D1I000000kyuFUAQ');
        System.assertNotEquals(0, orgConfig.size());
    }
    static testMethod void test_basicAuthCallout_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Map<String, Object> addSfOrgEnv = ARVaultSetupController.basicAuthCallout('0f913a9c-a99e-45fb-adc2-d7c4a9713dce', txARVault, 'Naresh Test Dev', 
                                                                     'nareshtestdev143@autorabit.com',
                                                                     'Naresh@7','NukwuYRFng5fuAMV9MPW5FKaW',
                                                                     'standard' ,'', 'https://login.salesforce.com');
        System.assertNotEquals(null, addSfOrgEnv);
    }
    
    static testMethod void test_saveBackupConfig_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String objCriteriaString = '[{ "0": { "name": "ActionLinkGroupTemplate", "label": "Action Link Group Template", "isExisted": true }, "1": { "name": "ApexClass", "label": "Apex Class", "isExisted": true },'+
            '"2": { "name": "ApexComponent", "label": "Visualforce Component", "isExisted": true },"3": { "name": "ApexPage", "label": "Visualforce Page", "isExisted": true }, '+
            '"4": { "name": "ApexTestSuite", "label": "Apex Test Suite", "isExisted": true }, "5": { "name": "ApexTrigger", "label": "Apex Trigger", "isExisted": true },'+
            '"6": { "name": "AuraDefinition", "label": "Lightning Component Definition", "isExisted": true },"7": { "name": "AuraDefinitionBundle", "label": "Lightning Component Bundle", "isExisted": true} }]';
        
        String responseString = ARVaultSetupController.saveBackupConfig('0f913a9c-a99e-45fb-adc2-d7c4a9713dce', txARVault,'00D1I000000kyuFUAQ', 'D','', '02:00', '', objCriteriaString,
                                                                '["ActionLinkGroupTemplate","AnalyticSnapshot","ApexClass","ApexComponent","ApexPage","ApexTestSuite","ApexTrigger","AuraDefinition","AuraDefinitionBundle"]',
                                                                'no','yes', '30c86e1c-2503-4c07-bebd-d7c2e04406dc');
         System.assertEquals('true', responseString);
    }
    static testMethod void test_testSfConnection_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String testSfOrgEnv = ARVaultSetupController.testSfConnection(txARVault, '00D1I000000kyuFUAQ');
        System.assertEquals('Success', testSfOrgEnv);
    }
    static testMethod void test_updateSfOrg_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Map<String, Object> updateSfOrgEnv = ARVaultSetupController.updateSfOrg('0f913a9c-a99e-45fb-adc2-d7c4a9713dce', txARVault,'00D1I000000kyuFUAQ','Naresh Test Dev', 
                                           'nareshtestdev143@autorabit.com',
                                           'Naresh@7','NukwuYRFng5fuAMV9MPW5FKaW','', 'standard','https://login.salesforce.com');
        System.assertNotEquals(null, updateSfOrgEnv);
    }
    static testMethod void test_testNewSfConnection_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String testSfOrgEnv = ARVaultSetupController.testNewSfConnection(txARVault,'nareshtestdev143@autorabit.com',
                                                   'Naresh@7','NukwuYRFng5fuAMV9MPW5FKaW'
                                                   , 'standard','https://login.salesforce.com');
        System.assertEquals('Success', testSfOrgEnv);
    }
    static testMethod void test_getOAuthOrg_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Map<String, Object> oauthOrg = ARVaultSetupController.getOAuthOrg('0f913a9c-a99e-45fb-adc2-d7c4a9713dce', txARVault,'Dev4', 'arvaultdev2017@autorabit.com');
        System.assertNotEquals(null, oauthOrg);
    }
    static testMethod void test_getMetadataTypes_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String selTypes='["ApexClass","ApexPage"]';
        List<Object> metadataTypes = ARVaultSetupController.getMetadataTypes(txARVault,'00D1I000000kyuFUAQ',selTypes);
        System.assertNotEquals(0, metadataTypes.size());
    }
    static testMethod void test_getSfObjects_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        List<Object> objList = ARVaultSetupController.getSfObjects(txARVault,'00D1I000000kyuFUAQ');
        System.assertNotEquals(0, objList.size());
    }
    static testMethod void test_getSfFields_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        List<Object> objList  = ARVaultSetupController.getSfFields(txARVault,'00D1I000000kyuFUAQ','Account');
        System.assertNotEquals(0, objList.size());
    }
    
    static testMethod void test_getAllSforgCfgs_UseCase1 () 
    {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());    
        List<Object> allCfgsList = ARVaultSetupController.getAllSforgCfgs(txARVault, '00D1I000000kyuFUAQ');        
        System.assertNotEquals(null, allCfgsList);
    }
}