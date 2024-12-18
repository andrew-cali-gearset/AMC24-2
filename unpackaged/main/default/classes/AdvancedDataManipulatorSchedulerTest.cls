@IsTest public class AdvancedDataManipulatorSchedulerTest {
    /* This method is used to test the AdvancedDataManipulatorScheduler. */
    @IsTest(SeeAllData=true) public static void AdvancedDataManipulatorSchedulerTest() {
        // Instantiate a new controller with all parameters in the page
        AdvancedDataManipulatorScheduler controller = new AdvancedDataManipulatorScheduler();
        controller.Schedule();
    }
}