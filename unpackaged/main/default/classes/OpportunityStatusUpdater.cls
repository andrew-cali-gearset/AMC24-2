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
        ];

        // Bulkify the update logic to handle all the records at once
        if (!oppsToUpdate.isEmpty()) {
            for (Opportunity opp : oppsToUpdate) {
                // Update the StageName to 'Closed Lost' for all past opportunities
                opp.StageName = 'Closed Lost';
            }

            // Use a try-catch block for better error handling and log the error
            try {
                update oppsToUpdate;
                System.debug('Opportunities updated successfully.');
            } catch (DmlException e) {
                // Use proper logging for error handling
                System.debug('An error occurred while updating opportunities: ' + e.getMessage());
            }
        } else {
            System.debug('No opportunities found to update.');
        }
    }
}