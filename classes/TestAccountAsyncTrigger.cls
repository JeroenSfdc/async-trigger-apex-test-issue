@IsTest
public class TestAccountAsyncTrigger {

    @TestSetup
    static void setup() {
		Account acc = new Account(Name='test', IMCDCompany__c='21100');
        insert acc;
	}
    
    @IsTest
    static void testAsyncTrigger() {
        Account acc = [SELECT Id, IMCDCompany__c FROM Account LIMIT 1];
        acc.IMCDCompany__c = '31100';
        Test.enableChangeDataCapture();

        Test.startTest();
        System.debug('Updating Account.IMCDCompany__c');
        update acc;
        Test.stopTest();
    }
}