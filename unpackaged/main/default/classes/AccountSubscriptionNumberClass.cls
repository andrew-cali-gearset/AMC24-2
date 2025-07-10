public class AccountSubscriptionNumberClass {
    public static void transformAccounts(List<Account> accounts) {
        for (Account acc : accounts) {
            // Check if the Active__c field is set to "Yes"
            if (acc.Active__c != 'Yes') {
                continue; // Skip this account and move to the next one
            }

            String accountName = acc.Name;
            String accountNamePrefix = accountName.substring(0, 3);

            // Initialize the new Subscription Number and SLA Expiration Date
            String newSubscriptionNumber = null;
            String newSLAExpirationDate = null;

            // Proceed with the transformation of the subscription number
            String subscriptionNumber = acc.Subscription_number__c;
            String prefixToRemove = 'GEA-';

            if (subscriptionNumber != null && subscriptionNumber.startsWith(prefixToRemove)) {
                // Remove the "GEA-" prefix
                subscriptionNumber = subscriptionNumber.substring(prefixToRemove.length());

                // Combine the Account Name prefix with the remaining subscription number
                newSubscriptionNumber = accountNamePrefix + subscriptionNumber;

                }
            }
        }
    }
}