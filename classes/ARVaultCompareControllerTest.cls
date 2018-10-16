@isTest
public class ARVaultCompareControllerTest {

    private static final String txARVault = 'eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJBUlZhdWx0IiwiYXVkIjoid2ViIiwicHJvZHVjdElkIjoxLCJjdXN0b21lcklkIjoiMTcyNWFiYzItNjY3ZS00ZDE1LTlmNGUtNDY5MjJhODBkZWUzIiwidXNlck5hbWUiOiJBUlZhdWx0IiwiZXhwIjoxNTI0Njg4ODI3LCJ1c2VySWQiOiIwZjkxM2E5Yy1hOTllLTQ1ZmItYWRjMi1kN2M0YTk3MTNkY2UiLCJpYXQiOjE1MjQ2MDI0Mjd9.XlDo5nw0RM5R6nPpDzqdXoD0qTAf7YLPL4Q8S490WP9Pi3Vh0Ajh3iToulGixbTCQrc9_1PqrUcKu7pH6I6bw9Ka47JFsk-vSIAM3kAuNrr7CiQw5Gk9ufrLG3UerRlphiRFa_TAwwIl9V79ZKTci3SEzGpjs-U21fOaWVQmdTkSHieZlYMBIS2xEy3LD2xnG9okXfA5zLsWGndkhE1l2E_Fffj-rdAeCdYfv2L-NuVnsZc6i2LvN0qOoJRB951Afub5X2axGJvPKeZBQDGlAApw6nh-xhp3zhc1GxGGRljti7UNvFhTFlb6eUty5-34X2sBCTaYeo-NtCASEXycFg';
    static testMethod void test_getListOfCompareBackups_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        List<Object> responseObj = ARVaultCompareController.getListOfCompareBackups(txARVault,'00D1I000000kyuFUAQ', '["30c86e1c-2503-4c07-bebd-d7c2e04406dc"]');
        System.assertNotEquals(null, responseObj);
    }

    static testMethod void test_getCompareBackups_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        List<Object> selBackups = ARVaultCompareController.getCompareBackups(txARVault,1527, 1588);
        System.assertNotEquals(0, selBackups.size());
    }
    
    static testMethod void test_getCompareChangeView_UseCase1(){
        String s1='[[{"diff":"false","name":"City","value":"Boardman"},{"diff":"false","name":"Country","value":"United States"}]]';
        String column='["City","Country"]';
        List<Object> columns =(List<Object>) JSON.deserializeUntyped(column);
        List<Object> changeColumns = ARVaultCompareController.getCompareChangeView(s1,s1,'LoginGeo',columns);             
        System.assertNotEquals(0, changeColumns.size());   
    }
    
    static testMethod void test_getRecordsForCompare_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        List<Object> records = ARVaultCompareController.getRecordsForCompare('MTIzNDU2',1527,1588,'Account');
        System.assertNotEquals(0, records.size());   
    }
    
    static testMethod void test_fetchTypeMembers_UseCase1(){
        String metadata1 = '[{"successcount":9,"members":["Account","Asset","Campaign","Case","Contact","Lead","Opportunity","Order","User"],"type":"SharingRules","totmembercount":9},{"successcount":0,"members":[],"type":"Scontrol","totmembercount":0},{"successcount":1,"members":["CustomLabels"],"type":"CustomLabels","totmembercount":1},{"successcount":0,"members":[],"type":"Settings","totmembercount":26},{"successcount":15,"members":["ARVault_UtilityBar","Backup","Compare","Compare1","Configuration","LightningSalesConsole_UtilityBar","LightningService_UtilityBar","PracticeApp","PracticeApp_UtilityBar","Restore","Restore1","Settings","Setup","Testing","Trailblazer_UtilityBar"],"type":"FlexiPage","totmembercount":15},{"successcount":64,"members":["ARVa__c","Account","AccountCleanInfo","AccountContactRole","Activity","Asset","AssetRelationship","AssistantProgress","Campaign","CampaignMember","Case","CaseContactRole","CaseMilestone","CollaborationGroup","CollaborationGroupMember","Contact","ContactCleanInfo","ContentVersion","Contract","ContractContactRole","ContractLineItem","DandBCompany","DuplicateRecordItem","DuplicateRecordSet","EmailMessage","Entitlement","EntitlementContact","Event","ExchangeUserMapping","FeedItem","ForecastingCategoryMapping","Idea","Lead","LeadCleanInfo","Macro","MacroAction","MacroInstruction","Opportunity","OpportunityCompetitor","OpportunityContactRole","OpportunityLineItem","Order","OrderItem","OrgDeleteRequest","PartnerRole","Pricebook2","PricebookEntry","Product2","QuickText","RestoreObject__c","Scorecard","ScorecardAssociation","ScorecardMetric","ServiceContract","Site","SocialPersona","Solution","StreamingChannel","Task","Topic","TopicAssignment","User","UserProvisioningRequest","Waypoint__c"],"type":"CustomObject","totmembercount":64},{"successcount":1,"members":["Internal Zone"],"type":"Community","totmembercount":1},{"successcount":0,"members":[],"type":"CspTrustedSite","totmembercount":0}]';
        String metadata2 = '[{"successcount":9,"members":["Account","Asset","Campaign","Case","Contact","Lead","Opportunity","Order","User"],"type":"SharingRules","totmembercount":9},{"successcount":0,"members":[],"type":"Scontrol","totmembercount":0},{"successcount":1,"members":["CustomLabels"],"type":"CustomLabels","totmembercount":1},{"successcount":0,"members":[],"type":"Settings","totmembercount":26},{"successcount":17,"members":["ARVault_Home_UtilityBar","ARVault_UtilityBar","Backup","Compare","Compare1","Configuration","Home","LightningSalesConsole_UtilityBar","LightningService_UtilityBar","PracticeApp","PracticeApp_UtilityBar","Restore","Restore1","Settings","Setup","Testing","Trailblazer_UtilityBar"],"type":"FlexiPage","totmembercount":17},{"successcount":65,"members":["ARVa__c","Account","AccountCleanInfo","AccountContactRole","Activity","Asset","AssetRelationship","AssistantProgress","Campaign","CampaignMember","Case","CaseContactRole","CaseMilestone","CollaborationGroup","CollaborationGroupMember","Contact","ContactCleanInfo","ContentVersion","Contract","ContractContactRole","ContractLineItem","CustomSetting__c","DandBCompany","DuplicateRecordItem","DuplicateRecordSet","EmailMessage","Entitlement","EntitlementContact","Event","ExchangeUserMapping","FeedItem","ForecastingCategoryMapping","Idea","Lead","LeadCleanInfo","Macro","MacroAction","MacroInstruction","Opportunity","OpportunityCompetitor","OpportunityContactRole","OpportunityLineItem","Order","OrderItem","OrgDeleteRequest","PartnerRole","Pricebook2","PricebookEntry","Product2","QuickText","RestoreObject__c","Scorecard","ScorecardAssociation","ScorecardMetric","ServiceContract","Site","SocialPersona","Solution","StreamingChannel","Task","Topic","TopicAssignment","User","UserProvisioningRequest","Waypoint__c"],"type":"CustomObject","totmembercount":65}]';
        List<Object> members = ARVaultCompareController.fetchTypeMembers(metadata1, metadata2, 'CustomObject');
        System.assertNotEquals(null, members);
    }
    
    static testMethod void test_getCompareMembers_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        List<Object> diffFiles = ARVaultCompareController.getCompareMembers('MTIzNDU2',1527, 1689, 'CustomObject', 'Account');
        System.assertNotEquals(0, diffFiles.size()); 
    }
    
    static testMethod void test_getAllSforgCfgs_UseCase1 () 
    {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());    
        List<Object> allCfgsList = ARVaultCompareController.getAllSforgCfgs(txARVault, '00D1I000000kyuFUAQ');        
        System.assertNotEquals(null, allCfgsList);
    }
}