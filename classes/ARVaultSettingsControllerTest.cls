@isTest
public class ARVaultSettingsControllerTest {

    private static final String txARVault = 'eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJBUlZhdWx0IiwiYXVkIjoid2ViIiwicHJvZHVjdElkIjoxLCJjdXN0b21lcklkIjoiMTcyNWFiYzItNjY3ZS00ZDE1LTlmNGUtNDY5MjJhODBkZWUzIiwidXNlck5hbWUiOiJBUlZhdWx0IiwiZXhwIjoxNTI0Njg4ODI3LCJ1c2VySWQiOiIwZjkxM2E5Yy1hOTllLTQ1ZmItYWRjMi1kN2M0YTk3MTNkY2UiLCJpYXQiOjE1MjQ2MDI0Mjd9.XlDo5nw0RM5R6nPpDzqdXoD0qTAf7YLPL4Q8S490WP9Pi3Vh0Ajh3iToulGixbTCQrc9_1PqrUcKu7pH6I6bw9Ka47JFsk-vSIAM3kAuNrr7CiQw5Gk9ufrLG3UerRlphiRFa_TAwwIl9V79ZKTci3SEzGpjs-U21fOaWVQmdTkSHieZlYMBIS2xEy3LD2xnG9okXfA5zLsWGndkhE1l2E_Fffj-rdAeCdYfv2L-NuVnsZc6i2LvN0qOoJRB951Afub5X2axGJvPKeZBQDGlAApw6nh-xhp3zhc1GxGGRljti7UNvFhTFlb6eUty5-34X2sBCTaYeo-NtCASEXycFg';
    static testMethod void test_RegisterNewUser_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String newUserReg = ARVaultSettingsController.RegisterNewUser('Jayashree', 'Jampana', 'S', 'jayashree.j@autorabit.com', 'AutoRabit', 'SWE', 'US', '');                  
        if(newUserReg.containsIgnoreCase('activation')){
            String successMessage ='Thanks for Registering with ARVault. you will receive activation mail to your registered mailId.(Note: please check in spam folder also)';
            System.assertEquals(successMessage, newUserReg);                
        }else{
            System.assertEquals('', newUserReg);
        }                
    }
    
    static testMethod void test_Login_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Map<String, Object> responseObj = ARVaultSettingsController.Login('leelapavan.a@autorabit.com','Leela@345');
        System.assertNotEquals(null, responseObj);
    }
    
    
    static testMethod void test_forgotPassword_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String pwd = ARVaultSettingsController.forgotPassword('jayashree.j@autorabit.com');
        System.assertEquals('Please click the link send to your mentioned Email to regenerate password.', pwd);
    }
    static testMethod void test_getSettings_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        Map<String, Object> settings = ARVaultSettingsController.getSettings('0f913a9c-a99e-45fb-adc2-d7c4a9713dce', txARVault);
        System.assertNotEquals(null, settings);
    }
    
    static testMethod void test_changePassword_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        String pwd = ARVaultSettingsController.changePassword('sdfsdf','Leela@345','0f913a9c-a99e-45fb-adc2-d7c4a9713dce', txARVault);
        System.assertEquals('', pwd);
    }
    
    static testMethod void test_addAWSEnvi_UseCase1(){
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());       
        String addAWSReponse = ARVaultSettingsController.addAWSEnvi('0f913a9c-a99e-45fb-adc2-d7c4a9713dce', txARVault,'', 'Y','', '','', '');
        System.assertEquals('AWS client is registerd successfully', addAWSReponse);
    }
    
    static testMethod void test_addServiceURL_UseCase1(){
        String addURL = ARVaultSettingsController.addServiceURL();
        System.assertNotEquals('', addURL);
    }
    
    
}