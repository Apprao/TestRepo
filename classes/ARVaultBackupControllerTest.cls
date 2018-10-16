@isTest
public class ARVaultBackupControllerTest {

   private static final String txARVault = 'eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJBUlZhdWx0IiwiYXVkIjoid2ViIiwicHJvZHVjdElkIjoxLCJjdXN0b21lcklkIjoiMTcyNWFiYzItNjY3ZS00ZDE1LTlmNGUtNDY5MjJhODBkZWUzIiwidXNlck5hbWUiOiJBUlZhdWx0IiwiZXhwIjoxNTI0Njg4ODI3LCJ1c2VySWQiOiIwZjkxM2E5Yy1hOTllLTQ1ZmItYWRjMi1kN2M0YTk3MTNkY2UiLCJpYXQiOjE1MjQ2MDI0Mjd9.XlDo5nw0RM5R6nPpDzqdXoD0qTAf7YLPL4Q8S490WP9Pi3Vh0Ajh3iToulGixbTCQrc9_1PqrUcKu7pH6I6bw9Ka47JFsk-vSIAM3kAuNrr7CiQw5Gk9ufrLG3UerRlphiRFa_TAwwIl9V79ZKTci3SEzGpjs-U21fOaWVQmdTkSHieZlYMBIS2xEy3LD2xnG9okXfA5zLsWGndkhE1l2E_Fffj-rdAeCdYfv2L-NuVnsZc6i2LvN0qOoJRB951Afub5X2axGJvPKeZBQDGlAApw6nh-xhp3zhc1GxGGRljti7UNvFhTFlb6eUty5-34X2sBCTaYeo-NtCASEXycFg'; 
   static testMethod void test_startBackup_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String backupSuccess = ARVaultBackupController.startBackup('0f913a9c-a99e-45fb-adc2-d7c4a9713dce', 'MTIzNDU2','00D1I000000kyuFUAQ','forced', 'yes',  'no', 'TESTQA', '30c86e1c-2503-4c07-bebd-d7c2e04406dc') ;
        System.assertEquals('Success', backupSuccess);
    }
       
    static testMethod void test_getListOfBackups_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        List<Object> objList  = ARVaultBackupController.getListOfBackups(txARVault, '00D1I000000kyuFUAQ', '["30c86e1c-2503-4c07-bebd-d7c2e04406dc"]');
        System.assertNotEquals(0, objList.size());        
    }
    
    static testMethod void test_getBackupObject_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Map<String, Object> backupObj = ARVaultBackupController.getBackupObject(txARVault, 1521);
        System.assertNotEquals(0, backupObj.size());
    }
    
    static testMethod void test_getBackupsLog_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        List<String> backupLog = ARVaultBackupController.getBackupsLog (txARVault, 1521);
        System.assertNotEquals(null, backupLog);
    }

    
    static testMethod void test_sendEmailNotification_UseCase1(){
         String sample = '[{"backupId":1719,"idCfgBakup":"7a6f008215a14fa488f6be78f2c2b323","bkpLabel":"SCHEDULEDBACKUP05-Mar-2018 13-00-00","liveStatus":"Transferring retrieved records to backup environment","flBakupTyp":"SCHEDULED","idUser":"f939bec89dc549d9bb2a5ef164ac0eb5","strTotDuration":224,"nbrTotApi":252,"nbrTotRecords":9,"successCount":9,"metaSuccessCount":906,"metaTotalCount":624,"metaTotDuration":62,"objProcStatus":"COMPLETED","isFullDataBackup":"no","isFullMetaBackup":"yes","tmStamp":1520254800000},{"backupId":1687,"idCfgBakup":"7a6f008215a14fa488f6be78f2c2b323","bkpLabel":"SCHEDULEDBACKUP27-Feb-2018 13-00-00","liveStatus":"Transferring retrieved records to backup environment","flBakupTyp":"SCHEDULED","idUser":"f939bec89dc549d9bb2a5ef164ac0eb5","strTotDuration":224,"nbrTotApi":254,"nbrTotRecords":883,"successCount":883,"metaSuccessCount":906,"metaTotalCount":624,"metaTotDuration":56,"objProcStatus":"COMPLETED","isFullDataBackup":"no","isFullMetaBackup":"yes","tmStamp":1519736400000},{"backupId":1226,"idCfgBakup":"7a6f008215a14fa488f6be78f2c2b323","bkpLabel":"SCHEDULEDBACKUP04-Feb-2018 13-00-00","liveStatus":"Transferring retrieved records to backup environment","flBakupTyp":"SCHEDULED","idUser":"f939bec89dc549d9bb2a5ef164ac0eb5","strTotDuration":215,"nbrTotApi":259,"nbrTotRecords":19,"successCount":19,"metaSuccessCount":770,"metaTotalCount":559,"metaTotDuration":50,"objProcStatus":"COMPLETED","isFullDataBackup":"no","isFullMetaBackup":"yes","tmStamp":1517749200000}]';
         String sendEmail = ARVaultBackupController.sendEmailNotification('00D1I000000kyuFUAQ',sample,'jayashree.j@autorabit.com','Backup');
         System.assertEquals('Success', sendEmail);
    }
    
    static testMethod void test_isEmailAttachment_UseCase1(){
         String sample = '[{"backupId":1719,"idCfgBakup":"7a6f008215a14fa488f6be78f2c2b323","bkpLabel":"SCHEDULEDBACKUP05-Mar-2018 13-00-00","liveStatus":"Transferring retrieved records to backup environment","flBakupTyp":"SCHEDULED","idUser":"f939bec89dc549d9bb2a5ef164ac0eb5","strTotDuration":224,"nbrTotApi":252,"nbrTotRecords":9,"successCount":9,"metaSuccessCount":906,"metaTotalCount":624,"metaTotDuration":62,"objProcStatus":"COMPLETED","isFullDataBackup":"no","isFullMetaBackup":"yes","tmStamp":1520254800000},{"backupId":1687,"idCfgBakup":"7a6f008215a14fa488f6be78f2c2b323","bkpLabel":"SCHEDULEDBACKUP27-Feb-2018 13-00-00","liveStatus":"Transferring retrieved records to backup environment","flBakupTyp":"SCHEDULED","idUser":"f939bec89dc549d9bb2a5ef164ac0eb5","strTotDuration":224,"nbrTotApi":254,"nbrTotRecords":883,"successCount":883,"metaSuccessCount":906,"metaTotalCount":624,"metaTotDuration":56,"objProcStatus":"COMPLETED","isFullDataBackup":"no","isFullMetaBackup":"yes","tmStamp":1519736400000},{"backupId":1226,"idCfgBakup":"7a6f008215a14fa488f6be78f2c2b323","bkpLabel":"SCHEDULEDBACKUP04-Feb-2018 13-00-00","liveStatus":"Transferring retrieved records to backup environment","flBakupTyp":"SCHEDULED","idUser":"f939bec89dc549d9bb2a5ef164ac0eb5","strTotDuration":215,"nbrTotApi":259,"nbrTotRecords":19,"successCount":19,"metaSuccessCount":770,"metaTotalCount":559,"metaTotDuration":50,"objProcStatus":"COMPLETED","isFullDataBackup":"no","isFullMetaBackup":"yes","tmStamp":1517749200000}]';
         boolean isExists = ARVaultBackupController.isEmailAttachment('00D1I000000kyuFUAQ',sample,'Backup');
         System.assertEquals(true, isExists);
    }
    
    static testMethod void test_getAllSforgCfgs_UseCase1 () 
    {
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());    
        List<Object> allCfgsList = ARVaultBackupController.getAllSforgCfgs(txARVault, '00D1I000000kyuFUAQ');
        
        System.assertNotEquals(null, allCfgsList);
    }
}