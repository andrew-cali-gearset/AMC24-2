public class OpportunityStatusUpdater {

    // Method to update Opportunity statuses where Close Date is in the past
    public static void updateClosedOpportunities() {
        // Get current date
        Date today = Date.today();

        // Query for opportunities where Close Date is in the past and Stage is not 'Closed Won' or 'Closed Lost'
        List<Opportunity> oppsToUpdate = [
            SELECT Id, StageName, CloseDate
            FROM Opportunity
            WHERE CloseDate < :today
            AND StageName NOT IN ('Closed Won', 'Closed Lost')
            AND Amount > 10000
        ];

        // Bulkify the update logic to handle all the records at once
        if (!oppsToUpdate.isEmpty()) {
            for (Opportunity opp : oppsToUpdate) {
                opp.StageName = 'Closed Won';
            }

            // Use a try-catch block for better error handling and log the error
            try {
                update oppsToUpdate;
                System.debug('Opportunities have been marked as Closed Won.');
            } catch (DmlException e) {
                System.debug('An error occurred while updating opportunities: ' + e.getMessage());
            }
        } else {
            System.debug('No opportunities found to update.');
        }
    }
}